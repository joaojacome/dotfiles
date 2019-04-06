#!/bin/bash
echo hook:module/playpause3 | tee -a $(find /tmp -maxdepth 1 -name 'polybar_mqueue*')
