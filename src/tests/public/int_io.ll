declare i32 @getch( )
declare i32 @getint( )
declare void @putch( i32 )
declare void @putint( i32 )
declare void @putarray( i32, i32* )
declare void @_sysy_starttime( i32 )
declare void @_sysy_stoptime( i32 )
@ascii_0 = global i32 48
define i32 @my_getint( ) {
my_getint:
  %r187 = add i32 0, 0
  %r188 = add i32 0, 0
  %r189 = add i32 0, 0
  %r190 = add i32 0, 0
  %r191 = add i32 0, 0
  %r192 = add i32 0, 0
  %r193 = add i32 0, 0
  br label %bb1

bb1:
  %r194 = phi i32 [ %r193, %my_getint ], [ %r220, %bb4 ]
  %r195 = icmp sgt i32 1, 0
  br i1 %r195, label %bb2, label %bb3

bb2:
  %r217 = call i32 @getch()
  %r218 = load i32, i32* @ascii_0
  %r219 = sub i32 %r217, %r218
  %r220 = add i32 %r219, 0
  %r221 = icmp slt i32 %r220, 0
  br i1 %r221, label %bb8, label %bb9

bb8:
  %r230 = add i32 1, 0
  br label %bb10

bb9:
  %r222 = add i32 0, 0
  br label %bb10

bb10:
  %r223 = phi i32 [ %r230, %bb8 ], [ %r222, %bb9 ]
  %r224 = icmp ne i32 %r223, 0
  br i1 %r224, label %bb4, label %bb7

bb7:
  %r225 = icmp sgt i32 %r220, 9
  br i1 %r225, label %bb11, label %bb12

bb11:
  %r227 = add i32 1, 0
  br label %bb13

bb12:
  %r226 = add i32 0, 0
  br label %bb13

bb13:
  %r228 = phi i32 [ %r227, %bb11 ], [ %r226, %bb12 ]
  %r229 = icmp ne i32 %r228, 0
  br i1 %r229, label %bb4, label %bb5

bb4:
  br label %bb1

bb5:
  br label %bb3

bb3:
  %r196 = phi i32 [ %r194, %bb1 ], [ %r220, %bb5 ]
  %r197 = add i32 %r196, 0
  br label %bb14

bb14:
  %r198 = phi i32 [ %r197, %bb3 ], [ %r212, %bb19 ]
  %r199 = icmp sgt i32 1, 0
  br i1 %r199, label %bb15, label %bb16

bb15:
  %r200 = call i32 @getch()
  %r201 = load i32, i32* @ascii_0
  %r202 = sub i32 %r200, %r201
  %r203 = add i32 %r202, 0
  %r204 = icmp sge i32 %r203, 0
  br i1 %r204, label %bb21, label %bb22

bb21:
  %r215 = add i32 1, 0
  br label %bb23

bb22:
  %r216 = add i32 0, 0
  br label %bb23

bb23:
  %r205 = phi i32 [ %r215, %bb21 ], [ %r216, %bb22 ]
  %r206 = icmp ne i32 %r205, 0
  br i1 %r206, label %bb20, label %bb18

bb20:
  %r207 = icmp sle i32 %r203, 9
  br i1 %r207, label %bb24, label %bb25

bb24:
  %r213 = add i32 1, 0
  br label %bb26

bb25:
  %r214 = add i32 0, 0
  br label %bb26

bb26:
  %r208 = phi i32 [ %r213, %bb24 ], [ %r214, %bb25 ]
  %r209 = icmp ne i32 %r208, 0
  br i1 %r209, label %bb17, label %bb18

bb17:
  %r210 = mul i32 %r198, 10
  %r211 = add i32 %r210, %r203
  %r212 = add i32 %r211, 0
  br label %bb19

bb18:
  br label %bb16

bb19:
  br label %bb14

bb16:
  ret i32 %r198
}

define i32 @mod( i32 %r138, i32 %r140 ) {
mod:
  %r233 = add i32 0, 0
  %r234 = add i32 %r138, 0
  %r235 = add i32 0, 0
  %r236 = add i32 %r140, 0
  %r237 = sdiv i32 %r234, %r236
  %r238 = mul i32 %r237, %r236
  %r239 = sub i32 %r234, %r238
  ret i32 %r239
}

define void @my_putint( i32 %r149 ) {
my_putint:
  %r242 = add i32 0, 0
  %r243 = add i32 %r149, 0
  %r151 = alloca [ 16 x i32 ]
  %r244 = add i32 0, 0
  %r245 = add i32 0, 0
  br label %bb27

bb27:
  %r246 = phi i32 [ %r243, %my_putint ], [ %r253, %bb28 ]
  %r247 = phi i32 [ %r245, %my_putint ], [ %r255, %bb28 ]
  %r248 = icmp sgt i32 %r246, 0
  br i1 %r248, label %bb28, label %bb29

bb28:
  %r155 = getelementptr [16 x i32 ], [16 x i32 ]* %r151, i32 0, i32 %r247
  %r249 = call i32 @mod(i32 %r246, i32 10)
  %r250 = load i32, i32* @ascii_0
  %r251 = add i32 %r249, %r250
  store i32 %r251, i32* %r155
  %r252 = sdiv i32 %r246, 10
  %r253 = add i32 %r252, 0
  %r254 = add i32 %r247, 1
  %r255 = add i32 %r254, 0
  br label %bb27

bb29:
  br label %bb30

bb30:
  %r256 = phi i32 [ %r247, %bb29 ], [ %r259, %bb31 ]
  %r257 = icmp sgt i32 %r256, 0
  br i1 %r257, label %bb31, label %bb32

bb31:
  %r258 = sub i32 %r256, 1
  %r259 = add i32 %r258, 0
  %r169 = getelementptr [16 x i32 ], [16 x i32 ]* %r151, i32 0, i32 %r259
  %r260 = load i32, i32* %r169
  call void @putch(i32 %r260)
  br label %bb30

bb32:
  ret void
}

define i32 @main( ) {
main:
  %r263 = add i32 0, 0
  call void @_sysy_starttime(i32 51)
  %r264 = call i32 @my_getint()
  %r265 = add i32 0, 0
  %r266 = add i32 %r264, 0
  br label %bb33

bb33:
  %r267 = phi i32 [ %r266, %main ], [ %r272, %bb34 ]
  %r268 = icmp sgt i32 %r267, 0
  br i1 %r268, label %bb34, label %bb35

bb34:
  %r269 = call i32 @my_getint()
  %r270 = add i32 %r269, 0
  call void @my_putint(i32 %r270)
  call void @putch(i32 10)
  %r271 = sub i32 %r267, 1
  %r272 = add i32 %r271, 0
  br label %bb33

bb35:
  call void @_sysy_stoptime(i32 58)
  ret i32 0
}

