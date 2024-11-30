declare i32 @getch( )
declare i32 @getint( )
declare void @putch( i32 )
declare void @putint( i32 )
declare void @putarray( i32, i32* )
declare void @_sysy_starttime( i32 )
declare void @_sysy_stoptime( i32 )
@N = global i32 0
define i32 @insert( i32* %r100, i32 %r101 ) {
insert:
  %r170 = add i32 0, 0
  %r171 = add i32 0, 0
  %r172 = add i32 0, 0
  %r173 = add i32 0, 0
  %r174 = add i32 %r101, 0
  %r175 = add i32 0, 0
  %r176 = add i32 0, 0
  %r177 = add i32 0, 0
  br label %bb1

bb1:
  %r178 = phi i32 [ %r177, %insert ], [ %r198, %bb2 ]
  %r108 = getelementptr i32, i32* %r100, i32 %r178
  %r179 = load i32, i32* %r108
  %r180 = icmp sgt i32 %r174, %r179
  br i1 %r180, label %bb5, label %bb6

bb5:
  %r200 = add i32 1, 0
  br label %bb7

bb6:
  %r201 = add i32 0, 0
  br label %bb7

bb7:
  %r181 = phi i32 [ %r200, %bb5 ], [ %r201, %bb6 ]
  %r182 = icmp ne i32 %r181, 0
  br i1 %r182, label %bb4, label %bb3

bb4:
  %r192 = load i32, i32* @N
  %r193 = icmp slt i32 %r178, %r192
  br i1 %r193, label %bb8, label %bb9

bb8:
  %r194 = add i32 1, 0
  br label %bb10

bb9:
  %r199 = add i32 0, 0
  br label %bb10

bb10:
  %r195 = phi i32 [ %r194, %bb8 ], [ %r199, %bb9 ]
  %r196 = icmp ne i32 %r195, 0
  br i1 %r196, label %bb2, label %bb3

bb2:
  %r197 = add i32 %r178, 1
  %r198 = add i32 %r197, 0
  br label %bb1

bb3:
  %r183 = load i32, i32* @N
  %r184 = add i32 %r183, 0
  br label %bb11

bb11:
  %r185 = phi i32 [ %r184, %bb3 ], [ %r191, %bb12 ]
  %r186 = icmp sgt i32 %r185, %r178
  br i1 %r186, label %bb12, label %bb13

bb12:
  %r187 = sub i32 %r185, 1
  %r188 = add i32 %r187, 0
  %r128 = getelementptr i32, i32* %r100, i32 %r185
  %r130 = getelementptr i32, i32* %r100, i32 %r188
  %r189 = load i32, i32* %r130
  store i32 %r189, i32* %r128
  %r133 = getelementptr i32, i32* %r100, i32 %r178
  store i32 %r174, i32* %r133
  %r190 = sub i32 %r185, 1
  %r191 = add i32 %r190, 0
  br label %bb11

bb13:
  ret i32 0
}

define i32 @main( ) {
main:
  call void @_sysy_starttime(i32 27)
  store i32 10, i32* @N
  %r138 = alloca [ 11 x i32 ]
  %r139 = getelementptr [11 x i32 ], [11 x i32 ]* %r138, i32 0, i32 0
  store i32 1, i32* %r139
  %r140 = getelementptr [11 x i32 ], [11 x i32 ]* %r138, i32 0, i32 1
  store i32 3, i32* %r140
  %r141 = getelementptr [11 x i32 ], [11 x i32 ]* %r138, i32 0, i32 2
  store i32 4, i32* %r141
  %r142 = getelementptr [11 x i32 ], [11 x i32 ]* %r138, i32 0, i32 3
  store i32 7, i32* %r142
  %r143 = getelementptr [11 x i32 ], [11 x i32 ]* %r138, i32 0, i32 4
  store i32 8, i32* %r143
  %r144 = getelementptr [11 x i32 ], [11 x i32 ]* %r138, i32 0, i32 5
  store i32 11, i32* %r144
  %r145 = getelementptr [11 x i32 ], [11 x i32 ]* %r138, i32 0, i32 6
  store i32 13, i32* %r145
  %r146 = getelementptr [11 x i32 ], [11 x i32 ]* %r138, i32 0, i32 7
  store i32 18, i32* %r146
  %r147 = getelementptr [11 x i32 ], [11 x i32 ]* %r138, i32 0, i32 8
  store i32 56, i32* %r147
  %r148 = getelementptr [11 x i32 ], [11 x i32 ]* %r138, i32 0, i32 9
  store i32 78, i32* %r148
  %r204 = add i32 0, 0
  %r205 = add i32 0, 0
  %r206 = add i32 0, 0
  %r207 = call i32 @getint()
  %r208 = add i32 %r207, 0
  %r209 = call i32 @insert(i32* %r138, i32 %r208)
  %r210 = add i32 %r209, 0
  br label %bb14

bb14:
  %r211 = phi i32 [ %r206, %main ], [ %r218, %bb15 ]
  %r212 = load i32, i32* @N
  %r213 = icmp slt i32 %r211, %r212
  br i1 %r213, label %bb15, label %bb16

bb15:
  %r157 = getelementptr [11 x i32 ], [11 x i32 ]* %r138, i32 0, i32 %r211
  %r214 = load i32, i32* %r157
  %r215 = add i32 %r214, 0
  call void @putint(i32 %r215)
  %r216 = add i32 10, 0
  call void @putch(i32 %r216)
  %r217 = add i32 %r211, 1
  %r218 = add i32 %r217, 0
  br label %bb14

bb16:
  call void @_sysy_stoptime(i32 54)
  ret i32 0
}

