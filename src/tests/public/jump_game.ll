declare i32 @getch( )
declare i32 @getint( )
declare void @putch( i32 )
declare void @putint( i32 )
declare void @putarray( i32, i32* )
declare void @_sysy_starttime( i32 )
declare void @_sysy_stoptime( i32 )
define i32 @canJump( i32* %r100, i32 %r101 ) {
canJump:
  %r185 = add i32 0, 0
  %r186 = add i32 0, 0
  %r187 = add i32 0, 0
  %r112 = alloca [ 10 x i32 ]
  %r188 = add i32 0, 0
  %r189 = add i32 %r101, 0
  %r190 = icmp eq i32 %r189, 1
  br i1 %r190, label %bb1, label %bb2

bb1:
  ret i32 1
bb2:
  br label %bb3

bb3:
  %r108 = getelementptr i32, i32* %r100, i32 0
  %r191 = load i32, i32* %r108
  %r192 = sub i32 %r189, 2
  %r193 = icmp sgt i32 %r191, %r192
  br i1 %r193, label %bb4, label %bb5

bb4:
  ret i32 1
bb5:
  br label %bb6

bb6:
  %r194 = add i32 0, 0
  br label %bb7

bb7:
  %r195 = phi i32 [ %r194, %bb6 ], [ %r199, %bb8 ]
  %r196 = sub i32 %r189, 1
  %r197 = icmp slt i32 %r195, %r196
  br i1 %r197, label %bb8, label %bb9

bb8:
  %r118 = getelementptr [10 x i32 ], [10 x i32 ]* %r112, i32 0, i32 %r195
  store i32 0, i32* %r118
  %r198 = add i32 %r195, 1
  %r199 = add i32 %r198, 0
  br label %bb7

bb9:
  %r200 = sub i32 %r189, 1
  %r201 = add i32 %r200, 0
  %r125 = getelementptr [10 x i32 ], [10 x i32 ]* %r112, i32 0, i32 %r201
  store i32 1, i32* %r125
  %r202 = sub i32 %r189, 2
  %r203 = add i32 %r202, 0
  br label %bb10

bb10:
  %r204 = phi i32 [ %r203, %bb9 ], [ %r219, %bb18 ]
  %r205 = icmp sgt i32 %r204, -1
  br i1 %r205, label %bb11, label %bb12

bb11:
  %r134 = getelementptr i32, i32* %r100, i32 %r204
  %r206 = load i32, i32* %r134
  %r207 = sub i32 %r189, 1
  %r208 = sub i32 %r207, %r204
  %r209 = icmp slt i32 %r206, %r208
  br i1 %r209, label %bb13, label %bb14

bb13:
  %r141 = getelementptr i32, i32* %r100, i32 %r204
  %r210 = load i32, i32* %r141
  %r211 = add i32 %r210, 0
  br label %bb15

bb14:
  %r212 = sub i32 %r189, 1
  %r213 = sub i32 %r212, %r204
  %r214 = add i32 %r213, 0
  br label %bb15

bb15:
  %r215 = phi i32 [ %r211, %bb13 ], [ %r214, %bb14 ]
  br label %bb16

bb16:
  %r216 = phi i32 [ %r215, %bb15 ], [ %r225, %bb21 ]
  %r217 = icmp sgt i32 %r216, -1
  br i1 %r217, label %bb17, label %bb18

bb17:
  %r220 = add i32 %r204, %r216
  %r221 = add i32 %r220, 0
  %r155 = getelementptr [10 x i32 ], [10 x i32 ]* %r112, i32 0, i32 %r221
  %r222 = load i32, i32* %r155
  %r223 = icmp ne i32 %r222, 0
  br i1 %r223, label %bb19, label %bb20

bb19:
  %r158 = getelementptr [10 x i32 ], [10 x i32 ]* %r112, i32 0, i32 %r204
  store i32 1, i32* %r158
  br label %bb21

bb20:
  br label %bb21

bb21:
  %r224 = sub i32 %r216, 1
  %r225 = add i32 %r224, 0
  br label %bb16

bb18:
  %r218 = sub i32 %r204, 1
  %r219 = add i32 %r218, 0
  br label %bb10

bb12:
  %r164 = getelementptr [10 x i32 ], [10 x i32 ]* %r112, i32 0, i32 0
  %r226 = load i32, i32* %r164
  ret i32 %r226
}

define i32 @main( ) {
main:
  call void @_sysy_starttime(i32 42)
  %r228 = add i32 0, 0
  %r167 = alloca [ 10 x i32 ]
  %r168 = getelementptr [10 x i32 ], [10 x i32 ]* %r167, i32 0, i32 0
  store i32 3, i32* %r168
  %r169 = getelementptr [10 x i32 ], [10 x i32 ]* %r167, i32 0, i32 1
  store i32 3, i32* %r169
  %r170 = getelementptr [10 x i32 ], [10 x i32 ]* %r167, i32 0, i32 2
  store i32 9, i32* %r170
  %r171 = getelementptr [10 x i32 ], [10 x i32 ]* %r167, i32 0, i32 3
  store i32 0, i32* %r171
  %r172 = getelementptr [10 x i32 ], [10 x i32 ]* %r167, i32 0, i32 4
  store i32 0, i32* %r172
  %r173 = getelementptr [10 x i32 ], [10 x i32 ]* %r167, i32 0, i32 5
  store i32 1, i32* %r173
  %r174 = getelementptr [10 x i32 ], [10 x i32 ]* %r167, i32 0, i32 6
  store i32 1, i32* %r174
  %r175 = getelementptr [10 x i32 ], [10 x i32 ]* %r167, i32 0, i32 7
  store i32 5, i32* %r175
  %r176 = getelementptr [10 x i32 ], [10 x i32 ]* %r167, i32 0, i32 8
  store i32 7, i32* %r176
  %r177 = getelementptr [10 x i32 ], [10 x i32 ]* %r167, i32 0, i32 9
  store i32 8, i32* %r177
  %r229 = add i32 10, 0
  %r230 = call i32 @canJump(i32* %r167, i32 %r229)
  %r231 = add i32 %r230, 0
  call void @_sysy_stoptime(i32 49)
  ret i32 %r231
}

