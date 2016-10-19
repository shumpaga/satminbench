#!/bin/sh

set -e  # Abort on any error
set -x  # Show each instruction at is it run

# LTL2BA
V=1.2b1
wget http://www.lsv.ens-cachan.fr/~gastin/ltl2ba/ltl2ba-$V.tar.gz
tar xvf ltl2ba-$V.tar.gz
cd ltl2ba-$V
make -j4
mv ltl2ba /usr/local/bin/
cd ..
rm -rf ltl2ba-$V ltl2ba-$V.tar.gz

# LTL3DRA
V=0.2.2
wget http://sourceforge.net/projects/ltl3dra/files/ltl3dra-$V.tar.gz
tar xvf ltl3dra-$V.tar.gz
cd ltl3dra-$V
make -j4
mv ltl3dra /usr/local/bin/
cd ..
rm -rf ltl3dra-$V ltl3ba-$V.tar.gz

# ltl2dstar
V=0.5.3
wget http://www.ltl2dstar.de/down/ltl2dstar-0.5.3.tar.gz
tar xvf ltl2dstar-$V.tar.gz
cd ltl2dstar-$V/src
make -j4
mv ltl2dstar /usr/local/bin/
cd ..

# Rabinizer 3.1
wget https://www7.in.tum.de/~kretinsk/rabinizer3/rabinizer3.1.jar
mv rabinizer3.1.jar /usr/local/bin/rabinizer.jar
cat >/usr/local/bin/rabinizer <<\EOF
#!/bin/sh
exec java -jar /usr/local/bin/rabinizer.jar "$@"
EOF
chmod +x /usr/local/bin/rabinizer

# PicoSAT 965
wget http://fmv.jku.at/picosat/picosat-965.tar.gz
tar -xvf picosat-965.tar.gz
cd picosat-965 && ./configure.sh && make
mv picosat /usr/local/bin/
cd .. && rm -rf picosat-965*

# Glucose 4.0
wget http://www.labri.fr/perso/lsimon/downloads/softwares/glucose-syrup.tgz
tar -xvf glucose-syrup.tgz
cd glucose-syrup/parallel && make
mv glucose-syrup /usr/local/bin/glucose
cd ../.. && rm -rf glucose-syrup*

# clone and configure Spot
cd $HOME
git clone https://gitlab.lrde.epita.fr/spot/spot.git
cd spot && git checkout aga/benchsat && autoreconf -vfi \
  && ./configure --disable-devel && make -j4
make install
