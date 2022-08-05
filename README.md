# openh264
使用cmake编译的openh264，用nasm编译的汇编，仅支持x86平台的汇编编译（linux/windows已测试通过）,汇编默认打开

## todos
1.支持linux汇编    已支持

2.支持encoder编译  已支持

## 编译方式
首先安装cmake与nasm,并配置环境变量
```
mkdir build_release
cd build_release
cmake ..
cmake --build -j4
```


# 相关测试
* 不启用汇编解码时间
```
./dec_console ../test_cif_I_CABAC_slice.264

H264 source file name: ../test_cif_I_CABAC_slice.264..
Can not find any output file to write..
------------------------------------------------------
-------------------------------------------------------
iWidth:         352
height:         288
Frames:         300
decode time:    0.673991 sec
FPS:            445.109801 fps
-------------------------------------------------------
```
* 不启用汇编编码时间  
```
./enc_console welsenc.cfg

Width:          320
Height:         192
Frames:         9
encode time:    0.009989 sec
FPS:            900.991090 fps
```

* 启动汇编解码时间
```
H264 source file name: ../test_cif_I_CABAC_slice.264..
Can not find any output file to write..
------------------------------------------------------
-------------------------------------------------------
iWidth:         352
height:         288
Frames:         300
decode time:    0.524717 sec
FPS:            571.736765 fps
-------------------------------------------------------
```

* 启用汇编编码时间
```
Width:          320
Height:         192
Frames:         9
encode time:    0.004487 sec
FPS:            2005.794517 fps
```