declare i32 @getch( )
declare i32 @getint( )
declare void @putch( i32 )
declare void @putint( i32 )
declare void @putarray( i32, i32* )
declare void @_sysy_starttime( i32 )
declare void @_sysy_stoptime( i32 )
@n = global i32 0
define i32 @swap( i32* %r100, i32 %r101, i32 %r103 ) {
swap:
  %r235 = add i32 0, 0
  %r236 = add i32 %r101, 0
  %r237 = add i32 0, 0
  %r238 = add i32 %r103, 0
  %r239 = add i32 0, 0
  %r106 = getelementptr i32, i32* %r100, i32 %r236
  %r240 = load i32, i32* %r106
  %r241 = add i32 %r240, 0
  %r109 = getelementptr i32, i32* %r100, i32 %r236
  %r111 = getelementptr i32, i32* %r100, i32 %r238
  %r242 = load i32, i32* %r111
  store i32 %r242, i32* %r109
  %r114 = getelementptr i32, i32* %r100, i32 %r238
  store i32 %r241, i32* %r114
  ret i32 0
}

define i32 @heap_ajust( i32* %r117, i32 %r118, i32 %r120 ) {
heap_ajust:
  %r264 = add i32 0, 0
  %r265 = add i32 0, 0
  %r266 = add i32 0, 0
  %r267 = add i32 0, 0
  %r268 = add i32 %r118, 0
  %r269 = add i32 0, 0
  %r270 = add i32 %r120, 0
  %r271 = add i32 0, 0
  %r272 = add i32 %r268, 0
  %r273 = add i32 0, 0
  %r274 = mul i32 %r272, 2
  %r275 = add i32 %r274, 1
  %r276 = add i32 %r275, 0
  br label %bb1

bb1:
  %r277 = phi i32 [ %r272, %heap_ajust ], [ %r292, %bb16 ]
  %r278 = phi i32 [ %r276, %heap_ajust ], [ %r295, %bb16 ]
  %r279 = add i32 %r270, 1
  %r280 = icmp slt i32 %r278, %r279
  br i1 %r280, label %bb2, label %bb3

bb2:
  %r281 = add i32 %r278, 1
  %r282 = add i32 %r281, 0
  %r283 = icmp slt i32 %r278, %r270
  br i1 %r283, label %bb8, label %bb9

bb8:
  %r305 = add i32 1, 0
  br label %bb10

bb9:
  %r306 = add i32 0, 0
  br label %bb10

bb10:
  %r284 = phi i32 [ %r305, %bb8 ], [ %r306, %bb9 ]
  %r285 = icmp ne i32 %r284, 0
  br i1 %r285, label %bb7, label %bb5

bb7:
  %r144 = getelementptr i32, i32* %r117, i32 %r278
  %r296 = load i32, i32* %r144
  %r147 = getelementptr i32, i32* %r117, i32 %r282
  %r297 = load i32, i32* %r147
  %r298 = icmp slt i32 %r296, %r297
  br i1 %r298, label %bb11, label %bb12

bb11:
  %r299 = add i32 1, 0
  br label %bb13

bb12:
  %r304 = add i32 0, 0
  br label %bb13

bb13:
  %r300 = phi i32 [ %r299, %bb11 ], [ %r304, %bb12 ]
  %r301 = icmp ne i32 %r300, 0
  br i1 %r301, label %bb4, label %bb5

bb4:
  %r302 = add i32 %r278, 1
  %r303 = add i32 %r302, 0
  br label %bb6

bb5:
  br label %bb6

bb6:
  %r286 = phi i32 [ %r303, %bb4 ], [ %r278, %bb5 ]
  %r156 = getelementptr i32, i32* %r117, i32 %r277
  %r287 = load i32, i32* %r156
  %r159 = getelementptr i32, i32* %r117, i32 %r286
  %r288 = load i32, i32* %r159
  %r289 = icmp sgt i32 %r287, %r288
  br i1 %r289, label %bb14, label %bb15

bb14:
  ret i32 0
bb15:
  %r290 = call i32 @swap(i32* %r117, i32 %r277, i32 %r286)
  %r291 = add i32 %r290, 0
  %r292 = add i32 %r286, 0
  %r293 = mul i32 %r292, 2
  %r294 = add i32 %r293, 1
  %r295 = add i32 %r294, 0
  br label %bb16

bb16:
  br label %bb1

bb3:
  ret i32 0
}

define i32 @heap_sort( i32* %r169, i32 %r170 ) {
heap_sort:
  %r319 = add i32 0, 0
  %r320 = add i32 0, 0
  %r321 = add i32 %r170, 0
  %r322 = add i32 0, 0
  %r323 = add i32 0, 0
  %r324 = sdiv i32 %r321, 2
  %r325 = sub i32 %r324, 1
  %r326 = add i32 %r325, 0
  br label %bb17

bb17:
  %r327 = phi i32 [ %r326, %heap_sort ], [ %r334, %bb18 ]
  %r328 = icmp sgt i32 %r327, -1
  br i1 %r328, label %bb18, label %bb19

bb18:
  %r329 = sub i32 %r321, 1
  %r330 = add i32 %r329, 0
  %r331 = call i32 @heap_ajust(i32* %r169, i32 %r327, i32 %r330)
  %r332 = add i32 %r331, 0
  %r333 = sub i32 %r327, 1
  %r334 = add i32 %r333, 0
  br label %bb17

bb19:
  %r335 = sub i32 %r321, 1
  %r336 = add i32 %r335, 0
  br label %bb20

bb20:
  %r337 = phi i32 [ %r336, %bb19 ], [ %r347, %bb21 ]
  %r338 = icmp sgt i32 %r337, 0
  br i1 %r338, label %bb21, label %bb22

bb21:
  %r339 = add i32 0, 0
  %r340 = call i32 @swap(i32* %r169, i32 %r339, i32 %r337)
  %r341 = add i32 %r340, 0
  %r342 = sub i32 %r337, 1
  %r343 = add i32 %r342, 0
  %r344 = call i32 @heap_ajust(i32* %r169, i32 %r339, i32 %r343)
  %r345 = add i32 %r344, 0
  %r346 = sub i32 %r337, 1
  %r347 = add i32 %r346, 0
  br label %bb20

bb22:
  ret i32 0
}

define i32 @main( ) {
main:
  %r354 = add i32 0, 0
  call void @_sysy_starttime(i32 50)
  store i32 10, i32* @n
  %r201 = alloca [ 10 x i32 ]
  %r202 = getelementptr [10 x i32 ], [10 x i32 ]* %r201, i32 0, i32 0
  store i32 4, i32* %r202
  %r203 = getelementptr [10 x i32 ], [10 x i32 ]* %r201, i32 0, i32 1
  store i32 3, i32* %r203
  %r204 = getelementptr [10 x i32 ], [10 x i32 ]* %r201, i32 0, i32 2
  store i32 9, i32* %r204
  %r205 = getelementptr [10 x i32 ], [10 x i32 ]* %r201, i32 0, i32 3
  store i32 2, i32* %r205
  %r206 = getelementptr [10 x i32 ], [10 x i32 ]* %r201, i32 0, i32 4
  store i32 0, i32* %r206
  %r207 = getelementptr [10 x i32 ], [10 x i32 ]* %r201, i32 0, i32 5
  store i32 1, i32* %r207
  %r208 = getelementptr [10 x i32 ], [10 x i32 ]* %r201, i32 0, i32 6
  store i32 6, i32* %r208
  %r209 = getelementptr [10 x i32 ], [10 x i32 ]* %r201, i32 0, i32 7
  store i32 5, i32* %r209
  %r210 = getelementptr [10 x i32 ], [10 x i32 ]* %r201, i32 0, i32 8
  store i32 7, i32* %r210
  %r211 = getelementptr [10 x i32 ], [10 x i32 ]* %r201, i32 0, i32 9
  store i32 8, i32* %r211
  %r355 = add i32 0, 0
  %r356 = add i32 0, 0
  %r357 = load i32, i32* @n
  %r358 = call i32 @heap_sort(i32* %r201, i32 %r357)
  %r359 = add i32 %r358, 0
  br label %bb23

bb23:
  %r360 = phi i32 [ %r359, %main ], [ %r367, %bb24 ]
  %r361 = load i32, i32* @n
  %r362 = icmp slt i32 %r360, %r361
  br i1 %r362, label %bb24, label %bb25

bb24:
  %r219 = getelementptr [10 x i32 ], [10 x i32 ]* %r201, i32 0, i32 %r360
  %r363 = load i32, i32* %r219
  %r364 = add i32 %r363, 0
  call void @putint(i32 %r364)
  %r365 = add i32 10, 0
  call void @putch(i32 %r365)
  %r366 = add i32 %r360, 1
  %r367 = add i32 %r366, 0
  br label %bb23

bb25:
  call void @_sysy_stoptime(i32 66)
  ret i32 0
}

