define i32 @func1( i32 %r100, i32 %r102, i32 %r104 ) {
func1:
  %r101 = alloca i32
  store i32 %r100, i32* %r101
  %r103 = alloca i32
  store i32 %r102, i32* %r103
  %r105 = alloca i32
  store i32 %r104, i32* %r105
  %r108 = load i32, i32* %r105
  %r107 = icmp eq i32 %r108, 0
  br i1 %r107, label %bb1, label %bb2

bb1:
  %r109 = load i32, i32* %r101
  %r110 = load i32, i32* %r103
  %r111 = mul i32 %r109, %r110
  ret i32 %r111
bb2:
  %r113 = load i32, i32* %r101
  %r114 = load i32, i32* %r103
  %r115 = load i32, i32* %r105
  %r116 = sub i32 %r114, %r115
  %r112 = call i32 @func1(i32 %r113, i32 %r116, i32 0)
  ret i32 %r112
bb3:
  ret i32 0
}

define i32 @func2( i32 %r117, i32 %r119 ) {
func2:
  %r118 = alloca i32
  store i32 %r117, i32* %r118
  %r120 = alloca i32
  store i32 %r119, i32* %r120
  %r123 = load i32, i32* %r120
  %r122 = icmp ne i32 %r123, 0
  br i1 %r122, label %bb4, label %bb5

bb4:
  %r125 = load i32, i32* %r118
  %r126 = load i32, i32* %r118
  %r127 = load i32, i32* %r120
  %r128 = sdiv i32 %r126, %r127
  %r129 = load i32, i32* %r120
  %r130 = mul i32 %r128, %r129
  %r131 = sub i32 %r125, %r130
  %r124 = call i32 @func2(i32 %r131, i32 0)
  ret i32 %r124
bb5:
  %r132 = load i32, i32* %r118
  ret i32 %r132
bb6:
  ret i32 0
}

define i32 @func3( i32 %r133, i32 %r135 ) {
func3:
  %r134 = alloca i32
  store i32 %r133, i32* %r134
  %r136 = alloca i32
  store i32 %r135, i32* %r136
  %r139 = load i32, i32* %r136
  %r138 = icmp eq i32 %r139, 0
  br i1 %r138, label %bb7, label %bb8

bb7:
  %r140 = load i32, i32* %r134
  %r141 = add i32 %r140, 1
  ret i32 %r141
bb8:
  %r143 = load i32, i32* %r134
  %r144 = load i32, i32* %r136
  %r145 = add i32 %r143, %r144
  %r142 = call i32 @func3(i32 %r145, i32 0)
  ret i32 %r142
bb9:
  ret i32 0
}

define i32 @func4( i32 %r146, i32 %r148, i32 %r150 ) {
func4:
  %r147 = alloca i32
  store i32 %r146, i32* %r147
  %r149 = alloca i32
  store i32 %r148, i32* %r149
  %r151 = alloca i32
  store i32 %r150, i32* %r151
  %r154 = load i32, i32* %r147
  %r153 = icmp ne i32 %r154, 0
  br i1 %r153, label %bb10, label %bb11

bb10:
  %r155 = load i32, i32* %r149
  ret i32 %r155
bb11:
  %r156 = load i32, i32* %r151
  ret i32 %r156
bb12:
  ret i32 0
}

define i32 @func5( i32 %r157 ) {
func5:
  %r158 = alloca i32
  store i32 %r157, i32* %r158
  %r159 = load i32, i32* %r158
  %r160 = sub i32 0, %r159
  ret i32 %r160
}

define i32 @func6( i32 %r161, i32 %r163 ) {
func6:
  %r171 = alloca i32
  %r162 = alloca i32
  store i32 %r161, i32* %r162
  %r164 = alloca i32
  store i32 %r163, i32* %r164
  %r166 = alloca i32
  %r168 = load i32, i32* %r162
  %r167 = icmp ne i32 %r168, 0
  br i1 %r167, label %bb17, label %bb18

bb17:
  store i32 1, i32* %r166
  br label %bb19

bb18:
  store i32 0, i32* %r166
  br label %bb19

bb19:
  %r170 = load i32, i32* %r166
  %r169 = icmp ne i32 %r170, 0
  br i1 %r169, label %bb16, label %bb14

bb16:
  %r173 = load i32, i32* %r164
  %r172 = icmp ne i32 %r173, 0
  br i1 %r172, label %bb20, label %bb21

bb20:
  store i32 1, i32* %r171
  br label %bb22

bb21:
  store i32 0, i32* %r171
  br label %bb22

bb22:
  %r175 = load i32, i32* %r171
  %r174 = icmp ne i32 %r175, 0
  br i1 %r174, label %bb13, label %bb14

bb13:
  ret i32 1
bb14:
  ret i32 0
bb15:
  ret i32 0
}

define i32 @func7( i32 %r176 ) {
func7:
  %r177 = alloca i32
  store i32 %r176, i32* %r177
  %r180 = load i32, i32* %r177
  %r179 = icmp ne i32 %r180, 0
  br i1 %r179, label %bb24, label %bb23

bb23:
  ret i32 1
bb24:
  ret i32 0
bb25:
  ret i32 0
}

define i32 @main( ) {
main:
  %r281 = alloca i32
  call void @_sysy_starttime(i32 97)
  %r181 = call i32 @getint()
  %r182 = alloca i32
  store i32 %r181, i32* %r182
  %r183 = call i32 @getint()
  %r184 = alloca i32
  store i32 %r183, i32* %r184
  %r185 = call i32 @getint()
  %r186 = alloca i32
  store i32 %r185, i32* %r186
  %r187 = call i32 @getint()
  %r188 = alloca i32
  store i32 %r187, i32* %r188
  %r189 = alloca [ 10 x i32 ]
  %r190 = alloca i32
  store i32 0, i32* %r190
  br label %bb26

bb26:
  %r192 = load i32, i32* %r190
  %r191 = icmp slt i32 %r192, 10
  br i1 %r191, label %bb27, label %bb28

bb27:
  %r194 = load i32, i32* %r190
  %r193 = getelementptr [10 x i32 ], [10 x i32 ]* %r189, i32 0, i32 %r194
  %r195 = call i32 @getint()
  store i32 %r195, i32* %r193
  %r196 = load i32, i32* %r190
  %r197 = add i32 %r196, 1
  store i32 %r197, i32* %r190
  br label %bb26

bb28:
  %r208 = load i32, i32* %r182
  %r207 = call i32 @func7(i32 %r208)
  %r210 = load i32, i32* %r184
  %r209 = call i32 @func5(i32 %r210)
  %r206 = call i32 @func6(i32 %r207, i32 %r209)
  %r211 = load i32, i32* %r186
  %r205 = call i32 @func2(i32 %r206, i32 %r211)
  %r212 = load i32, i32* %r188
  %r204 = call i32 @func3(i32 %r205, i32 %r212)
  %r203 = call i32 @func5(i32 %r204)
  %r213 = getelementptr [10 x i32 ], [10 x i32 ]* %r189, i32 0, i32 0
  %r214 = load i32, i32* %r213
  %r220 = getelementptr [10 x i32 ], [10 x i32 ]* %r189, i32 0, i32 1
  %r221 = load i32, i32* %r220
  %r219 = call i32 @func5(i32 %r221)
  %r223 = getelementptr [10 x i32 ], [10 x i32 ]* %r189, i32 0, i32 2
  %r224 = load i32, i32* %r223
  %r226 = getelementptr [10 x i32 ], [10 x i32 ]* %r189, i32 0, i32 3
  %r227 = load i32, i32* %r226
  %r225 = call i32 @func7(i32 %r227)
  %r222 = call i32 @func6(i32 %r224, i32 %r225)
  %r229 = getelementptr [10 x i32 ], [10 x i32 ]* %r189, i32 0, i32 4
  %r230 = load i32, i32* %r229
  %r232 = getelementptr [10 x i32 ], [10 x i32 ]* %r189, i32 0, i32 5
  %r233 = load i32, i32* %r232
  %r231 = call i32 @func7(i32 %r233)
  %r228 = call i32 @func2(i32 %r230, i32 %r231)
  %r218 = call i32 @func4(i32 %r219, i32 %r222, i32 %r228)
  %r234 = getelementptr [10 x i32 ], [10 x i32 ]* %r189, i32 0, i32 6
  %r235 = load i32, i32* %r234
  %r217 = call i32 @func3(i32 %r218, i32 %r235)
  %r236 = getelementptr [10 x i32 ], [10 x i32 ]* %r189, i32 0, i32 7
  %r237 = load i32, i32* %r236
  %r216 = call i32 @func2(i32 %r217, i32 %r237)
  %r239 = getelementptr [10 x i32 ], [10 x i32 ]* %r189, i32 0, i32 8
  %r240 = load i32, i32* %r239
  %r242 = getelementptr [10 x i32 ], [10 x i32 ]* %r189, i32 0, i32 9
  %r243 = load i32, i32* %r242
  %r241 = call i32 @func7(i32 %r243)
  %r238 = call i32 @func3(i32 %r240, i32 %r241)
  %r244 = load i32, i32* %r182
  %r215 = call i32 @func1(i32 %r216, i32 %r238, i32 %r244)
  %r202 = call i32 @func4(i32 %r203, i32 %r214, i32 %r215)
  %r246 = load i32, i32* %r184
  %r249 = load i32, i32* %r186
  %r248 = call i32 @func7(i32 %r249)
  %r250 = load i32, i32* %r188
  %r247 = call i32 @func3(i32 %r248, i32 %r250)
  %r245 = call i32 @func2(i32 %r246, i32 %r247)
  %r201 = call i32 @func3(i32 %r202, i32 %r245)
  %r251 = getelementptr [10 x i32 ], [10 x i32 ]* %r189, i32 0, i32 0
  %r252 = load i32, i32* %r251
  %r253 = getelementptr [10 x i32 ], [10 x i32 ]* %r189, i32 0, i32 1
  %r254 = load i32, i32* %r253
  %r200 = call i32 @func1(i32 %r201, i32 %r252, i32 %r254)
  %r255 = getelementptr [10 x i32 ], [10 x i32 ]* %r189, i32 0, i32 2
  %r256 = load i32, i32* %r255
  %r199 = call i32 @func2(i32 %r200, i32 %r256)
  %r257 = getelementptr [10 x i32 ], [10 x i32 ]* %r189, i32 0, i32 3
  %r258 = load i32, i32* %r257
  %r264 = getelementptr [10 x i32 ], [10 x i32 ]* %r189, i32 0, i32 4
  %r265 = load i32, i32* %r264
  %r267 = getelementptr [10 x i32 ], [10 x i32 ]* %r189, i32 0, i32 5
  %r268 = load i32, i32* %r267
  %r266 = call i32 @func5(i32 %r268)
  %r263 = call i32 @func3(i32 %r265, i32 %r266)
  %r270 = getelementptr [10 x i32 ], [10 x i32 ]* %r189, i32 0, i32 6
  %r271 = load i32, i32* %r270
  %r269 = call i32 @func5(i32 %r271)
  %r262 = call i32 @func2(i32 %r263, i32 %r269)
  %r272 = getelementptr [10 x i32 ], [10 x i32 ]* %r189, i32 0, i32 7
  %r273 = load i32, i32* %r272
  %r275 = getelementptr [10 x i32 ], [10 x i32 ]* %r189, i32 0, i32 8
  %r276 = load i32, i32* %r275
  %r274 = call i32 @func7(i32 %r276)
  %r261 = call i32 @func1(i32 %r262, i32 %r273, i32 %r274)
  %r278 = getelementptr [10 x i32 ], [10 x i32 ]* %r189, i32 0, i32 9
  %r279 = load i32, i32* %r278
  %r277 = call i32 @func5(i32 %r279)
  %r260 = call i32 @func2(i32 %r261, i32 %r277)
  %r280 = load i32, i32* %r182
  %r259 = call i32 @func3