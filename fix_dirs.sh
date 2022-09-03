#!/bin/sh
cd build/libsel4 || exit
mkdir -p include/interfaces || exit
mkdir -p include/sel4 || exit
mkdir -p arch_include/x86/sel4/arch || exit
mkdir -p sel4_arch_include/x86_64/sel4/sel4_arch || exit
cd ../ || exit
mkdir -p lib

cd musllibc || exit
mkdir -p build-temp || exit
cd .. || exit

cd kernel || exit
mkdir -p gen_headers/api/ || exit
cp ../libsel4/include/sel4/*.h gen_headers/api/ || exit

mkdir -p gen_headers/arch/api/ || exit
cp ../libsel4/sel4_arch_include/x86_64/sel4/sel4_arch/*.h gen_headers/arch/api/ || exit
mkdir -p generated_prune/plat_mode/machine || exit
mkdir -p generated_prune/arch/object || exit
mkdir -p generated_prune/sel4 || exit
cd .. || exit

cd ../ || exit
