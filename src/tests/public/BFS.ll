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
  %r282 = add i32 0, 0
  %r283 = add i32 0, 0
  %r284 = add i32 0, 0
  %r285 = add i32 0, 0
  %r286 = call i32 @getch()
  %r287 = add i32 0, 0
  %r288 = add i32 %r286, 0
  %r289 = add i32 0, 0
  %r290 = add i32 0, 0
  %r291 = add i32 0, 0
  %r292 = add i32 0, 0
  br label %bb1

bb1:
  %r293 = phi i32 [ %r288, %quickread ], [ %r304, %bb13 ]
  %r294 = phi i32 [ %r292, %quickread ], [ %r302, %bb13 ]
  %r295 = icmp slt i32 %r293, 48
  br i1 %r295, label %bb5, label %bb6

bb5:
  %r297 = add i32 1, 0
  br label %bb7

bb6:
  %r296 = add i32 0, 0
  br label %bb7

bb7:
  %r298 = phi i32 [ %r297, %bb5 ], [ %r296, %bb6 ]
  %r299 = icmp ne i32 %r298, 0
  br i1 %r299, label %bb2, label %bb4

bb4:
  %r305 = icmp sgt i32 %r293, 57
  br i1 %r305, label %bb8, label %bb9

bb8:
  %r307 = add i32 1, 0
  br label %bb10

bb9:
  %r306 = add i32 0, 0
  br label %bb10

bb10:
  %r308 = phi i32 [ %r307, %bb8 ], [ %r306, %bb9 ]
  %r309 = icmp ne i32 %r308, 0
  br i1 %r309, label %bb2, label %bb3

bb2:
  %r300 = icmp eq i32 %r293, 45
  br i1 %r300, label %bb11, label %bb12

bb11:
  %r301 = add i32 1, 0
  br label %bb13

bb12:
  br label %bb13

bb13:
  %r302 = phi i32 [ %r301, %bb11 ], [ %r294, %bb12 ]
  %r303 = call i32 @getch()
  %r304 = add i32 %r303, 0
  br label %bb1

bb3:
  br label %bb14

bb14:
  %r310 = phi i32 [ %r293, %bb3 ], [ %r326, %bb15 ]
  %r311 = phi i32 [ %r290, %bb3 ], [ %r324, %bb15 ]
  %r312 = icmp sge i32 %r310, 48
  br i1 %r312, label %bb18, label %bb19

bb18:
  %r314 = add i32 1, 0
  br label %bb20

bb19:
  %r313 = add i32 0, 0
  br label %bb20

bb20:
  %r315 = phi i32 [ %r314, %bb18 ], [ %r313, %bb19 ]
  %r316 = icmp ne i32 %r315, 0
  br i1 %r316, label %bb17, label %bb16

bb17:
  %r317 = icmp sle i32 %r310, 57
  br i1 %r317, label %bb21, label %bb22

bb21:
  %r318 = add i32 1, 0
  br label %bb23

bb22:
  %r327 = add i32 0, 0
  br label %bb23

bb23:
  %r319 = phi i32 [ %r318, %bb21 ], [ %r327, %bb22 ]
  %r320 = icmp ne i32 %r319, 0
  br i1 %r320, label %bb15, label %bb16

bb15:
  %r321 = mul i32 %r311, 10
  %r322 = add i32 %r321, %r310
  %r323 = sub i32 %r322, 48
  %r324 = add i32 %r323, 0
  %r325 = call i32 @getch()
  %r326 = add i32 %r325, 0
  br label %bb14

bb16:
  %r328 = icmp ne i32 %r294, 0
  br i1 %r328, label %bb24, label %bb25

bb24:
  %r329 = sub i32 0, %r311
  ret i32 %r329
bb25:
  ret i32 %r311
}

define void @addedge( i32 %r140, i32 %r142 ) {
addedge:
  %r332 = add i32 0, 0
  %r333 = add i32 %r140, 0
  %r334 = add i32 0, 0
  %r335 = add i32 %r142, 0
  %r336 = load i32, i32* @cnt
  %r144 = getelementptr [5005 x i32 ], [5005 x i32 ]* @to, i32 0, i32 %r336
  store i32 %r335, i32* %r144
  %r337 = load i32, i32* @cnt
  %r147 = getelementptr [5005 x i32 ], [5005 x i32 ]* @next, i32 0, i32 %r337
  %r149 = getelementptr [1005 x i32 ], [1005 x i32 ]* @head, i32 0, i32 %r333
  %r338 = load i32, i32* %r149
  store i32 %r338, i32* %r147
  %r152 = getelementptr [1005 x i32 ], [1005 x i32 ]* @head, i32 0, i32 %r333
  %r339 = load i32, i32* @cnt
  store i32 %r339, i32* %r152
  %r340 = load i32, i32* @cnt
  %r341 = add i32 %r340, 1
  store i32 %r341, i32* @cnt
  %r342 = load i32, i32* @cnt
  %r157 = getelementptr [5005 x i32 ], [5005 x i32 ]* @to, i32 0, i32 %r342
  store i32 %r333, i32* %r157
  %r343 = load i32, i32* @cnt
  %r160 = getelementptr [5005 x i32 ], [5005 x i32 ]* @next, i32 0, i32 %r343
  %r162 = getelementptr [1005 x i32 ], [1005 x i32 ]* @head, i32 0, i32 %r335
  %r344 = load i32, i32* %r162
  store i32 %r344, i32* %r160
  %r165 = getelementptr [1005 x i32 ], [1005 x i32 ]* @head, i32 0, i32 %r335
  %r345 = load i32, i32* @cnt
  store i32 %r345, i32* %r165
  %r346 = load i32, i32* @cnt
  %r347 = add i32 %r346, 1
  store i32 %r347, i32* @cnt
  ret void
}

define void @init( ) {
init:
  %r349 = add i32 0, 0
  %r350 = add i32 0, 0
  br label %bb27

bb27:
  %r351 = phi i32 [ %r350, %init ], [ %r354, %bb28 ]
  %r352 = icmp slt i32 %r351, 1005
  br i1 %r352, label %bb28, label %bb29

bb28:
  %r173 = getelementptr [1005 x i32 ], [1005 x i32 ]* @head, i32 0, i32 %r351
  store i32 -1, i32* %r173
  %r353 = add i32 %r351, 1
  %r354 = add i32 %r353, 0
  br label %bb27

bb29:
  ret void
}

define void @inqueue( i32 %r177 ) {
inqueue:
  %r356 = add i32 0, 0
  %r357 = add i32 %r177, 0
  %r179 = getelementptr [1005 x i32 ], [1005 x i32 ]* @inq, i32 0, i32 %r357
  store i32 1, i32* %r179
  %r358 = load i32, i32* @tail
  %r359 = add i32 %r358, 1
  store i32 %r359, i32* @tail
  %r360 = load i32, i32* @tail
  %r183 = getelementptr [1005 x i32 ], [1005 x i32 ]* @que, i32 0, i32 %r360
  store i32 %r357, i32* %r183
  ret void
}

define i32 @popqueue( ) {
popqueue:
  %r362 = load i32, i32* @h
  %r363 = add i32 %r362, 1
  store i32 %r363, i32* @h
  %r364 = load i32, i32* @h
  %r188 = getelementptr [1005 x i32 ], [1005 x i32 ]* @que, i32 0, i32 %r364
  %r365 = load i32, i32* %r188
  %r366 = add i32 0, 0
  %r367 = add i32 %r365, 0
  %r368 = load i32, i32* @h
  %r192 = getelementptr [1005 x i32 ], [1005 x i32 ]* @que, i32 0, i32 %r368
  %r369 = load i32, i32* %r192
  ret i32 %r369
}

define i32 @same( i32 %r195, i32 %r197 ) {
same:
  %r376 = add i32 0, 0
  %r377 = add i32 %r195, 0
  %r378 = add i32 0, 0
  %r379 = add i32 %r197, 0
  store i32 0, i32* @h
  store i32 0, i32* @tail
  call void @inqueue(i32 %r377)
  %r380 = add i32 0, 0
  %r381 = add i32 0, 0
  %r382 = add i32 0, 0
  %r383 = add i32 0, 0
  %r384 = add i32 0, 0
  %r385 = add i32 0, 0
  %r386 = add i32 0, 0
  %r387 = add i32 0, 0
  br label %bb30

bb30:
  %r388 = phi i32 [ %r381, %same ], [ %r403, %bb38 ]
  %r389 = load i32, i32* @h
  %r390 = load i32, i32* @tail
  %r391 = icmp slt i32 %r389, %r390
  br i1 %r391, label %bb31, label %bb32

bb31:
  %r400 = call i32 @popqueue()
  %r401 = add i32 %r400, 0
  %r402 = icmp eq i32 %r401, %r379
  br i1 %r402, label %bb33, label %bb34

bb33:
  %r415 = add i32 1, 0
  br label %bb35

bb34:
  br label %bb35

bb35:
  %r403 = phi i32 [ %r415, %bb33 ], [ %r388, %bb34 ]
  %r212 = getelementptr [1005 x i32 ], [1005 x i32 ]* @head, i32 0, i32 %r401
  %r404 = load i32, i32* %r212
  %r405 = add i32 %r404, 0
  br label %bb36

bb36:
  %r406 = phi i32 [ %r405, %bb35 ], [ %r414, %bb41 ]
  %r407 = icmp ne i32 %r406, -1
  br i1 %r407, label %bb37, label %bb38

bb37:
  %r217 = getelementptr [5005 x i32 ], [5005 x i32 ]* @to, i32 0, i32 %r406
  %r408 = load i32, i32* %r217
  %r409 = add i32 %r408, 0
  %r222 = getelementptr [1005 x i32 ], [1005 x i32 ]* @inq, i32 0, i32 %r409
  %r410 = load i32, i32* %r222
  %r411 = icmp eq i32 %r410, 0
  br i1 %r411, label %bb39, label %bb40

bb39:
  %r225 = getelementptr [5005 x i32 ], [5005 x i32 ]* @to, i32 0, i32 %r406
  %r412 = load i32, i32* %r225
  call void @inqueue(i32 %r412)
  br label %bb41

bb40:
  br label %bb41

bb41:
  %r228 = getelementptr [5005 x i32 ], [5005 x i32 ]* @next, i32 0, i32 %r406
  %r413 = load i32, i32* %r228
  %r414 = add i32 %r413, 0
  br label %bb36

bb38:
  br label %bb30

bb32:
  %r392 = add i32 0, 0
  br label %bb42

bb42:
  %r393 = phi i32 [ %r392, %bb32 ], [ %r399, %bb43 ]
  %r394 = load i32, i32* @tail
  %r395 = icmp sle i32 %r393, %r394
  br i1 %r395, label %bb43, label %bb44

bb43:
  %r234 = getelementptr [1005 x i32 ], [1005 x i32 ]* @que, i32 0, i32 %r393
  %r396 = load i32, i32* %r234
  %r397 = add i32 %r396, 0
  %r237 = getelementptr [1005 x i32 ], [1005 x i32 ]* @inq, i32 0, i32 %r397
  store i32 0, i32* %r237
  %r398 = add i32 %r393, 1
  %r399 = add i32 %r398, 0
  br label %bb42

bb44:
  ret i32 %r388
}

define i32 @main( ) {
main:
  %r421 = add i32 0, 0
  %r422 = add i32 0, 0
  %r423 = call i32 @quickread()
  store i32 %r423, i32* @n
  %r424 = call i32 @quickread()
  store i32 %r424, i32* @m
  call void @_sysy_starttime(i32 97)
  call void @init()
  %r425 = add i32 0, 0
  %r426 = add i32 0, 0
  %r427 = add i32 0, 0
  %r428 = add i32 0, 0
  %r429 = add i32 0, 0
  %r430 = add i32 0, 0
  br label %bb45

bb45:
  %r431 = load i32, i32* @m
  %r432 = icmp ne i32 %r431, 0
  br i1 %r432, label %bb46, label %bb47

bb46:
  %r433 = call i32 @getch()
  %r434 = add i32 %r433, 0
  br label %bb48

bb48:
  %r435 = phi i32 [ %r434, %bb46 ], [ %r456, %bb49 ]
  %r436 = icmp ne i32 %r435, 81
  br i1 %r436, label %bb52, label %bb53

bb52:
  %r458 = add i32 1, 0
  br label %bb54

bb53:
  %r459 = add i32 0, 0
  br label %bb54

bb54:
  %r437 = phi i32 [ %r458, %bb52 ], [ %r459, %bb53 ]
  %r438 = icmp ne i32 %r437, 0
  br i1 %r438, label %bb51, label %bb50

bb51:
  %r451 = icmp ne i32 %r435, 85
  br i1 %r451, label %bb55, label %bb56

bb55:
  %r452 = add i32 1, 0
  br label %bb57

bb56:
  %r457 = add i32 0, 0
  br label %bb57

bb57:
  %r453 = phi i32 [ %r452, %bb55 ], [ %r457, %bb56 ]
  %r454 = icmp ne i32 %r453, 0
  br i1 %r454, label %bb49, label %bb50

bb49:
  %r455 = call i32 @getch()
  %r456 = add i32 %r455, 0
  br label %bb48

bb50:
  %r439 = icmp eq i32 %r435, 81
  br i1 %r439, label %bb58, label %bb59

bb58:
  %r446 = call i32 @quickread()
  %r447 = add i32 %r446, 0
  %r448 = call i32 @quickread()
  %r449 = add i32 %r448, 0
  %r450 = call i32 @same(i32 %r447, i32 %r449)
  call void @putint(i32 %r450)
  call void @putch(i32 10)
  br label %bb60

bb59:
  %r442 = call i32 @quickread()
  %r443 = add i32 %r442, 0
  %r444 = call i32 @quickread()
  %r445 = add i32 %r444, 0
  call void @addedge(i32 %r443, i32 %r445)
  br label %bb60

bb60:
  %r440 = load i32, i32* @m
  %r441 = sub i32 %r440, 1
  store i32 %r441, i32* @m
  br label %bb45

bb47:
  call void @_sysy_stoptime(i32 117)
  ret i32 0
}

