declare i32 @getch( )
declare i32 @getint( )
declare void @putch( i32 )
declare void @putint( i32 )
declare void @putarray( i32, i32* )
declare void @_sysy_starttime( i32 )
declare void @_sysy_stoptime( i32 )
define i32 @uniquePaths( i32 %r100, i32 %r102 ) {
uniquePaths:
  %r215 = add i32 0, 0
  %r216 = add i32 0, 0
  %r217 = add i32 0, 0
  %r218 = add i32 0, 0
  %r219 = add i32 0, 0
  %r115 = alloca [ 9 x i32 ]
  %r220 = add i32 0, 0
  %r221 = add i32 0, 0
  %r222 = add i32 %r100, 0
  %r223 = add i32 0, 0
  %r224 = add i32 %r102, 0
  %r225 = add i32 0, 0
  %r226 = icmp eq i32 %r222, 1
  br i1 %r226, label %bb5, label %bb6

bb5:
  %r279 = add i32 1, 0
  br label %bb7

bb6:
  %r280 = add i32 0, 0
  br label %bb7

bb7:
  %r227 = phi i32 [ %r279, %bb5 ], [ %r280, %bb6 ]
  %r228 = icmp ne i32 %r227, 0
  br i1 %r228, label %bb1, label %bb4

bb4:
  %r229 = icmp eq i32 %r224, 1
  br i1 %r229, label %bb8, label %bb9

bb8:
  %r277 = add i32 1, 0
  br label %bb10

bb9:
  %r278 = add i32 0, 0
  br label %bb10

bb10:
  %r230 = phi i32 [ %r277, %bb8 ], [ %r278, %bb9 ]
  %r231 = icmp ne i32 %r230, 0
  br i1 %r231, label %bb1, label %bb2

bb1:
  ret i32 1
bb2:
  br label %bb3

bb3:
  %r232 = add i32 0, 0
  br label %bb11

bb11:
  %r233 = phi i32 [ %r232, %bb3 ], [ %r240, %bb12 ]
  %r234 = icmp slt i32 %r233, %r222
  br i1 %r234, label %bb12, label %bb13

bb12:
  %r235 = mul i32 %r233, 3
  %r236 = add i32 %r235, %r224
  %r237 = sub i32 %r236, 1
  %r238 = add i32 %r237, 0
  %r129 = getelementptr [9 x i32 ], [9 x i32 ]* %r115, i32 0, i32 %r238
  store i32 1, i32* %r129
  %r239 = add i32 %r233, 1
  %r240 = add i32 %r239, 0
  br label %bb11

bb13:
  %r241 = add i32 0, 0
  br label %bb14

bb14:
  %r242 = phi i32 [ %r241, %bb13 ], [ %r276, %bb15 ]
  %r243 = icmp slt i32 %r242, %r224
  br i1 %r243, label %bb15, label %bb16

bb15:
  %r271 = sub i32 %r222, 1
  %r272 = mul i32 %r271, 3
  %r273 = add i32 %r272, %r242
  %r274 = add i32 %r273, 0
  %r141 = getelementptr [9 x i32 ], [9 x i32 ]* %r115, i32 0, i32 %r274
  store i32 1, i32* %r141
  %r275 = add i32 %r242, 1
  %r276 = add i32 %r275, 0
  br label %bb14

bb16:
  %r244 = sub i32 %r222, 2
  %r245 = add i32 %r244, 0
  br label %bb17

bb17:
  %r246 = phi i32 [ %r245, %bb16 ], [ %r269, %bb22 ]
  %r247 = icmp sgt i32 %r246, -1
  br i1 %r247, label %bb18, label %bb19

bb18:
  %r248 = sub i32 %r224, 2
  %r249 = add i32 %r248, 0
  br label %bb20

bb20:
  %r250 = phi i32 [ %r249, %bb18 ], [ %r267, %bb21 ]
  %r251 = icmp sgt i32 %r250, -1
  br i1 %r251, label %bb21, label %bb22

bb21:
  %r252 = mul i32 %r246, 3
  %r253 = add i32 %r252, %r250
  %r254 = add i32 %r253, 0
  %r255 = add i32 %r246, 1
  %r256 = mul i32 %r255, 3
  %r257 = add i32 %r256, %r250
  %r258 = add i32 %r257, 0
  %r259 = mul i32 %r246, 3
  %r260 = add i32 %r259, %r250
  %r261 = add i32 %r260, 1
  %r262 = add i32 %r261, 0
  %r167 = getelementptr [9 x i32 ], [9 x i32 ]* %r115, i32 0, i32 %r254
  %r169 = getelementptr [9 x i32 ], [9 x i32 ]* %r115, i32 0, i32 %r258
  %r263 = load i32, i32* %r169
  %r172 = getelementptr [9 x i32 ], [9 x i32 ]* %r115, i32 0, i32 %r262
  %r264 = load i32, i32* %r172
  %r265 = add i32 %r263, %r264
  store i32 %r265, i32* %r167
  %r266 = sub i32 %r250, 1
  %r267 = add i32 %r266, 0
  br label %bb20

bb22:
  %r268 = sub i32 %r246, 1
  %r269 = add i32 %r268, 0
  br label %bb17

bb19:
  %r180 = getelementptr [9 x i32 ], [9 x i32 ]* %r115, i32 0, i32 0
  %r270 = load i32, i32* %r180
  ret i32 %r270
}

define i32 @main( ) {
main:
  call void @_sysy_starttime(i32 40)
  %r287 = add i32 0, 0
  %r288 = add i32 0, 0
  %r289 = add i32 3, 0
  %r290 = call i32 @uniquePaths(i32 %r289, i32 %r289)
  %r291 = add i32 %r290, 0
  call void @_sysy_stoptime(i32 45)
  ret i32 %r291
}

