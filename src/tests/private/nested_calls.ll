declare i32 @getch( )
declare i32 @getint( )
declare void @putch( i32 )
declare void @putint( i32 )
declare void @putarray( i32, i32* )
declare void @_sysy_starttime( i32 )
declare void @_sysy_stoptime( i32 )
define i32 @func1( i32 %r100, i32 %r102, i32 %r104 ) {
func1:
  %r286 = add i32 0, 0
  %r287 = add i32 %r100, 0
  %r288 = add i32 0, 0
  %r289 = add i32 %r102, 0
  %r290 = add i32 0, 0
  %r291 = add i32 %r104, 0
  %r292 = icmp eq i32 %r291, 0
  br i1 %r292, label %bb1, label %bb2

bb1:
  %r293 = mul i32 %r287, %r289
  ret i32 %r293
bb2:
  %r294 = sub i32 %r289, %r291
  %r295 = call i32 @func1(i32 %r287, i32 %r294, i32 0)
  ret i32 %r295
}

define i32 @func2( i32 %r117, i32 %r119 ) {
func2:
  %r298 = add i32 0, 0
  %r299 = add i32 %r117, 0
  %r300 = add i32 0, 0
  %r301 = add i32 %r119, 0
  %r302 = icmp ne i32 %r301, 0
  br i1 %r302, label %bb4, label %bb5

bb4:
  %r303 = sdiv i32 %r299, %r301
  %r304 = mul i32 %r303, %r301
  %r305 = sub i32 %r299, %r304
  %r306 = call i32 @func2(i32 %r305, i32 0)
  ret i32 %r306
bb5:
  ret i32 %r299
}

define i32 @func3( i32 %r133, i32 %r135 ) {
func3:
  %r309 = add i32 0, 0
  %r310 = add i32 %r133, 0
  %r311 = add i32 0, 0
  %r312 = add i32 %r135, 0
  %r313 = icmp eq i32 %r312, 0
  br i1 %r313, label %bb7, label %bb8

bb7:
  %r314 = add i32 %r310, 1
  ret i32 %r314
bb8:
  %r315 = add i32 %r310, %r312
  %r316 = call i32 @func3(i32 %r315, i32 0)
  ret i32 %r316
}

define i32 @func4( i32 %r146, i32 %r148, i32 %r150 ) {
func4:
  %r320 = add i32 0, 0
  %r321 = add i32 %r146, 0
  %r322 = add i32 0, 0
  %r323 = add i32 %r148, 0
  %r324 = add i32 0, 0
  %r325 = add i32 %r150, 0
  %r326 = icmp ne i32 %r321, 0
  br i1 %r326, label %bb10, label %bb11

bb10:
  ret i32 %r323
bb11:
  ret i32 %r325
}

define i32 @func5( i32 %r157 ) {
func5:
  %r328 = add i32 0, 0
  %r329 = add i32 %r157, 0
  %r330 = sub i32 0, %r329
  ret i32 %r330
}

define i32 @func6( i32 %r161, i32 %r163 ) {
func6:
  %r335 = add i32 0, 0
  %r336 = add i32 0, 0
  %r337 = add i32 %r161, 0
  %r338 = add i32 0, 0
  %r339 = add i32 %r163, 0
  %r340 = add i32 0, 0
  %r341 = icmp ne i32 %r337, 0
  br i1 %r341, label %bb17, label %bb18

bb17:
  %r349 = add i32 1, 0
  br label %bb19

bb18:
  %r350 = add i32 0, 0
  br label %bb19

bb19:
  %r342 = phi i32 [ %r349, %bb17 ], [ %r350, %bb18 ]
  %r343 = icmp ne i32 %r342, 0
  br i1 %r343, label %bb16, label %bb14

bb16:
  %r344 = icmp ne i32 %r339, 0
  br i1 %r344, label %bb20, label %bb21

bb20:
  %r345 = add i32 1, 0
  br label %bb22

bb21:
  %r348 = add i32 0, 0
  br label %bb22

bb22:
  %r346 = phi i32 [ %r345, %bb20 ], [ %r348, %bb21 ]
  %r347 = icmp ne i32 %r346, 0
  br i1 %r347, label %bb13, label %bb14

bb13:
  ret i32 1
bb14:
  ret i32 0
}

define i32 @func7( i32 %r176 ) {
func7:
  %r352 = add i32 0, 0
  %r353 = add i32 %r176, 0
  %r354 = icmp ne i32 %r353, 0
  br i1 %r354, label %bb24, label %bb23

bb23:
  ret i32 1
bb24:
  ret i32 0
}

define i32 @main( ) {
main:
  %r361 = add i32 0, 0
  call void @_sysy_starttime(i32 97)
  %r362 = call i32 @getint()
  %r363 = add i32 0, 0
  %r364 = add i32 %r362, 0
  %r365 = call i32 @getint()
  %r366 = add i32 0, 0
  %r367 = add i32 %r365, 0
  %r368 = call i32 @getint()
  %r369 = add i32 0, 0
  %r370 = add i32 %r368, 0
  %r371 = call i32 @getint()
  %r372 = add i32 0, 0
  %r373 = add i32 %r371, 0
  %r189 = alloca [ 10 x i32 ]
  %r374 = add i32 0, 0
  %r375 = add i32 0, 0
  br label %bb26

bb26:
  %r376 = phi i32 [ %r375, %main ], [ %r435, %bb27 ]
  %r377 = icmp slt i32 %r376, 10
  br i1 %r377, label %bb27, label %bb28

bb27:
  %r193 = getelementptr [10 x i32 ], [10 x i32 ]* %r189, i32 0, i32 %r376
  %r433 = call i32 @getint()
  %r434 = add i32 %r376, 1
  %r435 = add i32 %r434, 0
  br label %bb26

bb28:
  %r378 = call i32 @func7(i32 %r364)
  %r379 = call i32 @func5(i32 %r367)
  %r380 = call i32 @func6(i32 %r378, i32 %r379)
  %r381 = call i32 @func2(i32 %r380, i32 %r370)
  %r382 = call i32 @func3(i32 %r381, i32 %r373)
  %r383 = call i32 @func5(i32 %r382)
  %r213 = getelementptr [10 x i32 ], [10 x i32 ]* %r189, i32 0, i32 0
  %r384 = load i32, i32* %r213
  %r220 = getelementptr [10 x i32 ], [10 x i32 ]* %r189, i32 0, i32 1
  %r385 = load i32, i32* %r220
  %r386 = call i32 @func5(i32 %r385)
  %r223 = getelementptr [10 x i32 ], [10 x i32 ]* %r189, i32 0, i32 2
  %r387 = load i32, i32* %r223
  %r226 = getelementptr [10 x i32 ], [10 x i32 ]* %r189, i32 0, i32 3
  %r388 = load i32, i32* %r226
  %r389 = call i32 @func7(i32 %r388)
  %r390 = call i32 @func6(i32 %r387, i32 %r389)
  %r229 = getelementptr [10 x i32 ], [10 x i32 ]* %r189, i32 0, i32 4
  %r391 = load i32, i32* %r229
  %r232 = getelementptr [10 x i32 ], [10 x i32 ]* %r189, i32 0, i32 5
  %r392 = load i32, i32* %r232
  %r393 = call i32 @func7(i32 %r392)
  %r394 = call i32 @func2(i32 %r391, i32 %r393)
  %r395 = call i32 @func4(i32 %r386, i32 %r390, i32 %r394)
  %r234 = getelementptr [10 x i32 ], [10 x i32 ]* %r189, i32 0, i32 6
  %r396 = load i32, i32* %r234
  %r397 = call i32 @func3(i32 %r395, i32 %r396)
  %r236 = getelementptr [10 x i32 ], [10 x i32 ]* %r189, i32 0, i32 7
  %r398 = load i32, i32* %r236
  %r399 = call i32 @func2(i32 %r397, i32 %r398)
  %r239 = getelementptr [10 x i32 ], [10 x i32 ]* %r189, i32 0, i32 8
  %r400 = load i32, i32* %r239
  %r242 = getelementptr [10 x i32 ], [10 x i32 ]* %r189, i32 0, i32 9
  %r401 = load i32, i32* %r242
  %r402 = call i32 @func7(i32 %r401)
  %r403 = call i32 @func3(i32 %r400, i32 %r402)
  %r404 = call i32 @func1(i32 %r399, i32 %r403, i32 %r364)
  %r405 = call i32 @func4(i32 %r383, i32 %r384, i32 %r404)
  %r406 = call i32 @func7(i32 %r370)
  %r407 = call i32 @func3(i32 %r406, i32 %r373)
  %r408 = call i32 @func2(i32 %r367, i32 %r407)
  %r409 = call i32 @func3(i32 %r405, i32 %r408)
  %r251 = getelementptr [10 x i32 ], [10 x i32 ]* %r189, i32 0, i32 0
  %r410 = load i32, i32* %r251
  %r253 = getelementptr [10 x i32 ], [10 x i32 ]* %r189, i32 0, i32 1
  %r411 = load i32, i32* %r253
  %r412 = call i32 @func1(i32 %r409, i32 %r410, i32 %r411)
  %r255 = getelementptr [10 x i32 ], [10 x i32 ]* %r189, i32 0, i32 2
  %r413 = load i32, i32* %r255
  %r414 = call i32 @func2(i32 %r412, i32 %r413)
  %r257 = getelementptr [10 x i32 ], [10 x i32 ]* %r189, i32 0, i32 3
  %r415 = load i32, i32* %r257
  %r264 = getelementptr [10 x i32 ], [10 x i32 ]* %r189, i32 0, i32 4
  %r416 = load i32, i32* %r264
  %r267 = getelementptr [10 x i32 ], [10 x i32 ]* %r189, i32 0, i32 5
  %r417 = load i32, i32* %r267
  %r418 = call i32 @func5(i32 %r417)
  %r419 = call i32 @func3(i32 %r416, i32 %r418)
  %r270 = getelementptr [10 x i32 ], [10 x i32 ]* %r189, i32 0, i32 6
  %r420 = load i32, i32* %r270
  %r421 = call i32 @func5(i32 %r420)
  %r422 = call i32 @func2(i32 %r419, i32 %r421)
  %r272 = getelementptr [10 x i32 ], [10 x i32 ]* %r189, i32 0, i32 7
  %r423 = load i32, i32* %r272
  %r275 = getelementptr [10 x i32 ], [10 x i32 ]* %r189, i32 0, i32 8
  %r424 = load i32, i32* %r275
  %r425 = call i32 @func7(i32 %r424)
  %r426 = call i32 @func1(i32 %r422, i32 %r423, i32 %r425)
  %r278 = getelementptr [10 x i32 ], [10 x i32 ]* %r189, i32 0, i32 9
  %r427 = load i32, i32* %r278
  %r428 = call i32 @func5(i32 %r427)
  %r429 = call i32 @func2(i32 %r426, i32 %r428)
  %r430 = call i32 @func3(i32 %r429, i32 %r364)
  %r431 = call i32 @func1(i32 %r414, i32 %r415, i32 %r430)
  %r432 = add i32 %r431, 0
  call void @_sysy_stoptime(i32 117)
  ret i32 %r432
}

