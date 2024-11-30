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
  %r399 = phi i32 [ %r398, %getMaxNum ], [ %r406, %bb6 ]
  %r400 = phi i32 [ %r396, %getMaxNum ], [ %r404, %bb6 ]
  %r401 = icmp slt i32 %r399, %r394
  br i1 %r401, label %bb2, label %bb3

bb2:
  %r110 = getelementptr i32, i32* %r102, i32 %r399
  %r402 = load i32, i32* %r110
  %r403 = icmp sgt i32 %r402, %r400
  br i1 %r403, label %bb4, label %bb5

bb4:
  %r114 = getelementptr i32, i32* %r102, i32 %r399
  %r407 = load i32, i32* %r114
  %r408 = add i32 %r407, 0
  br label %bb6

bb5:
  br label %bb6

bb6:
  %r404 = phi i32 [ %r408, %bb4 ], [ %r400, %bb5 ]
  %r405 = add i32 %r399, 1
  %r406 = add i32 %r405, 0
  br label %bb1

bb3:
  ret i32 %r400
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
  %r611 = add i32 1, 0
  br label %bb22

bb21:
  %r525 = add i32 0, 0
  br label %bb22

bb22:
  %r526 = phi i32 [ %r611, %bb20 ], [ %r525, %bb21 ]
  %r527 = icmp ne i32 %r526, 0
  br i1 %r527, label %bb13, label %bb14

bb13:
  ret void
bb14:
  br label %bb15

bb15:
  %r528 = add i32 %r509, 0
  br label %bb23

bb23:
  %r529 = phi i32 [ %r528, %bb15 ], [ %r540, %bb24 ]
  %r530 = icmp slt i32 %r529, %r511
  br i1 %r530, label %bb24, label %bb25

bb24:
  %r182 = getelementptr i32, i32* %r143, i32 %r529
  %r531 = load i32, i32* %r182
  %r532 = call i32 @getNumPos(i32 %r531, i32 %r507)
  %r533 = add i32 %r532, 0
  %r188 = getelementptr i32, i32* %r143, i32 %r529
  %r534 = load i32, i32* %r188
  %r535 = call i32 @getNumPos(i32 %r534, i32 %r507)
  %r536 = add i32 %r535, 0
  %r193 = getelementptr [16 x i32 ], [16 x i32 ]* %r150, i32 0, i32 %r536
  %r195 = getelementptr [16 x i32 ], [16 x i32 ]* %r150, i32 0, i32 %r533
  %r537 = load i32, i32* %r195
  %r538 = add i32 %r537, 1
  store i32 %r538, i32* %r193
  %r539 = add i32 %r529, 1
  %r540 = add i32 %r539, 0
  br label %bb23

bb25:
  %r201 = getelementptr [16 x i32 ], [16 x i32 ]* %r148, i32 0, i32 0
  store i32 %r509, i32* %r201
  %r203 = getelementptr [16 x i32 ], [16 x i32 ]* %r149, i32 0, i32 0
  %r205 = getelementptr [16 x i32 ], [16 x i32 ]* %r150, i32 0, i32 0
  %r541 = load i32, i32* %r205
  %r542 = add i32 %r509, %r541
  store i32 %r542, i32* %r203
  %r543 = add i32 1, 0
  br label %bb26

bb26:
  %r544 = phi i32 [ %r543, %bb25 ], [ %r610, %bb27 ]
  %r545 = load i32, i32* @base
  %r546 = icmp slt i32 %r544, %r545
  br i1 %r546, label %bb27, label %bb28

bb27:
  %r603 = sub i32 %r544, 1
  %r604 = add i32 %r603, 0
  %r214 = getelementptr [16 x i32 ], [16 x i32 ]* %r148, i32 0, i32 %r544
  %r216 = getelementptr [16 x i32 ], [16 x i32 ]* %r149, i32 0, i32 %r604
  %r605 = load i32, i32* %r216
  store i32 %r605, i32* %r214
  %r219 = getelementptr [16 x i32 ], [16 x i32 ]* %r149, i32 0, i32 %r544
  %r221 = getelementptr [16 x i32 ], [16 x i32 ]* %r148, i32 0, i32 %r544
  %r606 = load i32, i32* %r221
  %r224 = getelementptr [16 x i32 ], [16 x i32 ]* %r150, i32 0, i32 %r544
  %r607 = load i32, i32* %r224
  %r608 = add i32 %r606, %r607
  store i32 %r608, i32* %r219
  %r609 = add i32 %r544, 1
  %r610 = add i32 %r609, 0
  br label %bb26

bb28:
  %r547 = add i32 0, 0
  br label %bb29

bb29:
  %r548 = phi i32 [ %r547, %bb28 ], [ %r574, %bb34 ]
  %r549 = load i32, i32* @base
  %r550 = icmp slt i32 %r548, %r549
  br i1 %r550, label %bb30, label %bb31

bb30:
  br label %bb32

bb32:
  %r234 = getelementptr [16 x i32 ], [16 x i32 ]* %r148, i32 0, i32 %r548
  %r570 = load i32, i32* %r234
  %r237 = getelementptr [16 x i32 ], [16 x i32 ]* %r149, i32 0, i32 %r548
  %r571 = load i32, i32* %r237
  %r572 = icmp slt i32 %r570, %r571
  br i1 %r572, label %bb33, label %bb34

bb33:
  %r240 = getelementptr [16 x i32 ], [16 x i32 ]* %r148, i32 0, i32 %r548
  %r575 = load i32, i32* %r240
  %r576 = add i32 %r575, 0
  %r244 = getelementptr i32, i32* %r143, i32 %r576
  %r577 = load i32, i32* %r244
  %r578 = add i32 %r577, 0
  br label %bb35

bb35:
  %r579 = phi i32 [ %r578, %bb33 ], [ %r588, %bb36 ]
  %r580 = call i32 @getNumPos(i32 %r579, i32 %r507)
  %r581 = icmp ne i32 %r580, %r548
  br i1 %r581, label %bb36, label %bb37

bb36:
  %r582 = add i32 %r579, 0
  %r583 = call i32 @getNumPos(i32 %r582, i32 %r507)
  %r584 = add i32 %r583, 0
  %r259 = getelementptr [16 x i32 ], [16 x i32 ]* %r148, i32 0, i32 %r584
  %r585 = load i32, i32* %r259
  %r586 = add i32 %r585, 0
  %r262 = getelementptr i32, i32* %r143, i32 %r586
  %r587 = load i32, i32* %r262
  %r588 = add i32 %r587, 0
  %r589 = call i32 @getNumPos(i32 %r582, i32 %r507)
  %r590 = add i32 %r589, 0
  %r268 = getelementptr [16 x i32 ], [16 x i32 ]* %r148, i32 0, i32 %r590
  %r591 = load i32, i32* %r268
  %r592 = add i32 %r591, 0
  %r271 = getelementptr i32, i32* %r143, i32 %r592
  store i32 %r582, i32* %r271
  %r593 = call i32 @getNumPos(i32 %r582, i32 %r507)
  %r594 = add i32 %r593, 0
  %r595 = call i32 @getNumPos(i32 %r582, i32 %r507)
  %r596 = add i32 %r595, 0
  %r281 = getelementptr [16 x i32 ], [16 x i32 ]* %r148, i32 0, i32 %r596
  %r283 = getelementptr [16 x i32 ], [16 x i32 ]* %r148, i32 0, i32 %r594
  %r597 = load i32, i32* %r283
  %r598 = add i32 %r597, 1
  store i32 %r598, i32* %r281
  br label %bb35

bb37:
  %r287 = getelementptr [16 x i32 ], [16 x i32 ]* %r148, i32 0, i32 %r548
  %r599 = load i32, i32* %r287
  %r600 = add i32 %r599, 0
  %r291 = getelementptr i32, i32* %r143, i32 %r600
  store i32 %r579, i32* %r291
  %r294 = getelementptr [16 x i32 ], [16 x i32 ]* %r148, i32 0, i32 %r548
  %r296 = getelementptr [16 x i32 ], [16 x i32 ]* %r148, i32 0, i32 %r548
  %r601 = load i32, i32* %r296
  %r602 = add i32 %r601, 1
  store i32 %r602, i32* %r294
  br label %bb32

bb34:
  %r573 = add i32 %r548, 1
  %r574 = add i32 %r573, 0
  br label %bb29

bb31:
  %r551 = add i32 %r509, 0
  %r303 = getelementptr [16 x i32 ], [16 x i32 ]* %r148, i32 0, i32 0
  store i32 %r509, i32* %r303
  %r305 = getelementptr [16 x i32 ], [16 x i32 ]* %r149, i32 0, i32 0
  %r307 = getelementptr [16 x i32 ], [16 x i32 ]* %r150, i32 0, i32 0
  %r552 = load i32, i32* %r307
  %r553 = add i32 %r509, %r552
  store i32 %r553, i32* %r305
  %r554 = add i32 0, 0
  br label %bb38

bb38:
  %r555 = phi i32 [ %r554, %bb31 ], [ %r563, %bb43 ]
  %r556 = load i32, i32* @base
  %r557 = icmp slt i32 %r555, %r556
  br i1 %r557, label %bb39, label %bb40

bb39:
  %r558 = icmp sgt i32 %r555, 0
  br i1 %r558, label %bb41, label %bb42

bb41:
  %r564 = sub i32 %r555, 1
  %r565 = add i32 %r564, 0
  %r319 = getelementptr [16 x i32 ], [16 x i32 ]* %r148, i32 0, i32 %r555
  %r321 = getelementptr [16 x i32 ], [16 x i32 ]* %r149, i32 0, i32 %r565
  %r566 = load i32, i32* %r321
  store i32 %r566, i32* %r319
  %r324 = getelementptr [16 x i32 ], [16 x i32 ]* %r149, i32 0, i32 %r555
  %r326 = getelementptr [16 x i32 ], [16 x i32 ]* %r148, i32 0, i32 %r555
  %r567 = load i32, i32* %r326
  %r329 = getelementptr [16 x i32 ], [16 x i32 ]* %r150, i32 0, i32 %r555
  %r568 = load i32, i32* %r329
  %r569 = add i32 %r567, %r568
  store i32 %r569, i32* %r324
  br label %bb43

bb42:
  br label %bb43

bb43:
  %r559 = sub i32 %r507, 1
  %r335 = getelementptr [16 x i32 ], [16 x i32 ]* %r148, i32 0, i32 %r555
  %r560 = load i32, i32* %r335
  %r338 = getelementptr [16 x i32 ], [16 x i32 ]* %r149, i32 0, i32 %r555
  %r561 = load i32, i32* %r338
  call void @radixSort(i32 %r559, i32* %r143, i32 %r560, i32 %r561)
  %r562 = add i32 %r555, 1
  %r563 = add i32 %r562, 0
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
  %r628 = phi i32 [ %r627, %main ], [ %r652, %bb45 ]
  %r629 = icmp slt i32 %r628, %r625
  br i1 %r629, label %bb45, label %bb46

bb45:
  %r349 = getelementptr [30000010 x i32 ], [30000010 x i32 ]* @a, i32 0, i32 %r628
  %r650 = call i32 @getint()
  store i32 %r650, i32* %r349
  %r651 = add i32 %r628, 1
  %r652 = add i32 %r651, 0
  br label %bb44

bb46:
  call void @_sysy_starttime(i32 97)
  call void @radixSort(i32 8, i32* @a, i32 0, i32 %r625)
  %r630 = add i32 0, 0
  br label %bb47

bb47:
  %r631 = phi i32 [ %r630, %bb46 ], [ %r644, %bb48 ]
  %r632 = icmp slt i32 %r631, %r625
  br i1 %r632, label %bb48, label %bb49

bb48:
  %r633 = load i32, i32* @ans
  %r361 = getelementptr [30000010 x i32 ], [30000010 x i32 ]* @a, i32 0, i32 %r631
  %r634 = load i32, i32* %r361
  %r364 = getelementptr [30000010 x i32 ], [30000010 x i32 ]* @a, i32 0, i32 %r631
  %r635 = load i32, i32* %r364
  %r636 = add i32 2, %r631
  %r637 = sdiv i32 %r635, %r636
  %r638 = add i32 2, %r631
  %r639 = mul i32 %r637, %r638
  %r640 = sub i32 %r634, %r639
  %r641 = mul i32 %r631, %r640
  %r642 = add i32 %r633, %r641
  store i32 %r642, i32* @ans
  %r643 = add i32 %r631, 1
  %r644 = add i32 %r643, 0
  br label %bb47

bb49:
  %r645 = load i32, i32* @ans
  %r646 = icmp slt i32 %r645, 0
  br i1 %r646, label %bb50, label %bb51

bb50:
  %r648 = load i32, i32* @ans
  %r649 = sub i32 0, %r648
  store i32 %r649, i32* @ans
  br label %bb52

bb51:
  br label %bb52

bb52:
  call void @_sysy_stoptime(i32 117)
  %r647 = load i32, i32* @ans
  call void @putint(i32 %r647)
  call void @putch(i32 10)
  ret i32 0
}

