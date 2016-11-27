#!/bin/bash
# run w/sudo
# checks the temp of the AXP209 PMU (no sensor on the R8 CPU)
# adapted from https://bbs.nextthing.co/t/how-to-check-the-temperature-of-chip/1738/4
lsb=$(i2cget -y -f 0 0x34 0x5f)
msb=$(i2cget -y -f 0 0x34 0x5e)
bin=$(( $(($msb << 4)) | $(($lsb & 0x0F))))
cel=`echo $bin | awk '{printf("%.2f", ($1/10) - 144.7)}'`
fah=`echo $cel | awk '{printf("%.2f", ($1 * 1.8) + 32)}'`
echo $cel"°C"
echo $fah"?F"
