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
  %r148 = add i32 0, 0
  %r149 = add i32 %r100, 0
  %r150 = add i32 0, 0
  %r151 = add i32 %r102, 0
  %r152 = sdiv i32 %r149, %r151
  %r153 = mul i32 %r152, %r151
  %r154 = sub i32 %r149, %r153
  ret i32 %r154
}

define i32 @split( i32 %r111, i32* %r113 ) {
split:
  %r161 = add i32 0, 0
  %r162 = add i32 %r111, 0
  %r163 = add i32 0, 0
  %r164 = load i32, i32* @N
  %r165 = sub i32 %r164, 1
  %r166 = add i32 %r165, 0
  br label %bb1

bb1:
  %r167 = phi i32 [ %r162, %split ], [ %r172, %bb2 ]
  %r168 = phi i32 [ %r166, %split ], [ %r174, %bb2 ]
  %r169 = icmp ne i32 %r168, -1
  br i1 %r169, label %bb2, label %bb3

bb2:
  %r119 = getelementptr i32, i32* %r113, i32 %r168
  %r170 = call i32 @mod(i32 %r167, i32 10)
  store i32 %r170, i32* %r119
  %r171 = sdiv i32 %r167, 10
  %r172 = add i32 %r171, 0
  %r173 = sub i32 %r168, 1
  %r174 = add i32 %r173, 0
  br label %bb1

bb3:
  ret i32 0
}

define i32 @main( ) {
main:
  call void @_sysy_starttime(i32 26)
  store i32 4, i32* @N
  store i32 10, i32* @newline
  %r184 = add i32 0, 0
  %r185 = add i32 0, 0
  %r129 = alloca [ 4 x i32 ]
  %r186 = add i32 1478, 0
  %r187 = call i32 @split(i32 %r186, i32* %r129)
  %r188 = add i32 %r187, 0
  %r189 = add i32 0, 0
  %r190 = add i32 0, 0
  br label %bb4

bb4:
  %r191 = phi i32 [ %r190, %main ], [ %r197, %bb5 ]
  %r192 = icmp slt i32 %r191, 4
  br i1 %r192, label %bb5, label %bb6

bb5:
  %r135 = getelementptr [4 x i32 ], [4 x i32 ]* %r129, i32 0, i32 %r191
  %r193 = load i32, i32* %r135
  %r194 = add i32 %r193, 0
  call void @putint(i32 %r194)
  %r195 = load i32, i32* @newline
  call void @putch(i32 %r195)
  %r196 = add i32 %r191, 1
  %r197 = add i32 %r196, 0
  br label %bb4

bb6:
  call void @_sysy_stoptime(i32 42)
  ret i32 0
}

