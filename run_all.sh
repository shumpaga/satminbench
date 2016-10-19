#!/bin/sh

exec 2>&1
set -x  # Show each instruction at is it run

# Install Spot
git clone https://gitlab.lrde.epita.fr/spot/spot.git
cd spot && git checkout aga/benchsat && autoreconf -vfi \
  && ./configure --disable-devel && make -j8
make install && cd ..
