#!/bin/bash
echo hook:module/playpause2 | tee -a $(find /tmp -maxdepth 1 -name 'polybar_mqueue*')
