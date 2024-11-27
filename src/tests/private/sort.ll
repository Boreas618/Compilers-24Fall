@base = global i32 16
@a = global [ 30000010 x i32 ] zeroinitializer
@ans = global i32 0
define i32 @getMaxNum( i32 %r100, i32* %r102 ) {
getMaxNum:
  %r101 = alloca i32
  store i32 %r100, i32* %r101
  %r103 = alloca i32
  store i32 0, i32* %r103
  %r104 = alloca i32
  store i32 0, i32* %r104
  br label %bb1

bb1:
  %r106 = load i32, i32* %r104
  %r107 = load i32, i32* %r101
  %r105 = icmp slt i32 %r106, %r107
  br i1 %r105, label %bb2, label %bb3

bb2:
  %r111 = load i32, i32* %r104
  %r110 = getelementptr i32, i32* %r102, i32 %r111
  %r112 = load i32, i32* %r110
  %r113 = load i32, i32* %r103
  %r109 = icmp sgt i32 %r112, %r113
  br i1 %r109, label %bb4, label %bb5

bb4:
  %r115 = load i32, i32* %r104
  %r114 = getelementptr i32, i32* %r102, i32 %r115
  %r116 = load i32, i32* %r114
  store i32 %r116, i32* %r103
  br label %bb6

bb5:
  br label %bb6

bb6:
  %r117 = load i32, i32* %r104
  %r118 = add i32 %r117, 1
  store i32 %r118, i32* %r104
  br label %bb1

bb3:
  %r119 = load i32, i32* %r103
  ret i32 %r119
}

define i32 @getNumPos( i32 %r120, i32 %r122 ) {
getNumPos:
  %r121 = alloca i32
  store i32 %r120, i32* %r121
  %r123 = alloca i32
  store i32 %r122, i32* %r123
  %r124 = alloca i32
  store i32 1, i32* %r124
  %r125 = alloca i32
  store i32 0, i32* %r125
  br label %bb7

bb7:
  %r127 = load i32, i32* %r125
  %r128 = load i32, i32* %r123
  %r126 = icmp slt i32 %r127, %r128
  br i1 %r126, label %bb8, label %bb9

bb8:
  %r129 = load i32, i32* %r121
  %r130 = load i32, i32* @base
  %r131 = sdiv i32 %r129, %r130
  store i32 %r131, i32* %r121
  %r132 = load i32, i32* %r125
  %r133 = add i32 %r132, 1
  store i32 %r133, i32* %r125
  br label %bb7

bb9:
  %r134 = load i32, i32* %r121
  %r135 = load i32, i32* %r121
  %r136 = load i32, i32* @base
  %r137 = sdiv i32 %r135, %r136
  %r138 = load i32, i32* @base
  %r139 = mul i32 %r137, %r138
  %r140 = sub i32 %r134, %r139
  ret i32 %r140
}

define void @radixSort( i32 %r141, i32* %r143, i32 %r144, i32 %r146 ) {
radixSort:
  %r318 = alloca i32
  %r290 = alloca i32
  %r280 = alloca i32
  %r258 = alloca i32
  %r254 = alloca i32
  %r247 = alloca i32
  %r243 = alloca i32
  %r213 = alloca i32
  %r192 = alloca i32
  %r186 = alloca i32
  %r177 = alloca i32
  %r169 = alloca i32
  %r164 = alloca i32
  %r142 = alloca i32
  store i32 %r141, i32* %r142
  %r145 = alloca i32
  store i32 %r144, i32* %r145
  %r147 = alloca i32
  store i32 %r146, i32* %r147
  %r148 = alloca [ 16 x i32 ]
  %r149 = alloca [ 16 x i32 ]
  %r150 = alloca [ 16 x i32 ]
  %r151 = alloca i32
  store i32 0, i32* %r151
  br label %bb10

bb10:
  %r153 = load i32, i32* %r151
  %r154 = load i32, i32* @base
  %r152 = icmp slt i32 %r153, %r154
  br i1 %r152, label %bb11, label %bb12

bb11:
  %r156 = load i32, i32* %r151
  %r155 = getelementptr [16 x i32 ], [16 x i32 ]* %r148, i32 0, i32 %r156
  store i32 0, i32* %r155
  %r158 = load i32, i32* %r151
  %r157 = getelementptr [16 x i32 ], [16 x i32 ]* %r149, i32 0, i32 %r158
  store i32 0, i32* %r157
  %r160 = load i32, i32* %r151
  %r159 = getelementptr [16 x i32 ], [16 x i32 ]* %r150, i32 0, i32 %r160
  store i32 0, i32* %r159
  %r161 = load i32, i32* %r151
  %r162 = add i32 %r161, 1
  store i32 %r162, i32* %r151
  br label %bb10

bb12:
  %r166 = load i32, i32* %r142
  %r165 = icmp eq i32 %r166, -1
  br i1 %r165, label %bb17, label %bb18

bb17:
  store i32 1, i32* %r164
  br label %bb19

bb18:
  store i32 0, i32* %r164
  br label %bb19

bb19:
  %r168 = load i32, i32* %r164
  %r167 = icmp ne i32 %r168, 0
  br i1 %r167, label %bb13, label %bb16

bb16:
  %r171 = load i32, i32* %r145
  %r172 = add i32 %r171, 1
  %r173 = load i32, i32* %r147
  %r170 = icmp sge i32 %r172, %r173
  br i1 %r170, label %bb20, label %bb21

bb20:
  store i32 1, i32* %r169
  br label %bb22

bb21:
  store i32 0, i32* %r169
  br label %bb22

bb22:
  %r175 = load i32, i32* %r169
  %r174 = icmp ne i32 %r175, 0
  br i1 %r174, label %bb13, label %bb14

bb13:
  ret void
bb14:
  br label %bb15

bb15:
  %r176 = load i32, i32* %r145
  store i32 %r176, i32* %r177
  br label %bb23

bb23:
  %r179 = load i32, i32* %r177
  %r180 = load i32, i32* %r147
  %r178 = icmp slt i32 %r179, %r180
  br i1 %r178, label %bb24, label %bb25

bb24:
  %r183 = load i32, i32* %r177
  %r182 = getelementptr i32, i32* %r143, i32 %r183
  %r184 = load i32, i32* %r182
  %r185 = load i32, i32* %r142
  %r181 = call i32 @getNumPos(i32 %r184, i32 %r185)
  store i32 %r181, i32* %r186
  %r189 = load i32, i32* %r177
  %r188 = getelementptr i32, i32* %r143, i32 %r189
  %r190 = load i32, i32* %r188
  %r191 = load i32, i32* %r142
  %r187 = call i32 @getNumPos(i32 %r190, i32 %r191)
  store i32 %r187, i32* %r192
  %r194 = load i32, i32* %r192
  %r193 = getelementptr [16 x i32 ], [16 x i32 ]* %r150, i32 0, i32 %r194
  %r196 = load i32, i32* %r186
  %r195 = getelementptr [16 x i32 ], [16 x i32 ]* %r150, i32 0, i32 %r196
  %r197 = load i32, i32* %r195
  %r198 = add i32 %r197, 1
  store i32 %r198, i32* %r193
  %r199 = load i32, i32* %r177
  %r200 = add i32 %r199, 1
  store i32 %r200, i32* %r177
  br label %bb23

bb25:
  %r201 = getelementptr [16 x i32 ], [16 x i32 ]* %r148, i32 0, i32 0
  %r202 = load i32, i32* %r145
  store i32 %r202, i32* %r201
  %r203 = getelementptr [16 x i32 ], [16 x i32 ]* %r149, i32 0, i32 0
  %r204 = load i32, i32* %r145
  %r205 = getelementptr [16 x i32 ], [16 x i32 ]* %r150, i32 0, i32 0
  %r206 = load i32, i32* %r205
  %r207 = add i32 %r204, %r206
  store i32 %r207, i32* %r203
  store i32 1, i32* %r177
  br label %bb26

bb26:
  %r209 = load i32, i32* %r177
  %r210 = load i32, i32* @base
  %r208 = icmp slt i32 %r209, %r210
  br i1 %r208, label %bb27, label %bb28

bb27:
  %r211 = load i32, i32* %r177
  %r212 = sub i32 %r211, 1
  store i32 %r212, i32* %r213
  %r215 = load i32, i32* %r177
  %r214 = getelementptr [16 x i32 ], [16 x i32 ]* %r148, i32 0, i32 %r215
  %r217 = load i32, i32* %r213
  %r216 = getelementptr [16 x i32 ], [16 x i32 ]* %r149, i32 0, i32 %r217
  %r218 = load i32, i32* %r216
  store i32 %r218, i32* %r214
  %r220 = load i32, i32* %r177
  %r219 = getelementptr [16 x i32 ], [16 x i32 ]* %r149, i32 0, i32 %r220
  %r222 = load i32, i32* %r177
  %r221 = getelementptr [16 x i32 ], [16 x i32 ]* %r148, i32 0, i32 %r222
  %r223 = load i32, i32* %r221
  %r225 = load i32, i32* %r177
  %r224 = getelementptr [16 x i32 ], [16 x i32 ]* %r150, i32 0, i32 %r225
  %r226 = load i32, i32* %r224
  %r227 = add i32 %r223, %r226
  store i32 %r227, i32* %r219
  %r228 = load i32, i32* %r177
  %r229 = add i32 %r228, 1
  store i32 %r229, i32* %r177
  br label %bb26

bb28:
  store i32 0, i32* %r177
  br label %bb29

bb29:
  %r231 = load i32, i32* %r177
  %r232 = load i32, i32* @base
  %r230 = icmp slt i32 %r231, %r232
  br i1 %r230, label %bb30, label %bb31

bb30:
  br label %bb32

bb32:
  %r235 = load i32, i32* %r177
  %r234 = getelementptr [16 x i32 ], [16 x i32 ]* %r148, i32 0, i32 %r235
  %r236 = load i32, i32* %r234
  %r238 = load i32, i32* %r177
  %r237 = getelementptr [16 x i32 ], [16 x i32 ]* %r149, i32 0, i32 %r238
  %r239 = load i32, i32* %r237
  %r233 = icmp slt i32 %r236, %r239
  br i1 %r233, label %bb33, label %bb34

bb33:
  %r241 = load i32, i32* %r177
  %r240 = getelementptr [16 x i32 ], [16 x i32 ]* %r148, i32 0, i32 %r241
  %r242 = load i32, i32* %r240
  store i32 %r242, i32* %r243
  %r245 = load i32, i32* %r243
  %r244 = getelementptr i32, i32* %r143, i32 %r245
  %r246 = load i32, i32* %r244
  store i32 %r246, i32* %r247
  br label %bb35

bb35:
  %r250 = load i32, i32* %r247
  %r251 = load i32, i32* %r142
  %r249 = call i32 @getNumPos(i32 %r250, i32 %r251)
  %r252 = load i32, i32* %r177
  %r248 = icmp ne i32 %r249, %r252
  br i1 %r248, label %bb36, label %bb37

bb36:
  %r253 = load i32, i32* %r247
  store i32 %r253, i32* %r254
  %r256 = load i32, i32* %r254
  %r257 = load i32, i32* %r142
  %r255 = call i32 @getNumPos(i32 %r256, i32 %r257)
  store i32 %r255, i32* %r258
  %r260 = load i32, i32* %r258
  %r259 = getelementptr [16 x i32 ], [16 x i32 ]* %r148, i32 0, i32 %r260
  %r261 = load i32, i32* %r259
  store i32 %r261, i32* %r258
  %r263 = load i32, i32* %r258
  %r262 = getelementptr i32, i32* %r143, i32 %r263
  %r264 = load i32, i32* %r262
  store i32 %r264, i32* %r247
  %r266 = load i32, i32* %r254
  %r267 = load i32, i32* %r142
  %r265 = call i32 @getNumPos(i32 %r266, i32 %r267)
  store i32 %r265, i32* %r258
  %r269 = load i32, i32* %r258
  %r268 = getelementptr [16 x i32 ], [16 x i32 ]* %r148, i32 0, i32 %r269
  %r270 = load i32, i32* %r268
  store i32 %r270, i32* %r258
  %r272 = load i32, i32* %r258
  %r271 = getelementptr i32, i32* %r143, i32 %r272
  %r273 = load i32, i32* %r254
  store i32 %r273, i32* %r271
  %r275 = load i32, i32* %r254
  %r276 = load i32, i32* %r142
  %r274 = call i32 @getNumPos(i32 %r275, i32 %r276)
  store i32 %r274, i32* %r258
  %r278 = load i32, i32* %r254
  %r279 = load i32, i32* %r142
  %r277 = call i32 @getNumPos(i32 %r278, i32 %r279)
  store i32 %r277, i32* %r280
  %r282 = load i32, i32* %r280
  %r281 = getelementptr [16 x i32 ], [16 x i32 ]* %r148, i32 0, i32 %r282
  %r284 = load i32, i32* %r258
  %r283 = getelementptr [16 x i32 ], [16 x i32 ]* %r148, i32 0, i32 %r284
  %r285 = load i32, i32* %r283
  %r286 = add i32 %r285, 1
  store i32 %r286, i32* %r281
  br label %bb35

bb37:
  %r288 = load i32, i32* %r177
  %r287 = getelementptr [16 x i32 ], [16 x i32 ]* %r148, i32 0, i32 %r288
  %r289 = load i32, i32* %r287
  store i32 %r289, i32* %r290
  %r292 = load i32, i32* %r290
  %r291 = getelementptr i32, i32* %r143, i32 %r292
  %r293 = load i32, i32* %r247
  store i32 %r293, i32* %r291
  %r295 = load i32, i32* %r177
  %r294 = getelementptr [16 x i32 ], [16 x i32 ]* %r148, i32 0, i32 %r295
  %r297 = load i32, i32* %r177
  %r296 = getelementptr [16 x i32 ], [16 x i32 ]* %r148, i32 0, i32 %r297
  %r298 = load i32, i32* %r296
  %r299 = add i32 %r298, 1
  store i32 %r299, i32* %r294
  br label %bb32

bb34:
  %r300 = load i32, i32* %r177
  %r301 = add i32 %r300, 1
  store i32 %r301, i32* %r177
  br label %bb29

bb31:
  %r302 = load i32, i32* %r145
  store i32 %r302, i32* %r177
  %r303 = getelementptr [16 x i32 ], [16 x i32 ]* %r148, i32 0, i32 0
  %r304 = load i32, i32* %r145
  store i32 %r304, i32* %r303
  %r305 = getelementptr [16 x i32 ], [16 x i32 ]* %r149, i32 0, i32 0
  %r306 = load i32, i32* %r145
  %r307 = getelementptr [16 x i32 ], [16 x i32 ]* %r150, i32 0, i32 0
  %r308 = load i32, i32* %r307
  %r309 = add i32 %r306, %r308
  store i32 %r309, i32* %r305
  store i32 0, i32* %r177
  br label %bb38

bb38:
  %r311 = load i32, i32* %r177
  %r312 = load i32, i32* @base
  %r310 = icmp slt i32 %r311, %r312
  br i1 %r310, label %bb39, label %bb40

bb39:
  %r315 = load i32, i32* %r177
  %r314 = icmp sgt i32 %r315, 0
  br i1 %r314, label %bb41, label %bb42

bb41:
  %r316 = load i32, i32* %r177
  %r317 = sub i32 %r316, 1
  store i32 %r317, i32* %r318
  %r320 = load i32, i32* %r177
  %r319 = getelementptr [16 x i32 ], [16 x i32 ]* %r148, i32 0, i32 %r320
  %r322 = load i32, i32* %r318
  %r321 = getelementptr [16 x i32 ], [16 x i32 ]* %r149, i32 0, i32 %r322
  %r323 = load i32, i32* %r321
  store i32 %r323, i32* %r319
  %r325 = load i32, i32* %r177
  %r324 = getelementptr [16 x i32 ], [16 x i32 ]* %r149, i32 0, i32 %r325
  %r327 = load i32, i32* %r177
  %r326 = getelementptr [16 x i32 ], [16 x i32 ]* %r148, i32 0, i32 %r327
  %r328 = load i32, i32* %r326
  %r330 = load i32, i32* %r177
  %r329 = getelementptr [16 x i32 ], [16 x i32 ]* %r150, i32 0, i32 %r330
  %r331 = load i32, i32* %r329
  %r332 = add i32 %r328, %r331
  store i32 %r332, i32* %r324
  br label %bb43

bb42:
  br label %bb43

bb43:
  %r333 = load i32, i32* %r142
  %r334 = sub i32 %r333, 1
  %r336 = load i32, i32* %r177
  %r335 = getelementptr [16 x i32 ], [16 x i32 ]* %r148, i32 0, i32 %r336
  %r337 = load i32, i32* %r335
  %r339 = load i32, i32* %r177
  %r338 = getelementptr [16 x i32 ], [16 x i32 ]* %r149, i32 0, i32 %r339
  %r340 = load i32, i32* %r338
  call void @radixSort(i32 %r334, i32* %r143, i32 %r337, i32 %r340)
  %r341 = load i32, i32* %r177
  %r342 = add i32 %r341, 1
  store i32 %r342, i32* %r177
  br label %bb38

bb40:
  ret void
}

define i32 @main( ) {
main:
  %r355 = alloca i32
  %r343 = call i32 @getint()
  %r344 = alloca i32
  store i32 %r343, i32* %r344
  %r34