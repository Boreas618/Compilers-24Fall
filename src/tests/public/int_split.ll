declare i32 @getch( )
declare i32 @getint( )
declare void @putch( i32 )
declare void @putint( i32 )
declare void @putarray( i32, i32* )
declare void @_sysy_starttime( i32 )
declare void @_sysy_stoptime( i32 )
@N = global i32 0
@newline = global i32 0
define i32 @mod( i32 %r100, i32 %r102 ) {
mod:
  %r144 = add i32 0, 0
  %r145 = add i32 %r100, 0
  %r146 = add i32 0, 0
  %r147 = add i32 %r102, 0
  %r148 = sdiv i32 %r145, %r147
  %r149 = mul i32 %r148, %r147
  %r150 = sub i32 %r145, %r149
  ret i32 %r150
}

define i32 @split( i32 %r111, i32* %r113 ) {
split:
  %r153 = add i32 0, 0
  %r154 = add i32 %r111, 0
  %r155 = add i32 0, 0
  %r156 = load i32, i32* @N
  %r157 = sub i32 %r156, 1
  %r158 = add i32 %r157, 0
  br label %bb1

bb1:
  %r159 = phi i32 [ %r158, %split ], [ %r166, %bb2 ]
  %r160 = phi i32 [ %r154, %split ], [ %r164, %bb2 ]
  %r161 = icmp ne i32 %r159, -1
  br i1 %r161, label %bb2, label %bb3

bb2:
  %r119 = getelementptr i32, i32* %r113, i32 %r159
  %r162 = call i32 @mod(i32 %r160, i32 10)
  store i32 %r162, i32* %r119
  %r163 = sdiv i32 %r160, 10
  %r164 = add i32 %r163, 0
  %r165 = sub i32 %r159, 1
  %r166 = add i32 %r165, 0
  br label %bb1

bb3:
  ret i32 0
}

define i32 @main( ) {
main:
  call void @_sysy_starttime(i32 26)
  store i32 4, i32* @N
  store i32 10, i32* @newline
  %r170 = add i32 0, 0
  %r171 = add i32 0, 0
  %r129 = alloca [ 4 x i32 ]
  %r172 = add i32 1478, 0
  %r173 = call i32 @split(i32 %r172, i32* %r129)
  %r174 = add i32 %r173, 0
  %r175 = add i32 0, 0
  %r176 = add i32 0, 0
  br label %bb4

bb4:
  %r177 = phi i32 [ %r176, %main ], [ %r183, %bb5 ]
  %r178 = icmp slt i32 %r177, 4
  br i1 %r178, label %bb5, label %bb6

bb5:
  %r135 = getelementptr [4 x i32 ], [4 x i32 ]* %r129, i32 0, i32 %r177
  %r179 = load i32, i32* %r135
  %r180 = add i32 %r179, 0
  call void @putint(i32 %r180)
  %r181 = load i32, i32* @newline
  call void @putch(i32 %r181)
  %r182 = add i32 %r177, 1
  %r183 = add i32 %r182, 0
  br label %bb4

bb6:
  call void @_sysy_stoptime(i32 42)
  ret i32 0
}

