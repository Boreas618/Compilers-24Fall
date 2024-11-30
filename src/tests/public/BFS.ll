declare i32 @getch( )
declare i32 @getint( )
declare void @putch( i32 )
declare void @putint( i32 )
declare void @putarray( i32, i32* )
declare void @_sysy_starttime( i32 )
declare void @_sysy_stoptime( i32 )
@n = global i32 0
@m = global i32 0
@to = global [ 5005 x i32 ] zeroinitializer
@next = global [ 5005 x i32 ] zeroinitializer
@head = global [ 1005 x i32 ] zeroinitializer
@cnt = global i32 0
@que = global [ 1005 x i32 ] zeroinitializer
@h = global i32 0
@tail = global i32 0
@inq = global [ 1005 x i32 ] zeroinitializer
define i32 @quickread( ) {
quickread:
  %r296 = add i32 0, 0
  %r297 = add i32 0, 0
  %r298 = add i32 0, 0
  %r299 = add i32 0, 0
  %r300 = call i32 @getch()
  %r301 = add i32 0, 0
  %r302 = add i32 %r300, 0
  %r303 = add i32 0, 0
  %r304 = add i32 0, 0
  %r305 = add i32 0, 0
  %r306 = add i32 0, 0
  br label %bb1

bb1:
  %r307 = phi i32 [ %r306, %quickread ], [ %r313, %bb13 ]
  %r308 = phi i32 [ %r302, %quickread ], [ %r315, %bb13 ]
  %r309 = icmp slt i32 %r308, 48
  br i1 %r309, label %bb5, label %bb6

bb5:
  %r343 = add i32 1, 0
  br label %bb7

bb6:
  %r342 = add i32 0, 0
  br label %bb7

bb7:
  %r310 = phi i32 [ %r343, %bb5 ], [ %r342, %bb6 ]
  %r311 = icmp ne i32 %r310, 0
  br i1 %r311, label %bb2, label %bb4

bb4:
  %r317 = icmp sgt i32 %r308, 57
  br i1 %r317, label %bb8, label %bb9

bb8:
  %r340 = add i32 1, 0
  br label %bb10

bb9:
  %r341 = add i32 0, 0
  br label %bb10

bb10:
  %r318 = phi i32 [ %r340, %bb8 ], [ %r341, %bb9 ]
  %r319 = icmp ne i32 %r318, 0
  br i1 %r319, label %bb2, label %bb3

bb2:
  %r312 = icmp eq i32 %r308, 45
  br i1 %r312, label %bb11, label %bb12

bb11:
  %r316 = add i32 1, 0
  br label %bb13

bb12:
  br label %bb13

bb13:
  %r313 = phi i32 [ %r316, %bb11 ], [ %r307, %bb12 ]
  %r314 = call i32 @getch()
  %r315 = add i32 %r314, 0
  br label %bb1

bb3:
  br label %bb14

bb14:
  %r320 = phi i32 [ %r304, %bb3 ], [ %r335, %bb15 ]
  %r321 = phi i32 [ %r308, %bb3 ], [ %r337, %bb15 ]
  %r322 = icmp sge i32 %r321, 48
  br i1 %r322, label %bb18, label %bb19

bb18:
  %r323 = add i32 1, 0
  br label %bb20

bb19:
  %r324 = add i32 0, 0
  br label %bb20

bb20:
  %r325 = phi i32 [ %r323, %bb18 ], [ %r324, %bb19 ]
  %r326 = icmp ne i32 %r325, 0
  br i1 %r326, label %bb17, label %bb16

bb17:
  %r329 = icmp sle i32 %r321, 57
  br i1 %r329, label %bb21, label %bb22

bb21:
  %r338 = add i32 1, 0
  br label %bb23

bb22:
  %r339 = add i32 0, 0
  br label %bb23

bb23:
  %r330 = phi i32 [ %r338, %bb21 ], [ %r339, %bb22 ]
  %r331 = icmp ne i32 %r330, 0
  br i1 %r331, label %bb15, label %bb16

bb15:
  %r332 = mul i32 %r320, 10
  %r333 = add i32 %r332, %r321
  %r334 = sub i32 %r333, 48
  %r335 = add i32 %r334, 0
  %r336 = call i32 @getch()
  %r337 = add i32 %r336, 0
  br label %bb14

bb16:
  %r327 = icmp ne i32 %r307, 0
  br i1 %r327, label %bb24, label %bb25

bb24:
  %r328 = sub i32 0, %r320
  ret i32 %r328
bb25:
  ret i32 %r320
}

define void @addedge( i32 %r140, i32 %r142 ) {
addedge:
  %r350 = add i32 0, 0
  %r351 = add i32 %r140, 0
  %r352 = add i32 0, 0
  %r353 = add i32 %r142, 0
  %r354 = load i32, i32* @cnt
  %r144 = getelementptr [5005 x i32 ], [5005 x i32 ]* @to, i32 0, i32 %r354
  store i32 %r353, i32* %r144
  %r355 = load i32, i32* @cnt
  %r147 = getelementptr [5005 x i32 ], [5005 x i32 ]* @next, i32 0, i32 %r355
  %r149 = getelementptr [1005 x i32 ], [1005 x i32 ]* @head, i32 0, i32 %r351
  %r356 = load i32, i32* %r149
  store i32 %r356, i32* %r147
  %r152 = getelementptr [1005 x i32 ], [1005 x i32 ]* @head, i32 0, i32 %r351
  %r357 = load i32, i32* @cnt
  store i32 %r357, i32* %r152
  %r358 = load i32, i32* @cnt
  %r359 = add i32 %r358, 1
  store i32 %r359, i32* @cnt
  %r360 = load i32, i32* @cnt
  %r157 = getelementptr [5005 x i32 ], [5005 x i32 ]* @to, i32 0, i32 %r360
  store i32 %r351, i32* %r157
  %r361 = load i32, i32* @cnt
  %r160 = getelementptr [5005 x i32 ], [5005 x i32 ]* @next, i32 0, i32 %r361
  %r162 = getelementptr [1005 x i32 ], [1005 x i32 ]* @head, i32 0, i32 %r353
  %r362 = load i32, i32* %r162
  store i32 %r362, i32* %r160
  %r165 = getelementptr [1005 x i32 ], [1005 x i32 ]* @head, i32 0, i32 %r353
  %r363 = load i32, i32* @cnt
  store i32 %r363, i32* %r165
  %r364 = load i32, i32* @cnt
  %r365 = add i32 %r364, 1
  store i32 %r365, i32* @cnt
  ret void
}

define void @init( ) {
init:
  %r369 = add i32 0, 0
  %r370 = add i32 0, 0
  br label %bb27

bb27:
  %r371 = phi i32 [ %r370, %init ], [ %r374, %bb28 ]
  %r372 = icmp slt i32 %r371, 1005
  br i1 %r372, label %bb28, label %bb29

bb28:
  %r173 = getelementptr [1005 x i32 ], [1005 x i32 ]* @head, i32 0, i32 %r371
  store i32 -1, i32* %r173
  %r373 = add i32 %r371, 1
  %r374 = add i32 %r373, 0
  br label %bb27

bb29:
  ret void
}

define void @inqueue( i32 %r177 ) {
inqueue:
  %r378 = add i32 0, 0
  %r379 = add i32 %r177, 0
  %r179 = getelementptr [1005 x i32 ], [1005 x i32 ]* @inq, i32 0, i32 %r379
  store i32 1, i32* %r179
  %r380 = load i32, i32* @tail
  %r381 = add i32 %r380, 1
  store i32 %r381, i32* @tail
  %r382 = load i32, i32* @tail
  %r183 = getelementptr [1005 x i32 ], [1005 x i32 ]* @que, i32 0, i32 %r382
  store i32 %r379, i32* %r183
  ret void
}

define i32 @popqueue( ) {
popqueue:
  %r386 = load i32, i32* @h
  %r387 = add i32 %r386, 1
  store i32 %r387, i32* @h
  %r388 = load i32, i32* @h
  %r188 = getelementptr [1005 x i32 ], [1005 x i32 ]* @que, i32 0, i32 %r388
  %r389 = load i32, i32* %r188
  %r390 = add i32 0, 0
  %r391 = add i32 %r389, 0
  %r392 = load i32, i32* @h
  %r192 = getelementptr [1005 x i32 ], [1005 x i32 ]* @que, i32 0, i32 %r392
  %r393 = load i32, i32* %r192
  ret i32 %r393
}

define i32 @same( i32 %r195, i32 %r197 ) {
same:
  %r412 = add i32 0, 0
  %r413 = add i32 %r195, 0
  %r414 = add i32 0, 0
  %r415 = add i32 %r197, 0
  store i32 0, i32* @h
  store i32 0, i32* @tail
  call void @inqueue(i32 %r413)
  %r416 = add i32 0, 0
  %r417 = add i32 0, 0
  %r418 = add i32 0, 0
  %r419 = add i32 0, 0
  %r420 = add i32 0, 0
  %r421 = add i32 0, 0
  %r422 = add i32 0, 0
  %r423 = add i32 0, 0
  br label %bb30

bb30:
  %r424 = phi i32 [ %r417, %same ], [ %r431, %bb38 ]
  %r425 = load i32, i32* @h
  %r426 = load i32, i32* @tail
  %r427 = icmp slt i32 %r425, %r426
  br i1 %r427, label %bb31, label %bb32

bb31:
  %r428 = call i32 @popqueue()
  %r429 = add i32 %r428, 0
  %r430 = icmp eq i32 %r429, %r415
  br i1 %r430, label %bb33, label %bb34

bb33:
  %r443 = add i32 1, 0
  br label %bb35

bb34:
  br label %bb35

bb35:
  %r431 = phi i32 [ %r443, %bb33 ], [ %r424, %bb34 ]
  %r212 = getelementptr [1005 x i32 ], [1005 x i32 ]* @head, i32 0, i32 %r429
  %r432 = load i32, i32* %r212
  %r433 = add i32 %r432, 0
  br label %bb36

bb36:
  %r434 = phi i32 [ %r433, %bb35 ], [ %r441, %bb41 ]
  %r435 = icmp ne i32 %r434, -1
  br i1 %r435, label %bb37, label %bb38

bb37:
  %r217 = getelementptr [5005 x i32 ], [5005 x i32 ]* @to, i32 0, i32 %r434
  %r436 = load i32, i32* %r217
  %r437 = add i32 %r436, 0
  %r222 = getelementptr [1005 x i32 ], [1005 x i32 ]* @inq, i32 0, i32 %r437
  %r438 = load i32, i32* %r222
  %r439 = icmp eq i32 %r438, 0
  br i1 %r439, label %bb39, label %bb40

bb39:
  %r225 = getelementptr [5005 x i32 ], [5005 x i32 ]* @to, i32 0, i32 %r434
  %r442 = load i32, i32* %r225
  call void @inqueue(i32 %r442)
  br label %bb41

bb40:
  br label %bb41

bb41:
  %r228 = getelementptr [5005 x i32 ], [5005 x i32 ]* @next, i32 0, i32 %r434
  %r440 = load i32, i32* %r228
  %r441 = add i32 %r440, 0
  br label %bb36

bb38:
  br label %bb30

bb32:
  %r444 = add i32 0, 0
  br label %bb42

bb42:
  %r445 = phi i32 [ %r444, %bb32 ], [ %r451, %bb43 ]
  %r446 = load i32, i32* @tail
  %r447 = icmp sle i32 %r445, %r446
  br i1 %r447, label %bb43, label %bb44

bb43:
  %r234 = getelementptr [1005 x i32 ], [1005 x i32 ]* @que, i32 0, i32 %r445
  %r448 = load i32, i32* %r234
  %r449 = add i32 %r448, 0
  %r237 = getelementptr [1005 x i32 ], [1005 x i32 ]* @inq, i32 0, i32 %r449
  store i32 0, i32* %r237
  %r450 = add i32 %r445, 1
  %r451 = add i32 %r450, 0
  br label %bb42

bb44:
  ret i32 %r424
}

define i32 @main( ) {
main:
  %r467 = add i32 0, 0
  %r468 = add i32 0, 0
  %r469 = call i32 @quickread()
  store i32 %r469, i32* @n
  %r470 = call i32 @quickread()
  store i32 %r470, i32* @m
  call void @_sysy_starttime(i32 97)
  call void @init()
  %r471 = add i32 0, 0
  %r472 = add i32 0, 0
  %r473 = add i32 0, 0
  %r474 = add i32 0, 0
  %r475 = add i32 0, 0
  %r476 = add i32 0, 0
  br label %bb45

bb45:
  %r477 = load i32, i32* @m
  %r478 = icmp ne i32 %r477, 0
  br i1 %r478, label %bb46, label %bb47

bb46:
  %r479 = call i32 @getch()
  %r480 = add i32 %r479, 0
  br label %bb48

bb48:
  %r481 = phi i32 [ %r480, %bb46 ], [ %r502, %bb49 ]
  %r482 = icmp ne i32 %r481, 81
  br i1 %r482, label %bb52, label %bb53

bb52:
  %r504 = add i32 1, 0
  br label %bb54

bb53:
  %r505 = add i32 0, 0
  br label %bb54

bb54:
  %r483 = phi i32 [ %r504, %bb52 ], [ %r505, %bb53 ]
  %r484 = icmp ne i32 %r483, 0
  br i1 %r484, label %bb51, label %bb50

bb51:
  %r497 = icmp ne i32 %r481, 85
  br i1 %r497, label %bb55, label %bb56

bb55:
  %r503 = add i32 1, 0
  br label %bb57

bb56:
  %r498 = add i32 0, 0
  br label %bb57

bb57:
  %r499 = phi i32 [ %r503, %bb55 ], [ %r498, %bb56 ]
  %r500 = icmp ne i32 %r499, 0
  br i1 %r500, label %bb49, label %bb50

bb49:
  %r501 = call i32 @getch()
  %r502 = add i32 %r501, 0
  br label %bb48

bb50:
  %r485 = icmp eq i32 %r481, 81
  br i1 %r485, label %bb58, label %bb59

bb58:
  %r492 = call i32 @quickread()
  %r493 = add i32 %r492, 0
  %r494 = call i32 @quickread()
  %r495 = add i32 %r494, 0
  %r496 = call i32 @same(i32 %r493, i32 %r495)
  call void @putint(i32 %r496)
  call void @putch(i32 10)
  br label %bb60

bb59:
  %r488 = call i32 @quickread()
  %r489 = add i32 %r488, 0
  %r490 = call i32 @quickread()
  %r491 = add i32 %r490, 0
  call void @addedge(i32 %r489, i32 %r491)
  br label %bb60

bb60:
  %r486 = load i32, i32* @m
  %r487 = sub i32 %r486, 1
  store i32 %r487, i32* @m
  br label %bb45

bb47:
  call void @_sysy_stoptime(i32 117)
  ret i32 0
}

