declare i32 @getch( )
declare i32 @getint( )
declare void @putch( i32 )
declare void @putint( i32 )
declare void @putarray( i32, i32* )
declare void @_sysy_starttime( i32 )
declare void @_sysy_stoptime( i32 )
@M = global i32 0
@L = global i32 0
@N = global i32 0
define i32 @mul( i32* %r100, i32* %r101, i32* %r102, i32* %r103, i32* %r104, i32* %r105, i32* %r106, i32* %r107, i32* %r108 ) {
mul:
  %r338 = add i32 0, 0
  %r339 = add i32 0, 0
  %r110 = getelementptr i32, i32* %r106, i32 0
  %r111 = getelementptr i32, i32* %r100, i32 0
  %r340 = load i32, i32* %r111
  %r113 = getelementptr i32, i32* %r103, i32 0
  %r341 = load i32, i32* %r113
  %r342 = mul i32 %r340, %r341
  %r116 = getelementptr i32, i32* %r100, i32 1
  %r343 = load i32, i32* %r116
  %r118 = getelementptr i32, i32* %r104, i32 0
  %r344 = load i32, i32* %r118
  %r345 = mul i32 %r343, %r344
  %r346 = add i32 %r342, %r345
  %r122 = getelementptr i32, i32* %r100, i32 2
  %r347 = load i32, i32* %r122
  %r124 = getelementptr i32, i32* %r105, i32 0
  %r348 = load i32, i32* %r124
  %r349 = mul i32 %r347, %r348
  %r350 = add i32 %r346, %r349
  %r128 = getelementptr i32, i32* %r106, i32 1
  %r129 = getelementptr i32, i32* %r100, i32 0
  %r351 = load i32, i32* %r129
  %r131 = getelementptr i32, i32* %r103, i32 1
  %r352 = load i32, i32* %r131
  %r353 = mul i32 %r351, %r352
  %r134 = getelementptr i32, i32* %r100, i32 1
  %r354 = load i32, i32* %r134
  %r136 = getelementptr i32, i32* %r104, i32 1
  %r355 = load i32, i32* %r136
  %r356 = mul i32 %r354, %r355
  %r357 = add i32 %r353, %r356
  %r140 = getelementptr i32, i32* %r100, i32 2
  %r358 = load i32, i32* %r140
  %r142 = getelementptr i32, i32* %r105, i32 1
  %r359 = load i32, i32* %r142
  %r360 = mul i32 %r358, %r359
  %r361 = add i32 %r357, %r360
  %r146 = getelementptr i32, i32* %r106, i32 2
  %r147 = getelementptr i32, i32* %r100, i32 0
  %r362 = load i32, i32* %r147
  %r149 = getelementptr i32, i32* %r103, i32 2
  %r363 = load i32, i32* %r149
  %r364 = mul i32 %r362, %r363
  %r152 = getelementptr i32, i32* %r100, i32 1
  %r365 = load i32, i32* %r152
  %r154 = getelementptr i32, i32* %r104, i32 2
  %r366 = load i32, i32* %r154
  %r367 = mul i32 %r365, %r366
  %r368 = add i32 %r364, %r367
  %r158 = getelementptr i32, i32* %r100, i32 2
  %r369 = load i32, i32* %r158
  %r160 = getelementptr i32, i32* %r105, i32 2
  %r370 = load i32, i32* %r160
  %r371 = mul i32 %r369, %r370
  %r372 = add i32 %r368, %r371
  %r164 = getelementptr i32, i32* %r107, i32 0
  %r165 = getelementptr i32, i32* %r101, i32 0
  %r373 = load i32, i32* %r165
  %r167 = getelementptr i32, i32* %r103, i32 0
  %r374 = load i32, i32* %r167
  %r375 = mul i32 %r373, %r374
  %r170 = getelementptr i32, i32* %r101, i32 1
  %r376 = load i32, i32* %r170
  %r172 = getelementptr i32, i32* %r104, i32 0
  %r377 = load i32, i32* %r172
  %r378 = mul i32 %r376, %r377
  %r379 = add i32 %r375, %r378
  %r176 = getelementptr i32, i32* %r101, i32 2
  %r380 = load i32, i32* %r176
  %r178 = getelementptr i32, i32* %r105, i32 0
  %r381 = load i32, i32* %r178
  %r382 = mul i32 %r380, %r381
  %r383 = add i32 %r379, %r382
  %r182 = getelementptr i32, i32* %r107, i32 1
  %r183 = getelementptr i32, i32* %r101, i32 0
  %r384 = load i32, i32* %r183
  %r185 = getelementptr i32, i32* %r103, i32 1
  %r385 = load i32, i32* %r185
  %r386 = mul i32 %r384, %r385
  %r188 = getelementptr i32, i32* %r101, i32 1
  %r387 = load i32, i32* %r188
  %r190 = getelementptr i32, i32* %r104, i32 1
  %r388 = load i32, i32* %r190
  %r389 = mul i32 %r387, %r388
  %r390 = add i32 %r386, %r389
  %r194 = getelementptr i32, i32* %r101, i32 2
  %r391 = load i32, i32* %r194
  %r196 = getelementptr i32, i32* %r105, i32 1
  %r392 = load i32, i32* %r196
  %r393 = mul i32 %r391, %r392
  %r394 = add i32 %r390, %r393
  %r200 = getelementptr i32, i32* %r107, i32 2
  %r201 = getelementptr i32, i32* %r101, i32 0
  %r395 = load i32, i32* %r201
  %r203 = getelementptr i32, i32* %r103, i32 2
  %r396 = load i32, i32* %r203
  %r397 = mul i32 %r395, %r396
  %r206 = getelementptr i32, i32* %r101, i32 1
  %r398 = load i32, i32* %r206
  %r208 = getelementptr i32, i32* %r104, i32 2
  %r399 = load i32, i32* %r208
  %r400 = mul i32 %r398, %r399
  %r401 = add i32 %r397, %r400
  %r212 = getelementptr i32, i32* %r101, i32 2
  %r402 = load i32, i32* %r212
  %r214 = getelementptr i32, i32* %r105, i32 2
  %r403 = load i32, i32* %r214
  %r404 = mul i32 %r402, %r403
  %r405 = add i32 %r401, %r404
  %r218 = getelementptr i32, i32* %r108, i32 0
  %r219 = getelementptr i32, i32* %r102, i32 0
  %r406 = load i32, i32* %r219
  %r221 = getelementptr i32, i32* %r103, i32 0
  %r407 = load i32, i32* %r221
  %r408 = mul i32 %r406, %r407
  %r224 = getelementptr i32, i32* %r102, i32 1
  %r409 = load i32, i32* %r224
  %r226 = getelementptr i32, i32* %r104, i32 0
  %r410 = load i32, i32* %r226
  %r411 = mul i32 %r409, %r410
  %r412 = add i32 %r408, %r411
  %r230 = getelementptr i32, i32* %r102, i32 2
  %r413 = load i32, i32* %r230
  %r232 = getelementptr i32, i32* %r105, i32 0
  %r414 = load i32, i32* %r232
  %r415 = mul i32 %r413, %r414
  %r416 = add i32 %r412, %r415
  %r236 = getelementptr i32, i32* %r108, i32 1
  %r237 = getelementptr i32, i32* %r102, i32 0
  %r417 = load i32, i32* %r237
  %r239 = getelementptr i32, i32* %r103, i32 1
  %r418 = load i32, i32* %r239
  %r419 = mul i32 %r417, %r418
  %r242 = getelementptr i32, i32* %r102, i32 1
  %r420 = load i32, i32* %r242
  %r244 = getelementptr i32, i32* %r104, i32 1
  %r421 = load i32, i32* %r244
  %r422 = mul i32 %r420, %r421
  %r423 = add i32 %r419, %r422
  %r248 = getelementptr i32, i32* %r102, i32 2
  %r424 = load i32, i32* %r248
  %r250 = getelementptr i32, i32* %r105, i32 1
  %r425 = load i32, i32* %r250
  %r426 = mul i32 %r424, %r425
  %r427 = add i32 %r423, %r426
  %r254 = getelementptr i32, i32* %r108, i32 2
  %r255 = getelementptr i32, i32* %r102, i32 0
  %r428 = load i32, i32* %r255
  %r257 = getelementptr i32, i32* %r103, i32 2
  %r429 = load i32, i32* %r257
  %r430 = mul i32 %r428, %r429
  %r260 = getelementptr i32, i32* %r102, i32 1
  %r431 = load i32, i32* %r260
  %r262 = getelementptr i32, i32* %r104, i32 2
  %r432 = load i32, i32* %r262
  %r433 = mul i32 %r431, %r432
  %r434 = add i32 %r430, %r433
  %r266 = getelementptr i32, i32* %r102, i32 2
  %r435 = load i32, i32* %r266
  %r268 = getelementptr i32, i32* %r105, i32 2
  %r436 = load i32, i32* %r268
  %r437 = mul i32 %r435, %r436
  %r438 = add i32 %r434, %r437
  ret i32 0
}

define i32 @main( ) {
main:
  %r441 = add i32 0, 0
  call void @_sysy_starttime(i32 97)
  store i32 3, i32* @N
  store i32 3, i32* @M
  store i32 3, i32* @L
  %r272 = alloca [ 3 x i32 ]
  %r273 = alloca [ 3 x i32 ]
  %r274 = alloca [ 3 x i32 ]
  %r275 = alloca [ 3 x i32 ]
  %r276 = alloca [ 3 x i32 ]
  %r277 = alloca [ 3 x i32 ]
  %r278 = alloca [ 6 x i32 ]
  %r279 = alloca [ 3 x i32 ]
  %r280 = alloca [ 3 x i32 ]
  %r442 = add i32 0, 0
  %r443 = add i32 0, 0
  br label %bb1

bb1:
  %r444 = phi i32 [ %r443, %main ], [ %r448, %bb2 ]
  %r445 = load i32, i32* @M
  %r446 = icmp slt i32 %r444, %r445
  br i1 %r446, label %bb2, label %bb3

bb2:
  %r285 = getelementptr [3 x i32 ], [3 x i32 ]* %r272, i32 0, i32 %r444
  %r288 = getelementptr [3 x i32 ], [3 x i32 ]* %r273, i32 0, i32 %r444
  %r291 = getelementptr [3 x i32 ], [3 x i32 ]* %r274, i32 0, i32 %r444
  %r294 = getelementptr [3 x i32 ], [3 x i32 ]* %r275, i32 0, i32 %r444
  %r297 = getelementptr [3 x i32 ], [3 x i32 ]* %r276, i32 0, i32 %r444
  %r300 = getelementptr [3 x i32 ], [3 x i32 ]* %r277, i32 0, i32 %r444
  %r447 = add i32 %r444, 1
  %r448 = add i32 %r447, 0
  br label %bb1

bb3:
  %r449 = call i32 @mul(i32* %r272, i32* %r273, i32* %r274, i32* %r275, i32* %r276, i32* %r277, i32* %r278, i32* %r279, i32* %r280)
  %r450 = add i32 %r449, 0
  br label %bb4

bb4:
  %r451 = phi i32 [ %r450, %bb3 ], [ %r457, %bb5 ]
  %r452 = load i32, i32* @N
  %r453 = icmp slt i32 %r451, %r452
  br i1 %r453, label %bb5, label %bb6

bb5:
  %r310 = getelementptr [6 x i32 ], [6 x i32 ]* %r278, i32 0, i32 %r451
  %r454 = load i32, i32* %r310
  %r455 = add i32 %r454, 0
  call void @putint(i32 %r455)
  %r456 = add i32 %r451, 1
  %r457 = add i32 %r456, 0
  br label %bb4

bb6:
  %r458 = add i32 10, 0
  %r459 = add i32 0, 0
  call void @putch(i32 %r458)
  br label %bb7

bb7:
  %r460 = phi i32 [ %r459, %bb6 ], [ %r466, %bb8 ]
  %r461 = load i32, i32* @N
  %r462 = icmp slt i32 %r460, %r461
  br i1 %r462, label %bb8, label %bb9

bb8:
  %r320 = getelementptr [3 x i32 ], [3 x i32 ]* %r279, i32 0, i32 %r460
  %r463 = load i32, i32* %r320
  %r464 = add i32 %r463, 0
  call void @putint(i32 %r464)
  %r465 = add i32 %r460, 1
  %r466 = add i32 %r465, 0
  br label %bb7

bb9:
  %r467 = add i32 10, 0
  %r468 = add i32 0, 0
  call void @putch(i32 %r467)
  br label %bb10

bb10:
  %r469 = phi i32 [ %r468, %bb9 ], [ %r475, %bb11 ]
  %r470 = load i32, i32* @N
  %r471 = icmp slt i32 %r469, %r470
  br i1 %r471, label %bb11, label %bb12

bb11:
  %r330 = getelementptr [3 x i32 ], [3 x i32 ]* %r280, i32 0, i32 %r469
  %r472 = load i32, i32* %r330
  %r473 = add i32 %r472, 0
  call void @putint(i32 %r473)
  %r474 = add i32 %r469, 1
  %r475 = add i32 %r474, 0
  br label %bb10

bb12:
  %r476 = add i32 10, 0
  call void @putch(i32 %r476)
  call void @_sysy_stoptime(i32 117)
  ret i32 0
}

