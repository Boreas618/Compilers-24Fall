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
  %r340 = add i32 0, 0
  %r341 = add i32 0, 0
  %r110 = getelementptr i32, i32* %r106, i32 0
  %r111 = getelementptr i32, i32* %r100, i32 0
  %r342 = load i32, i32* %r111
  %r113 = getelementptr i32, i32* %r103, i32 0
  %r343 = load i32, i32* %r113
  %r344 = mul i32 %r342, %r343
  %r116 = getelementptr i32, i32* %r100, i32 1
  %r345 = load i32, i32* %r116
  %r118 = getelementptr i32, i32* %r104, i32 0
  %r346 = load i32, i32* %r118
  %r347 = mul i32 %r345, %r346
  %r348 = add i32 %r344, %r347
  %r122 = getelementptr i32, i32* %r100, i32 2
  %r349 = load i32, i32* %r122
  %r124 = getelementptr i32, i32* %r105, i32 0
  %r350 = load i32, i32* %r124
  %r351 = mul i32 %r349, %r350
  %r352 = add i32 %r348, %r351
  store i32 %r352, i32* %r110
  %r128 = getelementptr i32, i32* %r106, i32 1
  %r129 = getelementptr i32, i32* %r100, i32 0
  %r353 = load i32, i32* %r129
  %r131 = getelementptr i32, i32* %r103, i32 1
  %r354 = load i32, i32* %r131
  %r355 = mul i32 %r353, %r354
  %r134 = getelementptr i32, i32* %r100, i32 1
  %r356 = load i32, i32* %r134
  %r136 = getelementptr i32, i32* %r104, i32 1
  %r357 = load i32, i32* %r136
  %r358 = mul i32 %r356, %r357
  %r359 = add i32 %r355, %r358
  %r140 = getelementptr i32, i32* %r100, i32 2
  %r360 = load i32, i32* %r140
  %r142 = getelementptr i32, i32* %r105, i32 1
  %r361 = load i32, i32* %r142
  %r362 = mul i32 %r360, %r361
  %r363 = add i32 %r359, %r362
  store i32 %r363, i32* %r128
  %r146 = getelementptr i32, i32* %r106, i32 2
  %r147 = getelementptr i32, i32* %r100, i32 0
  %r364 = load i32, i32* %r147
  %r149 = getelementptr i32, i32* %r103, i32 2
  %r365 = load i32, i32* %r149
  %r366 = mul i32 %r364, %r365
  %r152 = getelementptr i32, i32* %r100, i32 1
  %r367 = load i32, i32* %r152
  %r154 = getelementptr i32, i32* %r104, i32 2
  %r368 = load i32, i32* %r154
  %r369 = mul i32 %r367, %r368
  %r370 = add i32 %r366, %r369
  %r158 = getelementptr i32, i32* %r100, i32 2
  %r371 = load i32, i32* %r158
  %r160 = getelementptr i32, i32* %r105, i32 2
  %r372 = load i32, i32* %r160
  %r373 = mul i32 %r371, %r372
  %r374 = add i32 %r370, %r373
  store i32 %r374, i32* %r146
  %r164 = getelementptr i32, i32* %r107, i32 0
  %r165 = getelementptr i32, i32* %r101, i32 0
  %r375 = load i32, i32* %r165
  %r167 = getelementptr i32, i32* %r103, i32 0
  %r376 = load i32, i32* %r167
  %r377 = mul i32 %r375, %r376
  %r170 = getelementptr i32, i32* %r101, i32 1
  %r378 = load i32, i32* %r170
  %r172 = getelementptr i32, i32* %r104, i32 0
  %r379 = load i32, i32* %r172
  %r380 = mul i32 %r378, %r379
  %r381 = add i32 %r377, %r380
  %r176 = getelementptr i32, i32* %r101, i32 2
  %r382 = load i32, i32* %r176
  %r178 = getelementptr i32, i32* %r105, i32 0
  %r383 = load i32, i32* %r178
  %r384 = mul i32 %r382, %r383
  %r385 = add i32 %r381, %r384
  store i32 %r385, i32* %r164
  %r182 = getelementptr i32, i32* %r107, i32 1
  %r183 = getelementptr i32, i32* %r101, i32 0
  %r386 = load i32, i32* %r183
  %r185 = getelementptr i32, i32* %r103, i32 1
  %r387 = load i32, i32* %r185
  %r388 = mul i32 %r386, %r387
  %r188 = getelementptr i32, i32* %r101, i32 1
  %r389 = load i32, i32* %r188
  %r190 = getelementptr i32, i32* %r104, i32 1
  %r390 = load i32, i32* %r190
  %r391 = mul i32 %r389, %r390
  %r392 = add i32 %r388, %r391
  %r194 = getelementptr i32, i32* %r101, i32 2
  %r393 = load i32, i32* %r194
  %r196 = getelementptr i32, i32* %r105, i32 1
  %r394 = load i32, i32* %r196
  %r395 = mul i32 %r393, %r394
  %r396 = add i32 %r392, %r395
  store i32 %r396, i32* %r182
  %r200 = getelementptr i32, i32* %r107, i32 2
  %r201 = getelementptr i32, i32* %r101, i32 0
  %r397 = load i32, i32* %r201
  %r203 = getelementptr i32, i32* %r103, i32 2
  %r398 = load i32, i32* %r203
  %r399 = mul i32 %r397, %r398
  %r206 = getelementptr i32, i32* %r101, i32 1
  %r400 = load i32, i32* %r206
  %r208 = getelementptr i32, i32* %r104, i32 2
  %r401 = load i32, i32* %r208
  %r402 = mul i32 %r400, %r401
  %r403 = add i32 %r399, %r402
  %r212 = getelementptr i32, i32* %r101, i32 2
  %r404 = load i32, i32* %r212
  %r214 = getelementptr i32, i32* %r105, i32 2
  %r405 = load i32, i32* %r214
  %r406 = mul i32 %r404, %r405
  %r407 = add i32 %r403, %r406
  store i32 %r407, i32* %r200
  %r218 = getelementptr i32, i32* %r108, i32 0
  %r219 = getelementptr i32, i32* %r102, i32 0
  %r408 = load i32, i32* %r219
  %r221 = getelementptr i32, i32* %r103, i32 0
  %r409 = load i32, i32* %r221
  %r410 = mul i32 %r408, %r409
  %r224 = getelementptr i32, i32* %r102, i32 1
  %r411 = load i32, i32* %r224
  %r226 = getelementptr i32, i32* %r104, i32 0
  %r412 = load i32, i32* %r226
  %r413 = mul i32 %r411, %r412
  %r414 = add i32 %r410, %r413
  %r230 = getelementptr i32, i32* %r102, i32 2
  %r415 = load i32, i32* %r230
  %r232 = getelementptr i32, i32* %r105, i32 0
  %r416 = load i32, i32* %r232
  %r417 = mul i32 %r415, %r416
  %r418 = add i32 %r414, %r417
  store i32 %r418, i32* %r218
  %r236 = getelementptr i32, i32* %r108, i32 1
  %r237 = getelementptr i32, i32* %r102, i32 0
  %r419 = load i32, i32* %r237
  %r239 = getelementptr i32, i32* %r103, i32 1
  %r420 = load i32, i32* %r239
  %r421 = mul i32 %r419, %r420
  %r242 = getelementptr i32, i32* %r102, i32 1
  %r422 = load i32, i32* %r242
  %r244 = getelementptr i32, i32* %r104, i32 1
  %r423 = load i32, i32* %r244
  %r424 = mul i32 %r422, %r423
  %r425 = add i32 %r421, %r424
  %r248 = getelementptr i32, i32* %r102, i32 2
  %r426 = load i32, i32* %r248
  %r250 = getelementptr i32, i32* %r105, i32 1
  %r427 = load i32, i32* %r250
  %r428 = mul i32 %r426, %r427
  %r429 = add i32 %r425, %r428
  store i32 %r429, i32* %r236
  %r254 = getelementptr i32, i32* %r108, i32 2
  %r255 = getelementptr i32, i32* %r102, i32 0
  %r430 = load i32, i32* %r255
  %r257 = getelementptr i32, i32* %r103, i32 2
  %r431 = load i32, i32* %r257
  %r432 = mul i32 %r430, %r431
  %r260 = getelementptr i32, i32* %r102, i32 1
  %r433 = load i32, i32* %r260
  %r262 = getelementptr i32, i32* %r104, i32 2
  %r434 = load i32, i32* %r262
  %r435 = mul i32 %r433, %r434
  %r436 = add i32 %r432, %r435
  %r266 = getelementptr i32, i32* %r102, i32 2
  %r437 = load i32, i32* %r266
  %r268 = getelementptr i32, i32* %r105, i32 2
  %r438 = load i32, i32* %r268
  %r439 = mul i32 %r437, %r438
  %r440 = add i32 %r436, %r439
  store i32 %r440, i32* %r254
  ret i32 0
}

define i32 @main( ) {
main:
  %r447 = add i32 0, 0
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
  %r448 = add i32 0, 0
  %r449 = add i32 0, 0
  br label %bb1

bb1:
  %r450 = phi i32 [ %r449, %main ], [ %r454, %bb2 ]
  %r451 = load i32, i32* @M
  %r452 = icmp slt i32 %r450, %r451
  br i1 %r452, label %bb2, label %bb3

bb2:
  %r285 = getelementptr [3 x i32 ], [3 x i32 ]* %r272, i32 0, i32 %r450
  store i32 %r450, i32* %r285
  %r288 = getelementptr [3 x i32 ], [3 x i32 ]* %r273, i32 0, i32 %r450
  store i32 %r450, i32* %r288
  %r291 = getelementptr [3 x i32 ], [3 x i32 ]* %r274, i32 0, i32 %r450
  store i32 %r450, i32* %r291
  %r294 = getelementptr [3 x i32 ], [3 x i32 ]* %r275, i32 0, i32 %r450
  store i32 %r450, i32* %r294
  %r297 = getelementptr [3 x i32 ], [3 x i32 ]* %r276, i32 0, i32 %r450
  store i32 %r450, i32* %r297
  %r300 = getelementptr [3 x i32 ], [3 x i32 ]* %r277, i32 0, i32 %r450
  store i32 %r450, i32* %r300
  %r453 = add i32 %r450, 1
  %r454 = add i32 %r453, 0
  br label %bb1

bb3:
  %r455 = call i32 @mul(i32* %r272, i32* %r273, i32* %r274, i32* %r275, i32* %r276, i32* %r277, i32* %r278, i32* %r279, i32* %r280)
  %r456 = add i32 %r455, 0
  br label %bb4

bb4:
  %r457 = phi i32 [ %r456, %bb3 ], [ %r463, %bb5 ]
  %r458 = load i32, i32* @N
  %r459 = icmp slt i32 %r457, %r458
  br i1 %r459, label %bb5, label %bb6

bb5:
  %r310 = getelementptr [6 x i32 ], [6 x i32 ]* %r278, i32 0, i32 %r457
  %r460 = load i32, i32* %r310
  %r461 = add i32 %r460, 0
  call void @putint(i32 %r461)
  %r462 = add i32 %r457, 1
  %r463 = add i32 %r462, 0
  br label %bb4

bb6:
  %r464 = add i32 10, 0
  %r465 = add i32 0, 0
  call void @putch(i32 %r464)
  br label %bb7

bb7:
  %r466 = phi i32 [ %r465, %bb6 ], [ %r472, %bb8 ]
  %r467 = load i32, i32* @N
  %r468 = icmp slt i32 %r466, %r467
  br i1 %r468, label %bb8, label %bb9

bb8:
  %r320 = getelementptr [3 x i32 ], [3 x i32 ]* %r279, i32 0, i32 %r466
  %r469 = load i32, i32* %r320
  %r470 = add i32 %r469, 0
  call void @putint(i32 %r470)
  %r471 = add i32 %r466, 1
  %r472 = add i32 %r471, 0
  br label %bb7

bb9:
  %r473 = add i32 10, 0
  %r474 = add i32 0, 0
  call void @putch(i32 %r473)
  br label %bb10

bb10:
  %r475 = phi i32 [ %r474, %bb9 ], [ %r482, %bb11 ]
  %r476 = load i32, i32* @N
  %r477 = icmp slt i32 %r475, %r476
  br i1 %r477, label %bb11, label %bb12

bb11:
  %r330 = getelementptr [3 x i32 ], [3 x i32 ]* %r280, i32 0, i32 %r475
  %r479 = load i32, i32* %r330
  %r480 = add i32 %r479, 0
  call void @putint(i32 %r480)
  %r481 = add i32 %r475, 1
  %r482 = add i32 %r481, 0
  br label %bb10

bb12:
  %r478 = add i32 10, 0
  call void @putch(i32 %r478)
  call void @_sysy_stoptime(i32 117)
  ret i32 0
}

