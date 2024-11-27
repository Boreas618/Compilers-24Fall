@n = global i32 0
define i32 @bubblesort( i32* %r100 ) {
bubblesort:
  %r127 = alloca i32
  %r124 = alloca i32
  %r115 = alloca i32
  %r101 = alloca i32
  %r102 = alloca i32
  store i32 0, i32* %r101
  br label %bb1

bb1:
  %r104 = load i32, i32* %r101
  %r105 = load i32, i32* @n
  %r106 = sub i32 %r105, 1
  %r103 = icmp slt i32 %r104, %r106
  br i1 %r103, label %bb2, label %bb3

bb2:
  store i32 0, i32* %r102
  br label %bb4

bb4:
  %r108 = load i32, i32* %r102
  %r109 = load i32, i32* @n
  %r110 = load i32, i32* %r101
  %r111 = sub i32 %r109, %r110
  %r112 = sub i32 %r111, 1
  %r107 = icmp slt i32 %r108, %r112
  br i1 %r107, label %bb5, label %bb6

bb5:
  %r113 = load i32, i32* %r102
  %r114 = add i32 %r113, 1
  store i32 %r114, i32* %r115
  %r119 = load i32, i32* %r102
  %r118 = getelementptr i32, i32* %r100, i32 %r119
  %r120 = load i32, i32* %r118
  %r122 = load i32, i32* %r115
  %r121 = getelementptr i32, i32* %r100, i32 %r122
  %r123 = load i32, i32* %r121
  %r117 = icmp sgt i32 %r120, %r123
  br i1 %r117, label %bb7, label %bb8

bb7:
  %r125 = load i32, i32* %r102
  %r126 = add i32 %r125, 1
  store i32 %r126, i32* %r127
  %r129 = load i32, i32* %r127
  %r128 = getelementptr i32, i32* %r100, i32 %r129
  %r130 = load i32, i32* %r128
  store i32 %r130, i32* %r124
  %r132 = load i32, i32* %r127
  %r131 = getelementptr i32, i32* %r100, i32 %r132
  %r134 = load i32, i32* %r102
  %r133 = getelementptr i32, i32* %r100, i32 %r134
  %r135 = load i32, i32* %r133
  store i32 %r135, i32* %r131
  %r137 = load i32, i32* %r102
  %r136 = getelementptr i32, i32* %r100, i32 %r137
  %r138 = load i32, i32* %r124
  store i32 %r138, i32* %r136
  br label %bb9

bb8:
  br label %bb9

bb9:
  %r139 = load i32, i32* %r102
  %r140 = add i32 %r139, 1
  store i32 %r140, i32* %r102
  br label %bb4

bb6:
  %r141 = load i32, i32* %r101
  %r142 = add i32 %r141, 1
  store i32 %r142, i32* %r101
  br label %bb1

bb3:
  ret i32 0
}

define i32 @insertsort( i32* %r143 ) {
insertsort:
  %r180 = alloca i32
  %r170 = alloca i32
  %r160 = alloca i32
  %r155 = alloca i32
  %r152 = alloca i32
  %r148 = alloca i32
  %r144 = alloca i32
  store i32 1, i32* %r144
  br label %bb10

bb10:
  %r146 = load i32, i32* %r144
  %r147 = load i32, i32* @n
  %r145 = icmp slt i32 %r146, %r147
  br i1 %r145, label %bb11, label %bb12

bb11:
  %r150 = load i32, i32* %r144
  %r149 = getelementptr i32, i32* %r143, i32 %r150
  %r151 = load i32, i32* %r149
  store i32 %r151, i32* %r148
  %r153 = load i32, i32* %r144
  %r154 = sub i32 %r153, 1
  store i32 %r154, i32* %r152
  br label %bb13

bb13:
  %r157 = load i32, i32* %r152
  %r156 = icmp sgt i32 %r157, -1
  br i1 %r156, label %bb17, label %bb18

bb17:
  store i32 1, i32* %r155
  br label %bb19

bb18:
  store i32 0, i32* %r155
  br label %bb19

bb19:
  %r159 = load i32, i32* %r155
  %r158 = icmp ne i32 %r159, 0
  br i1 %r158, label %bb16, label %bb15

bb16:
  %r162 = load i32, i32* %r148
  %r164 = load i32, i32* %r152
  %r163 = getelementptr i32, i32* %r143, i32 %r164
  %r165 = load i32, i32* %r163
  %r161 = icmp slt i32 %r162, %r165
  br i1 %r161, label %bb20, label %bb21

bb20:
  store i32 1, i32* %r160
  br label %bb22

bb21:
  store i32 0, i32* %r160
  br label %bb22

bb22:
  %r167 = load i32, i32* %r160
  %r166 = icmp ne i32 %r167, 0
  br i1 %r166, label %bb14, label %bb15

bb14:
  %r168 = load i32, i32* %r152
  %r169 = add i32 %r168, 1
  store i32 %r169, i32* %r170
  %r172 = load i32, i32* %r170
  %r171 = getelementptr i32, i32* %r143, i32 %r172
  %r174 = load i32, i32* %r152
  %r173 = getelementptr i32, i32* %r143, i32 %r174
  %r175 = load i32, i32* %r173
  store i32 %r175, i32* %r171
  %r176 = load i32, i32* %r152
  %r177 = sub i32 %r176, 1
  store i32 %r177, i32* %r152
  br label %bb13

bb15:
  %r178 = load i32, i32* %r152
  %r179 = add i32 %r178, 1
  store i32 %r179, i32* %r180
  %r182 = load i32, i32* %r180
  %r181 = getelementptr i32, i32* %r143, i32 %r182
  %r183 = load i32, i32* %r148
  store i32 %r183, i32* %r181
  %r184 = load i32, i32* %r144
  %r185 = add i32 %r184, 1
  store i32 %r185, i32* %r144
  br label %bb10

bb12:
  ret i32 0
}

define i32 @QuickSort( i32* %r186, i32 %r187, i32 %r189 ) {
QuickSort:
  %r264 = alloca i32
  %r240 = alloca i32
  %r234 = alloca i32
  %r212 = alloca i32
  %r206 = alloca i32
  %r199 = alloca i32
  %r197 = alloca i32
  %r195 = alloca i32
  %r188 = alloca i32
  store i32 %r187, i32* %r188
  %r190 = alloca i32
  store i32 %r189, i32* %r190
  %r193 = load i32, i32* %r188
  %r194 = load i32, i32* %r190
  %r192 = icmp slt i32 %r193, %r194
  br i1 %r192, label %bb23, label %bb24

bb23:
  %r196 = load i32, i32* %r188
  store i32 %r196, i32* %r195
  %r198 = load i32, i32* %r190
  store i32 %r198, i32* %r197
  %r201 = load i32, i32* %r188
  %r200 = getelementptr i32, i32* %r186, i32 %r201
  %r202 = load i32, i32* %r200
  store i32 %r202, i32* %r199
  br label %bb26

bb26:
  %r204 = load i32, i32* %r195
  %r205 = load i32, i32* %r197
  %r203 = icmp slt i32 %r204, %r205
  br i1 %r203, label %bb27, label %bb28

bb27:
  br label %bb29

bb29:
  %r208 = load i32, i32* %r195
  %r209 = load i32, i32* %r197
  %r207 = icmp slt i32 %r208, %r209
  br i1 %r207, label %bb33, label %bb34

bb33:
  store i32 1, i32* %r206
  br label %bb35

bb34:
  store i32 0, i32* %r206
  br label %bb35

bb35:
  %r211 = load i32, i32* %r206
  %r210 = icmp ne i32 %r211, 0
  br i1 %r210, label %bb32, label %bb31

bb32:
  %r215 = load i32, i32* %r197
  %r214 = getelementptr i32, i32* %r186, i32 %r215
  %r216 = load i32, i32* %r214
  %r217 = load i32, i32* %r199
  %r218 = sub i32 %r217, 1
  %r213 = icmp sgt i32 %r216, %r218
  br i1 %r213, label %bb36, label %bb37

bb36:
  store i32 1, i32* %r212
  br label %bb38

bb37:
  store i32 0, i32* %r212
  br label %bb38

bb38:
  %r220 = load i32, i32* %r212
  %r219 = icmp ne i32 %r220, 0
  br i1 %r219, label %bb30, label %bb31

bb30:
  %r221 = load i32, i32* %r197
  %r222 = sub i32 %r221, 1
  store i32 %r222, i32* %r197
  br label %bb29

bb31:
  %r225 = load i32, i32* %r195
  %r226 = load i32, i32* %r197
  %r224 = icmp slt i32 %r225, %r226
  br i1 %r224, label %bb39, label %bb40

bb39:
  %r228 = load i32, i32* %r195
  %r227 = getelementptr i32, i32* %r186, i32 %r228
  %r230 = load i32, i32* %r197
  %r229 = getelementptr i32, i32* %r186, i32 %r230
  %r231 = load i32, i32* %r229
  store i32 %r231, i32* %r227
  %r232 = load i32, i32* %r195
  %r233 = add i32 %r232, 1
  store i32 %r233, i32* %r195
  br label %bb41

bb40:
  br label %bb41

bb41:
  br label %bb42

bb42:
  %r236 = load i32, i32* %r195
  %r237 = load i32, i32* %r197
  %r235 = icmp slt i32 %r236, %r237
  br i1 %r235, label %bb46, label %bb47

bb46:
  store i32 1, i32* %r234
  br label %bb48

bb47:
  store i32 0, i32* %r234
  br label %bb48

bb48:
  %r239 = load i32, i32* %r234
  %r238 = icmp ne i32 %r239, 0
  br i1 %r238, label %bb45, label %bb44

bb45:
  %r243 = load i32, i32* %r195
  %r242 = getelementptr i32, i32* %r186, i32 %r243
  %r244 = load i32, i32* %r242
  %r245 = load i32, i32* %r199
  %r241 = icmp slt i32 %r244, %r245
  br i1 %r241, label %bb49, label %bb50

bb49:
  store i32 1, i32* %r240
  br label %bb51

bb50:
  store i32 0, i32* %r240
  br label %bb51

bb51:
  %r247 = load i32, i32* %r240
  %r246 = icmp ne i32 %r247, 0
  br i1 %r246, label %bb43, label %bb44

bb43:
  %r248 = load i32, i32* %r195
  %r249 = add i32 %r248, 1
  store i32 %r249, i32* %r195
  br label %bb42

bb44:
  %r252 = load i32, i32* %r195
  %r253 = load i32, i32* %r197
  %r251 = icmp slt i32 %r252, %r253
  br i1 %r251, label %bb52, label %bb53

bb52:
  %r255 = load i32, i32* %r197
  %r254 = getelementptr i32, i32* %r186, i32 %r255
  %r257 = load i32, i32* %r195
  %r256 = getelementptr i32, i32* %r186, i32 %r257
  %r258 = load i32, i32* %r256
  store i32 %r258, i32* %r254
  %r259 = load i32, i32* %r197
  %r260 = sub i32 %r259, 1
  store i32 %r260, i32* %r197
  br label %bb54

bb53:
  br label %bb54

bb54:
  br label %bb26

bb28:
  %r262 = load i32, i32* %r195
  %r261 = getelementptr i32, i32* %r186, i32 %r262
  %r263 = load i32, i32* %r199
  store i32 %r263, i32* %r261
  %r265 = load i32, i32* %r195
  %r266 = sub i32 %r265, 1
  store i32 %r266, i32* %r264
  %r268 = load i32, i32* %r188
  %r269 = load i32, i32* %r264
  %r267 = call i32 @QuickSort(i32* %r186, i32 %r268, i32 %r269)
  store i32 %r267, i32* %r264
  %r270 = load i32, i32* %r195
  %r271 = add i32 %r270, 1
  store i32 %r271, i32* %r264
  %r273 = load i32, i32* %r264
  %r274 = load i32, i32* %r190
  %r272 = call i32 @QuickSort(i32* %r186, i32 %r273, i32 %r274)
  store i32 %r272, i32* %r264
  br label %bb25

bb24:
  br label %bb25

bb25:
  ret i32 0
}

define i32 @getMid( i32* %r275 ) {
getMid:
  %r287 = alloca i32
  %r276 = alloca i32
  %r279 = load i32, i32* @n
  %r280 = sdiv i32 %r279, 2
  %r281 = mul i32 %r280, 2
  %r282 = load i32, i32* @n
  %r278 = icmp eq i32 %r281, %r282
  br i1 %r278, label %bb55, label %bb56

bb55:
  %r283 = load i32, i32* @n
  %r284 = sdiv i32 %r283, 2
  store i32 %r284, i32* %r276
  %r285 = load i32, i32* %r276
  %r286 = sub i32 %r285, 1
  store i32 %r286, i32* %r287
  %r289 = load i32, i32* %r276
  %r288 = getelementptr i32, i32* %r275, i32 %r289
  %r290 = load i32, i32* %r288
  %r292 = load i32, i32* %r287
  %r291 = getelementptr i32, i32* %r275, i32 %r292
  %r293 = load i32, i32* %r291
  %r294 = add i32 %r290, %r293
  %r295 = sdiv i32 %r294, 2
  ret i32 %r295
bb56:
  %r296 = load i32, i32* @n
  %r297 = sdiv i32 %r296, 2
  store i32 %r297, i32* %r276
  %r299 = load i32, i32* %r276
  %r298 = getelementptr i32, i32* %r275, i32 %r299
  %r300 = load i32, i32* %r298
  ret i32 %r300
bb57:
  ret i32 0
}

define i32 @getMost( i32* %r301 ) {
getMost:
  %r315 = alloca i32
  %r311 = alloca i32
  %r310 = alloca i32
  %r302 = alloca [ 1000 x i32 ]
  %r303 = alloca i32
  store i32 0, i32* %r303
  br label %bb58

bb58:
  %r305 = load i32, i32* %r303
  %r304 = icmp slt i32 %r305, 1000
  br i1 %r304, label %bb59, label %bb60

bb59:
  %r307 = load i32, i32* %r303
  %r306 = getelementptr [1000 x i32 ], [1000 x i32 ]* %r302, i32 0, i32 %r307
  store i32 0, i32* %r306
  %r308 = load i32, i32* %r303
  %r309 = add i32 %r308, 1
  store i32 %r309, i32* %r303
  br label %bb58

bb60:
  store i32 0, i32* %r303
  store i32 0, i32* %r310
  br label %bb61

bb61:
  %r313 = load i32, i32* %r303
  %r314 = load i32, i32* @n
  %r312 = icmp slt i32 %r313, %r314
  br i1 %r312, label %bb62, label %bb63

bb62:
  %r317 = load i32, i32* %r303
  %r316 = getelementptr i32, i32* %r301, i32 %r317
  %r318 = load i32, i32* %r316
  store i32 %r318, i32* %r315
  %r320 = load i32, i32* %r315
  %r319 = getelementptr [1000 x i32 ], [1000 x i32 ]* %r302, i32 0, i32 %r320
  %r322 = load i32, i32* %r315
  %r321 = getelementptr [1000 x i32 ], [1000 x i32 ]* %r302, i32 0, i32 %r322
  %r323 = load i32, i32* %r321
  %r324 = add i32 %r323, 1
  store i32 %r324, i32* %r319
  %r328 = load i32, i32* %r315
  %r327 = getelementptr [1000 x i32 ], [1000 x i32 ]* %r302, i32 0, i32 %r328
  %r329 = load i32, i32* %r327
  %r330 = load i32, i32* %r310
  %r326 = icmp sgt i32 %r329, %r330
  br i1 %r326, label %bb64, label %bb65

bb64:
  %r332 = load i32, i32* %r315
  %r331 = getelementptr [1000 x i32 ], [1000 x i32 ]* %r302, i32 0, i32 %r332
  %r333 = load i32, i32* %r331
  store i32 %r333, i32* %r310
  %r334 = load i32, i32* %r315
  store i32 %r334, i32* %r311
  br label %bb66

bb65:
  br label %bb66

bb66:
  %r335 = load i32, i32* %r303
  %r336 = add i32 %r335, 1
  store i32 %r336, i32* %r303
  br label %bb61

bb63:
  %r337 = load i32, i32* %r311
  ret i32 %r337
}

define i32 @revert( i32* %r338 ) {
revert:
  %r339 = alloca i32
  %r340 = alloca i32
  %r341 = alloca i32
  store i32 0, i32* %r340
  store i32 0, i32* %r341
  br label %bb67

bb67:
  %r343 = load i32, i32* %r340
  %r344 = load i32, i32* %r341
  %r342 = icmp slt i32 %r343, %r344
  br i1 %r342, label %bb68, label %bb69

bb68:
  %r346 = load i32, i32* %r340
  %r345 = getelementptr i32, i32* %r338, i32 %r346
  %r347 = load i32, i32* %r345
  store i32 %r347, i32* %r339
  %r349 = load i32, i32* %r340
  %r348 = getelementptr i32, i32* %r338, i32 %r349
  %r351 = load i32, i32* %r341
  %r350 = getelementptr i32, i32* %r338, i32 %r351
  %r352 = load i32, i32* %r350
  store i32 %r352, i32* %r348
  %r354 = load i32, i32* %r341
  %r353 = getelementptr i32, i32* %r338, i32 %r354
  %r355 = load i32, i32* %r339
  store i32 %r355, i32* %r353
  %r356 = load i32, i32* %r340
  %r357 = add i32 %r356, 1
  store i32 %r357, i32* %r340
  %r358 = load i32, i32* %r341
  %r359 = sub i32 %r358, 1
  store i32 %r359, i32* %r341
  br label %bb67

bb69:
  ret i32 0
}

define i32 @arrCopy( i32* %r360, i32* %r361 ) {
arrCopy:
  %r362 = alloca i32
  store i32 0, i32* %r362
  br label %bb70

bb70:
  %r364 = load i32, i32* %r362
  %r365 = load i32, i32* @n
  %r363 = icmp slt i32 %r364, %r365
  br i1 %r363, label %bb71, label %bb72

bb71:
  %r367 = load i32, i32* %r362
  %r366 = getelementptr i32, i32* %r361, i32 %r367
  %r369 = load i32, i32* %r362
  %r368 = getelementptr i32, i32* %r360, i32 %r369
  %r370 = load i32, i32* %r368
  store i32 %r370, i32* %r366
  %r371 = load i32, i32* %r362
  %r372 = add i32 %r371, 1
  store i32 %r372, i32* %r362
  br label %bb70

bb72:
  ret i32 0
}

define i32 @calSum( i32* %r373, i32 %r374 ) {
calSum:
  %r375 = alloca i32
  store i32 %r374, i32* %r375
  %r376 = alloca i32
  store i32 0, i32* %r376
  %r377 = alloca i32
  store i32 0, i32* %r377
  br label %bb73

bb73:
  %r379 = load i32, i32* %r377
  %r380 = load i32, i32* @n
  %r378 = icmp slt i32 %r379, %r380
  br i1 %r378, label %bb74, label %bb75

bb74:
  %r381 = load i32, i32* %r376
  %r383 = load i32, i32* %r377
  %r382 = getelementptr i32, i32* %r373, i32 %r383
  %r384 = load i32, i32* %r382
  %r385 = add i32 %r381, %r384
  store i32 %r385, i32* %r376
  %r388 = load i32, i32* %r377
  %r389 = load i32, i32* %r377
  %r390 = load i32, i32* %r375
  %r391 = sdiv i32 %r389, %r390
  %r392 = load i32, i32* %r375
  %r393 = mul i32 %r391, %r392
  %r394 = sub i32 %r388, %r393
  %r395 = load i32, i32* %r375
  %r396 = sub i32 %r395, 1
  %r387 = icmp ne i32 %r394, %r396
  br i1 %r387, label %bb76, label %bb77

bb76:
  %r398 = load i32, i32* %r377
  %r397 = getelementptr i32, i32* %r373, i32 %r398
  store i32 0, i32* %r397
  br label %bb78

bb77:
  %r400 = load i32, i32* %r377
  %r399 = getelementptr i32, i32* %r373, i32 %r400
  %r401 = load i32, i32* %r376
  store i32 %r401, i32* %r399
  store i32 0, i32* %r376
  br label %bb78

bb78:
  %r402 = load i32, i32* %r377
  %r403 = add i32 %r402, 1
  store i32 %r403, i32* %r377
  br label %bb73

bb75:
  ret i32 0
}

define i32 @avgPooling( i32* %r404, i32 %r405 ) {
avgPooling:
  %r441 = alloca i32
  %r406 = alloca i32
  store i32 %r405, i32* %r406
  %r407 = alloca i32
  %r408 = alloca i32
  store i32 0, i32* %r408
  store i32 0, i32* %r407
  %r409 = alloca i32
  br label %bb79

bb79:
  %r411 = load i32, i32* %r408
  %r412 = load i32, i32* @n
  %r410 = icmp slt i32 %r411, %r412
  br i1 %r410, label %bb80, label %bb81

bb80:
  %r415 = load i32, i32* %r408
  %r416 = load i32, i32* %r406
  %r417 = sub i32 %r416, 1
  %r414 = icmp slt i32 %r415, %r417
  br i1 %r414, label %bb82, label %bb83

bb82:
  %r418 = load i32, i32* %r407
  %r420 = load i32, i32* %r408
  %r419 = getelementptr i32, i32* %r404, i32 %r420
  %r421 = load i32, i32* %r419
  %r422 = add i32 %r418, %r421
  store i32 %r422, i32* %r407
  br label %bb84

bb83:
  %r425 = load i32, i32* %r408
  %r426 = load i32, i32* %r406
  %r427 = sub i32 %r426, 1
  %r424 = icmp eq i32 %r425, %r427
  br i1 %r424, label %bb85, label %bb86

bb85:
  %r428 = getelementptr i32, i32* %r404, i32 0
  %r429 = load i32, i32* %r428
  store i32 %r429, i32* %r409
  %r430 = getelementptr i32, i32* %r404, i32 0
  %r431 = load i32, i32* %r407
  %r432 = load i32, i32* %r406
  %r433 = sdiv i32 %r431, %r432
  store i32 %r433, i32* %r430
  br label %bb87

bb86:
  %r434 = load i32, i32* %r407
  %r436 = load i32, i32* %r408
  %r435 = getelementptr i32, i32* %r404, i32 %r436
  %r437 = load i32, i32* %r435
  %r438 = add i32 %r434, %r437
  %r439 = load i32, i32* %r409
  %r440 = sub i32 %r438, %r439
  store i32 %r440, i32* %r407
  %r442 = load i32, i32* %r408
  %r443 = load i32, i32* %r406
  %r444 = sub i32 %r442, %r443
  %r445 = add i32 %r444, 1
  store i32 %r445, i32* %r441
  %r447 = load i32, i32* %r441
  %r446 = getelementptr i32, i32* %r404, i32 %r447
  %r448 = load i32, i32* %r446
  store i32 %r448, i32* %r409
  %r450 = load i32, i32* %r441
  %r449 = getelementptr i32, i32* %r404, i32 %r450
  %r451 = load i32, i32* %r407
  %r452 = load i32, i32* %r406
  %r453 = sdiv i32 %r451, %r452
  store i32 %r453, i32* %r449
  br label %bb87

bb87:
  br label %bb84

bb84:
  %r454 = load i32, i32* %r408
  %r455 = add i32 %r454, 1
  store i32 %r455, i32* %r408
  br label %bb79

bb81:
  %r456 = load i32, i32* @n
  %r457 = load i32, i32* %r406
  %r458 = sub i32 %r456, %r457
  %r459 = add i32 %r458, 1
  store i32 %r459, i32* %r408
  br label %bb88

bb88:
  %r461 = load i32, i32* %r408
  %r462 = load i32, i32* @n
  %r460 = icmp slt i32 %r461, %r462
  br i1 %r460, label %bb89, label %bb90

bb89:
  %r464 = load i32, i32* %r408
  %r463 = getelementptr i32, i32* %r404, i32 %r464
  store i32 0, i32* %r463
  %r465 = load i32, i32* %r408
  %r466 = add i32 %r465, 1
  store i32 %r466, i32* %r408
  br label %bb88

bb90:
  ret i32 0
}

define i32 @main( ) {
main:
  call void @_sysy_starttime(i32 209)
  store i32 32, i32* @n
  %r467 = alloca [ 32 x i32 ]
  %r468 = alloca [ 32 x i32 ]
  %r469 = getelementptr [32 x i32 ], [32 x i32 ]* %r467, i32 0, i32 0
  store i32 7, i32* %r469
  %r470 = getelementptr [32 x i32 ], [32 x i32 ]* %r467, i32 0, i32 1
  store i32 23, i32* %r470
  %r471 = getelementptr [32 x i32 ], [32 x i32 ]* %r467, i32 0, i32 2
  store i32 89, i32* %r471
  %r472 = getelementptr [32 x i32 ], [32 x i32 ]* %r467, i32 0, i32 3
  store i32 26, i32* %r472
  %r473 = getelementptr [32 x i32 ], [32 x i32 ]* %r467, i32 0, i32 4
  store i32 282, i32* %r473
  %r474 = getelementptr [32 x i32 ], [32 x i32 ]* %r467, i32 0, i32 5
  store i32 254, i32* %r474
  %r475 = getelementptr [32 x i32 ], [32 x i32 ]* %r467, i32 0, i32 6
  store i32 27, i32* %r475
  %r476 = getelementptr [32 x i32 ], [32 x i32 ]* %r467, i32 0, i32 7
  store i32 5, i32* %r476
  %r477 = getelementptr [32 x i32 ], [32 x i32 ]* %r467, i32 0, i32 8
  store i32 83, i32* %r477
  %r478 = getelementptr [32 x i32 ], [32 x i32 ]* %r467, i32 0, i32 9
  store i32 273, i32* %r478
  %r479 = getelementptr [32 x i32 ], [32 x i32 ]* %r467, i32 0, i32 10
  store i32 574, i32* %r479
  %r480 = getelementptr [32 x i32 ], [32 x i32 ]* %r467, i32 0, i32 11
  store i32 905, i32* %r480
  %r481 = getelementptr [32 x i32 ], [32 x i32 ]* %r467, i32 0, i32 12
  store i32 354, i32* %r481
  %r482 = getelementptr [32 x i32 ], [32 x i32 ]* %r467, i32 0, i32 13
  store i32 657, i32* %r482
  %r483 = getelementptr [32 x i32 ], [32 x i32 ]* %r467, i32 0, i32 14
  store i32 935, i32* %r483
  %r484 = getelementptr [32 x i32 ], [32 x i32 ]* %r467, i32 0, i32 15
  store i32 264, i32* %r484
  %r485 = getelementptr [32 x i32 ], [32 x i32 ]* %r467, i32 0, i32 16
  store i32 639, i32* %r485
  %r486 = getelementptr [32 x i32 ], [32 x i32 ]* %r467, i32 0, i32 17
  store i32 459, i32* %r486
  %r487 = getelementptr [32 x i32 ], [32 x i32 ]* %r467, i32 0, i32 18
  store i32 29, i32* %r487
  %r488 = getelementptr [32 x i32 ], [32 x i32 ]* %r467, i32 0, i32 19
  store i32 68, i32* %r488
  %r489 = getelementptr [32 x i32 ], [32 x i32 ]* %r467, i32 0, i32 20
  store i32 929, i32* %r489
  %r490 = getelementptr [32 x i32 ], [32 x i32 ]* %r467, i32 0, i32 21
  store i32 756, i32* %r490
  %r491 = getelementptr [32 x i32 ], [32 x i32 ]* %r467, i32 0, i32 22
  store i32 452, i32* %r491
  %r492 = getelementptr [32 x i32 ], [32 x i32 ]* %r467, i32 0, i32 23
  store i32 279, i32* %r492
  %r493 = getelementptr [32 x i32 ], [32 x i32 ]* %r467, i32 0, i32 24
  store i32 58, i32* %r493
  %r494 = getelementptr [32 x i32 ], [32 x i32 ]* %r467, i32 0, i32 25
  store i32 87, i32* %r494
  %r495 = getelementptr [32 x i32 ], [32 x i32 ]* %r467, i32 0, i32 26
  store i32 96, i32* %r495
  %r496 = getelementptr [32 x i32 ], [32 x i32 ]* %r467, i32 0, i32 27
  store i32 36, i32* %r496
  %r497 = getelementptr [32 x i32 ], [32 x i32 ]* %r467, i32 0, i32 28
  store i32 39, i32* %r497
  %r498 = getelementptr [32 x i32 ], [32 x i32 ]* %r467, i32 0, i32 29
  store i32 28, i32* %r498
  %r499 = getelementptr [32 x i32 ], [32 x i32 ]* %r467, i32 0, i32 30
  store i32 1, i32* %r499
  %r500 = getelementptr [32 x i32 ], [32 x i32 ]* %r467, i32 0, i32 31
  store i32 290, i32* %r500
  %r501 = alloca i32
  %r502 = call i32 @arrCopy(i32* %r467, i32* %r468)
  store i32 %r502, i32* %r501
  %r503 = call i32 @revert(i32* %r468)
  store i32 %r503, i32* %r501
  %r504 = alloca i32
  store i32 0, i32* %r504
  br label %bb91

bb91:
  %r506 = load i32, i32* %r504
  %r505 = icmp slt i32 %r506, 32
  br i1 %r505, label %bb92, label %bb93

bb92:
  %r508 = load i32, i32* %r504
  %r507 = getelementptr [32 x i32 ], [32 x i32 ]* %r468, i32 0, i32 %r508
  %r509 = load i32, i32* %r507
  store i32 %r509, i32* %r501
  %r510 = load i32, i32* %r501
  call void @putint(i32 %r510)
  %r511 = load i32, i32* %r504
  %r512 = add i32 %r511, 1
  store i32 %r512, i32* %r504
  br label %bb91

bb93:
  %r513 = call i32 @bubblesort(i32* %r468)
  store i32 %r513, i32* %r501
  store i32 0, i32* %r504
  br label %bb94

bb94:
  %r515 = load i32, i32* %r504
  %r514 = icmp slt i32 %r515, 32
  br i1 %r514, label %bb95, label %bb96

bb95:
  %r517 = load i32, i32* %r504
  %r516 = getelementptr [32 x i32 ], [32 x i32 ]* %r468, i32 0, i32 %r517
  %r518 = load i32, i32* %r516
  store i32 %r518, i32* %r501
  %r519 = load i32, i32* %r501
  call void @putint(i32 %r519)
  %r520 = load i32, i32* %r504
  %r521 = add i32 %r520, 1
  store i32 %r521, i32* %r504
  br label %bb94

bb96:
  %r522 = call i32 @getMid(i32* %r468)
  store i32 %r522, i32* %r501
  %r523 = load i32, i32* %r501
  call void @putint(i32 %r523)
  %r524 = call i32 @getMost(i32* %r468)
  store i32 %r524, i32* %r501
  %r525 = load i32, i32* %r501
  call void @putint(i32 %r525)
  %r526 = call i32 @arrCopy(i32* %r467, i32* %r468)
  store i32 %r526, i32* %r501
  %r527 = call i32 @bubblesort(i32* %r468)
  store i32 %r527, i32* %r501
  store i32 0, i32* %r504
  br label %bb97

bb97:
  %r529 = load i32, i32* %r504
  %r528 = icmp slt i32 %r529, 32
  br i1 %r528, label %bb98, label %bb99

bb98:
  %r531 = load i32, i32* %r504
  %r530 = getelementptr [32 x i32 ], [32 x i32 ]* %r468, i32 0, i32 %r531
  %r532 = load i32, i32* %r530
  store i32 %r532, i32* %r501
  %r533 = load i32, i32* %r501
  call void @putint(i32 %r533)
  %r534 = load i32, i32* %r504
  %r535 = add i32 %r534, 1
  store i32 %r535, i32* %r504
  br label %bb97

bb99:
  %r536 = call i32 @arrCopy(i32* %r467, i32* %r468)
  store i32 %r536, i32* %r501
  %r537 = call i32 @insertsort(i32* %r468)
  store i32 %r537, i32* %r501
  store i32 0, i32* %r504
  br label %bb100

bb100:
  %r539 = load i32, i32* %r504
  %r538 = icmp slt i32 %r539, 32
  br i1 %r538, label %bb101, label %bb102

bb101:
  %r541 = load i32, i32* %r504
  %r540 = getelementptr [32 x i32 ], [32 x i32 ]* %r468, i32 0, i32 %r541
  %r542 = load i32, i32* %r540
  store i32 %r542, i32* %r501
  %r543 = load i32, i32* %r501
  call void @putint(i32 %r543)
  %r544 = load i32, i32* %r504
  %r545 = add i32 %r544, 1
  store i32 %r545, i32* %r504
  br label %bb100

bb102:
  %r546 = call i32 @arrCopy(i32* %r467, i32* %r468)
  store i32 %r546, i32* %r501
  store i32 0, i32* %r504
  store i32 31, i32* %r501
  %r548 = load i32, i32* %r504
  %r549 = load i32, i32* %r501
  %r547 = call i32 @QuickSort(i32* %r468, i32 %r548, i32 %r549)
  store i32 %r547, i32* %r501
  br label %bb103

bb103:
  %r551 = load i32, i32* %r504
  %r550 = icmp slt i32 %r551, 32
  br i1 %r550, label %bb104, label %bb105

bb104:
  %r553 = load i32, i32* %r504
  %r552 = getelementptr [32 x i32 ], [32 x i32 ]* %r468, i32 0, i32 %r553
  %r554 = load i32, i32* %r552
  store i32 %r554, i32* %r501
  %r555 = load i32, i32* %r501
  call void @putint(i32 %r555)
  %r556 = load i32, i32* %r504
  %r557 = add i32 %r556, 1
  store i32 %r557, i32* %r504
  br label %bb103

bb105:
  %r558 = call i32 @arrCopy(i32* %r467, i32* %r468)
  store i32 %r558, i32* %r501
  %r559 = call i32 @calSum(i32* %r468, i32 4)
  store i32 %r559, i32* %r501
  store i32 0, i32* %r504
  br label %bb106

bb106:
  %r561 = load i32, i32* %r504
  %r560 = icmp slt i32 %r56