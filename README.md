This is a device tree for Motorola XT530 codename domino, currently trying to port CM11.

Till now can only get working recovery.

Want to build yourself?

$ mkdir CM11

$ cd CM11

$ repo init -u git://github.com/androidarmv6/android.git -b cm-11.0

$ repo sync

$ sh vendor/cm/get-prebuilts

$ source build/envsetup.sh

$ brunch domino

The freshly compiled zip would be ready at out/target/product/domino/cm-VERSION-date-domino.zip

You would need to edit updater-script a little bit to not to flash boot.img and erase system instead of formatting.
