# 橙 狐 (OFRP) for Redmi K60 (mondrian)  
使用红米K60，MIUI 14（安卓13）制作，适用于橙狐安卓12分支  

![OFRP](https://image.ibb.co/cTMWux/logo.jpg "OFRP")  
====================================================
# 目前进度
嗯，就在我天天摸鱼平板5p的时候，看了一眼xda，  
有墨西哥二次元大佬先做出来了，还挂出了捐赠，行吧，大佬多了是好事，  
我毕竟业余搞这个的目的在于学习大佬技术，不想在设备树里放太多不必要、用不上的lib，这方面比较纠结，所以进度比较慢，  
他的橙狐没有开源，拆包看比较像是用[这个树](https://github.com/pjgowtham/recovery_device_oplus_sm8475)改的然后拆包skkk佬的twrp导入部分文件，  
我这个项目全开源，无捐赠，从twrpdtgen导入miui官方recovery开始，每个文件都有commit历史，  
主要学习了skkk佬和余空佬的marble、[fuxi](https://github.com/Device-Tree-Fuxi/device_xiaomi_fuxi_TWRP)项目  
这个项目主要还是在本地化上做点差异，毕竟原版橙狐汉化只有八成，繁中更是没法用，方便中国搞机小伙伴参考制作过程，  
新手机k60日常工作用机，而且功能已经比较全的twrp已经有skkk佬在维护，所以搞机优先度比较低。  

目前进度：基本功能可用，震动反馈可用，汉化比较全，  
自测刷miui 14.0.24.0官方包会提示失败，不知道是上游代码问题还是哪的问题，水平有限难以修复，有待后续观察。  
# 如何使用
下载地址在右侧[Releases](https://github.com/ymdzq/OFRP-device_xiaomi_mondrian/releases)中。  
刷入方法，解压得到recovery.img，使用任意方法刷入手机recovery分区，请自备adb、fastboot工具  
zip卡刷包可以直接用其他第三方rec刷入（例如skkk的twrp或者旧版本橙狐升级），不支持miui官方rec刷入  
fastboot刷入recovery.img命令：  
```
fastboot flash recovery_ab recovery.img
fastboot reboot recovery
```
# 如何构建
下载OFRP源代码，克隆这个仓库放到相应的位置  
例如OFRP源代码根目录为~/fox_12.1，则保存为~/fox_12.1/device/xiaomi/mondrian/:  
```bash
cd ~/fox_12.1
mkdir -p device/xiaomi
cd device/xiaomi
git clone https://github.com/ymdzq/OFRP-device_xiaomi_mondrian.git mondrian
```
打开源代码根目录运行:  
```bash
. build/envsetup.sh && lunch twrp_mondrian-eng && mka recoveryimage
```
