# 橙 狐 (OFRP) for Redmi K60 (mondrian)  
使用红米K60，MIUI 14（安卓13）制作，适用于橙狐安卓12分支  

![OFRP](https://image.ibb.co/cTMWux/logo.jpg "OFRP")  
====================================================
# 目前进度
基本功能可用，震动反馈可用，汉化比较全，  
自测刷miui 14.0.24.0/14.0.25.0官方包会提示失败，不知道是上游代码问题还是哪的问题，水平有限难以修复，有待后续观察。  
vab+ab双rec分区+gki这玩意也太难搞了吧，bug超级多，有时候明明内核模块都在，进rec还是触控、电量修复全失效  

主要学习了skkk佬和余空佬的marble、[fuxi](https://github.com/Device-Tree-Fuxi/device_xiaomi_fuxi_TWRP)项目  
这个项目主要还是在本地化上做点差异，毕竟原版橙狐汉化只有八成，繁中更是没法用，方便中国搞机小伙伴参考制作过程，  
新手机k60日常工作用机，而且功能已经比较全的twrp已经有skkk佬在维护，所以搞机优先度比较低。  
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
