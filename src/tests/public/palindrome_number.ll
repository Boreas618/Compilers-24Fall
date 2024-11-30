declare i32 @getch( )
declare i32 @getint( )
declare void @putch( i32 )
declare void @putint( i32 )
declare void @putarray( i32, i32* )
declare void @_sysy_starttime( i32 )
declare void @_sysy_stoptime( i32 )
define i32 @mod( i32 %r100, i32 %r102 ) {
mod:
  %r160 = add i32 0, 0
  %r161 = add i32 %r100, 0
  %r162 = add i32 0, 0
  %r163 = add i32 %r102, 0
  %r164 = sdiv i32 %r161, %r163
  %r165 = mul i32 %r164, %r163
  %r166 = sub i32 %r161, %r165
  ret i32 %r166
}

define i32 @palindrome( i32 %r111 ) {
palindrome:
  %r182 = add i32 0, 0
  %r183 = add i32 0, 0
  %r184 = add i32 0, 0
  %r185 = add i32 %r111, 0
  %r113 = alloca [ 4 x i32 ]
  %r186 = add i32 0, 0
  %r187 = add i32 0, 0
  %r188 = add i32 0, 0
  br label %bb1

bb1:
  %r189 = phi i32 [ %r185, %palindrome ], [ %r194, %bb2 ]
  %r190 = phi i32 [ %r188, %palindrome ], [ %r196, %bb2 ]
  %r191 = icmp slt i32 %r190, 4
  br i1 %r191, label %bb2, label %bb3

bb2:
  %r118 = getelementptr [4 x i32 ], [4 x i32 ]* %r113, i32 0, i32 %r190
  %r192 = call i32 @mod(i32 %r189, i32 10)
  store i32 %r192, i32* %r118
  %r193 = sdiv i32 %r189, 10
  %r194 = add i32 %r193, 0
  %r195 = add i32 %r190, 1
  %r196 = add i32 %r195, 0
  br label %bb1

bb3:
  %r129 = getelementptr [4 x i32 ], [4 x i32 ]* %r113, i32 0, i32 0
  %r197 = load i32, i32* %r129
  %r131 = getelementptr [4 x i32 ], [4 x i32 ]* %r113, i32 0, i32 3
  %r198 = load i32, i32* %r131
  %r199 = icmp eq i32 %r197, %r198
  br i1 %r199, label %bb8, label %bb9

bb8:
  %r213 = add i32 1, 0
  br label %bb10

bb9:
  %r212 = add i32 0, 0
  br label %bb10

bb10:
  %r200 = phi i32 [ %r213, %bb8 ], [ %r212, %bb9 ]
  %r201 = icmp ne i32 %r200, 0
  br i1 %r201, label %bb7, label %bb5

bb7:
  %r137 = getelementptr [4 x i32 ], [4 x i32 ]* %r113, i32 0, i32 1
  %r204 = load i32, i32* %r137
  %r139 = getelementptr [4 x i32 ], [4 x i32 ]* %r113, i32 0, i32 2
  %r205 = load i32, i32* %r139
  %r206 = icmp eq i32 %r204, %r205
  br i1 %r206, label %bb11, label %bb12

bb11:
  %r211 = add i32 1, 0
  br label %bb13

bb12:
  %r207 = add i32 0, 0
  br label %bb13

bb13:
  %r208 = phi i32 [ %r211, %bb11 ], [ %r207, %bb12 ]
  %r209 = icmp ne i32 %r208, 0
  br i1 %r209, label %bb4, label %bb5

bb4:
  %r210 = add i32 1, 0
  br label %bb6

bb5:
  %r203 = add i32 0, 0
  br label %bb6

bb6:
  %r202 = phi i32 [ %r210, %bb4 ], [ %r203, %bb5 ]
  ret i32 %r202
}

define i32 @main( ) {
main:
  call void @_sysy_starttime(i32 30)
  %r220 = add i32 0, 0
  %r221 = add i32 1221, 0
  %r222 = add i32 0, 0
  %r223 = call i32 @palindrome(i32 %r221)
  %r224 = add i32 %r223, 0
  %r225 = icmp eq i32 %r224, 1
  br i1 %r225, label %bb14, label %bb15

bb14:
  call void @putint(i32 %r221)
  br label %bb16

bb15:
  %r227 = add i32 0, 0
  call void @putint(i32 %r227)
  br label %bb16

bb16:
  %r226 = add i32 10, 0
  call void @putch(i32 %r226)
  call void @_sysy_stoptime(i32 47)
  ret i32 0
}

