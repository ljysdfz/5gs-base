#!/bin/bash

# BSD 2-Clause License

# Copyright (c) 2020, Supreeth Herle
# All rights reserved.

# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:

# 1. Redistributions of source code must retain the above copyright notice, this
#    list of conditions and the following disclaimer.

# 2. Redistributions in binary form must reproduce the above copyright notice,
#    this list of conditions and the following disclaimer in the documentation
#    and/or other materials provided with the distribution.

# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
# FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
# DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
# SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
# CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
# OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
# OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

# webui_2024

cp -r /mnt/tamper /tmp
cd /tmp/tamper

echo ${Flag4} > udm-subscription-management/flag
sed -i "s|#WEB_ADMIN_PASSWORD#|${WEB_ADMIN_PASSWORD}|" udm-subscription-management/server/index.js
sed -i "s|#PURGE_COMMAND#|${PURGE_COMMAND}|" udm-subscription-management/server/index.js
zip -q -r ${SOURCE_CODE_PACKAGE} udm-subscription-management
rm -rf udm-subscription-management
sed -i "s|#SOURCE_CODE_PACKAGE#|${SOURCE_CODE_PACKAGE}|g" index.js
sed -i "s|#FLAG#|${Flag5}|" index.js
sed -i "s|#WEB_ADMIN_PASSWORD#|${WEB_ADMIN_PASSWORD}|" index.js
sed -i "s|#PURGE_COMMAND#|${PURGE_COMMAND}|" index.js
sed -i "s|#POPULATE_COMMAND#|${POPULATE_COMMAND}|" index.js
sed -i "s|#PLATFORM#|${PLATFORM}|" _document.js
sed -i "s|#PLATFORM#|${PLATFORM}|" Login.js
sed -i "s|#PLATFORM#|${PLATFORM}|" Layout.js
sed -i "s|#PLATFORM#|${PLATFORM}|" Header.js

mv index.js /open5gs/webui/server/
mv Login.js /open5gs/webui/src/components/Base/
mv Layout.js /open5gs/webui/src/components/Base/
mv Header.js /open5gs/webui/src/components/Base/
mv _document.js /open5gs/webui/pages/
mv ${SOURCE_CODE_PACKAGE} /open5gs/webui/server/

# Original

export DB_URI="mongodb://${MONGO_IP}/open5gs"
cd /open5gs/webui && npm run dev

#cd webui && npm run dev

# Sync docker time
#ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
