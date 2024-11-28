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
  %r387 = add i32 0, 0
  %r388 = add i32 %r100, 0
  %r389 = add i32 0, 0
  %r390 = add i32 0, 0
  %r391 = add i32 0, 0
  %r392 = add i32 0, 0
  br label %bb1

bb1:
  %r393 = phi i32 [ %r390, %getMaxNum ], [ %r398, %bb6 ]
  %r394 = phi i32 [ %r392, %getMaxNum ], [ %r400, %bb6 ]
  %r395 = icmp slt i32 %r394, %r388
  br i1 %r395, label %bb2, label %bb3

bb2:
  %r110 = getelementptr i32, i32* %r102, i32 %r394
  %r396 = load i32, i32* %r110
  %r397 = icmp sgt i32 %r396, %r393
  br i1 %r397, label %bb4, label %bb5

bb4:
  %r114 = getelementptr i32, i32* %r102, i32 %r394
  %r401 = load i32, i32* %r114
  %r402 = add i32 %r401, 0
  br label %bb6

bb5:
  br label %bb6

bb6:
  %r398 = phi i32 [ %r402, %bb4 ], [ %r393, %bb5 ]
  %r399 = add i32 %r394, 1
  %r400 = add i32 %r399, 0
  br label %bb1

bb3:
  ret i32 %r393
}

define i32 @getNumPos( i32 %r120, i32 %r122 ) {
getNumPos:
  %r407 = add i32 0, 0
  %r408 = add i32 %r120, 0
  %r409 = add i32 0, 0
  %r410 = add i32 %r122, 0
  %r411 = add i32 0, 0
  %r412 = add i32 1, 0
  %r413 = add i32 0, 0
  %r414 = add i32 0, 0
  br label %bb7

bb7:
  %r415 = phi i32 [ %r408, %getNumPos ], [ %r420, %bb8 ]
  %r416 = phi i32 [ %r414, %getNumPos ], [ %r422, %bb8 ]
  %r417 = icmp slt i32 %r416, %r410
  br i1 %r417, label %bb8, label %bb9

bb8:
  %r418 = load i32, i32* @base
  %r419 = sdiv i32 %r415, %r418
  %r420 = add i32 %r419, 0
  %r421 = add i32 %r416, 1
  %r422 = add i32 %r421, 0
  br label %bb7

bb9:
  %r423 = load i32, i32* @base
  %r424 = sdiv i32 %r415, %r423
  %r425 = load i32, i32* @base
  %r426 = mul i32 %r424, %r425
  %r427 = sub i32 %r415, %r426
  ret i32 %r427
}

define void @radixSort( i32 %r141, i32* %r143, i32 %r144, i32 %r146 ) {
radixSort:
  %r445 = add i32 0, 0
  %r446 = add i32 0, 0
  %r447 = add i32 0, 0
  %r448 = add i32 0, 0
  %r449 = add i32 0, 0
  %r450 = add i32 0, 0
  %r451 = add i32 0, 0
  %r452 = add i32 0, 0
  %r453 = add i32 0, 0
  %r454 = add i32 0, 0
  %r455 = add i32 0, 0
  %r456 = add i32 0, 0
  %r457 = add i32 0, 0
  %r458 = add i32 0, 0
  %r459 = add i32 %r141, 0
  %r460 = add i32 0, 0
  %r461 = add i32 %r144, 0
  %r462 = add i32 0, 0
  %r463 = add i32 %r146, 0
  %r148 = alloca [ 16 x i32 ]
  %r149 = alloca [ 16 x i32 ]
  %r150 = alloca [ 16 x i32 ]
  %r464 = add i32 0, 0
  %r465 = add i32 0, 0
  br label %bb10

bb10:
  %r466 = phi i32 [ %r465, %radixSort ], [ %r470, %bb11 ]
  %r467 = load i32, i32* @base
  %r468 = icmp slt i32 %r466, %r467
  br i1 %r468, label %bb11, label %bb12

bb11:
  %r155 = getelementptr [16 x i32 ], [16 x i32 ]* %r148, i32 0, i32 %r466
  %r157 = getelementptr [16 x i32 ], [16 x i32 ]* %r149, i32 0, i32 %r466
  %r159 = getelementptr [16 x i32 ], [16 x i32 ]* %r150, i32 0, i32 %r466
  %r469 = add i32 %r466, 1
  %r470 = add i32 %r469, 0
  br label %bb10

bb12:
  %r471 = icmp eq i32 %r459, -1
  br i1 %r471, label %bb17, label %bb18

bb17:
  %r563 = add i32 1, 0
  br label %bb19

bb18:
  %r564 = add i32 0, 0
  br label %bb19

bb19:
  %r472 = phi i32 [ %r563, %bb17 ], [ %r564, %bb18 ]
  %r473 = icmp ne i32 %r472, 0
  br i1 %r473, label %bb13, label %bb16

bb16:
  %r474 = add i32 %r461, 1
  %r475 = icmp sge i32 %r474, %r463
  br i1 %r475, label %bb20, label %bb21

bb20:
  %r476 = add i32 1, 0
  br label %bb22

bb21:
  %r562 = add i32 0, 0
  br label %bb22

bb22:
  %r477 = phi i32 [ %r476, %bb20 ], [ %r562, %bb21 ]
  %r478 = icmp ne i32 %r477, 0
  br i1 %r478, label %bb13, label %bb14

bb13:
  ret void
bb14:
  br label %bb15

bb15:
  %r479 = add i32 %r461, 0
  br label %bb23

bb23:
  %r480 = phi i32 [ %r479, %bb15 ], [ %r491, %bb24 ]
  %r481 = icmp slt i32 %r480, %r463
  br i1 %r481, label %bb24, label %bb25

bb24:
  %r182 = getelementptr i32, i32* %r143, i32 %r480
  %r482 = load i32, i32* %r182
  %r483 = call i32 @getNumPos(i32 %r482, i32 %r459)
  %r484 = add i32 %r483, 0
  %r188 = getelementptr i32, i32* %r143, i32 %r480
  %r485 = load i32, i32* %r188
  %r486 = call i32 @getNumPos(i32 %r485, i32 %r459)
  %r487 = add i32 %r486, 0
  %r193 = getelementptr [16 x i32 ], [16 x i32 ]* %r150, i32 0, i32 %r487
  %r195 = getelementptr [16 x i32 ], [16 x i32 ]* %r150, i32 0, i32 %r484
  %r488 = load i32, i32* %r195
  %r489 = add i32 %r488, 1
  %r490 = add i32 %r480, 1
  %r491 = add i32 %r490, 0
  br label %bb23

bb25:
  %r201 = getelementptr [16 x i32 ], [16 x i32 ]* %r148, i32 0, i32 0
  %r203 = getelementptr [16 x i32 ], [16 x i32 ]* %r149, i32 0, i32 0
  %r205 = getelementptr [16 x i32 ], [16 x i32 ]* %r150, i32 0, i32 0
  %r492 = load i32, i32* %r205
  %r493 = add i32 %r461, %r492
  %r494 = add i32 1, 0
  br label %bb26

bb26:
  %r495 = phi i32 [ %r494, %bb25 ], [ %r505, %bb27 ]
  %r496 = load i32, i32* @base
  %r497 = icmp slt i32 %r495, %r496
  br i1 %r497, label %bb27, label %bb28

bb27:
  %r498 = sub i32 %r495, 1
  %r499 = add i32 %r498, 0
  %r214 = getelementptr [16 x i32 ], [16 x i32 ]* %r148, i32 0, i32 %r495
  %r216 = getelementptr [16 x i32 ], [16 x i32 ]* %r149, i32 0, i32 %r499
  %r500 = load i32, i32* %r216
  %r219 = getelementptr [16 x i32 ], [16 x i32 ]* %r149, i32 0, i32 %r495
  %r221 = getelementptr [16 x i32 ], [16 x i32 ]* %r148, i32 0, i32 %r495
  %r501 = load i32, i32* %r221
  %r224 = getelementptr [16 x i32 ], [16 x i32 ]* %r150, i32 0, i32 %r495
  %r502 = load i32, i32* %r224
  %r503 = add i32 %r501, %r502
  %r504 = add i32 %r495, 1
  %r505 = add i32 %r504, 0
  br label %bb26

bb28:
  %r506 = add i32 0, 0
  br label %bb29

bb29:
  %r507 = phi i32 [ %r506, %bb28 ], [ %r561, %bb34 ]
  %r508 = load i32, i32* @base
  %r509 = icmp slt i32 %r507, %r508
  br i1 %r509, label %bb30, label %bb31

bb30:
  br label %bb32

bb32:
  %r234 = getelementptr [16 x i32 ], [16 x i32 ]* %r148, i32 0, i32 %r507
  %r529 = load i32, i32* %r234
  %r237 = getelementptr [16 x i32 ], [16 x i32 ]* %r149, i32 0, i32 %r507
  %r530 = load i32, i32* %r237
  %r531 = icmp slt i32 %r529, %r530
  br i1 %r531, label %bb33, label %bb34

bb33:
  %r240 = getelementptr [16 x i32 ], [16 x i32 ]* %r148, i32 0, i32 %r507
  %r532 = load i32, i32* %r240
  %r533 = add i32 %r532, 0
  %r244 = getelementptr i32, i32* %r143, i32 %r533
  %r534 = load i32, i32* %r244
  %r535 = add i32 %r534, 0
  br label %bb35

bb35:
  %r536 = phi i32 [ %r535, %bb33 ], [ %r549, %bb36 ]
  %r537 = call i32 @getNumPos(i32 %r536, i32 %r459)
  %r538 = icmp ne i32 %r537, %r507
  br i1 %r538, label %bb36, label %bb37

bb36:
  %r543 = add i32 %r536, 0
  %r544 = call i32 @getNumPos(i32 %r543, i32 %r459)
  %r545 = add i32 %r544, 0
  %r259 = getelementptr [16 x i32 ], [16 x i32 ]* %r148, i32 0, i32 %r545
  %r546 = load i32, i32* %r259
  %r547 = add i32 %r546, 0
  %r262 = getelementptr i32, i32* %r143, i32 %r547
  %r548 = load i32, i32* %r262
  %r549 = add i32 %r548, 0
  %r550 = call i32 @getNumPos(i32 %r543, i32 %r459)
  %r551 = add i32 %r550, 0
  %r268 = getelementptr [16 x i32 ], [16 x i32 ]* %r148, i32 0, i32 %r551
  %r552 = load i32, i32* %r268
  %r553 = add i32 %r552, 0
  %r271 = getelementptr i32, i32* %r143, i32 %r553
  %r554 = call i32 @getNumPos(i32 %r543, i32 %r459)
  %r555 = add i32 %r554, 0
  %r556 = call i32 @getNumPos(i32 %r543, i32 %r459)
  %r557 = add i32 %r556, 0
  %r281 = getelementptr [16 x i32 ], [16 x i32 ]* %r148, i32 0, i32 %r557
  %r283 = getelementptr [16 x i32 ], [16 x i32 ]* %r148, i32 0, i32 %r555
  %r558 = load i32, i32* %r283
  %r559 = add i32 %r558, 1
  br label %bb35

bb37:
  %r287 = getelementptr [16 x i32 ], [16 x i32 ]* %r148, i32 0, i32 %r507
  %r539 = load i32, i32* %r287
  %r540 = add i32 %r539, 0
  %r291 = getelementptr i32, i32* %r143, i32 %r540
  %r294 = getelementptr [16 x i32 ], [16 x i32 ]* %r148, i32 0, i32 %r507
  %r296 = getelementptr [16 x i32 ], [16 x i32 ]* %r148, i32 0, i32 %r507
  %r541 = load i32, i32* %r296
  %r542 = add i32 %r541, 1
  br label %bb32

bb34:
  %r560 = add i32 %r507, 1
  %r561 = add i32 %r560, 0
  br label %bb29

bb31:
  %r510 = add i32 %r461, 0
  %r303 = getelementptr [16 x i32 ], [16 x i32 ]* %r148, i32 0, i32 0
  %r305 = getelementptr [16 x i32 ], [16 x i32 ]* %r149, i32 0, i32 0
  %r307 = getelementptr [16 x i32 ], [16 x i32 ]* %r150, i32 0, i32 0
  %r511 = load i32, i32* %r307
  %r512 = add i32 %r461, %r511
  %r513 = add i32 0, 0
  br label %bb38

bb38:
  %r514 = phi i32 [ %r513, %bb31 ], [ %r522, %bb43 ]
  %r515 = load i32, i32* @base
  %r516 = icmp slt i32 %r514, %r515
  br i1 %r516, label %bb39, label %bb40

bb39:
  %r517 = icmp sgt i32 %r514, 0
  br i1 %r517, label %bb41, label %bb42

bb41:
  %r523 = sub i32 %r514, 1
  %r524 = add i32 %r523, 0
  %r319 = getelementptr [16 x i32 ], [16 x i32 ]* %r148, i32 0, i32 %r514
  %r321 = getelementptr [16 x i32 ], [16 x i32 ]* %r149, i32 0, i32 %r524
  %r525 = load i32, i32* %r321
  %r324 = getelementptr [16 x i32 ], [16 x i32 ]* %r149, i32 0, i32 %r514
  %r326 = getelementptr [16 x i32 ], [16 x i32 ]* %r148, i32 0, i32 %r514
  %r526 = load i32, i32* %r326
  %r329 = getelementptr [16 x i32 ], [16 x i32 ]* %r150, i32 0, i32 %r514
  %r527 = load i32, i32* %r329
  %r528 = add i32 %r526, %r527
  br label %bb43

bb42:
  br label %bb43

bb43:
  %r518 = sub i32 %r459, 1
  %r335 = getelementptr [16 x i32 ], [16 x i32 ]* %r148, i32 0, i32 %r514
  %r519 = load i32, i32* %r335
  %r338 = getelementptr [16 x i32 ], [16 x i32 ]* %r149, i32 0, i32 %r514
  %r520 = load i32, i32* %r338
  call void @radixSort(i32 %r518, i32* %r143, i32 %r519, i32 %r520)
  %r521 = add i32 %r514, 1
  %r522 = add i32 %r521, 0
  br label %bb38

bb40:
  ret void
}

define i32 @main( ) {
main:
  %r568 = add i32 0, 0
  %r569 = call i32 @getint()
  %r570 = add i32 0, 0
  %r571 = add i32 %r569, 0
  %r572 = add i32 0, 0
  %r573 = add i32 0, 0
  br label %bb44

bb44:
  %r574 = phi i32 [ %r573, %main ], [ %r578, %bb45 ]
  %r575 = icmp slt i32 %r574, %r571
  br i1 %r575, label %bb45, label %bb46

bb45:
  %r349 = getelementptr [30000010 x i32 ], [30000010 x i32 ]* @a, i32 0, i32 %r574
  %r576 = call i32 @getint()
  %r577 = add i32 %r574, 1
  %r578 = add i32 %r577, 0
  br label %bb44

bb46:
  call void @_sysy_starttime(i32 97)
  call void @radixSort(i32 8, i32* @a, i32 0, i32 %r571)
  %r579 = add i32 0, 0
  br label %bb47

bb47:
  %r580 = phi i32 [ %r579, %bb46 ], [ %r593, %bb48 ]
  %r581 = icmp slt i32 %r580, %r571
  br i1 %r581, label %bb48, label %bb49

bb48:
  %r582 = load i32, i32* @ans
  %r361 = getelementptr [30000010 x i32 ], [30000010 x i32 ]* @a, i32 0, i32 %r580
  %r583 = load i32, i32* %r361
  %r364 = getelementptr [30000010 x i32 ], [30000010 x i32 ]* @a, i32 0, i32 %r580
  %r584 = load i32, i32* %r364
  %r585 = add i32 2, %r580
  %r586 = sdiv i32 %r584, %r585
  %r587 = add i32 2, %r580
  %r588 = mul i32 %r586, %r587
  %r589 = sub i32 %r583, %r588
  %r590 = mul i32 %r580, %r589
  %r591 = add i32 %r582, %r590
  store i32 %r591, i32* @ans
  %r592 = add i32 %r580, 1
  %r593 = add i32 %r592, 0
  br label %bb47

bb49:
  %r594 = load i32, i32* @ans
  %r595 = icmp slt i32 %r594, 0
  br i1 %r595, label %bb50, label %bb51

bb50:
  %r597 = load i32, i32* @ans
  %r598 = sub i32 0, %r597
  store i32 %r598, i32* @ans
  br label %bb52

bb51:
  br label %bb52

bb52:
  call void @_sysy_stoptime(i32 117)
  %r596 = load i32, i32* @ans
  call void @putint(i32 %r596)
  call void @putch(i32 10)
  ret i32 0
}

