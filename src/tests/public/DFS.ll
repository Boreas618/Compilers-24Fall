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
  %r263 = add i32 0, 0
  %r264 = add i32 0, 0
  %r265 = add i32 0, 0
  %r266 = add i32 0, 0
  %r267 = call i32 @getch()
  %r268 = add i32 0, 0
  %r269 = add i32 %r267, 0
  %r270 = add i32 0, 0
  %r271 = add i32 0, 0
  %r272 = add i32 0, 0
  %r273 = add i32 0, 0
  br label %bb1

bb1:
  %r274 = phi i32 [ %r269, %quickread ], [ %r285, %bb13 ]
  %r275 = phi i32 [ %r273, %quickread ], [ %r283, %bb13 ]
  %r276 = icmp slt i32 %r274, 48
  br i1 %r276, label %bb5, label %bb6

bb5:
  %r278 = add i32 1, 0
  br label %bb7

bb6:
  %r277 = add i32 0, 0
  br label %bb7

bb7:
  %r279 = phi i32 [ %r278, %bb5 ], [ %r277, %bb6 ]
  %r280 = icmp ne i32 %r279, 0
  br i1 %r280, label %bb2, label %bb4

bb4:
  %r286 = icmp sgt i32 %r274, 57
  br i1 %r286, label %bb8, label %bb9

bb8:
  %r310 = add i32 1, 0
  br label %bb10

bb9:
  %r309 = add i32 0, 0
  br label %bb10

bb10:
  %r287 = phi i32 [ %r310, %bb8 ], [ %r309, %bb9 ]
  %r288 = icmp ne i32 %r287, 0
  br i1 %r288, label %bb2, label %bb3

bb2:
  %r281 = icmp eq i32 %r274, 45
  br i1 %r281, label %bb11, label %bb12

bb11:
  %r282 = add i32 1, 0
  br label %bb13

bb12:
  br label %bb13

bb13:
  %r283 = phi i32 [ %r282, %bb11 ], [ %r275, %bb12 ]
  %r284 = call i32 @getch()
  %r285 = add i32 %r284, 0
  br label %bb1

bb3:
  br label %bb14

bb14:
  %r289 = phi i32 [ %r274, %bb3 ], [ %r304, %bb15 ]
  %r290 = phi i32 [ %r271, %bb3 ], [ %r302, %bb15 ]
  %r291 = icmp sge i32 %r289, 48
  br i1 %r291, label %bb18, label %bb19

bb18:
  %r307 = add i32 1, 0
  br label %bb20

bb19:
  %r308 = add i32 0, 0
  br label %bb20

bb20:
  %r292 = phi i32 [ %r307, %bb18 ], [ %r308, %bb19 ]
  %r293 = icmp ne i32 %r292, 0
  br i1 %r293, label %bb17, label %bb16

bb17:
  %r296 = icmp sle i32 %r289, 57
  br i1 %r296, label %bb21, label %bb22

bb21:
  %r306 = add i32 1, 0
  br label %bb23

bb22:
  %r305 = add i32 0, 0
  br label %bb23

bb23:
  %r297 = phi i32 [ %r306, %bb21 ], [ %r305, %bb22 ]
  %r298 = icmp ne i32 %r297, 0
  br i1 %r298, label %bb15, label %bb16

bb15:
  %r299 = mul i32 %r290, 10
  %r300 = add i32 %r299, %r289
  %r301 = sub i32 %r300, 48
  %r302 = add i32 %r301, 0
  %r303 = call i32 @getch()
  %r304 = add i32 %r303, 0
  br label %bb14

bb16:
  %r294 = icmp ne i32 %r275, 0
  br i1 %r294, label %bb24, label %bb25

bb24:
  %r295 = sub i32 0, %r290
  ret i32 %r295
bb25:
  ret i32 %r290
}

define void @addedge( i32 %r140, i32 %r142 ) {
addedge:
  %r313 = add i32 0, 0
  %r314 = add i32 %r140, 0
  %r315 = add i32 0, 0
  %r316 = add i32 %r142, 0
  %r317 = load i32, i32* @cnt
  %r144 = getelementptr [5005 x i32 ], [5005 x i32 ]* @to, i32 0, i32 %r317
  store i32 %r316, i32* %r144
  %r318 = load i32, i32* @cnt
  %r147 = getelementptr [5005 x i32 ], [5005 x i32 ]* @next, i32 0, i32 %r318
  %r149 = getelementptr [1005 x i32 ], [1005 x i32 ]* @head, i32 0, i32 %r314
  %r319 = load i32, i32* %r149
  store i32 %r319, i32* %r147
  %r152 = getelementptr [1005 x i32 ], [1005 x i32 ]* @head, i32 0, i32 %r314
  %r320 = load i32, i32* @cnt
  store i32 %r320, i32* %r152
  %r321 = load i32, i32* @cnt
  %r322 = add i32 %r321, 1
  store i32 %r322, i32* @cnt
  %r323 = load i32, i32* @cnt
  %r157 = getelementptr [5005 x i32 ], [5005 x i32 ]* @to, i32 0, i32 %r323
  store i32 %r314, i32* %r157
  %r324 = load i32, i32* @cnt
  %r160 = getelementptr [5005 x i32 ], [5005 x i32 ]* @next, i32 0, i32 %r324
  %r162 = getelementptr [1005 x i32 ], [1005 x i32 ]* @head, i32 0, i32 %r316
  %r325 = load i32, i32* %r162
  store i32 %r325, i32* %r160
  %r165 = getelementptr [1005 x i32 ], [1005 x i32 ]* @head, i32 0, i32 %r316
  %r326 = load i32, i32* @cnt
  store i32 %r326, i32* %r165
  %r327 = load i32, i32* @cnt
  %r328 = add i32 %r327, 1
  store i32 %r328, i32* @cnt
  ret void
}

define void @init( ) {
init:
  %r330 = add i32 0, 0
  %r331 = add i32 0, 0
  br label %bb27

bb27:
  %r332 = phi i32 [ %r331, %init ], [ %r335, %bb28 ]
  %r333 = icmp slt i32 %r332, 1005
  br i1 %r333, label %bb28, label %bb29

bb28:
  %r173 = getelementptr [1005 x i32 ], [1005 x i32 ]* @head, i32 0, i32 %r332
  store i32 -1, i32* %r173
  %r334 = add i32 %r332, 1
  %r335 = add i32 %r334, 0
  br label %bb27

bb29:
  ret void
}

define void @clear( ) {
clear:
  %r337 = add i32 0, 0
  %r338 = add i32 1, 0
  br label %bb30

bb30:
  %r339 = phi i32 [ %r338, %clear ], [ %r343, %bb31 ]
  %r340 = load i32, i32* @n
  %r341 = icmp sle i32 %r339, %r340
  br i1 %r341, label %bb31, label %bb32

bb31:
  %r181 = getelementptr [1005 x i32 ], [1005 x i32 ]* @vis, i32 0, i32 %r339
  store i32 0, i32* %r181
  %r342 = add i32 %r339, 1
  %r343 = add i32 %r342, 0
  br label %bb30

bb32:
  ret void
}

define i32 @same( i32 %r185, i32 %r187 ) {
same:
  %r350 = add i32 0, 0
  %r351 = add i32 0, 0
  %r352 = add i32 0, 0
  %r353 = add i32 0, 0
  %r354 = add i32 0, 0
  %r355 = add i32 %r185, 0
  %r356 = add i32 0, 0
  %r357 = add i32 %r187, 0
  %r189 = getelementptr [1005 x i32 ], [1005 x i32 ]* @vis, i32 0, i32 %r355
  store i32 1, i32* %r189
  %r358 = icmp eq i32 %r355, %r357
  br i1 %r358, label %bb33, label %bb34

bb33:
  ret i32 1
bb34:
  br label %bb35

bb35:
  %r195 = getelementptr [1005 x i32 ], [1005 x i32 ]* @head, i32 0, i32 %r355
  %r359 = load i32, i32* %r195
  %r360 = add i32 %r359, 0
  br label %bb36

bb36:
  %r361 = phi i32 [ %r360, %bb35 ], [ %r371, %bb41 ]
  %r362 = icmp ne i32 %r361, -1
  br i1 %r362, label %bb37, label %bb38

bb37:
  %r201 = getelementptr [5005 x i32 ], [5005 x i32 ]* @to, i32 0, i32 %r361
  %r363 = load i32, i32* %r201
  %r364 = add i32 %r363, 0
  %r208 = getelementptr [1005 x i32 ], [1005 x i32 ]* @vis, i32 0, i32 %r364
  %r365 = load i32, i32* %r208
  %r366 = icmp eq i32 %r365, 0
  br i1 %r366, label %bb43, label %bb44

bb43:
  %r378 = add i32 1, 0
  br label %bb45

bb44:
  %r367 = add i32 0, 0
  br label %bb45

bb45:
  %r368 = phi i32 [ %r378, %bb43 ], [ %r367, %bb44 ]
  %r369 = icmp ne i32 %r368, 0
  br i1 %r369, label %bb42, label %bb40

bb42:
  %r372 = call i32 @same(i32 %r364, i32 %r357)
  %r373 = icmp ne i32 %r372, 0
  br i1 %r373, label %bb46, label %bb47

bb46:
  %r374 = add i32 1, 0
  br label %bb48

bb47:
  %r377 = add i32 0, 0
  br label %bb48

bb48:
  %r375 = phi i32 [ %r374, %bb46 ], [ %r377, %bb47 ]
  %r376 = icmp ne i32 %r375, 0
  br i1 %r376, label %bb39, label %bb40

bb39:
  ret i32 1
bb40:
  br label %bb41

bb41:
  %r220 = getelementptr [5005 x i32 ], [5005 x i32 ]* @next, i32 0, i32 %r361
  %r370 = load i32, i32* %r220
  %r371 = add i32 %r370, 0
  br label %bb36

bb38:
  ret i32 0
}

define i32 @main( ) {
main:
  %r384 = add i32 0, 0
  %r385 = add i32 0, 0
  call void @_sysy_starttime(i32 74)
  %r386 = call i32 @quickread()
  store i32 %r386, i32* @n
  %r387 = call i32 @quickread()
  store i32 %r387, i32* @m
  call void @init()
  %r388 = add i32 0, 0
  %r389 = add i32 0, 0
  %r390 = add i32 0, 0
  %r391 = add i32 0, 0
  %r392 = add i32 0, 0
  %r393 = add i32 0, 0
  br label %bb49

bb49:
  %r394 = load i32, i32* @m
  %r395 = icmp ne i32 %r394, 0
  br i1 %r395, label %bb50, label %bb51

bb50:
  %r396 = call i32 @getch()
  %r397 = add i32 %r396, 0
  br label %bb52

bb52:
  %r398 = phi i32 [ %r397, %bb50 ], [ %r419, %bb53 ]
  %r399 = icmp ne i32 %r398, 81
  br i1 %r399, label %bb56, label %bb57

bb56:
  %r421 = add i32 1, 0
  br label %bb58

bb57:
  %r422 = add i32 0, 0
  br label %bb58

bb58:
  %r400 = phi i32 [ %r421, %bb56 ], [ %r422, %bb57 ]
  %r401 = icmp ne i32 %r400, 0
  br i1 %r401, label %bb55, label %bb54

bb55:
  %r414 = icmp ne i32 %r398, 85
  br i1 %r414, label %bb59, label %bb60

bb59:
  %r420 = add i32 1, 0
  br label %bb61

bb60:
  %r415 = add i32 0, 0
  br label %bb61

bb61:
  %r416 = phi i32 [ %r420, %bb59 ], [ %r415, %bb60 ]
  %r417 = icmp ne i32 %r416, 0
  br i1 %r417, label %bb53, label %bb54

bb53:
  %r418 = call i32 @getch()
  %r419 = add i32 %r418, 0
  br label %bb52

bb54:
  %r402 = icmp eq i32 %r398, 81
  br i1 %r402, label %bb62, label %bb63

bb62:
  %r405 = call i32 @quickread()
  %r406 = add i32 %r405, 0
  %r407 = call i32 @quickread()
  %r408 = add i32 %r407, 0
  call void @clear()
  %r409 = call i32 @same(i32 %r406, i32 %r408)
  call void @putint(i32 %r409)
  call void @putch(i32 10)
  br label %bb64

bb63:
  %r410 = call i32 @quickread()
  %r411 = add i32 %r410, 0
  %r412 = call i32 @quickread()
  %r413 = add i32 %r412, 0
  call void @addedge(i32 %r411, i32 %r413)
  br label %bb64

bb64:
  %r403 = load i32, i32* @m
  %r404 = sub i32 %r403, 1
  store i32 %r404, i32* @m
  br label %bb49

bb51:
  call void @_sysy_stoptime(i32 96)
  ret i32 0
}

