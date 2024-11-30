declare i32 @getch( )
declare i32 @getint( )
declare void @putch( i32 )
declare void @putint( i32 )
declare void @putarray( i32, i32* )
declare void @_sysy_starttime( i32 )
declare void @_sysy_stoptime( i32 )
define i32 @main( ) {
main:
  %r183 = add i32 0, 0
  %r184 = add i32 0, 0
  %r185 = add i32 0, 0
  %r186 = add i32 0, 0
  %r187 = add i32 0, 0
  %r188 = add i32 0, 0
  %r189 = add i32 0, 0
  %r190 = add i32 0, 0
  %r191 = add i32 0, 0
  call void @_sysy_starttime(i32 3)
  %r192 = add i32 0, 0
  %r193 = add i32 0, 0
  %r102 = alloca [ 10 x i32 ]
  %r194 = add i32 0, 0
  %r195 = add i32 0, 0
  br label %bb1

bb1:
  %r196 = phi i32 [ %r195, %main ], [ %r200, %bb2 ]
  %r197 = icmp slt i32 %r196, 10
  br i1 %r197, label %bb2, label %bb3

bb2:
  %r105 = getelementptr [10 x i32 ], [10 x i32 ]* %r102, i32 0, i32 %r196
  %r198 = add i32 %r196, 1
  store i32 %r198, i32* %r105
  %r199 = add i32 %r196, 1
  %r200 = add i32 %r199, 0
  br label %bb1

bb3:
  %r201 = add i32 10, 0
  %r202 = call i32 @getint()
  %r203 = add i32 %r202, 0
  %r204 = sub i32 %r201, 1
  %r205 = add i32 %r204, 0
  %r206 = add i32 0, 0
  %r207 = add i32 %r205, %r206
  %r208 = sdiv i32 %r207, 2
  %r209 = add i32 %r208, 0
  %r210 = add i32 0, 0
  %r211 = add i32 0, 0
  %r212 = add i32 0, 0
  br label %bb4

bb4:
  %r213 = phi i32 [ %r211, %bb3 ], [ %r232, %bb16 ]
  %r214 = phi i32 [ %r210, %bb3 ], [ %r229, %bb16 ]
  %r215 = phi i32 [ %r212, %bb3 ], [ %r230, %bb16 ]
  %r216 = icmp slt i32 %r213, 10
  br i1 %r216, label %bb8, label %bb9

bb8:
  %r235 = add i32 1, 0
  br label %bb10

bb9:
  %r236 = add i32 0, 0
  br label %bb10

bb10:
  %r217 = phi i32 [ %r235, %bb8 ], [ %r236, %bb9 ]
  %r218 = icmp ne i32 %r217, 0
  br i1 %r218, label %bb7, label %bb6

bb7:
  %r222 = icmp eq i32 %r214, 0
  br i1 %r222, label %bb11, label %bb12

bb11:
  %r233 = add i32 1, 0
  br label %bb13

bb12:
  %r234 = add i32 0, 0
  br label %bb13

bb13:
  %r223 = phi i32 [ %r233, %bb11 ], [ %r234, %bb12 ]
  %r224 = icmp ne i32 %r223, 0
  br i1 %r224, label %bb5, label %bb6

bb5:
  %r137 = getelementptr [10 x i32 ], [10 x i32 ]* %r102, i32 0, i32 %r213
  %r225 = load i32, i32* %r137
  %r226 = icmp eq i32 %r225, %r203
  br i1 %r226, label %bb14, label %bb15

bb14:
  %r227 = add i32 1, 0
  %r228 = add i32 %r213, 0
  br label %bb16

bb15:
  br label %bb16

bb16:
  %r229 = phi i32 [ %r227, %bb14 ], [ %r214, %bb15 ]
  %r230 = phi i32 [ %r228, %bb14 ], [ %r215, %bb15 ]
  %r231 = add i32 %r213, 1
  %r232 = add i32 %r231, 0
  br label %bb4

bb6:
  %r219 = icmp eq i32 %r214, 1
  br i1 %r219, label %bb17, label %bb18

bb17:
  call void @putint(i32 %r215)
  br label %bb19

bb18:
  %r221 = add i32 0, 0
  call void @putint(i32 %r221)
  br label %bb19

bb19:
  %r220 = add i32 10, 0
  call void @putch(i32 %r220)
  call void @_sysy_stoptime(i32 53)
  ret i32 0
}

