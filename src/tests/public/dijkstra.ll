declare i32 @getch( )
declare i32 @getint( )
declare void @putch( i32 )
declare void @putint( i32 )
declare void @putarray( i32, i32* )
declare void @_sysy_starttime( i32 )
declare void @_sysy_stoptime( i32 )
@INF = global i32 65535
%array2D = type { [16 x i32 ] }
@e = global [ 16 x %array2D ] zeroinitializer
@book = global [ 16 x i32 ] zeroinitializer
@dis = global [ 16 x i32 ] zeroinitializer
@n = global i32 0
@m = global i32 0
@v1 = global i32 0
@v2 = global i32 0
@w = global i32 0
define void @Dijkstra( ) {
Dijkstra:
  %r268 = add i32 0, 0
  %r269 = add i32 0, 0
  %r270 = add i32 0, 0
  %r271 = add i32 0, 0
  %r272 = add i32 0, 0
  %r273 = add i32 0, 0
  %r274 = add i32 0, 0
  %r275 = add i32 1, 0
  br label %bb1

bb1:
  %r276 = phi i32 [ %r275, %Dijkstra ], [ %r333, %bb2 ]
  %r277 = load i32, i32* @n
  %r278 = icmp sle i32 %r276, %r277
  br i1 %r278, label %bb2, label %bb3

bb2:
  %r104 = getelementptr [16 x i32 ], [16 x i32 ]* @dis, i32 0, i32 %r276
  %r106 = getelementptr [16 x %array2D ], [16 x %array2D ]* @e, i32 0, i32 1
  %r107 = getelementptr %array2D, %array2D* %r106, i32 0, i32 0
  %r108 = getelementptr [16 x i32 ], [16 x i32 ]* %r107, i32 0, i32 %r276
  %r331 = load i32, i32* %r108
  store i32 %r331, i32* %r104
  %r111 = getelementptr [16 x i32 ], [16 x i32 ]* @book, i32 0, i32 %r276
  store i32 0, i32* %r111
  %r332 = add i32 %r276, 1
  %r333 = add i32 %r332, 0
  br label %bb1

bb3:
  %r115 = getelementptr [16 x i32 ], [16 x i32 ]* @book, i32 0, i32 1
  store i32 1, i32* %r115
  %r279 = add i32 1, 0
  br label %bb4

bb4:
  %r280 = phi i32 [ %r279, %bb3 ], [ %r311, %bb22 ]
  %r281 = load i32, i32* @n
  %r282 = sub i32 %r281, 1
  %r283 = icmp sle i32 %r280, %r282
  br i1 %r283, label %bb5, label %bb6

bb5:
  %r284 = load i32, i32* @INF
  %r285 = add i32 %r284, 0
  %r286 = add i32 0, 0
  %r287 = add i32 1, 0
  br label %bb7

bb7:
  %r288 = phi i32 [ %r285, %bb5 ], [ %r326, %bb12 ]
  %r289 = phi i32 [ %r287, %bb5 ], [ %r329, %bb12 ]
  %r290 = phi i32 [ %r286, %bb5 ], [ %r327, %bb12 ]
  %r291 = load i32, i32* @n
  %r292 = icmp sle i32 %r289, %r291
  br i1 %r292, label %bb8, label %bb9

bb8:
  %r131 = getelementptr [16 x i32 ], [16 x i32 ]* @dis, i32 0, i32 %r289
  %r312 = load i32, i32* %r131
  %r313 = icmp sgt i32 %r288, %r312
  br i1 %r313, label %bb14, label %bb15

bb14:
  %r314 = add i32 1, 0
  br label %bb16

bb15:
  %r330 = add i32 0, 0
  br label %bb16

bb16:
  %r315 = phi i32 [ %r314, %bb14 ], [ %r330, %bb15 ]
  %r316 = icmp ne i32 %r315, 0
  br i1 %r316, label %bb13, label %bb11

bb13:
  %r138 = getelementptr [16 x i32 ], [16 x i32 ]* @book, i32 0, i32 %r289
  %r317 = load i32, i32* %r138
  %r318 = icmp eq i32 %r317, 0
  br i1 %r318, label %bb17, label %bb18

bb17:
  %r324 = add i32 1, 0
  br label %bb19

bb18:
  %r325 = add i32 0, 0
  br label %bb19

bb19:
  %r319 = phi i32 [ %r324, %bb17 ], [ %r325, %bb18 ]
  %r320 = icmp ne i32 %r319, 0
  br i1 %r320, label %bb10, label %bb11

bb10:
  %r143 = getelementptr [16 x i32 ], [16 x i32 ]* @dis, i32 0, i32 %r289
  %r321 = load i32, i32* %r143
  %r322 = add i32 %r321, 0
  %r323 = add i32 %r289, 0
  br label %bb12

bb11:
  br label %bb12

bb12:
  %r326 = phi i32 [ %r322, %bb10 ], [ %r288, %bb11 ]
  %r327 = phi i32 [ %r323, %bb10 ], [ %r290, %bb11 ]
  %r328 = add i32 %r289, 1
  %r329 = add i32 %r328, 0
  br label %bb7

bb9:
  %r149 = getelementptr [16 x i32 ], [16 x i32 ]* @book, i32 0, i32 %r290
  store i32 1, i32* %r149
  %r293 = add i32 1, 0
  br label %bb20

bb20:
  %r294 = phi i32 [ %r293, %bb9 ], [ %r309, %bb25 ]
  %r295 = load i32, i32* @n
  %r296 = icmp sle i32 %r294, %r295
  br i1 %r296, label %bb21, label %bb22

bb21:
  %r157 = getelementptr [16 x %array2D ], [16 x %array2D ]* @e, i32 0, i32 %r290
  %r159 = getelementptr %array2D, %array2D* %r157, i32 0, i32 0
  %r160 = getelementptr [16 x i32 ], [16 x i32 ]* %r159, i32 0, i32 %r294
  %r297 = load i32, i32* %r160
  %r298 = load i32, i32* @INF
  %r299 = icmp slt i32 %r297, %r298
  br i1 %r299, label %bb23, label %bb24

bb23:
  %r166 = getelementptr [16 x i32 ], [16 x i32 ]* @dis, i32 0, i32 %r294
  %r300 = load i32, i32* %r166
  %r169 = getelementptr [16 x i32 ], [16 x i32 ]* @dis, i32 0, i32 %r290
  %r301 = load i32, i32* %r169
  %r172 = getelementptr [16 x %array2D ], [16 x %array2D ]* @e, i32 0, i32 %r290
  %r174 = getelementptr %array2D, %array2D* %r172, i32 0, i32 0
  %r175 = getelementptr [16 x i32 ], [16 x i32 ]* %r174, i32 0, i32 %r294
  %r302 = load i32, i32* %r175
  %r303 = add i32 %r301, %r302
  %r304 = icmp sgt i32 %r300, %r303
  br i1 %r304, label %bb26, label %bb27

bb26:
  %r179 = getelementptr [16 x i32 ], [16 x i32 ]* @dis, i32 0, i32 %r294
  %r181 = getelementptr [16 x i32 ], [16 x i32 ]* @dis, i32 0, i32 %r290
  %r305 = load i32, i32* %r181
  %r184 = getelementptr [16 x %array2D ], [16 x %array2D ]* @e, i32 0, i32 %r290
  %r186 = getelementptr %array2D, %array2D* %r184, i32 0, i32 0
  %r187 = getelementptr [16 x i32 ], [16 x i32 ]* %r186, i32 0, i32 %r294
  %r306 = load i32, i32* %r187
  %r307 = add i32 %r305, %r306
  store i32 %r307, i32* %r179
  br label %bb28

bb27:
  br label %bb28

bb28:
  br label %bb25

bb24:
  br label %bb25

bb25:
  %r308 = add i32 %r294, 1
  %r309 = add i32 %r308, 0
  br label %bb20

bb22:
  %r310 = add i32 %r280, 1
  %r311 = add i32 %r310, 0
  br label %bb4

bb6:
  ret void
}

define i32 @main( ) {
main:
  %r346 = add i32 0, 0
  %r347 = add i32 0, 0
  %r348 = add i32 0, 0
  call void @_sysy_starttime(i32 53)
  %r349 = add i32 0, 0
  %r350 = call i32 @getint()
  store i32 %r350, i32* @n
  %r351 = call i32 @getint()
  store i32 %r351, i32* @m
  %r352 = add i32 1, 0
  br label %bb29

bb29:
  %r353 = phi i32 [ %r352, %main ], [ %r365, %bb34 ]
  %r354 = load i32, i32* @n
  %r355 = icmp sle i32 %r353, %r354
  br i1 %r355, label %bb30, label %bb31

bb30:
  %r356 = add i32 1, 0
  br label %bb32

bb32:
  %r357 = phi i32 [ %r356, %bb30 ], [ %r363, %bb37 ]
  %r358 = load i32, i32* @n
  %r359 = icmp sle i32 %r357, %r358
  br i1 %r359, label %bb33, label %bb34

bb33:
  %r360 = icmp eq i32 %r353, %r357
  br i1 %r360, label %bb35, label %bb36

bb35:
  %r209 = getelementptr [16 x %array2D ], [16 x %array2D ]* @e, i32 0, i32 %r353
  %r211 = getelementptr %array2D, %array2D* %r209, i32 0, i32 0
  %r212 = getelementptr [16 x i32 ], [16 x i32 ]* %r211, i32 0, i32 %r357
  store i32 0, i32* %r212
  br label %bb37

bb36:
  %r214 = getelementptr [16 x %array2D ], [16 x %array2D ]* @e, i32 0, i32 %r353
  %r216 = getelementptr %array2D, %array2D* %r214, i32 0, i32 0
  %r217 = getelementptr [16 x i32 ], [16 x i32 ]* %r216, i32 0, i32 %r357
  %r361 = load i32, i32* @INF
  store i32 %r361, i32* %r217
  br label %bb37

bb37:
  %r362 = add i32 %r357, 1
  %r363 = add i32 %r362, 0
  br label %bb32

bb34:
  %r364 = add i32 %r353, 1
  %r365 = add i32 %r364, 0
  br label %bb29

bb31:
  %r366 = add i32 1, 0
  br label %bb38

bb38:
  %r367 = phi i32 [ %r366, %bb31 ], [ %r383, %bb39 ]
  %r368 = load i32, i32* @m
  %r369 = icmp sle i32 %r367, %r368
  br i1 %r369, label %bb39, label %bb40

bb39:
  %r377 = call i32 @getint()
  %r378 = add i32 %r377, 0
  %r379 = call i32 @getint()
  %r380 = add i32 %r379, 0
  %r231 = getelementptr [16 x %array2D ], [16 x %array2D ]* @e, i32 0, i32 %r378
  %r233 = getelementptr %array2D, %array2D* %r231, i32 0, i32 0
  %r234 = getelementptr [16 x i32 ], [16 x i32 ]* %r233, i32 0, i32 %r380
  %r381 = call i32 @getint()
  store i32 %r381, i32* %r234
  %r382 = add i32 %r367, 1
  %r383 = add i32 %r382, 0
  br label %bb38

bb40:
  call void @Dijkstra()
  %r370 = add i32 1, 0
  br label %bb41

bb41:
  %r371 = phi i32 [ %r370, %bb40 ], [ %r376, %bb42 ]
  %r372 = load i32, i32* @n
  %r373 = icmp sle i32 %r371, %r372
  br i1 %r373, label %bb42, label %bb43

bb42:
  %r242 = getelementptr [16 x i32 ], [16 x i32 ]* @dis, i32 0, i32 %r371
  %r374 = load i32, i32* %r242
  call void @putint(i32 %r374)
  call void @putch(i32 32)
  %r375 = add i32 %r371, 1
  %r376 = add i32 %r375, 0
  br label %bb41

bb43:
  call void @putch(i32 10)
  call void @_sysy_stoptime(i32 91)
  ret i32 0
}

