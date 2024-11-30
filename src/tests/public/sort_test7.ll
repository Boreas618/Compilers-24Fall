declare i32 @getch( )
declare i32 @getint( )
declare void @putch( i32 )
declare void @putint( i32 )
declare void @putarray( i32, i32* )
declare void @_sysy_starttime( i32 )
declare void @_sysy_stoptime( i32 )
@n = global i32 0
define i32 @Merge( i32* %r100, i32 %r101, i32 %r103, i32 %r105 ) {
Merge:
  %r279 = add i32 0, 0
  %r280 = add i32 0, 0
  %r281 = add i32 0, 0
  %r282 = add i32 0, 0
  %r283 = add i32 %r101, 0
  %r284 = add i32 0, 0
  %r285 = add i32 %r103, 0
  %r286 = add i32 0, 0
  %r287 = add i32 %r105, 0
  %r288 = add i32 0, 0
  %r289 = sub i32 %r285, %r283
  %r290 = add i32 %r289, 1
  %r291 = add i32 %r290, 0
  %r292 = add i32 0, 0
  %r293 = sub i32 %r287, %r285
  %r294 = add i32 %r293, 0
  %r116 = alloca [ 10 x i32 ]
  %r117 = alloca [ 10 x i32 ]
  %r295 = add i32 0, 0
  %r296 = add i32 0, 0
  %r297 = add i32 0, 0
  %r298 = add i32 0, 0
  %r299 = add i32 0, 0
  br label %bb1

bb1:
  %r300 = phi i32 [ %r296, %Merge ], [ %r306, %bb2 ]
  %r301 = icmp slt i32 %r300, %r291
  br i1 %r301, label %bb2, label %bb3

bb2:
  %r302 = add i32 %r300, %r283
  %r303 = add i32 %r302, 0
  %r127 = getelementptr [10 x i32 ], [10 x i32 ]* %r116, i32 0, i32 %r300
  %r129 = getelementptr i32, i32* %r100, i32 %r303
  %r304 = load i32, i32* %r129
  store i32 %r304, i32* %r127
  %r305 = add i32 %r300, 1
  %r306 = add i32 %r305, 0
  br label %bb1

bb3:
  br label %bb4

bb4:
  %r307 = phi i32 [ %r298, %bb3 ], [ %r314, %bb5 ]
  %r308 = icmp slt i32 %r307, %r294
  br i1 %r308, label %bb5, label %bb6

bb5:
  %r309 = add i32 %r307, %r285
  %r310 = add i32 %r309, 1
  %r311 = add i32 %r310, 0
  %r141 = getelementptr [10 x i32 ], [10 x i32 ]* %r117, i32 0, i32 %r307
  %r143 = getelementptr i32, i32* %r100, i32 %r311
  %r312 = load i32, i32* %r143
  store i32 %r312, i32* %r141
  %r313 = add i32 %r307, 1
  %r314 = add i32 %r313, 0
  br label %bb4

bb6:
  %r315 = add i32 0, 0
  %r316 = add i32 0, 0
  %r317 = add i32 %r283, 0
  br label %bb7

bb7:
  %r318 = phi i32 [ %r317, %bb6 ], [ %r354, %bb19 ]
  %r319 = phi i32 [ %r315, %bb6 ], [ %r355, %bb19 ]
  %r320 = phi i32 [ %r316, %bb6 ], [ %r356, %bb19 ]
  %r321 = icmp ne i32 %r319, %r291
  br i1 %r321, label %bb11, label %bb12

bb11:
  %r322 = add i32 1, 0
  br label %bb13

bb12:
  %r323 = add i32 0, 0
  br label %bb13

bb13:
  %r324 = phi i32 [ %r322, %bb11 ], [ %r323, %bb12 ]
  %r325 = icmp ne i32 %r324, 0
  br i1 %r325, label %bb10, label %bb9

bb10:
  %r342 = icmp ne i32 %r320, %r294
  br i1 %r342, label %bb14, label %bb15

bb14:
  %r363 = add i32 1, 0
  br label %bb16

bb15:
  %r362 = add i32 0, 0
  br label %bb16

bb16:
  %r343 = phi i32 [ %r363, %bb14 ], [ %r362, %bb15 ]
  %r344 = icmp ne i32 %r343, 0
  br i1 %r344, label %bb8, label %bb9

bb8:
  %r164 = getelementptr [10 x i32 ], [10 x i32 ]* %r116, i32 0, i32 %r319
  %r345 = load i32, i32* %r164
  %r167 = getelementptr [10 x i32 ], [10 x i32 ]* %r117, i32 0, i32 %r320
  %r346 = load i32, i32* %r167
  %r347 = add i32 %r346, 1
  %r348 = icmp slt i32 %r345, %r347
  br i1 %r348, label %bb17, label %bb18

bb17:
  %r171 = getelementptr i32, i32* %r100, i32 %r318
  %r173 = getelementptr [10 x i32 ], [10 x i32 ]* %r116, i32 0, i32 %r319
  %r349 = load i32, i32* %r173
  store i32 %r349, i32* %r171
  %r350 = add i32 %r318, 1
  %r351 = add i32 %r350, 0
  %r352 = add i32 %r319, 1
  %r353 = add i32 %r352, 0
  br label %bb19

bb18:
  %r180 = getelementptr i32, i32* %r100, i32 %r318
  %r182 = getelementptr [10 x i32 ], [10 x i32 ]* %r117, i32 0, i32 %r320
  %r357 = load i32, i32* %r182
  store i32 %r357, i32* %r180
  %r358 = add i32 %r318, 1
  %r359 = add i32 %r358, 0
  %r360 = add i32 %r320, 1
  %r361 = add i32 %r360, 0
  br label %bb19

bb19:
  %r354 = phi i32 [ %r351, %bb17 ], [ %r359, %bb18 ]
  %r355 = phi i32 [ %r353, %bb17 ], [ %r319, %bb18 ]
  %r356 = phi i32 [ %r320, %bb17 ], [ %r361, %bb18 ]
  br label %bb7

bb9:
  br label %bb20

bb20:
  %r326 = phi i32 [ %r318, %bb9 ], [ %r331, %bb21 ]
  %r327 = phi i32 [ %r319, %bb9 ], [ %r333, %bb21 ]
  %r328 = icmp slt i32 %r327, %r291
  br i1 %r328, label %bb21, label %bb22

bb21:
  %r192 = getelementptr i32, i32* %r100, i32 %r326
  %r194 = getelementptr [10 x i32 ], [10 x i32 ]* %r116, i32 0, i32 %r327
  %r329 = load i32, i32* %r194
  store i32 %r329, i32* %r192
  %r330 = add i32 %r326, 1
  %r331 = add i32 %r330, 0
  %r332 = add i32 %r327, 1
  %r333 = add i32 %r332, 0
  br label %bb20

bb22:
  br label %bb23

bb23:
  %r334 = phi i32 [ %r326, %bb22 ], [ %r339, %bb24 ]
  %r335 = phi i32 [ %r320, %bb22 ], [ %r341, %bb24 ]
  %r336 = icmp slt i32 %r335, %r294
  br i1 %r336, label %bb24, label %bb25

bb24:
  %r204 = getelementptr i32, i32* %r100, i32 %r334
  %r206 = getelementptr [10 x i32 ], [10 x i32 ]* %r117, i32 0, i32 %r335
  %r337 = load i32, i32* %r206
  store i32 %r337, i32* %r204
  %r338 = add i32 %r334, 1
  %r339 = add i32 %r338, 0
  %r340 = add i32 %r335, 1
  %r341 = add i32 %r340, 0
  br label %bb23

bb25:
  ret i32 0
}

define i32 @MergeSort( i32* %r213, i32 %r214, i32 %r216 ) {
MergeSort:
  %r368 = add i32 0, 0
  %r369 = add i32 0, 0
  %r370 = add i32 0, 0
  %r371 = add i32 %r214, 0
  %r372 = add i32 0, 0
  %r373 = add i32 %r216, 0
  %r374 = icmp slt i32 %r371, %r373
  br i1 %r374, label %bb26, label %bb27

bb26:
  %r375 = add i32 %r371, %r373
  %r376 = sdiv i32 %r375, 2
  %r377 = add i32 %r376, 0
  %r378 = call i32 @MergeSort(i32* %r213, i32 %r371, i32 %r377)
  %r379 = add i32 %r378, 0
  %r380 = add i32 %r377, 1
  %r381 = add i32 %r380, 0
  %r382 = call i32 @MergeSort(i32* %r213, i32 %r381, i32 %r373)
  %r383 = add i32 %r382, 0
  %r384 = call i32 @Merge(i32* %r213, i32 %r371, i32 %r377, i32 %r373)
  %r385 = add i32 %r384, 0
  br label %bb28

bb27:
  br label %bb28

bb28:
  ret i32 0
}

define i32 @main( ) {
main:
  call void @_sysy_starttime(i32 71)
  store i32 10, i32* @n
  %r240 = alloca [ 10 x i32 ]
  %r241 = getelementptr [10 x i32 ], [10 x i32 ]* %r240, i32 0, i32 0
  store i32 4, i32* %r241
  %r242 = getelementptr [10 x i32 ], [10 x i32 ]* %r240, i32 0, i32 1
  store i32 3, i32* %r242
  %r243 = getelementptr [10 x i32 ], [10 x i32 ]* %r240, i32 0, i32 2
  store i32 9, i32* %r243
  %r244 = getelementptr [10 x i32 ], [10 x i32 ]* %r240, i32 0, i32 3
  store i32 2, i32* %r244
  %r245 = getelementptr [10 x i32 ], [10 x i32 ]* %r240, i32 0, i32 4
  store i32 0, i32* %r245
  %r246 = getelementptr [10 x i32 ], [10 x i32 ]* %r240, i32 0, i32 5
  store i32 1, i32* %r246
  %r247 = getelementptr [10 x i32 ], [10 x i32 ]* %r240, i32 0, i32 6
  store i32 6, i32* %r247
  %r248 = getelementptr [10 x i32 ], [10 x i32 ]* %r240, i32 0, i32 7
  store i32 5, i32* %r248
  %r249 = getelementptr [10 x i32 ], [10 x i32 ]* %r240, i32 0, i32 8
  store i32 7, i32* %r249
  %r250 = getelementptr [10 x i32 ], [10 x i32 ]* %r240, i32 0, i32 9
  store i32 8, i32* %r250
  %r388 = add i32 0, 0
  %r389 = add i32 0, 0
  %r390 = add i32 0, 0
  %r391 = load i32, i32* @n
  %r392 = sub i32 %r391, 1
  %r393 = add i32 %r392, 0
  %r394 = call i32 @MergeSort(i32* %r240, i32 %r389, i32 %r393)
  %r395 = add i32 %r394, 0
  br label %bb29

bb29:
  %r396 = phi i32 [ %r395, %main ], [ %r403, %bb30 ]
  %r397 = load i32, i32* @n
  %r398 = icmp slt i32 %r396, %r397
  br i1 %r398, label %bb30, label %bb31

bb30:
  %r261 = getelementptr [10 x i32 ], [10 x i32 ]* %r240, i32 0, i32 %r396
  %r399 = load i32, i32* %r261
  %r400 = add i32 %r399, 0
  call void @putint(i32 %r400)
  %r401 = add i32 10, 0
  call void @putch(i32 %r401)
  %r402 = add i32 %r396, 1
  %r403 = add i32 %r402, 0
  br label %bb29

bb31:
  call void @_sysy_stoptime(i32 97)
  ret i32 0
}

