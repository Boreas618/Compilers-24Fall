declare i32 @getch( )
declare i32 @getint( )
declare void @putch( i32 )
declare void @putint( i32 )
declare void @putarray( i32, i32* )
declare void @_sysy_starttime( i32 )
declare void @_sysy_stoptime( i32 )
define void @move( i32 %r100, i32 %r102 ) {
move:
  %r144 = add i32 0, 0
  %r145 = add i32 %r100, 0
  %r146 = add i32 0, 0
  %r147 = add i32 %r102, 0
  call void @putint(i32 %r145)
  call void @putch(i32 32)
  call void @putint(i32 %r147)
  call void @putch(i32 44)
  call void @putch(i32 32)
  ret void
}

define void @hanoi( i32 %r106, i32 %r108, i32 %r110, i32 %r112 ) {
hanoi:
  %r160 = add i32 0, 0
  %r161 = add i32 %r106, 0
  %r162 = add i32 0, 0
  %r163 = add i32 %r108, 0
  %r164 = add i32 0, 0
  %r165 = add i32 %r110, 0
  %r166 = add i32 0, 0
  %r167 = add i32 %r112, 0
  %r168 = icmp eq i32 %r161, 1
  br i1 %r168, label %bb1, label %bb2

bb1:
  call void @move(i32 %r163, i32 %r167)
  br label %bb3

bb2:
  %r169 = sub i32 %r161, 1
  call void @hanoi(i32 %r169, i32 %r163, i32 %r167, i32 %r165)
  call void @move(i32 %r163, i32 %r167)
  %r170 = sub i32 %r161, 1
  call void @hanoi(i32 %r170, i32 %r165, i32 %r163, i32 %r167)
  br label %bb3

bb3:
  ret void
}

define i32 @main( ) {
main:
  call void @_sysy_starttime(i32 21)
  %r174 = call i32 @getint()
  %r175 = add i32 0, 0
  %r176 = add i32 %r174, 0
  br label %bb4

bb4:
  %r177 = phi i32 [ %r176, %main ], [ %r181, %bb5 ]
  %r178 = icmp sgt i32 %r177, 0
  br i1 %r178, label %bb5, label %bb6

bb5:
  %r179 = call i32 @getint()
  call void @hanoi(i32 %r179, i32 1, i32 2, i32 3)
  call void @putch(i32 10)
  %r180 = sub i32 %r177, 1
  %r181 = add i32 %r180, 0
  br label %bb4

bb6:
  call void @_sysy_stoptime(i32 28)
  ret i32 0
}

