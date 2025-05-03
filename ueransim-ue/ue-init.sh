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

sed -i 's|#MNC#|'$MNC'|g' ue.yaml
sed -i 's|#MCC#|'$MCC'|g' ue.yaml
sed -i 's|#UE_KI#|'$UE_KI'|g' ue.yaml
sed -i 's|#UE_OP#|'$UE_OP'|g' ue.yaml
sed -i 's|#OP_TYPE#|'$OP_TYPE'|g' ue.yaml
sed -i 's|#UE_AMF#|'$UE_AMF'|g' ue.yaml
sed -i 's|#UE_IMEISV#|'$UE_IMEISV'|g' ue.yaml
sed -i 's|#UE_IMEI#|'$UE_IMEI'|g' ue.yaml
sed -i 's|#UE_IMSI#|'$UE_IMSI'|g' ue.yaml
sed -i 's|#GNB_UU_IP#|'$GNB_UU_IP'|g' ue.yaml
