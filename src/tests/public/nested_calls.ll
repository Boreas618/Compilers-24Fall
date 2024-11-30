declare i32 @getch( )
declare i32 @getint( )
declare void @putch( i32 )
declare void @putint( i32 )
declare void @putarray( i32, i32* )
declare void @_sysy_starttime( i32 )
declare void @_sysy_stoptime( i32 )
define i32 @func1( i32 %r100, i32 %r102, i32 %r104 ) {
func1:
  %r292 = add i32 0, 0
  %r293 = add i32 %r100, 0
  %r294 = add i32 0, 0
  %r295 = add i32 %r102, 0
  %r296 = add i32 0, 0
  %r297 = add i32 %r104, 0
  %r298 = icmp eq i32 %r297, 0
  br i1 %r298, label %bb1, label %bb2

bb1:
  %r299 = mul i32 %r293, %r295
  ret i32 %r299
bb2:
  %r300 = sub i32 %r295, %r297
  %r301 = call i32 @func1(i32 %r293, i32 %r300, i32 0)
  ret i32 %r301
}

define i32 @func2( i32 %r117, i32 %r119 ) {
func2:
  %r308 = add i32 0, 0
  %r309 = add i32 %r117, 0
  %r310 = add i32 0, 0
  %r311 = add i32 %r119, 0
  %r312 = icmp ne i32 %r311, 0
  br i1 %r312, label %bb4, label %bb5

bb4:
  %r313 = sdiv i32 %r309, %r311
  %r314 = mul i32 %r313, %r311
  %r315 = sub i32 %r309, %r314
  %r316 = call i32 @func2(i32 %r315, i32 0)
  ret i32 %r316
bb5:
  ret i32 %r309
}

define i32 @func3( i32 %r133, i32 %r135 ) {
func3:
  %r323 = add i32 0, 0
  %r324 = add i32 %r133, 0
  %r325 = add i32 0, 0
  %r326 = add i32 %r135, 0
  %r327 = icmp eq i32 %r326, 0
  br i1 %r327, label %bb7, label %bb8

bb7:
  %r328 = add i32 %r324, 1
  ret i32 %r328
bb8:
  %r329 = add i32 %r324, %r326
  %r330 = call i32 @func3(i32 %r329, i32 0)
  ret i32 %r330
}

define i32 @func4( i32 %r146, i32 %r148, i32 %r150 ) {
func4:
  %r340 = add i32 0, 0
  %r341 = add i32 %r146, 0
  %r342 = add i32 0, 0
  %r343 = add i32 %r148, 0
  %r344 = add i32 0, 0
  %r345 = add i32 %r150, 0
  %r346 = icmp ne i32 %r341, 0
  br i1 %r346, label %bb10, label %bb11

bb10:
  ret i32 %r343
bb11:
  ret i32 %r345
}

define i32 @func5( i32 %r157 ) {
func5:
  %r350 = add i32 0, 0
  %r351 = add i32 %r157, 0
  %r352 = sub i32 0, %r351
  ret i32 %r352
}

define i32 @func6( i32 %r161, i32 %r163 ) {
func6:
  %r365 = add i32 0, 0
  %r366 = add i32 0, 0
  %r367 = add i32 %r161, 0
  %r368 = add i32 0, 0
  %r369 = add i32 %r163, 0
  %r370 = add i32 0, 0
  %r371 = icmp ne i32 %r367, 0
  br i1 %r371, label %bb17, label %bb18

bb17:
  %r372 = add i32 1, 0
  br label %bb19

bb18:
  %r373 = add i32 0, 0
  br label %bb19

bb19:
  %r374 = phi i32 [ %r372, %bb17 ], [ %r373, %bb18 ]
  %r375 = icmp ne i32 %r374, 0
  br i1 %r375, label %bb16, label %bb14

bb16:
  %r376 = icmp ne i32 %r369, 0
  br i1 %r376, label %bb20, label %bb21

bb20:
  %r380 = add i32 1, 0
  br label %bb22

bb21:
  %r377 = add i32 0, 0
  br label %bb22

bb22:
  %r378 = phi i32 [ %r380, %bb20 ], [ %r377, %bb21 ]
  %r379 = icmp ne i32 %r378, 0
  br i1 %r379, label %bb13, label %bb14

bb13:
  ret i32 1
bb14:
  ret i32 0
}

define i32 @func7( i32 %r176 ) {
func7:
  %r384 = add i32 0, 0
  %r385 = add i32 %r176, 0
  %r386 = icmp ne i32 %r385, 0
  br i1 %r386, label %bb24, label %bb23

bb23:
  ret i32 1
bb24:
  ret i32 0
}

define i32 @main( ) {
main:
  %r405 = add i32 0, 0
  call void @_sysy_starttime(i32 97)
  %r406 = call i32 @getint()
  %r407 = add i32 0, 0
  %r408 = add i32 %r406, 0
  %r409 = call i32 @getint()
  %r410 = add i32 0, 0
  %r411 = add i32 %r409, 0
  %r412 = call i32 @getint()
  %r413 = add i32 0, 0
  %r414 = add i32 %r412, 0
  %r415 = call i32 @getint()
  %r416 = add i32 0, 0
  %r417 = add i32 %r415, 0
  %r189 = alloca [ 10 x i32 ]
  %r418 = add i32 0, 0
  %r419 = add i32 0, 0
  br label %bb26

bb26:
  %r420 = phi i32 [ %r419, %main ], [ %r424, %bb27 ]
  %r421 = icmp slt i32 %r420, 10
  br i1 %r421, label %bb27, label %bb28

bb27:
  %r193 = getelementptr [10 x i32 ], [10 x i32 ]* %r189, i32 0, i32 %r420
  %r422 = call i32 @getint()
  store i32 %r422, i32* %r193
  %r423 = add i32 %r420, 1
  %r424 = add i32 %r423, 0
  br label %bb26

bb28:
  %r425 = call i32 @func7(i32 %r408)
  %r426 = call i32 @func5(i32 %r411)
  %r427 = call i32 @func6(i32 %r425, i32 %r426)
  %r428 = call i32 @func2(i32 %r427, i32 %r414)
  %r429 = call i32 @func3(i32 %r428, i32 %r417)
  %r430 = call i32 @func5(i32 %r429)
  %r213 = getelementptr [10 x i32 ], [10 x i32 ]* %r189, i32 0, i32 0
  %r431 = load i32, i32* %r213
  %r220 = getelementptr [10 x i32 ], [10 x i32 ]* %r189, i32 0, i32 1
  %r432 = load i32, i32* %r220
  %r433 = call i32 @func5(i32 %r432)
  %r223 = getelementptr [10 x i32 ], [10 x i32 ]* %r189, i32 0, i32 2
  %r434 = load i32, i32* %r223
  %r226 = getelementptr [10 x i32 ], [10 x i32 ]* %r189, i32 0, i32 3
  %r435 = load i32, i32* %r226
  %r436 = call i32 @func7(i32 %r435)
  %r437 = call i32 @func6(i32 %r434, i32 %r436)
  %r229 = getelementptr [10 x i32 ], [10 x i32 ]* %r189, i32 0, i32 4
  %r438 = load i32, i32* %r229
  %r232 = getelementptr [10 x i32 ], [10 x i32 ]* %r189, i32 0, i32 5
  %r439 = load i32, i32* %r232
  %r440 = call i32 @func7(i32 %r439)
  %r441 = call i32 @func2(i32 %r438, i32 %r440)
  %r442 = call i32 @func4(i32 %r433, i32 %r437, i32 %r441)
  %r234 = getelementptr [10 x i32 ], [10 x i32 ]* %r189, i32 0, i32 6
  %r443 = load i32, i32* %r234
  %r444 = call i32 @func3(i32 %r442, i32 %r443)
  %r236 = getelementptr [10 x i32 ], [10 x i32 ]* %r189, i32 0, i32 7
  %r445 = load i32, i32* %r236
  %r446 = call i32 @func2(i32 %r444, i32 %r445)
  %r239 = getelementptr [10 x i32 ], [10 x i32 ]* %r189, i32 0, i32 8
  %r447 = load i32, i32* %r239
  %r242 = getelementptr [10 x i32 ], [10 x i32 ]* %r189, i32 0, i32 9
  %r448 = load i32, i32* %r242
  %r449 = call i32 @func7(i32 %r448)
  %r450 = call i32 @func3(i32 %r447, i32 %r449)
  %r451 = call i32 @func1(i32 %r446, i32 %r450, i32 %r408)
  %r452 = call i32 @func4(i32 %r430, i32 %r431, i32 %r451)
  %r453 = call i32 @func7(i32 %r414)
  %r454 = call i32 @func3(i32 %r453, i32 %r417)
  %r455 = call i32 @func2(i32 %r411, i32 %r454)
  %r456 = call i32 @func3(i32 %r452, i32 %r455)
  %r251 = getelementptr [10 x i32 ], [10 x i32 ]* %r189, i32 0, i32 0
  %r457 = load i32, i32* %r251
  %r253 = getelementptr [10 x i32 ], [10 x i32 ]* %r189, i32 0, i32 1
  %r458 = load i32, i32* %r253
  %r459 = call i32 @func1(i32 %r456, i32 %r457, i32 %r458)
  %r255 = getelementptr [10 x i32 ], [10 x i32 ]* %r189, i32 0, i32 2
  %r460 = load i32, i32* %r255
  %r461 = call i32 @func2(i32 %r459, i32 %r460)
  %r257 = getelementptr [10 x i32 ], [10 x i32 ]* %r189, i32 0, i32 3
  %r462 = load i32, i32* %r257
  %r264 = getelementptr [10 x i32 ], [10 x i32 ]* %r189, i32 0, i32 4
  %r463 = load i32, i32* %r264
  %r267 = getelementptr [10 x i32 ], [10 x i32 ]* %r189, i32 0, i32 5
  %r464 = load i32, i32* %r267
  %r465 = call i32 @func5(i32 %r464)
  %r466 = call i32 @func3(i32 %r463, i32 %r465)
  %r270 = getelementptr [10 x i32 ], [10 x i32 ]* %r189, i32 0, i32 6
  %r467 = load i32, i32* %r270
  %r468 = call i32 @func5(i32 %r467)
  %r469 = call i32 @func2(i32 %r466, i32 %r468)
  %r272 = getelementptr [10 x i32 ], [10 x i32 ]* %r189, i32 0, i32 7
  %r470 = load i32, i32* %r272
  %r275 = getelementptr [10 x i32 ], [10 x i32 ]* %r189, i32 0, i32 8
  %r471 = load i32, i32* %r275
  %r472 = call i32 @func7(i32 %r471)
  %r473 = call i32 @func1(i32 %r469, i32 %r470, i32 %r472)
  %r278 = getelementptr [10 x i32 ], [10 x i32 ]* %r189, i32 0, i32 9
  %r474 = load i32, i32* %r278
  %r475 = call i32 @func5(i32 %r474)
  %r476 = call i32 @func2(i32 %r473, i32 %r475)
  %r477 = call i32 @func3(i32 %r476, i32 %r408)
  %r478 = call i32 @func1(i32 %r461, i32 %r462, i32 %r477)
  %r479 = add i32 %r478, 0
  call void @_sysy_stoptime(i32 117)
  ret i32 %r479
}

