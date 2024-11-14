declare i32 @getch( )
declare i32 @getint( )
declare void @putint( i32 )
declare void @putch( i32 )
declare void @putarray( i32, i32* )
declare void @_sysy_starttime( i32 )
declare void @_sysy_stoptime( i32 )
define i32 @main( ) {
main:
  %r100 = alloca i32
  %r101 = alloca i32
  %r102 = alloca [ 10 x i32 ]
  store i32 0, i32* %r101
  store i32 0, i32* %r100
  br label %bb1

bb1:
  %r104 = load i32, i32* %r100
  %r103 = icmp slt i32 %r104, 10
  br i1 %r103, label %bb2, label %bb3

bb2:
  %r106 = load i32, i32* %r100
  %r105 = getelementptr [10 x i32 ], [10 x i32 ]* %r102, i32 0, i32 %r106
  %r107 = load i32, i32* %r100
  %r108 = add i32 %r107, 1
  store i32 %r108, i32* %r105
  %r109 = load i32, i32* %r100
  %r110 = add i32 %r109, 1
  store i32 %r110, i32* %r100
  br label %bb1

bb3:
  %r111 = alloca i32
  %r112 = alloca i32
  %r113 = alloca i32
  %r114 = alloca i32
  %r115 = alloca i32
  store i32 10, i32* %r115
  %r116 = call i32 @getint()
  store i32 %r116, i32* %r111
  %r117 = load i32, i32* %r115
  %r118 = sub i32 %r117, 1
  store i32 %r118, i32* %r112
  store i32 0, i32* %r113
  %r119 = load i32, i32* %r112
  %r120 = load i32, i32* %r113
  %r121 = add i32 %r119, %r120
  %r122 = sdiv i32 %r121, 2
  store i32 %r122, i32* %r114
  br label %bb4

bb4:
  %r123 = alloca i32
  %r126 = load i32, i32* %r114
  %r125 = getelementptr [10 x i32 ], [10 x i32 ]* %r102, i32 0, i32 %r126
  %r127 = load i32, i32* %r125
  %r128 = load i32, i32* %r111
  %r124 = icmp ne i32 %r127, %r128
  br i1 %r124, label %bb8, label %bb9

bb8:
  store i32 1, i32* %r123
  br label %bb10

bb9:
  store i32 0, i32* %r123
  br label %bb10

bb10:
  %r130 = load i32, i32* %r123
  %r129 = icmp ne i32 %r130, 0
  br i1 %r129, label %bb7, label %bb6

bb7:
  %r131 = alloca i32
  %r133 = load i32, i32* %r113
  %r134 = load i32, i32* %r112
  %r132 = icmp slt i32 %r133, %r134
  br i1 %r132, label %bb11, label %bb12

bb11:
  store i32 1, i32* %r131
  br label %bb13

bb12:
  store i32 0, i32* %r131
  br label %bb13

bb13:
  %r136 = load i32, i32* %r131
  %r135 = icmp ne i32 %r136, 0
  br i1 %r135, label %bb5, label %bb6

bb5:
  %r137 = load i32, i32* %r112
  %r138 = load i32, i32* %r113
  %r139 = add i32 %r137, %r138
  %r140 = sdiv i32 %r139, 2
  store i32 %r140, i32* %r114
  %r143 = load i32, i32* %r111
  %r145 = load i32, i32* %r114
  %r144 = getelementptr [10 x i32 ], [10 x i32 ]* %r102, i32 0, i32 %r145
  %r146 = load i32, i32* %r144
  %r142 = icmp slt i32 %r143, %r146
  br i1 %r142, label %bb14, label %bb15

bb14:
  %r147 = load i32, i32* %r114
  %r148 = sub i32 %r147, 1
  store i32 %r148, i32* %r112
  br label %bb16

bb15:
  %r149 = load i32, i32* %r114
  %r150 = add i32 %r149, 1
  store i32 %r150, i32* %r113
  br label %bb16

bb16:
  br label %bb4

bb6:
  %r153 = load i32, i32* %r111
  %r155 = load i32, i32* %r114
  %r154 = getelementptr [10 x i32 ], [10 x i32 ]* %r102, i32 0, i32 %r155
  %r156 = load i32, i32* %r154
  %r152 = icmp eq i32 %r153, %r156
  br i1 %r152, label %bb17, label %bb18

bb17:
  %r157 = load i32, i32* %r111
  call void @putint(i32 %r157)
  br label %bb19

bb18:
  store i32 0, i32* %r111
  %r158 = load i32, i32* %r111
  call void @putint(i32 %r158)
  br label %bb19

bb19:
  store i32 10, i32* %r111
  %r159 = load i32, i32* %r111
  call void @putch(i32 %r159)
  ret i32 0
}

