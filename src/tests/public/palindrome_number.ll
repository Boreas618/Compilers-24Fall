declare i32 @getch( )
declare i32 @getint( )
declare void @putch( i32 )
declare void @putint( i32 )
declare void @putarray( i32, i32* )
declare void @_sysy_starttime( i32 )
declare void @_sysy_stoptime( i32 )
define i32 @mod( i32 %r100, i32 %r102 ) {
mod:
  %r156 = add i32 0, 0
  %r157 = add i32 %r100, 0
  %r158 = add i32 0, 0
  %r159 = add i32 %r102, 0
  %r160 = sdiv i32 %r157, %r159
  %r161 = mul i32 %r160, %r159
  %r162 = sub i32 %r157, %r161
  ret i32 %r162
}

define i32 @palindrome( i32 %r111 ) {
palindrome:
  %r168 = add i32 0, 0
  %r169 = add i32 0, 0
  %r170 = add i32 0, 0
  %r171 = add i32 %r111, 0
  %r113 = alloca [ 4 x i32 ]
  %r172 = add i32 0, 0
  %r173 = add i32 0, 0
  %r174 = add i32 0, 0
  br label %bb1

bb1:
  %r175 = phi i32 [ %r174, %palindrome ], [ %r182, %bb2 ]
  %r176 = phi i32 [ %r171, %palindrome ], [ %r180, %bb2 ]
  %r177 = icmp slt i32 %r175, 4
  br i1 %r177, label %bb2, label %bb3

bb2:
  %r118 = getelementptr [4 x i32 ], [4 x i32 ]* %r113, i32 0, i32 %r175
  %r178 = call i32 @mod(i32 %r176, i32 10)
  store i32 %r178, i32* %r118
  %r179 = sdiv i32 %r176, 10
  %r180 = add i32 %r179, 0
  %r181 = add i32 %r175, 1
  %r182 = add i32 %r181, 0
  br label %bb1

bb3:
  %r129 = getelementptr [4 x i32 ], [4 x i32 ]* %r113, i32 0, i32 0
  %r183 = load i32, i32* %r129
  %r131 = getelementptr [4 x i32 ], [4 x i32 ]* %r113, i32 0, i32 3
  %r184 = load i32, i32* %r131
  %r185 = icmp eq i32 %r183, %r184
  br i1 %r185, label %bb8, label %bb9

bb8:
  %r199 = add i32 1, 0
  br label %bb10

bb9:
  %r186 = add i32 0, 0
  br label %bb10

bb10:
  %r187 = phi i32 [ %r199, %bb8 ], [ %r186, %bb9 ]
  %r188 = icmp ne i32 %r187, 0
  br i1 %r188, label %bb7, label %bb5

bb7:
  %r137 = getelementptr [4 x i32 ], [4 x i32 ]* %r113, i32 0, i32 1
  %r189 = load i32, i32* %r137
  %r139 = getelementptr [4 x i32 ], [4 x i32 ]* %r113, i32 0, i32 2
  %r190 = load i32, i32* %r139
  %r191 = icmp eq i32 %r189, %r190
  br i1 %r191, label %bb11, label %bb12

bb11:
  %r195 = add i32 1, 0
  br label %bb13

bb12:
  %r196 = add i32 0, 0
  br label %bb13

bb13:
  %r192 = phi i32 [ %r195, %bb11 ], [ %r196, %bb12 ]
  %r193 = icmp ne i32 %r192, 0
  br i1 %r193, label %bb4, label %bb5

bb4:
  %r194 = add i32 1, 0
  br label %bb6

bb5:
  %r197 = add i32 0, 0
  br label %bb6

bb6:
  %r198 = phi i32 [ %r194, %bb4 ], [ %r197, %bb5 ]
  ret i32 %r198
}

define i32 @main( ) {
main:
  call void @_sysy_starttime(i32 30)
  %r202 = add i32 0, 0
  %r203 = add i32 1221, 0
  %r204 = add i32 0, 0
  %r205 = call i32 @palindrome(i32 %r203)
  %r206 = add i32 %r205, 0
  %r207 = icmp eq i32 %r206, 1
  br i1 %r207, label %bb14, label %bb15

bb14:
  call void @putint(i32 %r203)
  br label %bb16

bb15:
  %r209 = add i32 0, 0
  call void @putint(i32 %r209)
  br label %bb16

bb16:
  %r208 = add i32 10, 0
  call void @putch(i32 %r208)
  call void @_sysy_stoptime(i32 47)
  ret i32 0
}

