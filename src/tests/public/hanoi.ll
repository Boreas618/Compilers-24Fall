declare i32 @getch( )
declare i32 @getint( )
declare void @putch( i32 )
declare void @putint( i32 )
declare void @putarray( i32, i32* )
declare void @_sysy_starttime( i32 )
declare void @_sysy_stoptime( i32 )
define void @move( i32 %r100, i32 %r102 ) {
move:
  %r140 = add i32 0, 0
  %r141 = add i32 %r100, 0
  %r142 = add i32 0, 0
  %r143 = add i32 %r102, 0
  call void @putint(i32 %r141)
  call void @putch(i32 32)
  call void @putint(i32 %r143)
  call void @putch(i32 44)
  call void @putch(i32 32)
  ret void
}

define void @hanoi( i32 %r106, i32 %r108, i32 %r110, i32 %r112 ) {
hanoi:
  %r148 = add i32 0, 0
  %r149 = add i32 %r106, 0
  %r150 = add i32 0, 0
  %r151 = add i32 %r108, 0
  %r152 = add i32 0, 0
  %r153 = add i32 %r110, 0
  %r154 = add i32 0, 0
  %r155 = add i32 %r112, 0
  %r156 = icmp eq i32 %r149, 1
  br i1 %r156, label %bb1, label %bb2

bb1:
  call void @move(i32 %r151, i32 %r155)
  br label %bb3

bb2:
  %r157 = sub i32 %r149, 1
  call void @hanoi(i32 %r157, i32 %r151, i32 %r155, i32 %r153)
  call void @move(i32 %r151, i32 %r155)
  %r158 = sub i32 %r149, 1
  call void @hanoi(i32 %r158, i32 %r153, i32 %r151, i32 %r155)
  br label %bb3

bb3:
  ret void
}

define i32 @main( ) {
main:
  call void @_sysy_starttime(i32 21)
  %r160 = call i32 @getint()
  %r161 = add i32 0, 0
  %r162 = add i32 %r160, 0
  br label %bb4

bb4:
  %r163 = phi i32 [ %r162, %main ], [ %r167, %bb5 ]
  %r164 = icmp sgt i32 %r163, 0
  br i1 %r164, label %bb5, label %bb6

bb5:
  %r165 = call i32 @getint()
  call void @hanoi(i32 %r165, i32 1, i32 2, i32 3)
  call void @putch(i32 10)
  %r166 = sub i32 %r163, 1
  %r167 = add i32 %r166, 0
  br label %bb4

bb6:
  call void @_sysy_stoptime(i32 28)
  ret i32 0
}

