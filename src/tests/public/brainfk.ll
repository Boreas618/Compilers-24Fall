declare i32 @getch( )
declare i32 @getint( )
declare void @putch( i32 )
declare void @putint( i32 )
declare void @putarray( i32, i32* )
declare void @_sysy_starttime( i32 )
declare void @_sysy_stoptime( i32 )
@TAPE_LEN = global i32 65536
@BUFFER_LEN = global i32 32768
@tape = global [ 65536 x i32 ] zeroinitializer
@program = global [ 32768 x i32 ] zeroinitializer
@ptr = global i32 0
define void @read_program( ) {
read_program:
  %r202 = add i32 0, 0
  %r203 = add i32 0, 0
  %r204 = call i32 @getint()
  %r205 = add i32 0, 0
  %r206 = add i32 %r204, 0
  br label %bb1

bb1:
  %r207 = phi i32 [ %r203, %read_program ], [ %r211, %bb2 ]
  %r208 = icmp slt i32 %r207, %r206
  br i1 %r208, label %bb2, label %bb3

bb2:
  %r106 = getelementptr [32768 x i32 ], [32768 x i32 ]* @program, i32 0, i32 %r207
  %r209 = call i32 @getch()
  store i32 %r209, i32* %r106
  %r210 = add i32 %r207, 1
  %r211 = add i32 %r210, 0
  br label %bb1

bb3:
  %r111 = getelementptr [32768 x i32 ], [32768 x i32 ]* @program, i32 0, i32 %r207
  store i32 0, i32* %r111
  ret void
}

define void @interpret( i32* %r113 ) {
interpret:
  %r227 = add i32 0, 0
  %r228 = add i32 0, 0
  %r229 = add i32 0, 0
  %r230 = add i32 0, 0
  %r231 = add i32 0, 0
  %r232 = add i32 0, 0
  br label %bb4

bb4:
  %r233 = phi i32 [ %r232, %interpret ], [ %r280, %bb27 ]
  %r118 = getelementptr i32, i32* %r113, i32 %r233
  %r234 = load i32, i32* %r118
  %r235 = icmp ne i32 %r234, 0
  br i1 %r235, label %bb5, label %bb6

bb5:
  %r121 = getelementptr i32, i32* %r113, i32 %r233
  %r236 = load i32, i32* %r121
  %r237 = add i32 %r236, 0
  %r238 = icmp eq i32 %r237, 62
  br i1 %r238, label %bb7, label %bb8

bb7:
  %r289 = load i32, i32* @ptr
  %r290 = add i32 %r289, 1
  store i32 %r290, i32* @ptr
  br label %bb9

bb8:
  br label %bb9

bb9:
  %r239 = icmp eq i32 %r237, 60
  br i1 %r239, label %bb10, label %bb11

bb10:
  %r287 = load i32, i32* @ptr
  %r288 = sub i32 %r287, 1
  store i32 %r288, i32* @ptr
  br label %bb12

bb11:
  br label %bb12

bb12:
  %r240 = icmp eq i32 %r237, 43
  br i1 %r240, label %bb13, label %bb14

bb13:
  %r283 = load i32, i32* @ptr
  %r137 = getelementptr [65536 x i32 ], [65536 x i32 ]* @tape, i32 0, i32 %r283
  %r284 = load i32, i32* @ptr
  %r139 = getelementptr [65536 x i32 ], [65536 x i32 ]* @tape, i32 0, i32 %r284
  %r285 = load i32, i32* %r139
  %r286 = add i32 %r285, 1
  store i32 %r286, i32* %r137
  br label %bb15

bb14:
  br label %bb15

bb15:
  %r241 = icmp eq i32 %r237, 45
  br i1 %r241, label %bb16, label %bb17

bb16:
  %r242 = load i32, i32* @ptr
  %r146 = getelementptr [65536 x i32 ], [65536 x i32 ]* @tape, i32 0, i32 %r242
  %r243 = load i32, i32* @ptr
  %r148 = getelementptr [65536 x i32 ], [65536 x i32 ]* @tape, i32 0, i32 %r243
  %r244 = load i32, i32* %r148
  %r245 = sub i32 %r244, 1
  store i32 %r245, i32* %r146
  br label %bb18

bb17:
  br label %bb18

bb18:
  %r246 = icmp eq i32 %r237, 46
  br i1 %r246, label %bb19, label %bb20

bb19:
  %r281 = load i32, i32* @ptr
  %r155 = getelementptr [65536 x i32 ], [65536 x i32 ]* @tape, i32 0, i32 %r281
  %r282 = load i32, i32* %r155
  call void @putch(i32 %r282)
  br label %bb21

bb20:
  br label %bb21

bb21:
  %r247 = icmp eq i32 %r237, 44
  br i1 %r247, label %bb22, label %bb23

bb22:
  %r248 = load i32, i32* @ptr
  %r161 = getelementptr [65536 x i32 ], [65536 x i32 ]* @tape, i32 0, i32 %r248
  %r249 = call i32 @getch()
  store i32 %r249, i32* %r161
  br label %bb24

bb23:
  br label %bb24

bb24:
  %r250 = icmp eq i32 %r237, 93
  br i1 %r250, label %bb29, label %bb30

bb29:
  %r251 = add i32 1, 0
  br label %bb31

bb30:
  %r252 = add i32 0, 0
  br label %bb31

bb31:
  %r253 = phi i32 [ %r251, %bb29 ], [ %r252, %bb30 ]
  %r254 = icmp ne i32 %r253, 0
  br i1 %r254, label %bb28, label %bb26

bb28:
  %r255 = load i32, i32* @ptr
  %r172 = getelementptr [65536 x i32 ], [65536 x i32 ]* @tape, i32 0, i32 %r255
  %r256 = load i32, i32* %r172
  %r257 = icmp ne i32 %r256, 0
  br i1 %r257, label %bb32, label %bb33

bb32:
  %r258 = add i32 1, 0
  br label %bb34

bb33:
  %r277 = add i32 0, 0
  br label %bb34

bb34:
  %r259 = phi i32 [ %r258, %bb32 ], [ %r277, %bb33 ]
  %r260 = icmp ne i32 %r259, 0
  br i1 %r260, label %bb25, label %bb26

bb25:
  %r261 = add i32 1, 0
  br label %bb35

bb35:
  %r262 = phi i32 [ %r233, %bb25 ], [ %r266, %bb43 ]
  %r263 = phi i32 [ %r261, %bb25 ], [ %r274, %bb43 ]
  %r264 = icmp sgt i32 %r263, 0
  br i1 %r264, label %bb36, label %bb37

bb36:
  %r265 = sub i32 %r262, 1
  %r266 = add i32 %r265, 0
  %r181 = getelementptr i32, i32* %r113, i32 %r266
  %r267 = load i32, i32* %r181
  %r268 = add i32 %r267, 0
  %r269 = icmp eq i32 %r268, 91
  br i1 %r269, label %bb38, label %bb39

bb38:
  %r270 = sub i32 %r263, 1
  %r271 = add i32 %r270, 0
  br label %bb40

bb39:
  br label %bb40

bb40:
  %r272 = phi i32 [ %r271, %bb38 ], [ %r263, %bb39 ]
  %r273 = icmp eq i32 %r268, 93
  br i1 %r273, label %bb41, label %bb42

bb41:
  %r275 = add i32 %r272, 1
  %r276 = add i32 %r275, 0
  br label %bb43

bb42:
  br label %bb43

bb43:
  %r274 = phi i32 [ %r276, %bb41 ], [ %r272, %bb42 ]
  br label %bb35

bb37:
  br label %bb27

bb26:
  br label %bb27

bb27:
  %r278 = phi i32 [ %r262, %bb37 ], [ %r233, %bb26 ]
  %r279 = add i32 %r278, 1
  %r280 = add i32 %r279, 0
  br label %bb4

bb6:
  ret void
}

define i32 @main( ) {
main:
  call void @_sysy_starttime(i32 76)
  call void @read_program()
  call void @interpret(i32* @program)
  call void @putch(i32 10)
  call void @_sysy_stoptime(i32 80)
  ret i32 0
}

