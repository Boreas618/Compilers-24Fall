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
  %r182 = add i32 0, 0
  %r183 = add i32 0, 0
  %r184 = add i32 0, 0
  %r185 = add i32 0, 0
  %r186 = add i32 %r101, 0
  %r187 = add i32 0, 0
  %r188 = add i32 0, 0
  %r189 = add i32 0, 0
  br label %bb1

bb1:
  %r190 = phi i32 [ %r189, %insert ], [ %r203, %bb2 ]
  %r108 = getelementptr i32, i32* %r100, i32 %r190
  %r191 = load i32, i32* %r108
  %r192 = icmp sgt i32 %r186, %r191
  br i1 %r192, label %bb5, label %bb6

bb5:
  %r193 = add i32 1, 0
  br label %bb7

bb6:
  %r213 = add i32 0, 0
  br label %bb7

bb7:
  %r194 = phi i32 [ %r193, %bb5 ], [ %r213, %bb6 ]
  %r195 = icmp ne i32 %r194, 0
  br i1 %r195, label %bb4, label %bb3

bb4:
  %r196 = load i32, i32* @N
  %r197 = icmp slt i32 %r190, %r196
  br i1 %r197, label %bb8, label %bb9

bb8:
  %r198 = add i32 1, 0
  br label %bb10

bb9:
  %r199 = add i32 0, 0
  br label %bb10

bb10:
  %r200 = phi i32 [ %r198, %bb8 ], [ %r199, %bb9 ]
  %r201 = icmp ne i32 %r200, 0
  br i1 %r201, label %bb2, label %bb3

bb2:
  %r202 = add i32 %r190, 1
  %r203 = add i32 %r202, 0
  br label %bb1

bb3:
  %r204 = load i32, i32* @N
  %r205 = add i32 %r204, 0
  br label %bb11

bb11:
  %r206 = phi i32 [ %r205, %bb3 ], [ %r212, %bb12 ]
  %r207 = icmp sgt i32 %r206, %r190
  br i1 %r207, label %bb12, label %bb13

bb12:
  %r208 = sub i32 %r206, 1
  %r209 = add i32 %r208, 0
  %r128 = getelementptr i32, i32* %r100, i32 %r206
  %r130 = getelementptr i32, i32* %r100, i32 %r209
  %r210 = load i32, i32* %r130
  store i32 %r210, i32* %r128
  %r133 = getelementptr i32, i32* %r100, i32 %r190
  store i32 %r186, i32* %r133
  %r211 = sub i32 %r206, 1
  %r212 = add i32 %r211, 0
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
  %r220 = add i32 0, 0
  %r221 = add i32 0, 0
  %r222 = add i32 0, 0
  %r223 = call i32 @getint()
  %r224 = add i32 %r223, 0
  %r225 = call i32 @insert(i32* %r138, i32 %r224)
  %r226 = add i32 %r225, 0
  br label %bb14

bb14:
  %r227 = phi i32 [ %r222, %main ], [ %r234, %bb15 ]
  %r228 = load i32, i32* @N
  %r229 = icmp slt i32 %r227, %r228
  br i1 %r229, label %bb15, label %bb16

bb15:
  %r157 = getelementptr [11 x i32 ], [11 x i32 ]* %r138, i32 0, i32 %r227
  %r230 = load i32, i32* %r157
  %r231 = add i32 %r230, 0
  call void @putint(i32 %r231)
  %r232 = add i32 10, 0
  call void @putch(i32 %r232)
  %r233 = add i32 %r227, 1
  %r234 = add i32 %r233, 0
  br label %bb14

bb16:
  call void @_sysy_stoptime(i32 54)
  ret i32 0
}

