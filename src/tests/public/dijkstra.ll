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
  %r254 = add i32 0, 0
  %r255 = add i32 0, 0
  %r256 = add i32 0, 0
  %r257 = add i32 0, 0
  %r258 = add i32 0, 0
  %r259 = add i32 0, 0
  %r260 = add i32 0, 0
  %r261 = add i32 1, 0
  br label %bb1

bb1:
  %r262 = phi i32 [ %r261, %Dijkstra ], [ %r267, %bb2 ]
  %r263 = load i32, i32* @n
  %r264 = icmp sle i32 %r262, %r263
  br i1 %r264, label %bb2, label %bb3

bb2:
  %r104 = getelementptr [16 x i32 ], [16 x i32 ]* @dis, i32 0, i32 %r262
  %r106 = getelementptr [16 x %array2D ], [16 x %array2D ]* @e, i32 0, i32 1
  %r107 = getelementptr %array2D, %array2D* %r106, i32 0, i32 0
  %r108 = getelementptr [16 x i32 ], [16 x i32 ]* %r107, i32 0, i32 %r262
  %r265 = load i32, i32* %r108
  store i32 %r265, i32* %r104
  %r111 = getelementptr [16 x i32 ], [16 x i32 ]* @book, i32 0, i32 %r262
  store i32 0, i32* %r111
  %r266 = add i32 %r262, 1
  %r267 = add i32 %r266, 0
  br label %bb1

bb3:
  %r115 = getelementptr [16 x i32 ], [16 x i32 ]* @book, i32 0, i32 1
  store i32 1, i32* %r115
  %r268 = add i32 1, 0
  br label %bb4

bb4:
  %r269 = phi i32 [ %r268, %bb3 ], [ %r319, %bb22 ]
  %r270 = load i32, i32* @n
  %r271 = sub i32 %r270, 1
  %r272 = icmp sle i32 %r269, %r271
  br i1 %r272, label %bb5, label %bb6

bb5:
  %r273 = load i32, i32* @INF
  %r274 = add i32 %r273, 0
  %r275 = add i32 0, 0
  %r276 = add i32 1, 0
  br label %bb7

bb7:
  %r277 = phi i32 [ %r276, %bb5 ], [ %r289, %bb12 ]
  %r278 = phi i32 [ %r275, %bb5 ], [ %r286, %bb12 ]
  %r279 = phi i32 [ %r274, %bb5 ], [ %r287, %bb12 ]
  %r280 = load i32, i32* @n
  %r281 = icmp sle i32 %r277, %r280
  br i1 %r281, label %bb8, label %bb9

bb8:
  %r131 = getelementptr [16 x i32 ], [16 x i32 ]* @dis, i32 0, i32 %r277
  %r282 = load i32, i32* %r131
  %r283 = icmp sgt i32 %r279, %r282
  br i1 %r283, label %bb14, label %bb15

bb14:
  %r300 = add i32 1, 0
  br label %bb16

bb15:
  %r299 = add i32 0, 0
  br label %bb16

bb16:
  %r284 = phi i32 [ %r300, %bb14 ], [ %r299, %bb15 ]
  %r285 = icmp ne i32 %r284, 0
  br i1 %r285, label %bb13, label %bb11

bb13:
  %r138 = getelementptr [16 x i32 ], [16 x i32 ]* @book, i32 0, i32 %r277
  %r290 = load i32, i32* %r138
  %r291 = icmp eq i32 %r290, 0
  br i1 %r291, label %bb17, label %bb18

bb17:
  %r298 = add i32 1, 0
  br label %bb19

bb18:
  %r297 = add i32 0, 0
  br label %bb19

bb19:
  %r292 = phi i32 [ %r298, %bb17 ], [ %r297, %bb18 ]
  %r293 = icmp ne i32 %r292, 0
  br i1 %r293, label %bb10, label %bb11

bb10:
  %r143 = getelementptr [16 x i32 ], [16 x i32 ]* @dis, i32 0, i32 %r277
  %r294 = load i32, i32* %r143
  %r295 = add i32 %r294, 0
  %r296 = add i32 %r277, 0
  br label %bb12

bb11:
  br label %bb12

bb12:
  %r286 = phi i32 [ %r296, %bb10 ], [ %r278, %bb11 ]
  %r287 = phi i32 [ %r295, %bb10 ], [ %r279, %bb11 ]
  %r288 = add i32 %r277, 1
  %r289 = add i32 %r288, 0
  br label %bb7

bb9:
  %r149 = getelementptr [16 x i32 ], [16 x i32 ]* @book, i32 0, i32 %r278
  store i32 1, i32* %r149
  %r301 = add i32 1, 0
  br label %bb20

bb20:
  %r302 = phi i32 [ %r301, %bb9 ], [ %r317, %bb25 ]
  %r303 = load i32, i32* @n
  %r304 = icmp sle i32 %r302, %r303
  br i1 %r304, label %bb21, label %bb22

bb21:
  %r157 = getelementptr [16 x %array2D ], [16 x %array2D ]* @e, i32 0, i32 %r278
  %r159 = getelementptr %array2D, %array2D* %r157, i32 0, i32 0
  %r160 = getelementptr [16 x i32 ], [16 x i32 ]* %r159, i32 0, i32 %r302
  %r305 = load i32, i32* %r160
  %r306 = load i32, i32* @INF
  %r307 = icmp slt i32 %r305, %r306
  br i1 %r307, label %bb23, label %bb24

bb23:
  %r166 = getelementptr [16 x i32 ], [16 x i32 ]* @dis, i32 0, i32 %r302
  %r308 = load i32, i32* %r166
  %r169 = getelementptr [16 x i32 ], [16 x i32 ]* @dis, i32 0, i32 %r278
  %r309 = load i32, i32* %r169
  %r172 = getelementptr [16 x %array2D ], [16 x %array2D ]* @e, i32 0, i32 %r278
  %r174 = getelementptr %array2D, %array2D* %r172, i32 0, i32 0
  %r175 = getelementptr [16 x i32 ], [16 x i32 ]* %r174, i32 0, i32 %r302
  %r310 = load i32, i32* %r175
  %r311 = add i32 %r309, %r310
  %r312 = icmp sgt i32 %r308, %r311
  br i1 %r312, label %bb26, label %bb27

bb26:
  %r179 = getelementptr [16 x i32 ], [16 x i32 ]* @dis, i32 0, i32 %r302
  %r181 = getelementptr [16 x i32 ], [16 x i32 ]* @dis, i32 0, i32 %r278
  %r313 = load i32, i32* %r181
  %r184 = getelementptr [16 x %array2D ], [16 x %array2D ]* @e, i32 0, i32 %r278
  %r186 = getelementptr %array2D, %array2D* %r184, i32 0, i32 0
  %r187 = getelementptr [16 x i32 ], [16 x i32 ]* %r186, i32 0, i32 %r302
  %r314 = load i32, i32* %r187
  %r315 = add i32 %r313, %r314
  store i32 %r315, i32* %r179
  br label %bb28

bb27:
  br label %bb28

bb28:
  br label %bb25

bb24:
  br label %bb25

bb25:
  %r316 = add i32 %r302, 1
  %r317 = add i32 %r316, 0
  br label %bb20

bb22:
  %r318 = add i32 %r269, 1
  %r319 = add i32 %r318, 0
  br label %bb4

bb6:
  ret void
}

define i32 @main( ) {
main:
  %r324 = add i32 0, 0
  %r325 = add i32 0, 0
  %r326 = add i32 0, 0
  call void @_sysy_starttime(i32 53)
  %r327 = add i32 0, 0
  %r328 = call i32 @getint()
  store i32 %r328, i32* @n
  %r329 = call i32 @getint()
  store i32 %r329, i32* @m
  %r330 = add i32 1, 0
  br label %bb29

bb29:
  %r331 = phi i32 [ %r330, %main ], [ %r343, %bb34 ]
  %r332 = load i32, i32* @n
  %r333 = icmp sle i32 %r331, %r332
  br i1 %r333, label %bb30, label %bb31

bb30:
  %r334 = add i32 1, 0
  br label %bb32

bb32:
  %r335 = phi i32 [ %r334, %bb30 ], [ %r341, %bb37 ]
  %r336 = load i32, i32* @n
  %r337 = icmp sle i32 %r335, %r336
  br i1 %r337, label %bb33, label %bb34

bb33:
  %r338 = icmp eq i32 %r331, %r335
  br i1 %r338, label %bb35, label %bb36

bb35:
  %r209 = getelementptr [16 x %array2D ], [16 x %array2D ]* @e, i32 0, i32 %r331
  %r211 = getelementptr %array2D, %array2D* %r209, i32 0, i32 0
  %r212 = getelementptr [16 x i32 ], [16 x i32 ]* %r211, i32 0, i32 %r335
  store i32 0, i32* %r212
  br label %bb37

bb36:
  %r214 = getelementptr [16 x %array2D ], [16 x %array2D ]* @e, i32 0, i32 %r331
  %r216 = getelementptr %array2D, %array2D* %r214, i32 0, i32 0
  %r217 = getelementptr [16 x i32 ], [16 x i32 ]* %r216, i32 0, i32 %r335
  %r339 = load i32, i32* @INF
  store i32 %r339, i32* %r217
  br label %bb37

bb37:
  %r340 = add i32 %r335, 1
  %r341 = add i32 %r340, 0
  br label %bb32

bb34:
  %r342 = add i32 %r331, 1
  %r343 = add i32 %r342, 0
  br label %bb29

bb31:
  %r344 = add i32 1, 0
  br label %bb38

bb38:
  %r345 = phi i32 [ %r344, %bb31 ], [ %r354, %bb39 ]
  %r346 = load i32, i32* @m
  %r347 = icmp sle i32 %r345, %r346
  br i1 %r347, label %bb39, label %bb40

bb39:
  %r348 = call i32 @getint()
  %r349 = add i32 %r348, 0
  %r350 = call i32 @getint()
  %r351 = add i32 %r350, 0
  %r231 = getelementptr [16 x %array2D ], [16 x %array2D ]* @e, i32 0, i32 %r349
  %r233 = getelementptr %array2D, %array2D* %r231, i32 0, i32 0
  %r234 = getelementptr [16 x i32 ], [16 x i32 ]* %r233, i32 0, i32 %r351
  %r352 = call i32 @getint()
  store i32 %r352, i32* %r234
  %r353 = add i32 %r345, 1
  %r354 = add i32 %r353, 0
  br label %bb38

bb40:
  call void @Dijkstra()
  %r355 = add i32 1, 0
  br label %bb41

bb41:
  %r356 = phi i32 [ %r355, %bb40 ], [ %r361, %bb42 ]
  %r357 = load i32, i32* @n
  %r358 = icmp sle i32 %r356, %r357
  br i1 %r358, label %bb42, label %bb43

bb42:
  %r242 = getelementptr [16 x i32 ], [16 x i32 ]* @dis, i32 0, i32 %r356
  %r359 = load i32, i32* %r242
  call void @putint(i32 %r359)
  call void @putch(i32 32)
  %r360 = add i32 %r356, 1
  %r361 = add i32 %r360, 0
  br label %bb41

bb43:
  call void @putch(i32 10)
  call void @_sysy_stoptime(i32 91)
  ret i32 0
}

