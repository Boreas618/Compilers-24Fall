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
@vis = global [ 1005 x i32 ] zeroinitializer
define i32 @quickread( ) {
quickread:
  %r277 = add i32 0, 0
  %r278 = add i32 0, 0
  %r279 = add i32 0, 0
  %r280 = add i32 0, 0
  %r281 = call i32 @getch()
  %r282 = add i32 0, 0
  %r283 = add i32 %r281, 0
  %r284 = add i32 0, 0
  %r285 = add i32 0, 0
  %r286 = add i32 0, 0
  %r287 = add i32 0, 0
  br label %bb1

bb1:
  %r288 = phi i32 [ %r283, %quickread ], [ %r298, %bb13 ]
  %r289 = phi i32 [ %r287, %quickread ], [ %r296, %bb13 ]
  %r290 = icmp slt i32 %r288, 48
  br i1 %r290, label %bb5, label %bb6

bb5:
  %r291 = add i32 1, 0
  br label %bb7

bb6:
  %r324 = add i32 0, 0
  br label %bb7

bb7:
  %r292 = phi i32 [ %r291, %bb5 ], [ %r324, %bb6 ]
  %r293 = icmp ne i32 %r292, 0
  br i1 %r293, label %bb2, label %bb4

bb4:
  %r299 = icmp sgt i32 %r288, 57
  br i1 %r299, label %bb8, label %bb9

bb8:
  %r301 = add i32 1, 0
  br label %bb10

bb9:
  %r300 = add i32 0, 0
  br label %bb10

bb10:
  %r302 = phi i32 [ %r301, %bb8 ], [ %r300, %bb9 ]
  %r303 = icmp ne i32 %r302, 0
  br i1 %r303, label %bb2, label %bb3

bb2:
  %r294 = icmp eq i32 %r288, 45
  br i1 %r294, label %bb11, label %bb12

bb11:
  %r295 = add i32 1, 0
  br label %bb13

bb12:
  br label %bb13

bb13:
  %r296 = phi i32 [ %r295, %bb11 ], [ %r289, %bb12 ]
  %r297 = call i32 @getch()
  %r298 = add i32 %r297, 0
  br label %bb1

bb3:
  br label %bb14

bb14:
  %r304 = phi i32 [ %r288, %bb3 ], [ %r320, %bb15 ]
  %r305 = phi i32 [ %r285, %bb3 ], [ %r318, %bb15 ]
  %r306 = icmp sge i32 %r304, 48
  br i1 %r306, label %bb18, label %bb19

bb18:
  %r323 = add i32 1, 0
  br label %bb20

bb19:
  %r307 = add i32 0, 0
  br label %bb20

bb20:
  %r308 = phi i32 [ %r323, %bb18 ], [ %r307, %bb19 ]
  %r309 = icmp ne i32 %r308, 0
  br i1 %r309, label %bb17, label %bb16

bb17:
  %r312 = icmp sle i32 %r304, 57
  br i1 %r312, label %bb21, label %bb22

bb21:
  %r322 = add i32 1, 0
  br label %bb23

bb22:
  %r321 = add i32 0, 0
  br label %bb23

bb23:
  %r313 = phi i32 [ %r322, %bb21 ], [ %r321, %bb22 ]
  %r314 = icmp ne i32 %r313, 0
  br i1 %r314, label %bb15, label %bb16

bb15:
  %r315 = mul i32 %r305, 10
  %r316 = add i32 %r315, %r304
  %r317 = sub i32 %r316, 48
  %r318 = add i32 %r317, 0
  %r319 = call i32 @getch()
  %r320 = add i32 %r319, 0
  br label %bb14

bb16:
  %r310 = icmp ne i32 %r289, 0
  br i1 %r310, label %bb24, label %bb25

bb24:
  %r311 = sub i32 0, %r305
  ret i32 %r311
bb25:
  ret i32 %r305
}

define void @addedge( i32 %r140, i32 %r142 ) {
addedge:
  %r331 = add i32 0, 0
  %r332 = add i32 %r140, 0
  %r333 = add i32 0, 0
  %r334 = add i32 %r142, 0
  %r335 = load i32, i32* @cnt
  %r144 = getelementptr [5005 x i32 ], [5005 x i32 ]* @to, i32 0, i32 %r335
  store i32 %r334, i32* %r144
  %r336 = load i32, i32* @cnt
  %r147 = getelementptr [5005 x i32 ], [5005 x i32 ]* @next, i32 0, i32 %r336
  %r149 = getelementptr [1005 x i32 ], [1005 x i32 ]* @head, i32 0, i32 %r332
  %r337 = load i32, i32* %r149
  store i32 %r337, i32* %r147
  %r152 = getelementptr [1005 x i32 ], [1005 x i32 ]* @head, i32 0, i32 %r332
  %r338 = load i32, i32* @cnt
  store i32 %r338, i32* %r152
  %r339 = load i32, i32* @cnt
  %r340 = add i32 %r339, 1
  store i32 %r340, i32* @cnt
  %r341 = load i32, i32* @cnt
  %r157 = getelementptr [5005 x i32 ], [5005 x i32 ]* @to, i32 0, i32 %r341
  store i32 %r332, i32* %r157
  %r342 = load i32, i32* @cnt
  %r160 = getelementptr [5005 x i32 ], [5005 x i32 ]* @next, i32 0, i32 %r342
  %r162 = getelementptr [1005 x i32 ], [1005 x i32 ]* @head, i32 0, i32 %r334
  %r343 = load i32, i32* %r162
  store i32 %r343, i32* %r160
  %r165 = getelementptr [1005 x i32 ], [1005 x i32 ]* @head, i32 0, i32 %r334
  %r344 = load i32, i32* @cnt
  store i32 %r344, i32* %r165
  %r345 = load i32, i32* @cnt
  %r346 = add i32 %r345, 1
  store i32 %r346, i32* @cnt
  ret void
}

define void @init( ) {
init:
  %r350 = add i32 0, 0
  %r351 = add i32 0, 0
  br label %bb27

bb27:
  %r352 = phi i32 [ %r351, %init ], [ %r355, %bb28 ]
  %r353 = icmp slt i32 %r352, 1005
  br i1 %r353, label %bb28, label %bb29

bb28:
  %r173 = getelementptr [1005 x i32 ], [1005 x i32 ]* @head, i32 0, i32 %r352
  store i32 -1, i32* %r173
  %r354 = add i32 %r352, 1
  %r355 = add i32 %r354, 0
  br label %bb27

bb29:
  ret void
}

define void @clear( ) {
clear:
  %r359 = add i32 0, 0
  %r360 = add i32 1, 0
  br label %bb30

bb30:
  %r361 = phi i32 [ %r360, %clear ], [ %r365, %bb31 ]
  %r362 = load i32, i32* @n
  %r363 = icmp sle i32 %r361, %r362
  br i1 %r363, label %bb31, label %bb32

bb31:
  %r181 = getelementptr [1005 x i32 ], [1005 x i32 ]* @vis, i32 0, i32 %r361
  store i32 0, i32* %r181
  %r364 = add i32 %r361, 1
  %r365 = add i32 %r364, 0
  br label %bb30

bb32:
  ret void
}

define i32 @same( i32 %r185, i32 %r187 ) {
same:
  %r384 = add i32 0, 0
  %r385 = add i32 0, 0
  %r386 = add i32 0, 0
  %r387 = add i32 0, 0
  %r388 = add i32 0, 0
  %r389 = add i32 %r185, 0
  %r390 = add i32 0, 0
  %r391 = add i32 %r187, 0
  %r189 = getelementptr [1005 x i32 ], [1005 x i32 ]* @vis, i32 0, i32 %r389
  store i32 1, i32* %r189
  %r392 = icmp eq i32 %r389, %r391
  br i1 %r392, label %bb33, label %bb34

bb33:
  ret i32 1
bb34:
  br label %bb35

bb35:
  %r195 = getelementptr [1005 x i32 ], [1005 x i32 ]* @head, i32 0, i32 %r389
  %r393 = load i32, i32* %r195
  %r394 = add i32 %r393, 0
  br label %bb36

bb36:
  %r395 = phi i32 [ %r394, %bb35 ], [ %r405, %bb41 ]
  %r396 = icmp ne i32 %r395, -1
  br i1 %r396, label %bb37, label %bb38

bb37:
  %r201 = getelementptr [5005 x i32 ], [5005 x i32 ]* @to, i32 0, i32 %r395
  %r397 = load i32, i32* %r201
  %r398 = add i32 %r397, 0
  %r208 = getelementptr [1005 x i32 ], [1005 x i32 ]* @vis, i32 0, i32 %r398
  %r399 = load i32, i32* %r208
  %r400 = icmp eq i32 %r399, 0
  br i1 %r400, label %bb43, label %bb44

bb43:
  %r401 = add i32 1, 0
  br label %bb45

bb44:
  %r412 = add i32 0, 0
  br label %bb45

bb45:
  %r402 = phi i32 [ %r401, %bb43 ], [ %r412, %bb44 ]
  %r403 = icmp ne i32 %r402, 0
  br i1 %r403, label %bb42, label %bb40

bb42:
  %r406 = call i32 @same(i32 %r398, i32 %r391)
  %r407 = icmp ne i32 %r406, 0
  br i1 %r407, label %bb46, label %bb47

bb46:
  %r408 = add i32 1, 0
  br label %bb48

bb47:
  %r411 = add i32 0, 0
  br label %bb48

bb48:
  %r409 = phi i32 [ %r408, %bb46 ], [ %r411, %bb47 ]
  %r410 = icmp ne i32 %r409, 0
  br i1 %r410, label %bb39, label %bb40

bb39:
  ret i32 1
bb40:
  br label %bb41

bb41:
  %r220 = getelementptr [5005 x i32 ], [5005 x i32 ]* @next, i32 0, i32 %r395
  %r404 = load i32, i32* %r220
  %r405 = add i32 %r404, 0
  br label %bb36

bb38:
  ret i32 0
}

define i32 @main( ) {
main:
  %r428 = add i32 0, 0
  %r429 = add i32 0, 0
  call void @_sysy_starttime(i32 74)
  %r430 = call i32 @quickread()
  store i32 %r430, i32* @n
  %r431 = call i32 @quickread()
  store i32 %r431, i32* @m
  call void @init()
  %r432 = add i32 0, 0
  %r433 = add i32 0, 0
  %r434 = add i32 0, 0
  %r435 = add i32 0, 0
  %r436 = add i32 0, 0
  %r437 = add i32 0, 0
  br label %bb49

bb49:
  %r438 = load i32, i32* @m
  %r439 = icmp ne i32 %r438, 0
  br i1 %r439, label %bb50, label %bb51

bb50:
  %r440 = call i32 @getch()
  %r441 = add i32 %r440, 0
  br label %bb52

bb52:
  %r442 = phi i32 [ %r441, %bb50 ], [ %r451, %bb53 ]
  %r443 = icmp ne i32 %r442, 81
  br i1 %r443, label %bb56, label %bb57

bb56:
  %r444 = add i32 1, 0
  br label %bb58

bb57:
  %r466 = add i32 0, 0
  br label %bb58

bb58:
  %r445 = phi i32 [ %r444, %bb56 ], [ %r466, %bb57 ]
  %r446 = icmp ne i32 %r445, 0
  br i1 %r446, label %bb55, label %bb54

bb55:
  %r447 = icmp ne i32 %r442, 85
  br i1 %r447, label %bb59, label %bb60

bb59:
  %r453 = add i32 1, 0
  br label %bb61

bb60:
  %r452 = add i32 0, 0
  br label %bb61

bb61:
  %r448 = phi i32 [ %r453, %bb59 ], [ %r452, %bb60 ]
  %r449 = icmp ne i32 %r448, 0
  br i1 %r449, label %bb53, label %bb54

bb53:
  %r450 = call i32 @getch()
  %r451 = add i32 %r450, 0
  br label %bb52

bb54:
  %r454 = icmp eq i32 %r442, 81
  br i1 %r454, label %bb62, label %bb63

bb62:
  %r455 = call i32 @quickread()
  %r456 = add i32 %r455, 0
  %r457 = call i32 @quickread()
  %r458 = add i32 %r457, 0
  call void @clear()
  %r459 = call i32 @same(i32 %r456, i32 %r458)
  call void @putint(i32 %r459)
  call void @putch(i32 10)
  br label %bb64

bb63:
  %r460 = call i32 @quickread()
  %r461 = add i32 %r460, 0
  %r462 = call i32 @quickread()
  %r463 = add i32 %r462, 0
  call void @addedge(i32 %r461, i32 %r463)
  br label %bb64

bb64:
  %r464 = load i32, i32* @m
  %r465 = sub i32 %r464, 1
  store i32 %r465, i32* @m
  br label %bb49

bb51:
  call void @_sysy_stoptime(i32 96)
  ret i32 0
}

