#!/bin/bash

(for f in `ls *.tar.bz2`; do tar xjf $f & done; wait) & all1=$!
cd difftest
(for f in `ls *.tar.bz2`; do tar xjf $f & done; wait) & all2=$!
cd ../bin
tar xjf linux.tar.bz2
cd ..

wait $all1
wait $all2

ln -sf SimTop-xiangshan-default-*.fir SimTop-xiangshan-default.fir
ln -sf SimTop-xiangshan-minimal-*.fir SimTop-xiangshan-minimal.fir
cd difftest
ln -sf SimTop-xiangshan-default-*.sv SimTop-xiangshan-default.sv
ln -sf SimTop-xiangshan-minimal-*.sv SimTop-xiangshan-minimal.sv

echo "Finishing extracting files under ready-to-run/"
