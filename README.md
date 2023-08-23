# 橙 狐 (OFRP) for Redmi K60 (mondrian)  
使用红米K60，MIUI 14（安卓13）制作，适用于橙狐安卓12分支  

![OFRP](https://image.ibb.co/cTMWux/logo.jpg "OFRP")  
====================================================
# 目前进度
基本功能可用，震动反馈可用，汉化比较全，可以正常刷入MIU完整包  
vab+ab双rec分区+gki这玩意也太难搞了  

主要学习了skkk佬和余空佬的marble、[fuxi](https://github.com/Device-Tree-Fuxi/device_xiaomi_fuxi_TWRP)项目  
这个项目主要还是在本地化上做点差异，毕竟原版橙狐汉化只有八成，繁中更是没法用，方便中国搞机小伙伴参考制作过程，  
新手机k60日常工作用机，而且功能已经比较全的twrp已经有skkk佬在维护，所以搞机优先度比较低。  
# 如何使用
进入[Release](https://github.com/ymdzq/OFRP-device_xiaomi_mondrian/releases)中，点开Assets选项，点击zip压缩包文件名下载  
zip卡刷包可以使用其他第三方rec刷入（例如skkk的twrp或者其他版本橙狐升级），不支持miui官方rec刷入  
或者解压后得到recovery.img文件，已root手机可以通过爱玩机工具箱、搞机助手等app直接写入recovery分区  
也可以手机连接电脑线刷，请自备[fastboot工具](https://developer.android.google.cn/studio/releases/platform-tools?hl=zh-cn)，手动重启手机至bootloader模式（橙色fastboot字样）  
使用fastboot工具把rec镜像刷入ab两槽的rec分区，重启进入rec，命令：  
```bash
fastboot flash recovery_a recovery.img
fastboot flash recovery_b recovery.img
fastboot reboot recovery
```
目前测试下来一般的gki内核（miui官方、ksu内核、VK内核）可以正常使用  
不兼容潘多拉内核，触屏和电量显示会失效，无法操作只能长按电源重启或者`adb reboot`  
潘多拉内核只有skkk的twrp能正常用，由于他魔改twrp源码比较多，不开源抄不了，klozz的橙狐也是这样，所以不会修  
# 如何构建
下载OFRP源代码，克隆这个仓库放到相应的位置  
例如OFRP源代码根目录为~/fox_12.1，则保存为~/fox_12.1/device/xiaomi/mondrian/:  
```bash
cd ~/fox_12.1
mkdir -p device/xiaomi
cd device/xiaomi
git clone https://github.com/ymdzq/OFRP-device_xiaomi_mondrian.git mondrian
```
bootctrl需要从默认a12.1分支改成a13分支然后重新repo sync拉取  
修改~/fox_12.1/.repo/manifests/twrp-default.xml，第99行  
```
    <project name="android_hardware_qcom_bootctrl" path="hardware/qcom-caf/bootctrl" remote="LineageOS" revision="lineage-19.1-caf" />
```
修改为  
```
    <project name="android_hardware_qcom_bootctrl" path="hardware/qcom-caf/bootctrl" remote="LineageOS" revision="lineage-20.0-caf" />
```
打开源代码根目录运行:  
```bash
. build/envsetup.sh && lunch twrp_mondrian-eng && mka recoveryimage
```
