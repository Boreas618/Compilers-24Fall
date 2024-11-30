declare i32 @getch( )
declare i32 @getint( )
declare void @putch( i32 )
declare void @putint( i32 )
declare void @putarray( i32, i32* )
declare void @_sysy_starttime( i32 )
declare void @_sysy_stoptime( i32 )
define i32 @uniquePaths( i32 %r100, i32 %r102 ) {
uniquePaths:
  %r197 = add i32 0, 0
  %r198 = add i32 0, 0
  %r199 = add i32 0, 0
  %r200 = add i32 0, 0
  %r201 = add i32 0, 0
  %r115 = alloca [ 9 x i32 ]
  %r202 = add i32 0, 0
  %r203 = add i32 0, 0
  %r204 = add i32 %r100, 0
  %r205 = add i32 0, 0
  %r206 = add i32 %r102, 0
  %r207 = add i32 0, 0
  %r208 = icmp eq i32 %r204, 1
  br i1 %r208, label %bb5, label %bb6

bb5:
  %r261 = add i32 1, 0
  br label %bb7

bb6:
  %r262 = add i32 0, 0
  br label %bb7

bb7:
  %r209 = phi i32 [ %r261, %bb5 ], [ %r262, %bb6 ]
  %r210 = icmp ne i32 %r209, 0
  br i1 %r210, label %bb1, label %bb4

bb4:
  %r211 = icmp eq i32 %r206, 1
  br i1 %r211, label %bb8, label %bb9

bb8:
  %r259 = add i32 1, 0
  br label %bb10

bb9:
  %r260 = add i32 0, 0
  br label %bb10

bb10:
  %r212 = phi i32 [ %r259, %bb8 ], [ %r260, %bb9 ]
  %r213 = icmp ne i32 %r212, 0
  br i1 %r213, label %bb1, label %bb2

bb1:
  ret i32 1
bb2:
  br label %bb3

bb3:
  %r214 = add i32 0, 0
  br label %bb11

bb11:
  %r215 = phi i32 [ %r214, %bb3 ], [ %r222, %bb12 ]
  %r216 = icmp slt i32 %r215, %r204
  br i1 %r216, label %bb12, label %bb13

bb12:
  %r217 = mul i32 %r215, 3
  %r218 = add i32 %r217, %r206
  %r219 = sub i32 %r218, 1
  %r220 = add i32 %r219, 0
  %r129 = getelementptr [9 x i32 ], [9 x i32 ]* %r115, i32 0, i32 %r220
  store i32 1, i32* %r129
  %r221 = add i32 %r215, 1
  %r222 = add i32 %r221, 0
  br label %bb11

bb13:
  %r223 = add i32 0, 0
  br label %bb14

bb14:
  %r224 = phi i32 [ %r223, %bb13 ], [ %r258, %bb15 ]
  %r225 = icmp slt i32 %r224, %r206
  br i1 %r225, label %bb15, label %bb16

bb15:
  %r253 = sub i32 %r204, 1
  %r254 = mul i32 %r253, 3
  %r255 = add i32 %r254, %r224
  %r256 = add i32 %r255, 0
  %r141 = getelementptr [9 x i32 ], [9 x i32 ]* %r115, i32 0, i32 %r256
  store i32 1, i32* %r141
  %r257 = add i32 %r224, 1
  %r258 = add i32 %r257, 0
  br label %bb14

bb16:
  %r226 = sub i32 %r204, 2
  %r227 = add i32 %r226, 0
  br label %bb17

bb17:
  %r228 = phi i32 [ %r227, %bb16 ], [ %r236, %bb22 ]
  %r229 = icmp sgt i32 %r228, -1
  br i1 %r229, label %bb18, label %bb19

bb18:
  %r231 = sub i32 %r206, 2
  %r232 = add i32 %r231, 0
  br label %bb20

bb20:
  %r233 = phi i32 [ %r232, %bb18 ], [ %r252, %bb21 ]
  %r234 = icmp sgt i32 %r233, -1
  br i1 %r234, label %bb21, label %bb22

bb21:
  %r237 = mul i32 %r228, 3
  %r238 = add i32 %r237, %r233
  %r239 = add i32 %r238, 0
  %r240 = add i32 %r228, 1
  %r241 = mul i32 %r240, 3
  %r242 = add i32 %r241, %r233
  %r243 = add i32 %r242, 0
  %r244 = mul i32 %r228, 3
  %r245 = add i32 %r244, %r233
  %r246 = add i32 %r245, 1
  %r247 = add i32 %r246, 0
  %r167 = getelementptr [9 x i32 ], [9 x i32 ]* %r115, i32 0, i32 %r239
  %r169 = getelementptr [9 x i32 ], [9 x i32 ]* %r115, i32 0, i32 %r243
  %r248 = load i32, i32* %r169
  %r172 = getelementptr [9 x i32 ], [9 x i32 ]* %r115, i32 0, i32 %r247
  %r249 = load i32, i32* %r172
  %r250 = add i32 %r248, %r249
  store i32 %r250, i32* %r167
  %r251 = sub i32 %r233, 1
  %r252 = add i32 %r251, 0
  br label %bb20

bb22:
  %r235 = sub i32 %r228, 1
  %r236 = add i32 %r235, 0
  br label %bb17

bb19:
  %r180 = getelementptr [9 x i32 ], [9 x i32 ]* %r115, i32 0, i32 0
  %r230 = load i32, i32* %r180
  ret i32 %r230
}

define i32 @main( ) {
main:
  call void @_sysy_starttime(i32 40)
  %r265 = add i32 0, 0
  %r266 = add i32 0, 0
  %r267 = add i32 3, 0
  %r268 = call i32 @uniquePaths(i32 %r267, i32 %r267)
  %r269 = add i32 %r268, 0
  call void @_sysy_stoptime(i32 45)
  ret i32 %r269
}

