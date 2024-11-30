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
  %r198 = add i32 0, 0
  %r199 = add i32 0, 0
  %r200 = call i32 @getint()
  %r201 = add i32 0, 0
  %r202 = add i32 %r200, 0
  br label %bb1

bb1:
  %r203 = phi i32 [ %r199, %read_program ], [ %r207, %bb2 ]
  %r204 = icmp slt i32 %r203, %r202
  br i1 %r204, label %bb2, label %bb3

bb2:
  %r106 = getelementptr [32768 x i32 ], [32768 x i32 ]* @program, i32 0, i32 %r203
  %r205 = call i32 @getch()
  store i32 %r205, i32* %r106
  %r206 = add i32 %r203, 1
  %r207 = add i32 %r206, 0
  br label %bb1

bb3:
  %r111 = getelementptr [32768 x i32 ], [32768 x i32 ]* @program, i32 0, i32 %r203
  store i32 0, i32* %r111
  ret void
}

define void @interpret( i32* %r113 ) {
interpret:
  %r213 = add i32 0, 0
  %r214 = add i32 0, 0
  %r215 = add i32 0, 0
  %r216 = add i32 0, 0
  %r217 = add i32 0, 0
  %r218 = add i32 0, 0
  br label %bb4

bb4:
  %r219 = phi i32 [ %r218, %interpret ], [ %r265, %bb27 ]
  %r118 = getelementptr i32, i32* %r113, i32 %r219
  %r220 = load i32, i32* %r118
  %r221 = icmp ne i32 %r220, 0
  br i1 %r221, label %bb5, label %bb6

bb5:
  %r121 = getelementptr i32, i32* %r113, i32 %r219
  %r222 = load i32, i32* %r121
  %r223 = add i32 %r222, 0
  %r224 = icmp eq i32 %r223, 62
  br i1 %r224, label %bb7, label %bb8

bb7:
  %r275 = load i32, i32* @ptr
  %r276 = add i32 %r275, 1
  store i32 %r276, i32* @ptr
  br label %bb9

bb8:
  br label %bb9

bb9:
  %r225 = icmp eq i32 %r223, 60
  br i1 %r225, label %bb10, label %bb11

bb10:
  %r273 = load i32, i32* @ptr
  %r274 = sub i32 %r273, 1
  store i32 %r274, i32* @ptr
  br label %bb12

bb11:
  br label %bb12

bb12:
  %r226 = icmp eq i32 %r223, 43
  br i1 %r226, label %bb13, label %bb14

bb13:
  %r227 = load i32, i32* @ptr
  %r137 = getelementptr [65536 x i32 ], [65536 x i32 ]* @tape, i32 0, i32 %r227
  %r228 = load i32, i32* @ptr
  %r139 = getelementptr [65536 x i32 ], [65536 x i32 ]* @tape, i32 0, i32 %r228
  %r229 = load i32, i32* %r139
  %r230 = add i32 %r229, 1
  store i32 %r230, i32* %r137
  br label %bb15

bb14:
  br label %bb15

bb15:
  %r231 = icmp eq i32 %r223, 45
  br i1 %r231, label %bb16, label %bb17

bb16:
  %r269 = load i32, i32* @ptr
  %r146 = getelementptr [65536 x i32 ], [65536 x i32 ]* @tape, i32 0, i32 %r269
  %r270 = load i32, i32* @ptr
  %r148 = getelementptr [65536 x i32 ], [65536 x i32 ]* @tape, i32 0, i32 %r270
  %r271 = load i32, i32* %r148
  %r272 = sub i32 %r271, 1
  store i32 %r272, i32* %r146
  br label %bb18

bb17:
  br label %bb18

bb18:
  %r232 = icmp eq i32 %r223, 46
  br i1 %r232, label %bb19, label %bb20

bb19:
  %r233 = load i32, i32* @ptr
  %r155 = getelementptr [65536 x i32 ], [65536 x i32 ]* @tape, i32 0, i32 %r233
  %r234 = load i32, i32* %r155
  call void @putch(i32 %r234)
  br label %bb21

bb20:
  br label %bb21

bb21:
  %r235 = icmp eq i32 %r223, 44
  br i1 %r235, label %bb22, label %bb23

bb22:
  %r267 = load i32, i32* @ptr
  %r161 = getelementptr [65536 x i32 ], [65536 x i32 ]* @tape, i32 0, i32 %r267
  %r268 = call i32 @getch()
  store i32 %r268, i32* %r161
  br label %bb24

bb23:
  br label %bb24

bb24:
  %r236 = icmp eq i32 %r223, 93
  br i1 %r236, label %bb29, label %bb30

bb29:
  %r266 = add i32 1, 0
  br label %bb31

bb30:
  %r237 = add i32 0, 0
  br label %bb31

bb31:
  %r238 = phi i32 [ %r266, %bb29 ], [ %r237, %bb30 ]
  %r239 = icmp ne i32 %r238, 0
  br i1 %r239, label %bb28, label %bb26

bb28:
  %r240 = load i32, i32* @ptr
  %r172 = getelementptr [65536 x i32 ], [65536 x i32 ]* @tape, i32 0, i32 %r240
  %r241 = load i32, i32* %r172
  %r242 = icmp ne i32 %r241, 0
  br i1 %r242, label %bb32, label %bb33

bb32:
  %r262 = add i32 1, 0
  br label %bb34

bb33:
  %r243 = add i32 0, 0
  br label %bb34

bb34:
  %r244 = phi i32 [ %r262, %bb32 ], [ %r243, %bb33 ]
  %r245 = icmp ne i32 %r244, 0
  br i1 %r245, label %bb25, label %bb26

bb25:
  %r246 = add i32 1, 0
  br label %bb35

bb35:
  %r247 = phi i32 [ %r219, %bb25 ], [ %r251, %bb43 ]
  %r248 = phi i32 [ %r246, %bb25 ], [ %r259, %bb43 ]
  %r249 = icmp sgt i32 %r248, 0
  br i1 %r249, label %bb36, label %bb37

bb36:
  %r250 = sub i32 %r247, 1
  %r251 = add i32 %r250, 0
  %r181 = getelementptr i32, i32* %r113, i32 %r251
  %r252 = load i32, i32* %r181
  %r253 = add i32 %r252, 0
  %r254 = icmp eq i32 %r253, 91
  br i1 %r254, label %bb38, label %bb39

bb38:
  %r255 = sub i32 %r248, 1
  %r256 = add i32 %r255, 0
  br label %bb40

bb39:
  br label %bb40

bb40:
  %r257 = phi i32 [ %r256, %bb38 ], [ %r248, %bb39 ]
  %r258 = icmp eq i32 %r253, 93
  br i1 %r258, label %bb41, label %bb42

bb41:
  %r260 = add i32 %r257, 1
  %r261 = add i32 %r260, 0
  br label %bb43

bb42:
  br label %bb43

bb43:
  %r259 = phi i32 [ %r261, %bb41 ], [ %r257, %bb42 ]
  br label %bb35

bb37:
  br label %bb27

bb26:
  br label %bb27

bb27:
  %r263 = phi i32 [ %r247, %bb37 ], [ %r219, %bb26 ]
  %r264 = add i32 %r263, 1
  %r265 = add i32 %r264, 0
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

