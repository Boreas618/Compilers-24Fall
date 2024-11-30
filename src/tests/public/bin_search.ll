declare i32 @getch( )
declare i32 @getint( )
declare void @putch( i32 )
declare void @putint( i32 )
declare void @putarray( i32, i32* )
declare void @_sysy_starttime( i32 )
declare void @_sysy_stoptime( i32 )
define i32 @main( ) {
main:
  %r169 = add i32 0, 0
  %r170 = add i32 0, 0
  %r171 = add i32 0, 0
  %r172 = add i32 0, 0
  %r173 = add i32 0, 0
  %r174 = add i32 0, 0
  %r175 = add i32 0, 0
  call void @_sysy_starttime(i32 3)
  %r176 = add i32 0, 0
  %r177 = add i32 0, 0
  %r102 = alloca [ 10 x i32 ]
  %r178 = add i32 0, 0
  %r179 = add i32 0, 0
  br label %bb1

bb1:
  %r180 = phi i32 [ %r179, %main ], [ %r184, %bb2 ]
  %r181 = icmp slt i32 %r180, 10
  br i1 %r181, label %bb2, label %bb3

bb2:
  %r105 = getelementptr [10 x i32 ], [10 x i32 ]* %r102, i32 0, i32 %r180
  %r182 = add i32 %r180, 1
  store i32 %r182, i32* %r105
  %r183 = add i32 %r180, 1
  %r184 = add i32 %r183, 0
  br label %bb1

bb3:
  %r185 = add i32 10, 0
  %r186 = call i32 @getint()
  %r187 = add i32 %r186, 0
  %r188 = sub i32 %r185, 1
  %r189 = add i32 %r188, 0
  %r190 = add i32 0, 0
  %r191 = add i32 %r189, %r190
  %r192 = sdiv i32 %r191, 2
  %r193 = add i32 %r192, 0
  br label %bb4

bb4:
  %r194 = phi i32 [ %r193, %bb3 ], [ %r207, %bb16 ]
  %r195 = phi i32 [ %r189, %bb3 ], [ %r210, %bb16 ]
  %r196 = phi i32 [ %r190, %bb3 ], [ %r211, %bb16 ]
  %r125 = getelementptr [10 x i32 ], [10 x i32 ]* %r102, i32 0, i32 %r194
  %r197 = load i32, i32* %r125
  %r198 = icmp ne i32 %r197, %r187
  br i1 %r198, label %bb8, label %bb9

bb8:
  %r199 = add i32 1, 0
  br label %bb10

bb9:
  %r222 = add i32 0, 0
  br label %bb10

bb10:
  %r200 = phi i32 [ %r199, %bb8 ], [ %r222, %bb9 ]
  %r201 = icmp ne i32 %r200, 0
  br i1 %r201, label %bb7, label %bb6

bb7:
  %r202 = icmp slt i32 %r196, %r195
  br i1 %r202, label %bb11, label %bb12

bb11:
  %r217 = add i32 1, 0
  br label %bb13

bb12:
  %r216 = add i32 0, 0
  br label %bb13

bb13:
  %r203 = phi i32 [ %r217, %bb11 ], [ %r216, %bb12 ]
  %r204 = icmp ne i32 %r203, 0
  br i1 %r204, label %bb5, label %bb6

bb5:
  %r205 = add i32 %r195, %r196
  %r206 = sdiv i32 %r205, 2
  %r207 = add i32 %r206, 0
  %r144 = getelementptr [10 x i32 ], [10 x i32 ]* %r102, i32 0, i32 %r207
  %r208 = load i32, i32* %r144
  %r209 = icmp slt i32 %r187, %r208
  br i1 %r209, label %bb14, label %bb15

bb14:
  %r214 = sub i32 %r207, 1
  %r215 = add i32 %r214, 0
  br label %bb16

bb15:
  %r212 = add i32 %r207, 1
  %r213 = add i32 %r212, 0
  br label %bb16

bb16:
  %r210 = phi i32 [ %r215, %bb14 ], [ %r195, %bb15 ]
  %r211 = phi i32 [ %r196, %bb14 ], [ %r213, %bb15 ]
  br label %bb4

bb6:
  %r154 = getelementptr [10 x i32 ], [10 x i32 ]* %r102, i32 0, i32 %r194
  %r218 = load i32, i32* %r154
  %r219 = icmp eq i32 %r187, %r218
  br i1 %r219, label %bb17, label %bb18

bb17:
  call void @putint(i32 %r187)
  br label %bb19

bb18:
  %r221 = add i32 0, 0
  call void @putint(i32 %r221)
  br label %bb19

bb19:
  %r220 = add i32 10, 0
  call void @putch(i32 %r220)
  call void @_sysy_stoptime(i32 49)
  ret i32 0
}

