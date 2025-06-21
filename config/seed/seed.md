make menuconfig
## 修改架构，然后执行命令，注意修改最后config名称


##### 初始化immortalwrt config
rm -rf .config && make menuconfig && cat ../OpenWrtAction/config/seed/immortalwrt_seed.config >> .config && make defconfig && cp -f .config ../OpenWrtAction/config/immortalwrt_config/R5C.config

##### 初始化openwrt config
rm -rf .config && make menuconfig && cat ../OpenWrtAction/config/seed/openwrt_seed.config >> .config && make defconfig && cp -f .config ../OpenWrtAction/config/openwrt_config/R5C.config

##### 初始化lean config
rm -rf .config && make menuconfig && cat ../OpenWrtAction/config/seed/lean_seed.config >> .config && make defconfig && cp -f .config ../OpenWrtAction/config/leanlede_config/R5C.config
