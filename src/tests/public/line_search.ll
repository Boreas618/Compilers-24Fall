declare i32 @getch( )
declare i32 @getint( )
declare void @putch( i32 )
declare void @putint( i32 )
declare void @putarray( i32, i32* )
declare void @_sysy_starttime( i32 )
declare void @_sysy_stoptime( i32 )
define i32 @main( ) {
main:
  %r161 = add i32 0, 0
  %r162 = add i32 0, 0
  %r163 = add i32 0, 0
  %r164 = add i32 0, 0
  %r165 = add i32 0, 0
  %r166 = add i32 0, 0
  %r167 = add i32 0, 0
  %r168 = add i32 0, 0
  %r169 = add i32 0, 0
  call void @_sysy_starttime(i32 3)
  %r170 = add i32 0, 0
  %r171 = add i32 0, 0
  %r102 = alloca [ 10 x i32 ]
  %r172 = add i32 0, 0
  %r173 = add i32 0, 0
  br label %bb1

bb1:
  %r174 = phi i32 [ %r173, %main ], [ %r178, %bb2 ]
  %r175 = icmp slt i32 %r174, 10
  br i1 %r175, label %bb2, label %bb3

bb2:
  %r105 = getelementptr [10 x i32 ], [10 x i32 ]* %r102, i32 0, i32 %r174
  %r176 = add i32 %r174, 1
  store i32 %r176, i32* %r105
  %r177 = add i32 %r174, 1
  %r178 = add i32 %r177, 0
  br label %bb1

bb3:
  %r179 = add i32 10, 0
  %r180 = call i32 @getint()
  %r181 = add i32 %r180, 0
  %r182 = sub i32 %r179, 1
  %r183 = add i32 %r182, 0
  %r184 = add i32 0, 0
  %r185 = add i32 %r183, %r184
  %r186 = sdiv i32 %r185, 2
  %r187 = add i32 %r186, 0
  %r188 = add i32 0, 0
  %r189 = add i32 0, 0
  %r190 = add i32 0, 0
  br label %bb4

bb4:
  %r191 = phi i32 [ %r190, %bb3 ], [ %r205, %bb16 ]
  %r192 = phi i32 [ %r189, %bb3 ], [ %r208, %bb16 ]
  %r193 = phi i32 [ %r188, %bb3 ], [ %r206, %bb16 ]
  %r194 = icmp slt i32 %r192, 10
  br i1 %r194, label %bb8, label %bb9

bb8:
  %r213 = add i32 1, 0
  br label %bb10

bb9:
  %r214 = add i32 0, 0
  br label %bb10

bb10:
  %r195 = phi i32 [ %r213, %bb8 ], [ %r214, %bb9 ]
  %r196 = icmp ne i32 %r195, 0
  br i1 %r196, label %bb7, label %bb6

bb7:
  %r200 = icmp eq i32 %r193, 0
  br i1 %r200, label %bb11, label %bb12

bb11:
  %r212 = add i32 1, 0
  br label %bb13

bb12:
  %r211 = add i32 0, 0
  br label %bb13

bb13:
  %r201 = phi i32 [ %r212, %bb11 ], [ %r211, %bb12 ]
  %r202 = icmp ne i32 %r201, 0
  br i1 %r202, label %bb5, label %bb6

bb5:
  %r137 = getelementptr [10 x i32 ], [10 x i32 ]* %r102, i32 0, i32 %r192
  %r203 = load i32, i32* %r137
  %r204 = icmp eq i32 %r203, %r181
  br i1 %r204, label %bb14, label %bb15

bb14:
  %r209 = add i32 1, 0
  %r210 = add i32 %r192, 0
  br label %bb16

bb15:
  br label %bb16

bb16:
  %r205 = phi i32 [ %r210, %bb14 ], [ %r191, %bb15 ]
  %r206 = phi i32 [ %r209, %bb14 ], [ %r193, %bb15 ]
  %r207 = add i32 %r192, 1
  %r208 = add i32 %r207, 0
  br label %bb4

bb6:
  %r197 = icmp eq i32 %r193, 1
  br i1 %r197, label %bb17, label %bb18

bb17:
  call void @putint(i32 %r191)
  br label %bb19

bb18:
  %r199 = add i32 0, 0
  call void @putint(i32 %r199)
  br label %bb19

bb19:
  %r198 = add i32 10, 0
  call void @putch(i32 %r198)
  call void @_sysy_stoptime(i32 53)
  ret i32 0
}

