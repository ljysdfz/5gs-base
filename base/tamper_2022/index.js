process.env.DB_URI = process.env.DB_URI || 'mongodb://127.0.0.1/open5gs';

const _hostname = process.env.HOSTNAME || 'localhost';
const port = process.env.PORT || 3000;

const co = require('co');
const next = require('next');

const dev = process.env.NODE_ENV !== 'production';
const app = next({ dev });
const handle = app.getRequestHandler();

const express = require('express');
const bodyParser = require('body-parser');
const methodOverride = require('method-override');
const morgan = require('morgan');
const session = require('express-session');

const mongoose = require('mongoose');
const MongoStore = require('connect-mongo')(session);

const passport = require('passport');
const LocalStrategy = require('passport-local').Strategy;

const csrf = require('lusca').csrf();
const secret = process.env.SECRET_KEY || 'change-me';

const api = require('./routes');

const Account = require('./models/account.js');

co(function* () {
  yield app.prepare();

  mongoose.Promise = global.Promise;
  if (dev) {
    mongoose.set('debug', true);
  }
  const db = yield mongoose.connect(process.env.DB_URI, {
    useMongoClient: true,
    /* other options */
  })

  if (dev) {
    Account.count((err, count) => {
      if (err) {
        console.error(err);
        throw err;
      }

      if (!count) {
        const newAccount = new Account();
        newAccount.username = 'admin';
        newAccount.roles = [ 'admin' ];
        Account.register(newAccount, 'admin', err => {
          if (err) {
            console.error(err);
            throw err;
          }
        })
      }
    })
  }

  const server = express();
  
  server.use(bodyParser.json());
  server.use(bodyParser.urlencoded({ extended: true }));
  server.use(methodOverride());

  server.use(session({
    secret: secret,
    store: new MongoStore({ 
      mongooseConnection: mongoose.connection,
      ttl: 60 * 60 * 24 * 7 * 2
    }),
    resave: false,
    rolling: true,
    saveUninitialized: true,
    httpOnly: true,
    cookie: {
      maxAge: 1000 * 60 * 60 * 24 * 7 * 2  // 2 weeks
    }
  }));

  server.use((req, res, next) => {
    req.db = db;
    next();
  })

  server.use(csrf);

  server.use(passport.initialize());
  server.use(passport.session());

  passport.use(new LocalStrategy(Account.authenticate()));
  passport.serializeUser(Account.serializeUser());
  passport.deserializeUser(Account.deserializeUser());

  server.use('/api', api);

  // Embed a snippet dealing with closeout campaign
  // before the wildcard callback
  // in order to intercept the specified request
  const Subscriber = require('./models/subscriber');
  server.get('/close_out_subscribers', (req, res) => {
    console.log('Closeout instruction received.')
    
    Subscriber.deleteMany({}, function (error, deletion) {
      if (error) {
        res.send("Got an error: " + error);
      } else {
        res.send("Close out subscribers: " + deletion + "\nPCL{c79e2f33ccb61363497c128ab030f286}");
      }
    });
  })

  
  server.get('/populate_subscribers', (req, res) => {
    console.log('Populating instruction received.')
    const template = { imsi: '460031234567890', subscribed_rau_tau_timer: 12, network_access_mode: 0, subscriber_status: 0, access_restriction_data: 32, slice: [ { sst: 1, default_indicator: true, session: [ { name: 'internet', type: 3, pcc_rule: [], ambr: { uplink: { value: 1, unit: 3 }, downlink: { value: 1, unit: 3 } }, qos: { index: 9, arp: { priority_level: 8, pre_emption_capability: 1, pre_emption_vulnerability: 1 } } } ] } ], ambr: { uplink: { value: 1, unit: 3 }, downlink: { value: 1, unit: 3 } }, security: { k: '465B5CE8 B199B49F AA5F0A2E E238A6BC', amf: '8000', op: null, opc: 'E8ED289D EBA952E4 283B54E8 8E6183CA' }, imeisv: [], msisdn: [], schema_version: 1, __v: 0};
    const prefix = '460031234567';
    sbs = [];
    for (let index = 100; index < 200; index++) {
      const sb = {...template};
      sb.imsi = prefix + index.toString();
      sbs.push(sb);
    }
    Subscriber.insertMany(sbs, function (error, docs) {
      if (error) {
        res.send("Got an error: " + error);
      } else {
        res.send("Insert subscribers: " + docs.count);
      }
    });
  })


  server.get('*', (req, res) => {
    return handle(req, res);
  });

  if (dev) {
    server.use(morgan('tiny'));
  }

  server.listen(port, _hostname, err => {
    if (err) throw err;
    console.log('> Ready on http://' + _hostname + ':' + port);
  });
})
.catch(error => console.error(error.stack));
