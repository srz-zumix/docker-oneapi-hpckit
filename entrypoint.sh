#!/bin/bash

.  /opt/intel/oneapi/setvars.sh
exec /bin/bash -l -c "$*"
