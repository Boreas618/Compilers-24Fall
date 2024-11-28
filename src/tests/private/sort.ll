declare i32 @getch( )
declare i32 @getint( )
declare void @putch( i32 )
declare void @putint( i32 )
declare void @putarray( i32, i32* )
declare void @_sysy_starttime( i32 )
declare void @_sysy_stoptime( i32 )
@base = global i32 16
@a = global [ 30000010 x i32 ] zeroinitializer
@ans = global i32 0
define i32 @getMaxNum( i32 %r100, i32* %r102 ) {
getMaxNum:
  %r393 = add i32 0, 0
  %r394 = add i32 %r100, 0
  %r395 = add i32 0, 0
  %r396 = add i32 0, 0
  %r397 = add i32 0, 0
  %r398 = add i32 0, 0
  br label %bb1

bb1:
  %r399 = phi i32 [ %r396, %getMaxNum ], [ %r406, %bb6 ]
  %r400 = phi i32 [ %r398, %getMaxNum ], [ %r408, %bb6 ]
  %r401 = icmp slt i32 %r400, %r394
  br i1 %r401, label %bb2, label %bb3

bb2:
  %r110 = getelementptr i32, i32* %r102, i32 %r400
  %r402 = load i32, i32* %r110
  %r403 = icmp sgt i32 %r402, %r399
  br i1 %r403, label %bb4, label %bb5

bb4:
  %r114 = getelementptr i32, i32* %r102, i32 %r400
  %r404 = load i32, i32* %r114
  %r405 = add i32 %r404, 0
  br label %bb6

bb5:
  br label %bb6

bb6:
  %r406 = phi i32 [ %r405, %bb4 ], [ %r399, %bb5 ]
  %r407 = add i32 %r400, 1
  %r408 = add i32 %r407, 0
  br label %bb1

bb3:
  ret i32 %r399
}

define i32 @getNumPos( i32 %r120, i32 %r122 ) {
getNumPos:
  %r421 = add i32 0, 0
  %r422 = add i32 %r120, 0
  %r423 = add i32 0, 0
  %r424 = add i32 %r122, 0
  %r425 = add i32 0, 0
  %r426 = add i32 1, 0
  %r427 = add i32 0, 0
  %r428 = add i32 0, 0
  br label %bb7

bb7:
  %r429 = phi i32 [ %r422, %getNumPos ], [ %r434, %bb8 ]
  %r430 = phi i32 [ %r428, %getNumPos ], [ %r436, %bb8 ]
  %r431 = icmp slt i32 %r430, %r424
  br i1 %r431, label %bb8, label %bb9

bb8:
  %r432 = load i32, i32* @base
  %r433 = sdiv i32 %r429, %r432
  %r434 = add i32 %r433, 0
  %r435 = add i32 %r430, 1
  %r436 = add i32 %r435, 0
  br label %bb7

bb9:
  %r437 = load i32, i32* @base
  %r438 = sdiv i32 %r429, %r437
  %r439 = load i32, i32* @base
  %r440 = mul i32 %r438, %r439
  %r441 = sub i32 %r429, %r440
  ret i32 %r441
}

define void @radixSort( i32 %r141, i32* %r143, i32 %r144, i32 %r146 ) {
radixSort:
  %r493 = add i32 0, 0
  %r494 = add i32 0, 0
  %r495 = add i32 0, 0
  %r496 = add i32 0, 0
  %r497 = add i32 0, 0
  %r498 = add i32 0, 0
  %r499 = add i32 0, 0
  %r500 = add i32 0, 0
  %r501 = add i32 0, 0
  %r502 = add i32 0, 0
  %r503 = add i32 0, 0
  %r504 = add i32 0, 0
  %r505 = add i32 0, 0
  %r506 = add i32 0, 0
  %r507 = add i32 %r141, 0
  %r508 = add i32 0, 0
  %r509 = add i32 %r144, 0
  %r510 = add i32 0, 0
  %r511 = add i32 %r146, 0
  %r148 = alloca [ 16 x i32 ]
  %r149 = alloca [ 16 x i32 ]
  %r150 = alloca [ 16 x i32 ]
  %r512 = add i32 0, 0
  %r513 = add i32 0, 0
  br label %bb10

bb10:
  %r514 = phi i32 [ %r513, %radixSort ], [ %r518, %bb11 ]
  %r515 = load i32, i32* @base
  %r516 = icmp slt i32 %r514, %r515
  br i1 %r516, label %bb11, label %bb12

bb11:
  %r155 = getelementptr [16 x i32 ], [16 x i32 ]* %r148, i32 0, i32 %r514
  store i32 0, i32* %r155
  %r157 = getelementptr [16 x i32 ], [16 x i32 ]* %r149, i32 0, i32 %r514
  store i32 0, i32* %r157
  %r159 = getelementptr [16 x i32 ], [16 x i32 ]* %r150, i32 0, i32 %r514
  store i32 0, i32* %r159
  %r517 = add i32 %r514, 1
  %r518 = add i32 %r517, 0
  br label %bb10

bb12:
  %r519 = icmp eq i32 %r507, -1
  br i1 %r519, label %bb17, label %bb18

bb17:
  %r612 = add i32 1, 0
  br label %bb19

bb18:
  %r520 = add i32 0, 0
  br label %bb19

bb19:
  %r521 = phi i32 [ %r612, %bb17 ], [ %r520, %bb18 ]
  %r522 = icmp ne i32 %r521, 0
  br i1 %r522, label %bb13, label %bb16

bb16:
  %r523 = add i32 %r509, 1
  %r524 = icmp sge i32 %r523, %r511
  br i1 %r524, label %bb20, label %bb21

bb20:
  %r610 = add i32 1, 0
  br label %bb22

bb21:
  %r611 = add i32 0, 0
  br label %bb22

bb22:
  %r525 = phi i32 [ %r610, %bb20 ], [ %r611, %bb21 ]
  %r526 = icmp ne i32 %r525, 0
  br i1 %r526, label %bb13, label %bb14

bb13:
  ret void
bb14:
  br label %bb15

bb15:
  %r527 = add i32 %r509, 0
  br label %bb23

bb23:
  %r528 = phi i32 [ %r527, %bb15 ], [ %r539, %bb24 ]
  %r529 = icmp slt i32 %r528, %r511
  br i1 %r529, label %bb24, label %bb25

bb24:
  %r182 = getelementptr i32, i32* %r143, i32 %r528
  %r530 = load i32, i32* %r182
  %r531 = call i32 @getNumPos(i32 %r530, i32 %r507)
  %r532 = add i32 %r531, 0
  %r188 = getelementptr i32, i32* %r143, i32 %r528
  %r533 = load i32, i32* %r188
  %r534 = call i32 @getNumPos(i32 %r533, i32 %r507)
  %r535 = add i32 %r534, 0
  %r193 = getelementptr [16 x i32 ], [16 x i32 ]* %r150, i32 0, i32 %r535
  %r195 = getelementptr [16 x i32 ], [16 x i32 ]* %r150, i32 0, i32 %r532
  %r536 = load i32, i32* %r195
  %r537 = add i32 %r536, 1
  store i32 %r537, i32* %r193
  %r538 = add i32 %r528, 1
  %r539 = add i32 %r538, 0
  br label %bb23

bb25:
  %r201 = getelementptr [16 x i32 ], [16 x i32 ]* %r148, i32 0, i32 0
  store i32 %r509, i32* %r201
  %r203 = getelementptr [16 x i32 ], [16 x i32 ]* %r149, i32 0, i32 0
  %r205 = getelementptr [16 x i32 ], [16 x i32 ]* %r150, i32 0, i32 0
  %r540 = load i32, i32* %r205
  %r541 = add i32 %r509, %r540
  store i32 %r541, i32* %r203
  %r542 = add i32 1, 0
  br label %bb26

bb26:
  %r543 = phi i32 [ %r542, %bb25 ], [ %r609, %bb27 ]
  %r544 = load i32, i32* @base
  %r545 = icmp slt i32 %r543, %r544
  br i1 %r545, label %bb27, label %bb28

bb27:
  %r602 = sub i32 %r543, 1
  %r603 = add i32 %r602, 0
  %r214 = getelementptr [16 x i32 ], [16 x i32 ]* %r148, i32 0, i32 %r543
  %r216 = getelementptr [16 x i32 ], [16 x i32 ]* %r149, i32 0, i32 %r603
  %r604 = load i32, i32* %r216
  store i32 %r604, i32* %r214
  %r219 = getelementptr [16 x i32 ], [16 x i32 ]* %r149, i32 0, i32 %r543
  %r221 = getelementptr [16 x i32 ], [16 x i32 ]* %r148, i32 0, i32 %r543
  %r605 = load i32, i32* %r221
  %r224 = getelementptr [16 x i32 ], [16 x i32 ]* %r150, i32 0, i32 %r543
  %r606 = load i32, i32* %r224
  %r607 = add i32 %r605, %r606
  store i32 %r607, i32* %r219
  %r608 = add i32 %r543, 1
  %r609 = add i32 %r608, 0
  br label %bb26

bb28:
  %r546 = add i32 0, 0
  br label %bb29

bb29:
  %r547 = phi i32 [ %r546, %bb28 ], [ %r601, %bb34 ]
  %r548 = load i32, i32* @base
  %r549 = icmp slt i32 %r547, %r548
  br i1 %r549, label %bb30, label %bb31

bb30:
  br label %bb32

bb32:
  %r234 = getelementptr [16 x i32 ], [16 x i32 ]* %r148, i32 0, i32 %r547
  %r569 = load i32, i32* %r234
  %r237 = getelementptr [16 x i32 ], [16 x i32 ]* %r149, i32 0, i32 %r547
  %r570 = load i32, i32* %r237
  %r571 = icmp slt i32 %r569, %r570
  br i1 %r571, label %bb33, label %bb34

bb33:
  %r240 = getelementptr [16 x i32 ], [16 x i32 ]* %r148, i32 0, i32 %r547
  %r572 = load i32, i32* %r240
  %r573 = add i32 %r572, 0
  %r244 = getelementptr i32, i32* %r143, i32 %r573
  %r574 = load i32, i32* %r244
  %r575 = add i32 %r574, 0
  br label %bb35

bb35:
  %r576 = phi i32 [ %r575, %bb33 ], [ %r585, %bb36 ]
  %r577 = call i32 @getNumPos(i32 %r576, i32 %r507)
  %r578 = icmp ne i32 %r577, %r547
  br i1 %r578, label %bb36, label %bb37

bb36:
  %r579 = add i32 %r576, 0
  %r580 = call i32 @getNumPos(i32 %r579, i32 %r507)
  %r581 = add i32 %r580, 0
  %r259 = getelementptr [16 x i32 ], [16 x i32 ]* %r148, i32 0, i32 %r581
  %r582 = load i32, i32* %r259
  %r583 = add i32 %r582, 0
  %r262 = getelementptr i32, i32* %r143, i32 %r583
  %r584 = load i32, i32* %r262
  %r585 = add i32 %r584, 0
  %r586 = call i32 @getNumPos(i32 %r579, i32 %r507)
  %r587 = add i32 %r586, 0
  %r268 = getelementptr [16 x i32 ], [16 x i32 ]* %r148, i32 0, i32 %r587
  %r588 = load i32, i32* %r268
  %r589 = add i32 %r588, 0
  %r271 = getelementptr i32, i32* %r143, i32 %r589
  store i32 %r579, i32* %r271
  %r590 = call i32 @getNumPos(i32 %r579, i32 %r507)
  %r591 = add i32 %r590, 0
  %r592 = call i32 @getNumPos(i32 %r579, i32 %r507)
  %r593 = add i32 %r592, 0
  %r281 = getelementptr [16 x i32 ], [16 x i32 ]* %r148, i32 0, i32 %r593
  %r283 = getelementptr [16 x i32 ], [16 x i32 ]* %r148, i32 0, i32 %r591
  %r594 = load i32, i32* %r283
  %r595 = add i32 %r594, 1
  store i32 %r595, i32* %r281
  br label %bb35

bb37:
  %r287 = getelementptr [16 x i32 ], [16 x i32 ]* %r148, i32 0, i32 %r547
  %r596 = load i32, i32* %r287
  %r597 = add i32 %r596, 0
  %r291 = getelementptr i32, i32* %r143, i32 %r597
  store i32 %r576, i32* %r291
  %r294 = getelementptr [16 x i32 ], [16 x i32 ]* %r148, i32 0, i32 %r547
  %r296 = getelementptr [16 x i32 ], [16 x i32 ]* %r148, i32 0, i32 %r547
  %r598 = load i32, i32* %r296
  %r599 = add i32 %r598, 1
  store i32 %r599, i32* %r294
  br label %bb32

bb34:
  %r600 = add i32 %r547, 1
  %r601 = add i32 %r600, 0
  br label %bb29

bb31:
  %r550 = add i32 %r509, 0
  %r303 = getelementptr [16 x i32 ], [16 x i32 ]* %r148, i32 0, i32 0
  store i32 %r509, i32* %r303
  %r305 = getelementptr [16 x i32 ], [16 x i32 ]* %r149, i32 0, i32 0
  %r307 = getelementptr [16 x i32 ], [16 x i32 ]* %r150, i32 0, i32 0
  %r551 = load i32, i32* %r307
  %r552 = add i32 %r509, %r551
  store i32 %r552, i32* %r305
  %r553 = add i32 0, 0
  br label %bb38

bb38:
  %r554 = phi i32 [ %r553, %bb31 ], [ %r568, %bb43 ]
  %r555 = load i32, i32* @base
  %r556 = icmp slt i32 %r554, %r555
  br i1 %r556, label %bb39, label %bb40

bb39:
  %r557 = icmp sgt i32 %r554, 0
  br i1 %r557, label %bb41, label %bb42

bb41:
  %r558 = sub i32 %r554, 1
  %r559 = add i32 %r558, 0
  %r319 = getelementptr [16 x i32 ], [16 x i32 ]* %r148, i32 0, i32 %r554
  %r321 = getelementptr [16 x i32 ], [16 x i32 ]* %r149, i32 0, i32 %r559
  %r560 = load i32, i32* %r321
  store i32 %r560, i32* %r319
  %r324 = getelementptr [16 x i32 ], [16 x i32 ]* %r149, i32 0, i32 %r554
  %r326 = getelementptr [16 x i32 ], [16 x i32 ]* %r148, i32 0, i32 %r554
  %r561 = load i32, i32* %r326
  %r329 = getelementptr [16 x i32 ], [16 x i32 ]* %r150, i32 0, i32 %r554
  %r562 = load i32, i32* %r329
  %r563 = add i32 %r561, %r562
  store i32 %r563, i32* %r324
  br label %bb43

bb42:
  br label %bb43

bb43:
  %r564 = sub i32 %r507, 1
  %r335 = getelementptr [16 x i32 ], [16 x i32 ]* %r148, i32 0, i32 %r554
  %r565 = load i32, i32* %r335
  %r338 = getelementptr [16 x i32 ], [16 x i32 ]* %r149, i32 0, i32 %r554
  %r566 = load i32, i32* %r338
  call void @radixSort(i32 %r564, i32* %r143, i32 %r565, i32 %r566)
  %r567 = add i32 %r554, 1
  %r568 = add i32 %r567, 0
  br label %bb38

bb40:
  ret void
}

define i32 @main( ) {
main:
  %r622 = add i32 0, 0
  %r623 = call i32 @getint()
  %r624 = add i32 0, 0
  %r625 = add i32 %r623, 0
  %r626 = add i32 0, 0
  %r627 = add i32 0, 0
  br label %bb44

bb44:
  %r628 = phi i32 [ %r627, %main ], [ %r632, %bb45 ]
  %r629 = icmp slt i32 %r628, %r625
  br i1 %r629, label %bb45, label %bb46

bb45:
  %r349 = getelementptr [30000010 x i32 ], [30000010 x i32 ]* @a, i32 0, i32 %r628
  %r630 = call i32 @getint()
  store i32 %r630, i32* %r349
  %r631 = add i32 %r628, 1
  %r632 = add i32 %r631, 0
  br label %bb44

bb46:
  call void @_sysy_starttime(i32 97)
  call void @radixSort(i32 8, i32* @a, i32 0, i32 %r625)
  %r633 = add i32 0, 0
  br label %bb47

bb47:
  %r634 = phi i32 [ %r633, %bb46 ], [ %r647, %bb48 ]
  %r635 = icmp slt i32 %r634, %r625
  br i1 %r635, label %bb48, label %bb49

bb48:
  %r636 = load i32, i32* @ans
  %r361 = getelementptr [30000010 x i32 ], [30000010 x i32 ]* @a, i32 0, i32 %r634
  %r637 = load i32, i32* %r361
  %r364 = getelementptr [30000010 x i32 ], [30000010 x i32 ]* @a, i32 0, i32 %r634
  %r638 = load i32, i32* %r364
  %r639 = add i32 2, %r634
  %r640 = sdiv i32 %r638, %r639
  %r641 = add i32 2, %r634
  %r642 = mul i32 %r640, %r641
  %r643 = sub i32 %r637, %r642
  %r644 = mul i32 %r634, %r643
  %r645 = add i32 %r636, %r644
  store i32 %r645, i32* @ans
  %r646 = add i32 %r634, 1
  %r647 = add i32 %r646, 0
  br label %bb47

bb49:
  %r648 = load i32, i32* @ans
  %r649 = icmp slt i32 %r648, 0
  br i1 %r649, label %bb50, label %bb51

bb50:
  %r651 = load i32, i32* @ans
  %r652 = sub i32 0, %r651
  store i32 %r652, i32* @ans
  br label %bb52

bb51:
  br label %bb52

bb52:
  call void @_sysy_stoptime(i32 117)
  %r650 = load i32, i32* @ans
  call void @putint(i32 %r650)
  call void @putch(i32 10)
  ret i32 0
}

