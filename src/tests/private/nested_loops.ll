%my_struct_1 = type { [7 x i32 ] }
%my_struct_2 = type { [8 x %my_struct_1 ] }
%my_struct_3 = type { [5 x %my_struct_2 ] }
%my_struct_4 = type { [4 x %my_struct_3 ] }
%my_struct_5 = type { [3 x %my_struct_4 ] }
%my_struct_6 = type { [2 x %my_struct_5 ] }
@arr1 = global [ 10 x %my_struct_6 ] zeroinitializer
@arr2 = global [ 10 x %my_struct_6 ] zeroinitializer
define i32 @loop1( i32 %r100, i32 %r102 ) {
loop1:
  %r117 = alloca i32
  %r111 = alloca i32
  %r101 = alloca i32
  store i32 %r100, i32* %r101
  %r103 = alloca i32
  store i32 %r102, i32* %r103
  %r104 = alloca i32
  %r105 = alloca i32
  %r106 = alloca i32
  %r107 = alloca i32
  %r108 = alloca i32
  %r109 = alloca i32
  %r110 = alloca i32
  store i32 0, i32* %r104
  br label %bb1

bb1:
  %r113 = load i32, i32* %r104
  %r114 = load i32, i32* %r101
  %r112 = icmp slt i32 %r113, %r114
  br i1 %r112, label %bb5, label %bb6

bb5:
  store i32 1, i32* %r111
  br label %bb7

bb6:
  store i32 0, i32* %r111
  br label %bb7

bb7:
  %r116 = load i32, i32* %r111
  %r115 = icmp ne i32 %r116, 0
  br i1 %r115, label %bb4, label %bb3

bb4:
  %r119 = load i32, i32* %r104
  %r120 = load i32, i32* %r103
  %r118 = icmp slt i32 %r119, %r120
  br i1 %r118, label %bb8, label %bb9

bb8:
  store i32 1, i32* %r117
  br label %bb10

bb9:
  store i32 0, i32* %r117
  br label %bb10

bb10:
  %r122 = load i32, i32* %r117
  %r121 = icmp ne i32 %r122, 0
  br i1 %r121, label %bb2, label %bb3

bb2:
  store i32 0, i32* %r105
  br label %bb11

bb11:
  %r124 = load i32, i32* %r105
  %r123 = icmp slt i32 %r124, 2
  br i1 %r123, label %bb12, label %bb13

bb12:
  store i32 0, i32* %r106
  br label %bb14

bb14:
  %r126 = load i32, i32* %r106
  %r125 = icmp slt i32 %r126, 3
  br i1 %r125, label %bb15, label %bb16

bb15:
  store i32 0, i32* %r107
  br label %bb17

bb17:
  %r128 = load i32, i32* %r107
  %r127 = icmp slt i32 %r128, 4
  br i1 %r127, label %bb18, label %bb19

bb18:
  store i32 0, i32* %r108
  br label %bb20

bb20:
  %r130 = load i32, i32* %r108
  %r129 = icmp slt i32 %r130, 5
  br i1 %r129, label %bb21, label %bb22

bb21:
  store i32 0, i32* %r109
  br label %bb23

bb23:
  %r132 = load i32, i32* %r109
  %r131 = icmp slt i32 %r132, 6
  br i1 %r131, label %bb24, label %bb25

bb24:
  store i32 0, i32* %r110
  br label %bb26

bb26:
  %r134 = load i32, i32* %r110
  %r133 = icmp slt i32 %r134, 2
  br i1 %r133, label %bb27, label %bb28

bb27:
  %r136 = load i32, i32* %r104
  %r135 = getelementptr [10 x %my_struct_6 ], [10 x %my_struct_6 ]* @arr1, i32 0, i32 %r136
  %r137 = getelementptr %my_struct_6, %my_struct_6* %r135, i32 0, i32 0
  %r139 = load i32, i32* %r105
  %r138 = getelementptr [2 x %my_struct_5 ], [2 x %my_struct_5 ]* %r137, i32 0, i32 %r139
  %r140 = getelementptr %my_struct_5, %my_struct_5* %r138, i32 0, i32 0
  %r142 = load i32, i32* %r106
  %r141 = getelementptr [3 x %my_struct_4 ], [3 x %my_struct_4 ]* %r140, i32 0, i32 %r142
  %r143 = getelementptr %my_struct_4, %my_struct_4* %r141, i32 0, i32 0
  %r145 = load i32, i32* %r107
  %r144 = getelementptr [4 x %my_struct_3 ], [4 x %my_struct_3 ]* %r143, i32 0, i32 %r145
  %r146 = getelementptr %my_struct_3, %my_struct_3* %r144, i32 0, i32 0
  %r148 = load i32, i32* %r108
  %r147 = getelementptr [5 x %my_struct_2 ], [5 x %my_struct_2 ]* %r146, i32 0, i32 %r148
  %r149 = getelementptr %my_struct_2, %my_struct_2* %r147, i32 0, i32 0
  %r151 = load i32, i32* %r109
  %r150 = getelementptr [8 x %my_struct_1 ], [8 x %my_struct_1 ]* %r149, i32 0, i32 %r151
  %r152 = getelementptr %my_struct_1, %my_struct_1* %r150, i32 0, i32 0
  %r154 = load i32, i32* %r110
  %r153 = getelementptr [7 x i32 ], [7 x i32 ]* %r152, i32 0, i32 %r154
  %r155 = load i32, i32* %r104
  %r156 = load i32, i32* %r105
  %r157 = add i32 %r155, %r156
  %r158 = load i32, i32* %r106
  %r159 = add i32 %r157, %r158
  %r160 = load i32, i32* %r107
  %r161 = add i32 %r159, %r160
  %r162 = load i32, i32* %r108
  %r163 = add i32 %r161, %r162
  %r164 = load i32, i32* %r109
  %r165 = add i32 %r163, %r164
  %r166 = load i32, i32* %r110
  %r167 = add i32 %r165, %r166
  %r168 = load i32, i32* %r101
  %r169 = add i32 %r167, %r168
  %r170 = load i32, i32* %r103
  %r171 = add i32 %r169, %r170
  store i32 %r171, i32* %r153
  %r172 = load i32, i32* %r110
  %r173 = add i32 %r172, 1
  store i32 %r173, i32* %r110
  br label %bb26

bb28:
  %r174 = load i32, i32* %r109
  %r175 = add i32 %r174, 1
  store i32 %r175, i32* %r109
  br label %bb23

bb25:
  %r176 = load i32, i32* %r108
  %r177 = add i32 %r176, 1
  store i32 %r177, i32* %r108
  br label %bb20

bb22:
  %r178 = load i32, i32* %r107
  %r179 = add i32 %r178, 1
  store i32 %r179, i32* %r107
  br label %bb17

bb19:
  %r180 = load i32, i32* %r106
  %r181 = add i32 %r180, 1
  store i32 %r181, i32* %r106
  br label %bb14

bb16:
  %r182 = load i32, i32* %r105
  %r183 = add i32 %r182, 1
  store i32 %r183, i32* %r105
  br label %bb11

bb13:
  %r184 = load i32, i32* %r104
  %r185 = add i32 %r184, 1
  store i32 %r185, i32* %r104
  br label %bb1

bb3:
  ret i32 0
}

define i32 @loop2( ) {
loop2:
  %r186 = alloca i32
  %r187 = alloca i32
  %r188 = alloca i32
  %r189 = alloca i32
  %r190 = alloca i32
  %r191 = alloca i32
  %r192 = alloca i32
  store i32 0, i32* %r186
  br label %bb29

bb29:
  %r194 = load i32, i32* %r186
  %r193 = icmp slt i32 %r194, 10
  br i1 %r193, label %bb30, label %bb31

bb30:
  store i32 0, i32* %r187
  br label %bb32

bb32:
  %r196 = load i32, i32* %r187
  %r195 = icmp slt i32 %r196, 2
  br i1 %r195, label %bb33, label %bb34

bb33:
  store i32 0, i32* %r188
  br label %bb35

bb35:
  %r198 = load i32, i32* %r188
  %r197 = icmp slt i32 %r198, 3
  br i1 %r197, label %bb36, label %bb37

bb36:
  store i32 0, i32* %r189
  br label %bb38

bb38:
  %r200 = load i32, i32* %r189
  %r199 = icmp slt i32 %r200, 2
  br i1 %r199, label %bb39, label %bb40

bb39:
  store i32 0, i32* %r190
  br label %bb41

bb41:
  %r202 = load i32, i32* %r190
  %r201 = icmp slt i32 %r202, 4
  br i1 %r201, label %bb42, label %bb43

bb42:
  store i32 0, i32* %r191
  br label %bb44

bb44:
  %r204 = load i32, i32* %r191
  %r203 = icmp slt i32 %r204, 8
  br i1 %r203, label %bb45, label %bb46

bb45:
  store i32 0, i32* %r192
  br label %bb47

bb47:
  %r206 = load i32, i32* %r192
  %r205 = icmp slt i32 %r206, 7
  br i1 %r205, label %bb48, label %bb49

bb48:
  %r208 = load i32, i32* %r186
  %r207 = getelementptr [10 x %my_struct_6 ], [10 x %my_struct_6 ]* @arr2, i32 0, i32 %r208
  %r209 = getelementptr %my_struct_6, %my_struct_6* %r207, i32 0, i32 0
  %r211 = load i32, i32* %r187
  %r210 = getelementptr [2 x %my_struct_5 ], [2 x %my_struct_5 ]* %r209, i32 0, i32 %r211
  %r212 = getelementptr %my_struct_5, %my_struct_5* %r210, i32 0, i32 0
  %r214 = load i32, i32* %r188
  %r213 = getelementptr [3 x %my_struct_4 ], [3 x %my_struct_4 ]* %r212, i32 0, i32 %r214
  %r215 = getelementptr %my_struct_4, %my_struct_4* %r213, i32 0, i32 0
  %r217 = load i32, i32* %r189
  %r216 = getelementptr [4 x %my_struct_3 ], [4 x %my_struct_3 ]* %r215, i32 0, i32 %r217
  %r218 = getelementptr %my_struct_3, %my_struct_3* %r216, i32 0, i32 0
  %r220 = load i32, i32* %r190
  %r219 = getelementptr [5 x %my_struct_2 ], [5 x %my_struct_2 ]* %r218, i32 0, i32 %r220
  %r221 = getelementptr %my_struct_2, %my_struct_2* %r219, i32 0, i32 0
  %r223 = load i32, i32* %r191
  %r222 = getelementptr [8 x %my_struct_1 ], [8 x %my_struct_1 ]* %r221, i32 0, i32 %r223
  %r224 = getelementptr %my_struct_1, %my_struct_1* %r222, i32 0, i32 0
  %r226 = load i32, i32* %r192
  %r225 = getelementptr [7 x i32 ], [7 x i32 ]* %r224, i32 0, i32 %r226
  %r227 = load i32, i32* %r186
  %r228 = load i32, i32* %r187
  %r229 = add i32 %r227, %r228
  %r230 = load i32, i32* %r189
  %r231 = add i32 %r229, %r230
  %r232 = load i32, i32* %r192
  %r233 = add i32 %r231, %r232
  store i32 %r233, i32* %r225
  %r234 = load i32, i32* %r192
  %r235 = add i32 %r234, 1
  store i32 %r235, i32* %r192
  br label %bb47

bb49:
  %r236 = load i32, i32* %r191
  %r237 = add i32 %r236, 1
  store i32 %r237, i32* %r191
  br label %bb44

bb46:
  %r238 = load i32, i32* %r190
  %r239 = add i32 %r238, 1
  store i32 %r239, i32* %r190
  br label %bb41

bb43:
  %r240 = load i32, i32* %r189
  %r241 = add i32 %r240, 1
  store i32 %r241, i32* %r189
  br label %bb38

bb40:
  %r242 = load i32, i32* %r188
  %r243 = add i32 %r242, 1
  store i32 %r243, i32* %r188
  br label %bb35

bb37:
  %r244 = load i32, i32* %r187
  %r245 = add i32 %r244, 1
  store i32 %r245, i32* %r187
  br label %bb32

bb34:
  %r246 = load i32, i32* %r186
  %r247 = add i32 %r246, 1
  store i32 %r247, i32* %r186
  br label %bb29

bb31:
  ret i32 0
}

define i32 @loop3( i32 %r248, i32 %r250, i32 %r252, i32 %r254, i32 %r256, i32 %r258, i32 %r260 ) {
loop3:
  %r249 = alloca i32
  store i32 %r248, i32* %r249
  %r251 = alloca i32
  store i32 %r250, i32* %r251
  %r253 = alloca i32
  store i32 %r252, i32* %r253
  %r255 = alloca i32
  store i32 %r254, i32* %r255
  %r257 = alloca i32
  store i32 %r256, i32* %r257
  %r259 = alloca i32
  store i32 %r258, i32* %r259
  %r261 = alloca i32
  store i32 %r260, i32* %r261
  %r262 = alloca i32
  %r263 = alloca i32
  %r264 = alloca i32
  %r265 = alloca i32
  %r266 = alloca i32
  %r267 = alloca i32
  %r268 = alloca i32
  %r269 = alloca i32
  store i32 0, i32* %r269
  store i32 0, i32* %r262
  br label %bb50

bb50:
  %r271 = load i32, i32* %r262
  %r270 = icmp slt i32 %r271, 10
  br i1 %r270, label %bb51, label %bb52

bb51:
  store i32 0, i32* %r263
  br label %bb53

bb53:
  %r273 = load i32, i32* %r263
  %r272 = icmp slt i32 %r273, 100
  br i1 %r272, label %bb54, label %bb55

bb54:
  store i32 0, i32* %r264
  br label %bb56

bb56:
  %r275 = load i32, i32* %r264
  %r274 = icmp slt i32 %r275, 1000
  br i1 %r274, label %bb57, label %bb58

bb57:
  store i32 0, i32* %r265
  br label %bb59

bb59:
  %r277 = load i32, i32* %r265
  %r276 = icmp slt i32 %r277, 10000
  br i1 %r276, label %bb60, label %bb61

bb60:
  store i32 0, i32* %r266
  br label %bb62

bb62:
  %r279 = load i32, i32* %r266
  %r278 = icmp slt i32 %r279, 100000
  br i1 %r278, label %bb63, label %bb64

bb63:
  store i32 0, i32* %r267
  br label %bb65

bb65:
  %r281 = load i32, i32* %r267
  %r280 = icmp slt i32 %r281, 1000000
  br i1 %r280, label %bb66, label %bb67

bb66:
  store i32 0, i32* %r268
  br label %bb68

bb68:
  %r283 = load i32, i32* %r268
  %r282 = icmp slt i32 %r283, 10000000
  br i1 %r282, label %bb69, label %bb70

bb69:
  %r284 = load i32, i32* %r269
  %r285 = load i32, i32* %r269
  %r286 = sdiv i32 %r285, 817
  %r287 = mul i32 %r286, 817
  %r288 = sub i32 %r284, %r287
  %r290 = load i32, i32* %r262
  %r289 = getelementptr [10 x %my_struct_6 ], [10 x %my_struct_6 ]* @arr1, i32 0, i32 %r290
  %r291 = getelementptr %my_struct_6, %my_struct_6* %r289, i32 0, i32 0
  %r293 = load i32, i32* %r263
  %r292 = getelementptr [2 x %my_struct_5 ], [2 x %my_struct_5 ]* %r291, i32 0, i32 %r293
  %r294 = getelementptr %my_struct_5, %my_struct_5* %r292, i32 0, i32 0
  %r296 = load i32, i32* %r264
  %r295 = getelementptr [3 x %my_struct_4 ], [3 x %my_struct_4 ]* %r294, i32 0, i32 %r296
  %r297 = getelementptr %my_struct_4, %my_struct_4* %r295, i32 0, i32 0
  %r299 = load i32, i32* %r265
  %r298 = getelementptr [4 x %my_struct_3 ], [4 x %my_struct_3 ]* %r297, i32 0, i32 %r299
  %r300 = getelementptr %my_struct_3, %my_struct_3* %r298, i32 0, i32 0
  %r302 = load i32, i32* %r266
  %r301 = getelementptr [5 x %my_struct_2 ], [5 x %my_struct_2 ]* %r300, i32 0, i32 %r302
  %r303 = getelementptr %my_struct_2, %my_struct_2* %r301, i32 0, i32 0
  %r305 = load i32, i32* %r267
  %r304 = getelementptr [8 x %my_struct_1 ], [8 x %my_struct_1 ]* %r303, i32 0, i32 %r305
  %r306 = getelementptr %my_struct_1, %my_struct_1* %r304, i32 0, i32 0
  %r308 = load i32, i32* %r268
  %r307 = getelementptr [7 x i32 ], [7 x i32 ]* %r306, i32 0, i32 %r308
  %r309 = load i32, i32* %r307
  %r310 = add i32 %r288, %r309
  %r312 = load i32, i32* %r262
  %r311 = getelementptr [10 x %my_struct_6 ], [10 x %my_struct_6 ]* @arr2, i32 0, i32 %r312
  %r313 = getelementptr %my_struct_6, %my_struct_6* %r311, i32 0, i32 0
  %r315 = load i32, i32* %r263
  %r314 = getelementptr [2 x %my_struct_5 ], [2 x %my_struct_5 ]* %r313, i32 0, i32 %r315
  %r316 = getelementptr %my_struct_5, %my_struct_5* %r314, i32 0, i32 0
  %r318 = load i32, i32* %r264
  %r317 = getelementptr [3 x %my_struct_4 ], [3 x %my_struct_4 ]* %r316, i32 0, i32 %r318
  %r319 = getelementptr %my_struct_4, %my_struct_4* %r317, i32 0, i32 0
  %r321 = load i32, i32* %r265
  %r320 = getelementptr [4 x %my_struct_3 ], [4 x %my_struct_3 ]* %r319, i32 0, i32 %r321
  %r322 = getelementptr %my_struct_3, %my_struct_3* %r320, i32 0, i32 0
  %r324 = load i32, i32* %r266
  %r323 = getelementptr [5 x %my_struct_2 ], [5 x %my_struct_2 ]* %r322, i32 0, i32 %r324
  %r325 = getelementptr %my_struct_2, %my_struct_2* %r323, i32 0, i32 0
  %r327 = load i32, i32* %r267
  %r326 = getelementptr [8 x %my_struct_1 ], [8 x %my_struct_1 ]* %r325, i32 0, i32 %r327
  %r328 = getelementptr %my_struct_1, %my_struct_1* %r326, i32 0, i32 0
  %r330 = load i32, i32* %r268
  %r329 = getelementptr [7 x i32 ], [7 x i32 ]* %r328, i32 0, i32 %r330
  %r331 = load i32, i32* %r329
  %r332 = add i32 %r310, %r331
  store i32 %r332, i32* %r269
  %r333 = load i32, i32* %r268
  %r334 = add i32 %r333, 1
  store i32 %r334, i32* %r268
  %r337 = load i32, i32* %r268
  %r338 = load i32, i32* %r261
  %r336 = icmp sge i32 %r337, %r338
  br i1 %r336, label %bb71, label %bb72

bb71:
  br label %bb70

bb72:
  br label %bb73

bb73:
  br label %bb68

bb70:
  %r339 = load i32, i32* %r267
  %r340 = add i32 %r339, 1
  store i32 %r340, i32* %r267
  %r343 = load i32, i32* %r267
  %r344 = load i32, i32* %r259
  %r342 = icmp sge i32 %r343, %r344
  br i1 %r342, label %bb74, label %bb75

bb74:
  br label %bb67

bb75:
  br label %bb76

bb76:
  br label %bb65

bb67:
  %r345 = load i32, i32* %r266
  %r346 = add i32 %r345, 1
  store i32 %r346, i32* %r266
  %r349 = load i32, i32* %r266
  %r350 = load i32, i32* %r257
  %r348 = icmp sge i32 %r349, %r350
  br i1 %r348, label %bb77, label %bb78

bb77:
  br label %bb64

bb78:
  br label %bb79

bb79:
  br label %bb62

bb64:
  %r351 = load i32, i32* %r265
  %r352 = add i32 %r351, 1
  store i32 %r352, i32* %r265
  %r355 = load i32, i32* %r265
  %r356 = load i32, i32* %r255
  %r354 = icmp sge i32 %r355, %r356
  br i1 %r354, label %bb80, label %bb81

bb80:
  br label %bb61

bb81:
  br label %bb82

bb82:
  br label %bb59

bb61:
  %r357 = load i32, i32* %r264
  %r358 = add i32 %r357, 1
  store i32 %r358, i32* %r264
  %r361 = load i32, i32* %r264
  %r362 = load i32, i32* %r253
  %r360 = icmp sge i32 %r361, %r362
  br i1 %r360, label %bb83, label %bb84

bb83:
  br label %bb58

bb84:
  br label %bb85

bb85:
  br label %bb56

bb58:
  %r363 = load i32, i32* %r263
  %r364 = add i32 %r363, 1
  store i32 %r364, i32* %r263
  %r367 = load i32, i32* %r263
  %r368 = load i32, i32* %r251
  %r366 = icmp sge i32 %r367, %r368
  br i1 %r366, label %bb86, label %bb87

bb86:
  br label %bb55

bb87:
  br label %bb88

bb88:
  br label %bb53

bb55:
  %r369 = load i32, i32* %r262
  %r370 = add i32 %r369, 1
  store i32 %r370, i32* %r262
  %r373 = load i32, i32* %r262
  %r374 = load i32, i32* %r249
  %r372 = icmp sge i32 %r373, %r374
  br i1 %r372, label %bb89, label %bb90

bb89:
  br label %bb52

bb90:
  br label %bb91

bb91:
  br label %bb50

bb52:
  %r375 = load i32, i32* %r269
  ret i32 %r375
}

define i32 @main( ) {
main:
  call void @_sysy_starttime(i32 97)
  %r376 = call i32 @getint()
  %r377 = alloca i32
  store i32 %r376, i32* %r377
  %r378 = call i32 @getint()
  %r379 = alloca i32
  store i32 %r378, i32* %r379
  %r380 = call i32 @getint()
  %r381 = alloca i32
  store i32 %r380, i32* %r381
  %r382 = call i32 @getint()
  %r383 = alloca i32
  store i32 %r382, i32* %r383
  %r384 = call i32 @getint()
  %r385 = alloca i32
  store i32 %r384, i32* %r385
  %r386 = call i32 @getint()
  %r387 = alloca i32
  store i32 %r386, i32* %r387
  %r388 = call i32 @getint()
  %r389 = alloca i32
  store i32 %r388, i32* %r389
  %r390 = call i32 @getint()
  %r391 = alloca i32
  store i32 %r390, i32* %r391
  %r392 = call i32 @getint()
  %r393 = alloca i32
  store i32 %r392, i32* %r393
  %r394 = load i32, i32* %r377
  %r395 = load i32, i32* %r379
  %r396 = call i32 @loop1(i32 %r394, i32 %r395)
  %r397 = call i32 @loop2()
  %r399 = loa