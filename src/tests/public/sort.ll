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
  store i32 0, i32* %r155
  %r157 = getelementptr [16 x i32 ], [16 x i32 ]* %r149, i32 0, i32 %r466
  store i32 0, i32* %r157
  %r159 = getelementptr [16 x i32 ], [16 x i32 ]* %r150, i32 0, i32 %r466
  store i32 0, i32* %r159
  %r469 = add i32 %r466, 1
  %r470 = add i32 %r469, 0
  br label %bb10

bb12:
  %r471 = icmp eq i32 %r459, -1
  br i1 %r471, label %bb17, label %bb18

bb17:
  %r473 = add i32 1, 0
  br label %bb19

bb18:
  %r472 = add i32 0, 0
  br label %bb19

bb19:
  %r474 = phi i32 [ %r473, %bb17 ], [ %r472, %bb18 ]
  %r475 = icmp ne i32 %r474, 0
  br i1 %r475, label %bb13, label %bb16

bb16:
  %r476 = add i32 %r461, 1
  %r477 = icmp sge i32 %r476, %r463
  br i1 %r477, label %bb20, label %bb21

bb20:
  %r478 = add i32 1, 0
  br label %bb22

bb21:
  %r479 = add i32 0, 0
  br label %bb22

bb22:
  %r480 = phi i32 [ %r478, %bb20 ], [ %r479, %bb21 ]
  %r481 = icmp ne i32 %r480, 0
  br i1 %r481, label %bb13, label %bb14

bb13:
  ret void
bb14:
  br label %bb15

bb15:
  %r482 = add i32 %r461, 0
  br label %bb23

bb23:
  %r483 = phi i32 [ %r482, %bb15 ], [ %r494, %bb24 ]
  %r484 = icmp slt i32 %r483, %r463
  br i1 %r484, label %bb24, label %bb25

bb24:
  %r182 = getelementptr i32, i32* %r143, i32 %r483
  %r485 = load i32, i32* %r182
  %r486 = call i32 @getNumPos(i32 %r485, i32 %r459)
  %r487 = add i32 %r486, 0
  %r188 = getelementptr i32, i32* %r143, i32 %r483
  %r488 = load i32, i32* %r188
  %r489 = call i32 @getNumPos(i32 %r488, i32 %r459)
  %r490 = add i32 %r489, 0
  %r193 = getelementptr [16 x i32 ], [16 x i32 ]* %r150, i32 0, i32 %r490
  %r195 = getelementptr [16 x i32 ], [16 x i32 ]* %r150, i32 0, i32 %r487
  %r491 = load i32, i32* %r195
  %r492 = add i32 %r491, 1
  store i32 %r492, i32* %r193
  %r493 = add i32 %r483, 1
  %r494 = add i32 %r493, 0
  br label %bb23

bb25:
  %r201 = getelementptr [16 x i32 ], [16 x i32 ]* %r148, i32 0, i32 0
  store i32 %r461, i32* %r201
  %r203 = getelementptr [16 x i32 ], [16 x i32 ]* %r149, i32 0, i32 0
  %r205 = getelementptr [16 x i32 ], [16 x i32 ]* %r150, i32 0, i32 0
  %r495 = load i32, i32* %r205
  %r496 = add i32 %r461, %r495
  store i32 %r496, i32* %r203
  %r497 = add i32 1, 0
  br label %bb26

bb26:
  %r498 = phi i32 [ %r497, %bb25 ], [ %r564, %bb27 ]
  %r499 = load i32, i32* @base
  %r500 = icmp slt i32 %r498, %r499
  br i1 %r500, label %bb27, label %bb28

bb27:
  %r557 = sub i32 %r498, 1
  %r558 = add i32 %r557, 0
  %r214 = getelementptr [16 x i32 ], [16 x i32 ]* %r148, i32 0, i32 %r498
  %r216 = getelementptr [16 x i32 ], [16 x i32 ]* %r149, i32 0, i32 %r558
  %r559 = load i32, i32* %r216
  store i32 %r559, i32* %r214
  %r219 = getelementptr [16 x i32 ], [16 x i32 ]* %r149, i32 0, i32 %r498
  %r221 = getelementptr [16 x i32 ], [16 x i32 ]* %r148, i32 0, i32 %r498
  %r560 = load i32, i32* %r221
  %r224 = getelementptr [16 x i32 ], [16 x i32 ]* %r150, i32 0, i32 %r498
  %r561 = load i32, i32* %r224
  %r562 = add i32 %r560, %r561
  store i32 %r562, i32* %r219
  %r563 = add i32 %r498, 1
  %r564 = add i32 %r563, 0
  br label %bb26

bb28:
  %r501 = add i32 0, 0
  br label %bb29

bb29:
  %r502 = phi i32 [ %r501, %bb28 ], [ %r537, %bb34 ]
  %r503 = load i32, i32* @base
  %r504 = icmp slt i32 %r502, %r503
  br i1 %r504, label %bb30, label %bb31

bb30:
  br label %bb32

bb32:
  %r234 = getelementptr [16 x i32 ], [16 x i32 ]* %r148, i32 0, i32 %r502
  %r505 = load i32, i32* %r234
  %r237 = getelementptr [16 x i32 ], [16 x i32 ]* %r149, i32 0, i32 %r502
  %r506 = load i32, i32* %r237
  %r507 = icmp slt i32 %r505, %r506
  br i1 %r507, label %bb33, label %bb34

bb33:
  %r240 = getelementptr [16 x i32 ], [16 x i32 ]* %r148, i32 0, i32 %r502
  %r508 = load i32, i32* %r240
  %r509 = add i32 %r508, 0
  %r244 = getelementptr i32, i32* %r143, i32 %r509
  %r510 = load i32, i32* %r244
  %r511 = add i32 %r510, 0
  br label %bb35

bb35:
  %r512 = phi i32 [ %r511, %bb33 ], [ %r525, %bb36 ]
  %r513 = call i32 @getNumPos(i32 %r512, i32 %r459)
  %r514 = icmp ne i32 %r513, %r502
  br i1 %r514, label %bb36, label %bb37

bb36:
  %r519 = add i32 %r512, 0
  %r520 = call i32 @getNumPos(i32 %r519, i32 %r459)
  %r521 = add i32 %r520, 0
  %r259 = getelementptr [16 x i32 ], [16 x i32 ]* %r148, i32 0, i32 %r521
  %r522 = load i32, i32* %r259
  %r523 = add i32 %r522, 0
  %r262 = getelementptr i32, i32* %r143, i32 %r523
  %r524 = load i32, i32* %r262
  %r525 = add i32 %r524, 0
  %r526 = call i32 @getNumPos(i32 %r519, i32 %r459)
  %r527 = add i32 %r526, 0
  %r268 = getelementptr [16 x i32 ], [16 x i32 ]* %r148, i32 0, i32 %r527
  %r528 = load i32, i32* %r268
  %r529 = add i32 %r528, 0
  %r271 = getelementptr i32, i32* %r143, i32 %r529
  store i32 %r519, i32* %r271
  %r530 = call i32 @getNumPos(i32 %r519, i32 %r459)
  %r531 = add i32 %r530, 0
  %r532 = call i32 @getNumPos(i32 %r519, i32 %r459)
  %r533 = add i32 %r532, 0
  %r281 = getelementptr [16 x i32 ], [16 x i32 ]* %r148, i32 0, i32 %r533
  %r283 = getelementptr [16 x i32 ], [16 x i32 ]* %r148, i32 0, i32 %r531
  %r534 = load i32, i32* %r283
  %r535 = add i32 %r534, 1
  store i32 %r535, i32* %r281
  br label %bb35

bb37:
  %r287 = getelementptr [16 x i32 ], [16 x i32 ]* %r148, i32 0, i32 %r502
  %r515 = load i32, i32* %r287
  %r516 = add i32 %r515, 0
  %r291 = getelementptr i32, i32* %r143, i32 %r516
  store i32 %r512, i32* %r291
  %r294 = getelementptr [16 x i32 ], [16 x i32 ]* %r148, i32 0, i32 %r502
  %r296 = getelementptr [16 x i32 ], [16 x i32 ]* %r148, i32 0, i32 %r502
  %r517 = load i32, i32* %r296
  %r518 = add i32 %r517, 1
  store i32 %r518, i32* %r294
  br label %bb32

bb34:
  %r536 = add i32 %r502, 1
  %r537 = add i32 %r536, 0
  br label %bb29

bb31:
  %r538 = add i32 %r461, 0
  %r303 = getelementptr [16 x i32 ], [16 x i32 ]* %r148, i32 0, i32 0
  store i32 %r461, i32* %r303
  %r305 = getelementptr [16 x i32 ], [16 x i32 ]* %r149, i32 0, i32 0
  %r307 = getelementptr [16 x i32 ], [16 x i32 ]* %r150, i32 0, i32 0
  %r539 = load i32, i32* %r307
  %r540 = add i32 %r461, %r539
  store i32 %r540, i32* %r305
  %r541 = add i32 0, 0
  br label %bb38

bb38:
  %r542 = phi i32 [ %r541, %bb31 ], [ %r550, %bb43 ]
  %r543 = load i32, i32* @base
  %r544 = icmp slt i32 %r542, %r543
  br i1 %r544, label %bb39, label %bb40

bb39:
  %r545 = icmp sgt i32 %r542, 0
  br i1 %r545, label %bb41, label %bb42

bb41:
  %r551 = sub i32 %r542, 1
  %r552 = add i32 %r551, 0
  %r319 = getelementptr [16 x i32 ], [16 x i32 ]* %r148, i32 0, i32 %r542
  %r321 = getelementptr [16 x i32 ], [16 x i32 ]* %r149, i32 0, i32 %r552
  %r553 = load i32, i32* %r321
  store i32 %r553, i32* %r319
  %r324 = getelementptr [16 x i32 ], [16 x i32 ]* %r149, i32 0, i32 %r542
  %r326 = getelementptr [16 x i32 ], [16 x i32 ]* %r148, i32 0, i32 %r542
  %r554 = load i32, i32* %r326
  %r329 = getelementptr [16 x i32 ], [16 x i32 ]* %r150, i32 0, i32 %r542
  %r555 = load i32, i32* %r329
  %r556 = add i32 %r554, %r555
  store i32 %r556, i32* %r324
  br label %bb43

bb42:
  br label %bb43

bb43:
  %r546 = sub i32 %r459, 1
  %r335 = getelementptr [16 x i32 ], [16 x i32 ]* %r148, i32 0, i32 %r542
  %r547 = load i32, i32* %r335
  %r338 = getelementptr [16 x i32 ], [16 x i32 ]* %r149, i32 0, i32 %r542
  %r548 = load i32, i32* %r338
  call void @radixSort(i32 %r546, i32* %r143, i32 %r547, i32 %r548)
  %r549 = add i32 %r542, 1
  %r550 = add i32 %r549, 0
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
  store i32 %r576, i32* %r349
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

