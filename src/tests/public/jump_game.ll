declare i32 @getch( )
declare i32 @getint( )
declare void @putch( i32 )
declare void @putint( i32 )
declare void @putarray( i32, i32* )
declare void @_sysy_starttime( i32 )
declare void @_sysy_stoptime( i32 )
define i32 @canJump( i32* %r100, i32 %r101 ) {
canJump:
  %r193 = add i32 0, 0
  %r194 = add i32 0, 0
  %r195 = add i32 0, 0
  %r112 = alloca [ 10 x i32 ]
  %r196 = add i32 0, 0
  %r197 = add i32 %r101, 0
  %r198 = icmp eq i32 %r197, 1
  br i1 %r198, label %bb1, label %bb2

bb1:
  ret i32 1
bb2:
  br label %bb3

bb3:
  %r108 = getelementptr i32, i32* %r100, i32 0
  %r199 = load i32, i32* %r108
  %r200 = sub i32 %r197, 2
  %r201 = icmp sgt i32 %r199, %r200
  br i1 %r201, label %bb4, label %bb5

bb4:
  ret i32 1
bb5:
  br label %bb6

bb6:
  %r202 = add i32 0, 0
  br label %bb7

bb7:
  %r203 = phi i32 [ %r202, %bb6 ], [ %r207, %bb8 ]
  %r204 = sub i32 %r197, 1
  %r205 = icmp slt i32 %r203, %r204
  br i1 %r205, label %bb8, label %bb9

bb8:
  %r118 = getelementptr [10 x i32 ], [10 x i32 ]* %r112, i32 0, i32 %r203
  store i32 0, i32* %r118
  %r206 = add i32 %r203, 1
  %r207 = add i32 %r206, 0
  br label %bb7

bb9:
  %r208 = sub i32 %r197, 1
  %r209 = add i32 %r208, 0
  %r125 = getelementptr [10 x i32 ], [10 x i32 ]* %r112, i32 0, i32 %r209
  store i32 1, i32* %r125
  %r210 = sub i32 %r197, 2
  %r211 = add i32 %r210, 0
  br label %bb10

bb10:
  %r212 = phi i32 [ %r211, %bb9 ], [ %r228, %bb18 ]
  %r213 = icmp sgt i32 %r212, -1
  br i1 %r213, label %bb11, label %bb12

bb11:
  %r134 = getelementptr i32, i32* %r100, i32 %r212
  %r214 = load i32, i32* %r134
  %r215 = sub i32 %r197, 1
  %r216 = sub i32 %r215, %r212
  %r217 = icmp slt i32 %r214, %r216
  br i1 %r217, label %bb13, label %bb14

bb13:
  %r141 = getelementptr i32, i32* %r100, i32 %r212
  %r229 = load i32, i32* %r141
  %r230 = add i32 %r229, 0
  br label %bb15

bb14:
  %r231 = sub i32 %r197, 1
  %r232 = sub i32 %r231, %r212
  %r233 = add i32 %r232, 0
  br label %bb15

bb15:
  %r218 = phi i32 [ %r230, %bb13 ], [ %r233, %bb14 ]
  br label %bb16

bb16:
  %r219 = phi i32 [ %r218, %bb15 ], [ %r226, %bb21 ]
  %r220 = icmp sgt i32 %r219, -1
  br i1 %r220, label %bb17, label %bb18

bb17:
  %r221 = add i32 %r212, %r219
  %r222 = add i32 %r221, 0
  %r155 = getelementptr [10 x i32 ], [10 x i32 ]* %r112, i32 0, i32 %r222
  %r223 = load i32, i32* %r155
  %r224 = icmp ne i32 %r223, 0
  br i1 %r224, label %bb19, label %bb20

bb19:
  %r158 = getelementptr [10 x i32 ], [10 x i32 ]* %r112, i32 0, i32 %r212
  store i32 1, i32* %r158
  br label %bb21

bb20:
  br label %bb21

bb21:
  %r225 = sub i32 %r219, 1
  %r226 = add i32 %r225, 0
  br label %bb16

bb18:
  %r227 = sub i32 %r212, 1
  %r228 = add i32 %r227, 0
  br label %bb10

bb12:
  %r164 = getelementptr [10 x i32 ], [10 x i32 ]* %r112, i32 0, i32 0
  %r234 = load i32, i32* %r164
  ret i32 %r234
}

define i32 @main( ) {
main:
  call void @_sysy_starttime(i32 42)
  %r238 = add i32 0, 0
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
  %r239 = add i32 10, 0
  %r240 = call i32 @canJump(i32* %r167, i32 %r239)
  %r241 = add i32 %r240, 0
  call void @_sysy_stoptime(i32 49)
  ret i32 %r241
}

