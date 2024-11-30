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
  %r229 = add i32 0, 0
  %r230 = add i32 %r101, 0
  %r231 = add i32 0, 0
  %r232 = add i32 %r103, 0
  %r233 = add i32 0, 0
  %r106 = getelementptr i32, i32* %r100, i32 %r230
  %r234 = load i32, i32* %r106
  %r235 = add i32 %r234, 0
  %r109 = getelementptr i32, i32* %r100, i32 %r230
  %r111 = getelementptr i32, i32* %r100, i32 %r232
  %r236 = load i32, i32* %r111
  store i32 %r236, i32* %r109
  %r114 = getelementptr i32, i32* %r100, i32 %r232
  store i32 %r235, i32* %r114
  ret i32 0
}

define i32 @heap_ajust( i32* %r117, i32 %r118, i32 %r120 ) {
heap_ajust:
  %r244 = add i32 0, 0
  %r245 = add i32 0, 0
  %r246 = add i32 0, 0
  %r247 = add i32 0, 0
  %r248 = add i32 %r118, 0
  %r249 = add i32 0, 0
  %r250 = add i32 %r120, 0
  %r251 = add i32 0, 0
  %r252 = add i32 %r248, 0
  %r253 = add i32 0, 0
  %r254 = mul i32 %r252, 2
  %r255 = add i32 %r254, 1
  %r256 = add i32 %r255, 0
  br label %bb1

bb1:
  %r257 = phi i32 [ %r252, %heap_ajust ], [ %r273, %bb16 ]
  %r258 = phi i32 [ %r256, %heap_ajust ], [ %r276, %bb16 ]
  %r259 = add i32 %r250, 1
  %r260 = icmp slt i32 %r258, %r259
  br i1 %r260, label %bb2, label %bb3

bb2:
  %r261 = add i32 %r258, 1
  %r262 = add i32 %r261, 0
  %r263 = icmp slt i32 %r258, %r250
  br i1 %r263, label %bb8, label %bb9

bb8:
  %r286 = add i32 1, 0
  br label %bb10

bb9:
  %r264 = add i32 0, 0
  br label %bb10

bb10:
  %r265 = phi i32 [ %r286, %bb8 ], [ %r264, %bb9 ]
  %r266 = icmp ne i32 %r265, 0
  br i1 %r266, label %bb7, label %bb5

bb7:
  %r144 = getelementptr i32, i32* %r117, i32 %r258
  %r277 = load i32, i32* %r144
  %r147 = getelementptr i32, i32* %r117, i32 %r262
  %r278 = load i32, i32* %r147
  %r279 = icmp slt i32 %r277, %r278
  br i1 %r279, label %bb11, label %bb12

bb11:
  %r280 = add i32 1, 0
  br label %bb13

bb12:
  %r285 = add i32 0, 0
  br label %bb13

bb13:
  %r281 = phi i32 [ %r280, %bb11 ], [ %r285, %bb12 ]
  %r282 = icmp ne i32 %r281, 0
  br i1 %r282, label %bb4, label %bb5

bb4:
  %r283 = add i32 %r258, 1
  %r284 = add i32 %r283, 0
  br label %bb6

bb5:
  br label %bb6

bb6:
  %r267 = phi i32 [ %r284, %bb4 ], [ %r258, %bb5 ]
  %r156 = getelementptr i32, i32* %r117, i32 %r257
  %r268 = load i32, i32* %r156
  %r159 = getelementptr i32, i32* %r117, i32 %r267
  %r269 = load i32, i32* %r159
  %r270 = icmp sgt i32 %r268, %r269
  br i1 %r270, label %bb14, label %bb15

bb14:
  ret i32 0
bb15:
  %r271 = call i32 @swap(i32* %r117, i32 %r257, i32 %r267)
  %r272 = add i32 %r271, 0
  %r273 = add i32 %r267, 0
  %r274 = mul i32 %r273, 2
  %r275 = add i32 %r274, 1
  %r276 = add i32 %r275, 0
  br label %bb16

bb16:
  br label %bb1

bb3:
  ret i32 0
}

define i32 @heap_sort( i32* %r169, i32 %r170 ) {
heap_sort:
  %r291 = add i32 0, 0
  %r292 = add i32 0, 0
  %r293 = add i32 %r170, 0
  %r294 = add i32 0, 0
  %r295 = add i32 0, 0
  %r296 = sdiv i32 %r293, 2
  %r297 = sub i32 %r296, 1
  %r298 = add i32 %r297, 0
  br label %bb17

bb17:
  %r299 = phi i32 [ %r298, %heap_sort ], [ %r306, %bb18 ]
  %r300 = icmp sgt i32 %r299, -1
  br i1 %r300, label %bb18, label %bb19

bb18:
  %r301 = sub i32 %r293, 1
  %r302 = add i32 %r301, 0
  %r303 = call i32 @heap_ajust(i32* %r169, i32 %r299, i32 %r302)
  %r304 = add i32 %r303, 0
  %r305 = sub i32 %r299, 1
  %r306 = add i32 %r305, 0
  br label %bb17

bb19:
  %r307 = sub i32 %r293, 1
  %r308 = add i32 %r307, 0
  br label %bb20

bb20:
  %r309 = phi i32 [ %r308, %bb19 ], [ %r319, %bb21 ]
  %r310 = icmp sgt i32 %r309, 0
  br i1 %r310, label %bb21, label %bb22

bb21:
  %r311 = add i32 0, 0
  %r312 = call i32 @swap(i32* %r169, i32 %r311, i32 %r309)
  %r313 = add i32 %r312, 0
  %r314 = sub i32 %r309, 1
  %r315 = add i32 %r314, 0
  %r316 = call i32 @heap_ajust(i32* %r169, i32 %r311, i32 %r315)
  %r317 = add i32 %r316, 0
  %r318 = sub i32 %r309, 1
  %r319 = add i32 %r318, 0
  br label %bb20

bb22:
  ret i32 0
}

define i32 @main( ) {
main:
  %r322 = add i32 0, 0
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
  %r323 = add i32 0, 0
  %r324 = add i32 0, 0
  %r325 = load i32, i32* @n
  %r326 = call i32 @heap_sort(i32* %r201, i32 %r325)
  %r327 = add i32 %r326, 0
  br label %bb23

bb23:
  %r328 = phi i32 [ %r327, %main ], [ %r335, %bb24 ]
  %r329 = load i32, i32* @n
  %r330 = icmp slt i32 %r328, %r329
  br i1 %r330, label %bb24, label %bb25

bb24:
  %r219 = getelementptr [10 x i32 ], [10 x i32 ]* %r201, i32 0, i32 %r328
  %r331 = load i32, i32* %r219
  %r332 = add i32 %r331, 0
  call void @putint(i32 %r332)
  %r333 = add i32 10, 0
  call void @putch(i32 %r333)
  %r334 = add i32 %r328, 1
  %r335 = add i32 %r334, 0
  br label %bb23

bb25:
  call void @_sysy_stoptime(i32 66)
  ret i32 0
}

