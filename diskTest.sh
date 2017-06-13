#!/bin/bash

export TMP_PATH=./

echo "8(KB) * 1024 data write: "
dd if=/dev/zero of=${TMP_PATH}/iotest bs=8k count=1k oflag=direct conv=fdatasync 2>&1
echo -e "\n1024(KB) * 1024 data write: "
dd if=/dev/zero of=${TMP_PATH}/iotest bs=1024k count=1k oflag=direct conv=fdatasync 2>&1
echo -e "\n8(KB) * 1024 data read: "
dd if=${TMP_PATH}/iotest of=/dev/null bs=8k count=1k iflag=direct 2>&1
echo -e "\n1024(KB) * 1024 data read: "
dd if=${TMP_PATH}/iotest of=/dev/null bs=1024k count=1k iflag=direct 2>&1
echo -e "\nThe current disk stat: "
df -h;

rm -f ${TMP_PATH}/iotest

exit 0
