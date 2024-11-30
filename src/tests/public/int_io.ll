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
  %r199 = add i32 0, 0
  %r200 = add i32 0, 0
  %r201 = add i32 0, 0
  %r202 = add i32 0, 0
  %r203 = add i32 0, 0
  %r204 = add i32 0, 0
  %r205 = add i32 0, 0
  br label %bb1

bb1:
  %r102 = icmp sgt i32 1, 0
  br i1 %r102, label %bb2, label %bb3

bb2:
  %r103 = call i32 @getch()
  %r104 = load i32, i32* @ascii_0
  %r105 = sub i32 %r103, %r104
  %r197 = add i32 %r105, 0
  %r108 = icmp slt i32 %r197, 0
  br i1 %r108, label %bb8, label %bb9

bb8:
  %r191 = add i32 1, 0
  br label %bb10

bb9:
  %r191 = add i32 0, 0
  br label %bb10

bb10:
  %r110 = icmp ne i32 %r191, 0
  br i1 %r110, label %bb4, label %bb7

bb7:
  %r113 = icmp sgt i32 %r197, 9
  br i1 %r113, label %bb11, label %bb12

bb11:
  %r188 = add i32 1, 0
  br label %bb13

bb12:
  %r188 = add i32 0, 0
  br label %bb13

bb13:
  %r115 = icmp ne i32 %r188, 0
  br i1 %r115, label %bb4, label %bb5

bb4:
  br label %bb1

bb5:
  br label %bb3

bb3:
  %r194 = add i32 %r197, 0
  br label %bb14

bb14:
  %r118 = icmp sgt i32 1, 0
  br i1 %r118, label %bb15, label %bb16

bb15:
  %r119 = call i32 @getch()
  %r120 = load i32, i32* @ascii_0
  %r121 = sub i32 %r119, %r120
  %r197 = add i32 %r121, 0
  %r124 = icmp sge i32 %r197, 0
  br i1 %r124, label %bb21, label %bb22

bb21:
  %r185 = add i32 1, 0
  br label %bb23

bb22:
  %r185 = add i32 0, 0
  br label %bb23

bb23:
  %r126 = icmp ne i32 %r185, 0
  br i1 %r126, label %bb20, label %bb18

bb20:
  %r129 = icmp sle i32 %r197, 9
  br i1 %r129, label %bb24, label %bb25

bb24:
  %r182 = add i32 1, 0
  br label %bb26

bb25:
  %r182 = add i32 0, 0
  br label %bb26

bb26:
  %r131 = icmp ne i32 %r182, 0
  br i1 %r131, label %bb17, label %bb18

bb17:
  %r134 = mul i32 %r194, 10
  %r136 = add i32 %r134, %r197
  %r194 = add i32 %r136, 0
  br label %bb19

bb18:
  br label %bb16

bb19:
  br label %bb14

bb16:
  ret i32 %r194
}

define i32 @mod( i32 %r138, i32 %r140 ) {
mod:
  %r212 = add i32 0, 0
  %r213 = add i32 %r138, 0
  %r214 = add i32 0, 0
  %r215 = add i32 %r140, 0
  %r216 = sdiv i32 %r213, %r215
  %r217 = mul i32 %r216, %r215
  %r218 = sub i32 %r213, %r217
  ret i32 %r218
}

define void @my_putint( i32 %r149 ) {
my_putint:
  %r225 = add i32 0, 0
  %r226 = add i32 %r149, 0
  %r151 = alloca [ 16 x i32 ]
  %r227 = add i32 0, 0
  %r228 = add i32 0, 0
  br label %bb27

bb27:
  %r229 = phi i32 [ %r226, %my_putint ], [ %r236, %bb28 ]
  %r230 = phi i32 [ %r228, %my_putint ], [ %r238, %bb28 ]
  %r231 = icmp sgt i32 %r229, 0
  br i1 %r231, label %bb28, label %bb29

bb28:
  %r155 = getelementptr [16 x i32 ], [16 x i32 ]* %r151, i32 0, i32 %r230
  %r232 = call i32 @mod(i32 %r229, i32 10)
  %r233 = load i32, i32* @ascii_0
  %r234 = add i32 %r232, %r233
  store i32 %r234, i32* %r155
  %r235 = sdiv i32 %r229, 10
  %r236 = add i32 %r235, 0
  %r237 = add i32 %r230, 1
  %r238 = add i32 %r237, 0
  br label %bb27

bb29:
  br label %bb30

bb30:
  %r239 = phi i32 [ %r230, %bb29 ], [ %r242, %bb31 ]
  %r240 = icmp sgt i32 %r239, 0
  br i1 %r240, label %bb31, label %bb32

bb31:
  %r241 = sub i32 %r239, 1
  %r242 = add i32 %r241, 0
  %r169 = getelementptr [16 x i32 ], [16 x i32 ]* %r151, i32 0, i32 %r242
  %r243 = load i32, i32* %r169
  call void @putch(i32 %r243)
  br label %bb30

bb32:
  ret void
}

define i32 @main( ) {
main:
  %r250 = add i32 0, 0
  call void @_sysy_starttime(i32 51)
  %r251 = call i32 @my_getint()
  %r252 = add i32 0, 0
  %r253 = add i32 %r251, 0
  br label %bb33

bb33:
  %r254 = phi i32 [ %r253, %main ], [ %r259, %bb34 ]
  %r255 = icmp sgt i32 %r254, 0
  br i1 %r255, label %bb34, label %bb35

bb34:
  %r256 = call i32 @my_getint()
  %r257 = add i32 %r256, 0
  call void @my_putint(i32 %r257)
  call void @putch(i32 10)
  %r258 = sub i32 %r254, 1
  %r259 = add i32 %r258, 0
  br label %bb33

bb35:
  call void @_sysy_stoptime(i32 58)
  ret i32 0
}

