#ARCH=arm-linux-androideabi
#export SYSROOT=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/../android-arm-toolchain
#/Users/webb/Library/Android/android-ndk-r10e/build/tools/make-standalone-toolchain.sh --arch=arm --platform=android-21 --install-dir=$SYSROOT

ARCH=i686-linux-android
export SYSROOT=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/../android-x86-toolchain
#/Users/webb/Library/Android/android-ndk-r10e/build/tools/make-standalone-toolchain.sh --arch=x86 --platform=android-21 --install-dir=$SYSROOT

export PATH=$SYSROOT/bin:$SYSROOT/$ARCH/bin:$PATH
cp -f $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/../sphinxbase/config.sub Cfg/. # for ARCH support
./configure --build=x86_64 --host=$ARCH --enable-static=yes --enable-shared=no --with-sysroot=$SYSROOT --prefix=$SYSROOT --disable-sndfile --disable-fftw && make && sudo make install
