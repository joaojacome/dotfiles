#!/bin/bash
echo hook:module/spotify2 | tee -a $(find /tmp -maxdepth 1 -name 'polybar_mqueue*')
echo hook:module/musicnext2 | tee -a $(find /tmp -maxdepth 1 -name 'polybar_mqueue*')
echo hook:module/musicprev2 | tee -a $(find /tmp -maxdepth 1 -name 'polybar_mqueue*')