declare i32 @getch( )
declare i32 @getint( )
declare void @putch( i32 )
declare void @putint( i32 )
declare void @putarray( i32, i32* )
declare void @_sysy_starttime( i32 )
declare void @_sysy_stoptime( i32 )
define i32 @main( ) {
main:
  %r187 = add i32 0, 0
  %r188 = add i32 0, 0
  %r189 = add i32 0, 0
  %r190 = add i32 0, 0
  %r191 = add i32 0, 0
  %r192 = add i32 0, 0
  %r193 = add i32 0, 0
  call void @_sysy_starttime(i32 3)
  %r194 = add i32 0, 0
  %r195 = add i32 0, 0
  %r102 = alloca [ 10 x i32 ]
  %r196 = add i32 0, 0
  %r197 = add i32 0, 0
  br label %bb1

bb1:
  %r198 = phi i32 [ %r197, %main ], [ %r202, %bb2 ]
  %r199 = icmp slt i32 %r198, 10
  br i1 %r199, label %bb2, label %bb3

bb2:
  %r105 = getelementptr [10 x i32 ], [10 x i32 ]* %r102, i32 0, i32 %r198
  %r200 = add i32 %r198, 1
  store i32 %r200, i32* %r105
  %r201 = add i32 %r198, 1
  %r202 = add i32 %r201, 0
  br label %bb1

bb3:
  %r203 = add i32 10, 0
  %r204 = call i32 @getint()
  %r205 = add i32 %r204, 0
  %r206 = sub i32 %r203, 1
  %r207 = add i32 %r206, 0
  %r208 = add i32 0, 0
  %r209 = add i32 %r207, %r208
  %r210 = sdiv i32 %r209, 2
  %r211 = add i32 %r210, 0
  br label %bb4

bb4:
  %r212 = phi i32 [ %r207, %bb3 ], [ %r231, %bb16 ]
  %r213 = phi i32 [ %r208, %bb3 ], [ %r232, %bb16 ]
  %r214 = phi i32 [ %r211, %bb3 ], [ %r228, %bb16 ]
  %r125 = getelementptr [10 x i32 ], [10 x i32 ]* %r102, i32 0, i32 %r214
  %r215 = load i32, i32* %r125
  %r216 = icmp ne i32 %r215, %r205
  br i1 %r216, label %bb8, label %bb9

bb8:
  %r218 = add i32 1, 0
  br label %bb10

bb9:
  %r217 = add i32 0, 0
  br label %bb10

bb10:
  %r219 = phi i32 [ %r218, %bb8 ], [ %r217, %bb9 ]
  %r220 = icmp ne i32 %r219, 0
  br i1 %r220, label %bb7, label %bb6

bb7:
  %r221 = icmp slt i32 %r213, %r212
  br i1 %r221, label %bb11, label %bb12

bb11:
  %r223 = add i32 1, 0
  br label %bb13

bb12:
  %r222 = add i32 0, 0
  br label %bb13

bb13:
  %r224 = phi i32 [ %r223, %bb11 ], [ %r222, %bb12 ]
  %r225 = icmp ne i32 %r224, 0
  br i1 %r225, label %bb5, label %bb6

bb5:
  %r226 = add i32 %r212, %r213
  %r227 = sdiv i32 %r226, 2
  %r228 = add i32 %r227, 0
  %r144 = getelementptr [10 x i32 ], [10 x i32 ]* %r102, i32 0, i32 %r228
  %r229 = load i32, i32* %r144
  %r230 = icmp slt i32 %r205, %r229
  br i1 %r230, label %bb14, label %bb15

bb14:
  %r235 = sub i32 %r228, 1
  %r236 = add i32 %r235, 0
  br label %bb16

bb15:
  %r233 = add i32 %r228, 1
  %r234 = add i32 %r233, 0
  br label %bb16

bb16:
  %r231 = phi i32 [ %r236, %bb14 ], [ %r212, %bb15 ]
  %r232 = phi i32 [ %r213, %bb14 ], [ %r234, %bb15 ]
  br label %bb4

bb6:
  %r154 = getelementptr [10 x i32 ], [10 x i32 ]* %r102, i32 0, i32 %r214
  %r237 = load i32, i32* %r154
  %r238 = icmp eq i32 %r205, %r237
  br i1 %r238, label %bb17, label %bb18

bb17:
  call void @putint(i32 %r205)
  br label %bb19

bb18:
  %r240 = add i32 0, 0
  call void @putint(i32 %r240)
  br label %bb19

bb19:
  %r239 = add i32 10, 0
  call void @putch(i32 %r239)
  call void @_sysy_stoptime(i32 49)
  ret i32 0
}

