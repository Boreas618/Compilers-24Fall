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
  %r301 = add i32 0, 0
  %r302 = add i32 0, 0
  %r303 = add i32 0, 0
  %r304 = add i32 0, 0
  %r305 = add i32 %r101, 0
  %r306 = add i32 0, 0
  %r307 = add i32 %r103, 0
  %r308 = add i32 0, 0
  %r309 = add i32 %r105, 0
  %r310 = add i32 0, 0
  %r311 = sub i32 %r307, %r305
  %r312 = add i32 %r311, 1
  %r313 = add i32 %r312, 0
  %r314 = add i32 0, 0
  %r315 = sub i32 %r309, %r307
  %r316 = add i32 %r315, 0
  %r116 = alloca [ 10 x i32 ]
  %r117 = alloca [ 10 x i32 ]
  %r317 = add i32 0, 0
  %r318 = add i32 0, 0
  %r319 = add i32 0, 0
  %r320 = add i32 0, 0
  %r321 = add i32 0, 0
  br label %bb1

bb1:
  %r322 = phi i32 [ %r318, %Merge ], [ %r328, %bb2 ]
  %r323 = icmp slt i32 %r322, %r313
  br i1 %r323, label %bb2, label %bb3

bb2:
  %r324 = add i32 %r322, %r305
  %r325 = add i32 %r324, 0
  %r127 = getelementptr [10 x i32 ], [10 x i32 ]* %r116, i32 0, i32 %r322
  %r129 = getelementptr i32, i32* %r100, i32 %r325
  %r326 = load i32, i32* %r129
  store i32 %r326, i32* %r127
  %r327 = add i32 %r322, 1
  %r328 = add i32 %r327, 0
  br label %bb1

bb3:
  br label %bb4

bb4:
  %r329 = phi i32 [ %r320, %bb3 ], [ %r336, %bb5 ]
  %r330 = icmp slt i32 %r329, %r316
  br i1 %r330, label %bb5, label %bb6

bb5:
  %r331 = add i32 %r329, %r307
  %r332 = add i32 %r331, 1
  %r333 = add i32 %r332, 0
  %r141 = getelementptr [10 x i32 ], [10 x i32 ]* %r117, i32 0, i32 %r329
  %r143 = getelementptr i32, i32* %r100, i32 %r333
  %r334 = load i32, i32* %r143
  store i32 %r334, i32* %r141
  %r335 = add i32 %r329, 1
  %r336 = add i32 %r335, 0
  br label %bb4

bb6:
  %r337 = add i32 0, 0
  %r338 = add i32 0, 0
  %r339 = add i32 %r305, 0
  br label %bb7

bb7:
  %r340 = phi i32 [ %r337, %bb6 ], [ %r376, %bb19 ]
  %r341 = phi i32 [ %r338, %bb6 ], [ %r377, %bb19 ]
  %r342 = phi i32 [ %r339, %bb6 ], [ %r378, %bb19 ]
  %r343 = icmp ne i32 %r340, %r313
  br i1 %r343, label %bb11, label %bb12

bb11:
  %r345 = add i32 1, 0
  br label %bb13

bb12:
  %r344 = add i32 0, 0
  br label %bb13

bb13:
  %r346 = phi i32 [ %r345, %bb11 ], [ %r344, %bb12 ]
  %r347 = icmp ne i32 %r346, 0
  br i1 %r347, label %bb10, label %bb9

bb10:
  %r364 = icmp ne i32 %r341, %r316
  br i1 %r364, label %bb14, label %bb15

bb14:
  %r385 = add i32 1, 0
  br label %bb16

bb15:
  %r384 = add i32 0, 0
  br label %bb16

bb16:
  %r365 = phi i32 [ %r385, %bb14 ], [ %r384, %bb15 ]
  %r366 = icmp ne i32 %r365, 0
  br i1 %r366, label %bb8, label %bb9

bb8:
  %r164 = getelementptr [10 x i32 ], [10 x i32 ]* %r116, i32 0, i32 %r340
  %r367 = load i32, i32* %r164
  %r167 = getelementptr [10 x i32 ], [10 x i32 ]* %r117, i32 0, i32 %r341
  %r368 = load i32, i32* %r167
  %r369 = add i32 %r368, 1
  %r370 = icmp slt i32 %r367, %r369
  br i1 %r370, label %bb17, label %bb18

bb17:
  %r171 = getelementptr i32, i32* %r100, i32 %r342
  %r173 = getelementptr [10 x i32 ], [10 x i32 ]* %r116, i32 0, i32 %r340
  %r379 = load i32, i32* %r173
  store i32 %r379, i32* %r171
  %r380 = add i32 %r342, 1
  %r381 = add i32 %r380, 0
  %r382 = add i32 %r340, 1
  %r383 = add i32 %r382, 0
  br label %bb19

bb18:
  %r180 = getelementptr i32, i32* %r100, i32 %r342
  %r182 = getelementptr [10 x i32 ], [10 x i32 ]* %r117, i32 0, i32 %r341
  %r371 = load i32, i32* %r182
  store i32 %r371, i32* %r180
  %r372 = add i32 %r342, 1
  %r373 = add i32 %r372, 0
  %r374 = add i32 %r341, 1
  %r375 = add i32 %r374, 0
  br label %bb19

bb19:
  %r376 = phi i32 [ %r383, %bb17 ], [ %r340, %bb18 ]
  %r377 = phi i32 [ %r341, %bb17 ], [ %r375, %bb18 ]
  %r378 = phi i32 [ %r381, %bb17 ], [ %r373, %bb18 ]
  br label %bb7

bb9:
  br label %bb20

bb20:
  %r348 = phi i32 [ %r340, %bb9 ], [ %r355, %bb21 ]
  %r349 = phi i32 [ %r342, %bb9 ], [ %r353, %bb21 ]
  %r350 = icmp slt i32 %r348, %r313
  br i1 %r350, label %bb21, label %bb22

bb21:
  %r192 = getelementptr i32, i32* %r100, i32 %r349
  %r194 = getelementptr [10 x i32 ], [10 x i32 ]* %r116, i32 0, i32 %r348
  %r351 = load i32, i32* %r194
  store i32 %r351, i32* %r192
  %r352 = add i32 %r349, 1
  %r353 = add i32 %r352, 0
  %r354 = add i32 %r348, 1
  %r355 = add i32 %r354, 0
  br label %bb20

bb22:
  br label %bb23

bb23:
  %r356 = phi i32 [ %r341, %bb22 ], [ %r363, %bb24 ]
  %r357 = phi i32 [ %r349, %bb22 ], [ %r361, %bb24 ]
  %r358 = icmp slt i32 %r356, %r316
  br i1 %r358, label %bb24, label %bb25

bb24:
  %r204 = getelementptr i32, i32* %r100, i32 %r357
  %r206 = getelementptr [10 x i32 ], [10 x i32 ]* %r117, i32 0, i32 %r356
  %r359 = load i32, i32* %r206
  store i32 %r359, i32* %r204
  %r360 = add i32 %r357, 1
  %r361 = add i32 %r360, 0
  %r362 = add i32 %r356, 1
  %r363 = add i32 %r362, 0
  br label %bb23

bb25:
  ret i32 0
}

define i32 @MergeSort( i32* %r213, i32 %r214, i32 %r216 ) {
MergeSort:
  %r398 = add i32 0, 0
  %r399 = add i32 0, 0
  %r400 = add i32 0, 0
  %r401 = add i32 %r214, 0
  %r402 = add i32 0, 0
  %r403 = add i32 %r216, 0
  %r404 = icmp slt i32 %r401, %r403
  br i1 %r404, label %bb26, label %bb27

bb26:
  %r405 = add i32 %r401, %r403
  %r406 = sdiv i32 %r405, 2
  %r407 = add i32 %r406, 0
  %r408 = call i32 @MergeSort(i32* %r213, i32 %r401, i32 %r407)
  %r409 = add i32 %r408, 0
  %r410 = add i32 %r407, 1
  %r411 = add i32 %r410, 0
  %r412 = call i32 @MergeSort(i32* %r213, i32 %r411, i32 %r403)
  %r413 = add i32 %r412, 0
  %r414 = call i32 @Merge(i32* %r213, i32 %r401, i32 %r407, i32 %r403)
  %r415 = add i32 %r414, 0
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
  %r422 = add i32 0, 0
  %r423 = add i32 0, 0
  %r424 = add i32 0, 0
  %r425 = load i32, i32* @n
  %r426 = sub i32 %r425, 1
  %r427 = add i32 %r426, 0
  %r428 = call i32 @MergeSort(i32* %r240, i32 %r423, i32 %r427)
  %r429 = add i32 %r428, 0
  br label %bb29

bb29:
  %r430 = phi i32 [ %r429, %main ], [ %r437, %bb30 ]
  %r431 = load i32, i32* @n
  %r432 = icmp slt i32 %r430, %r431
  br i1 %r432, label %bb30, label %bb31

bb30:
  %r261 = getelementptr [10 x i32 ], [10 x i32 ]* %r240, i32 0, i32 %r430
  %r433 = load i32, i32* %r261
  %r434 = add i32 %r433, 0
  call void @putint(i32 %r434)
  %r435 = add i32 10, 0
  call void @putch(i32 %r435)
  %r436 = add i32 %r430, 1
  %r437 = add i32 %r436, 0
  br label %bb29

bb31:
  call void @_sysy_stoptime(i32 97)
  ret i32 0
}

