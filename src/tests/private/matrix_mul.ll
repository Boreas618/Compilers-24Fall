@M = global i32 0
@L = global i32 0
@N = global i32 0
define i32 @mul( i32* %r100, i32* %r101, i32* %r102, i32* %r103, i32* %r104, i32* %r105, i32* %r106, i32* %r107, i32* %r108 ) {
mul:
  %r109 = alloca i32
  store i32 0, i32* %r109
  %r110 = getelementptr i32, i32* %r106, i32 0
  %r111 = getelementptr i32, i32* %r100, i32 0
  %r112 = load i32, i32* %r111
  %r113 = getelementptr i32, i32* %r103, i32 0
  %r114 = load i32, i32* %r113
  %r115 = mul i32 %r112, %r114
  %r116 = getelementptr i32, i32* %r100, i32 1
  %r117 = load i32, i32* %r116
  %r118 = getelementptr i32, i32* %r104, i32 0
  %r119 = load i32, i32* %r118
  %r120 = mul i32 %r117, %r119
  %r121 = add i32 %r115, %r120
  %r122 = getelementptr i32, i32* %r100, i32 2
  %r123 = load i32, i32* %r122
  %r124 = getelementptr i32, i32* %r105, i32 0
  %r125 = load i32, i32* %r124
  %r126 = mul i32 %r123, %r125
  %r127 = add i32 %r121, %r126
  store i32 %r127, i32* %r110
  %r128 = getelementptr i32, i32* %r106, i32 1
  %r129 = getelementptr i32, i32* %r100, i32 0
  %r130 = load i32, i32* %r129
  %r131 = getelementptr i32, i32* %r103, i32 1
  %r132 = load i32, i32* %r131
  %r133 = mul i32 %r130, %r132
  %r134 = getelementptr i32, i32* %r100, i32 1
  %r135 = load i32, i32* %r134
  %r136 = getelementptr i32, i32* %r104, i32 1
  %r137 = load i32, i32* %r136
  %r138 = mul i32 %r135, %r137
  %r139 = add i32 %r133, %r138
  %r140 = getelementptr i32, i32* %r100, i32 2
  %r141 = load i32, i32* %r140
  %r142 = getelementptr i32, i32* %r105, i32 1
  %r143 = load i32, i32* %r142
  %r144 = mul i32 %r141, %r143
  %r145 = add i32 %r139, %r144
  store i32 %r145, i32* %r128
  %r146 = getelementptr i32, i32* %r106, i32 2
  %r147 = getelementptr i32, i32* %r100, i32 0
  %r148 = load i32, i32* %r147
  %r149 = getelementptr i32, i32* %r103, i32 2
  %r150 = load i32, i32* %r149
  %r151 = mul i32 %r148, %r150
  %r152 = getelementptr i32, i32* %r100, i32 1
  %r153 = load i32, i32* %r152
  %r154 = getelementptr i32, i32* %r104, i32 2
  %r155 = load i32, i32* %r154
  %r156 = mul i32 %r153, %r155
  %r157 = add i32 %r151, %r156
  %r158 = getelementptr i32, i32* %r100, i32 2
  %r159 = load i32, i32* %r158
  %r160 = getelementptr i32, i32* %r105, i32 2
  %r161 = load i32, i32* %r160
  %r162 = mul i32 %r159, %r161
  %r163 = add i32 %r157, %r162
  store i32 %r163, i32* %r146
  %r164 = getelementptr i32, i32* %r107, i32 0
  %r165 = getelementptr i32, i32* %r101, i32 0
  %r166 = load i32, i32* %r165
  %r167 = getelementptr i32, i32* %r103, i32 0
  %r168 = load i32, i32* %r167
  %r169 = mul i32 %r166, %r168
  %r170 = getelementptr i32, i32* %r101, i32 1
  %r171 = load i32, i32* %r170
  %r172 = getelementptr i32, i32* %r104, i32 0
  %r173 = load i32, i32* %r172
  %r174 = mul i32 %r171, %r173
  %r175 = add i32 %r169, %r174
  %r176 = getelementptr i32, i32* %r101, i32 2
  %r177 = load i32, i32* %r176
  %r178 = getelementptr i32, i32* %r105, i32 0
  %r179 = load i32, i32* %r178
  %r180 = mul i32 %r177, %r179
  %r181 = add i32 %r175, %r180
  store i32 %r181, i32* %r164
  %r182 = getelementptr i32, i32* %r107, i32 1
  %r183 = getelementptr i32, i32* %r101, i32 0
  %r184 = load i32, i32* %r183
  %r185 = getelementptr i32, i32* %r103, i32 1
  %r186 = load i32, i32* %r185
  %r187 = mul i32 %r184, %r186
  %r188 = getelementptr i32, i32* %r101, i32 1
  %r189 = load i32, i32* %r188
  %r190 = getelementptr i32, i32* %r104, i32 1
  %r191 = load i32, i32* %r190
  %r192 = mul i32 %r189, %r191
  %r193 = add i32 %r187, %r192
  %r194 = getelementptr i32, i32* %r101, i32 2
  %r195 = load i32, i32* %r194
  %r196 = getelementptr i32, i32* %r105, i32 1
  %r197 = load i32, i32* %r196
  %r198 = mul i32 %r195, %r197
  %r199 = add i32 %r193, %r198
  store i32 %r199, i32* %r182
  %r200 = getelementptr i32, i32* %r107, i32 2
  %r201 = getelementptr i32, i32* %r101, i32 0
  %r202 = load i32, i32* %r201
  %r203 = getelementptr i32, i32* %r103, i32 2
  %r204 = load i32, i32* %r203
  %r205 = mul i32 %r202, %r204
  %r206 = getelementptr i32, i32* %r101, i32 1
  %r207 = load i32, i32* %r206
  %r208 = getelementptr i32, i32* %r104, i32 2
  %r209 = load i32, i32* %r208
  %r210 = mul i32 %r207, %r209
  %r211 = add i32 %r205, %r210
  %r212 = getelementptr i32, i32* %r101, i32 2
  %r213 = load i32, i32* %r212
  %r214 = getelementptr i32, i32* %r105, i32 2
  %r215 = load i32, i32* %r214
  %r216 = mul i32 %r213, %r215
  %r217 = add i32 %r211, %r216
  store i32 %r217, i32* %r200
  %r218 = getelementptr i32, i32* %r108, i32 0
  %r219 = getelementptr i32, i32* %r102, i32 0
  %r220 = load i32, i32* %r219
  %r221 = getelementptr i32, i32* %r103, i32 0
  %r222 = load i32, i32* %r221
  %r223 = mul i32 %r220, %r222
  %r224 = getelementptr i32, i32* %r102, i32 1
  %r225 = load i32, i32* %r224
  %r226 = getelementptr i32, i32* %r104, i32 0
  %r227 = load i32, i32* %r226
  %r228 = mul i32 %r225, %r227
  %r229 = add i32 %r223, %r228
  %r230 = getelementptr i32, i32* %r102, i32 2
  %r231 = load i32, i32* %r230
  %r232 = getelementptr i32, i32* %r105, i32 0
  %r233 = load i32, i32* %r232
  %r234 = mul i32 %r231, %r233
  %r235 = add i32 %r229, %r234
  store i32 %r235, i32* %r218
  %r236 = getelementptr i32, i32* %r108, i32 1
  %r237 = getelementptr i32, i32* %r102, i32 0
  %r238 = load i32, i32* %r237
  %r239 = getelementptr i32, i32* %r103, i32 1
  %r240 = load i32, i32* %r239
  %r241 = mul i32 %r238, %r240
  %r242 = getelementptr i32, i32* %r102, i32 1
  %r243 = load i32, i32* %r242
  %r244 = getelementptr i32, i32* %r104, i32 1
  %r245 = load i32, i32* %r244
  %r246 = mul i32 %r243, %r245
  %r247 = add i32 %r241, %r246
  %r248 = getelementptr i32, i32* %r102, i32 2
  %r249 = load i32, i32* %r248
  %r250 = getelementptr i32, i32* %r105, i32 1
  %r251 = load i32, i32* %r250
  %r252 = mul i32 %r249, %r251
  %r253 = add i32 %r247, %r252
  store i32 %r253, i32* %r236
  %r254 = getelementptr i32, i32* %r108, i32 2
  %r255 = getelementptr i32, i32* %r102, i32 0
  %r256 = load i32, i32* %r255
  %r257 = getelementptr i32, i32* %r103, i32 2
  %r258 = load i32, i32* %r257
  %r259 = mul i32 %r256, %r258
  %r260 = getelementptr i32, i32* %r102, i32 1
  %r261 = load i32, i32* %r260
  %r262 = getelementptr i32, i32* %r104, i32 2
  %r263 = load i32, i32* %r262
  %r264 = mul i32 %r261, %r263
  %r265 = add i32 %r259, %r264
  %r266 = getelementptr i32, i32* %r102, i32 2
  %r267 = load i32, i32* %r266
  %r268 = getelementptr i32, i32* %r105, i32 2
  %r269 = load i32, i32* %r268
  %r270 = mul i32 %r267, %r269
  %r271 = add i32 %r265, %r270
  store i32 %r271, i32* %r254
  ret i32 0
}

define i32 @main( ) {
main:
  %r306 = alloca i32
  call void @_sysy_starttime(i32 97)
  store i32 3, i32* @N
  store i32 3, i32* @M
  store i32 3, i32* @L
  %r272 = alloca [ 3 x i32 ]
  %r273 = alloca [ 3 x i32 ]
  %r274 = alloca [ 3 x i32 ]
  %r275 = alloca [ 3 x i32 ]
  %r276 = alloca [ 3 x i32 ]
  %r277 = alloca [ 3 x i32 ]
  %r278 = alloca [ 6 x i32 ]
  %r279 = alloca [ 3 x i32 ]
  %r280 = alloca [ 3 x i32 ]
  %r281 = alloca i32
  store i32 0, i32* %r281
  br label %bb1

bb1:
  %r283 = load i32, i32* %r281
  %r284 = load i32, i32* @M
  %r282 = icmp slt i32 %r283, %r284
  br i1 %r282, label %bb2, label %bb3

bb2:
  %r286 = load i32, i32* %r281
  %r285 = getelementptr [3 x i32 ], [3 x i32 ]* %r272, i32 0, i32 %r286
  %r287 = load i32, i32* %r281
  store i32 %r287, i32* %r285
  %r289 = load i32, i32* %r281
  %r288 = getelementptr [3 x i32 ], [3 x i32 ]* %r273, i32 0, i32 %r289
  %r290 = load i32, i32* %r281
  store i32 %r290, i32* %r288
  %r292 = load i32, i32* %r281
  %r291 = getelementptr [3 x i32 ], [3 x i32 ]* %r274, i32 0, i32 %r292
  %r293 = load i32, i32* %r281
  store i32 %r293, i32* %r291
  %r295 = load i32, i32* %r281
  %r294 = getelementptr [3 x i32 ], [3 x i32 ]* %r275, i32 0, i32 %r295
  %r296 = load i32, i32* %r281
  store i32 %r296, i32* %r294
  %r298 = load i32, i32* %r281
  %r297 = getelementptr [3 x i32 ], [3 x i32 ]* %r276, i32 0, i32 %r298
  %r299 = load i32, i32* %r281
  store i32 %r299, i32* %r297
  %r301 = load i32, i32* %r281
  %r300 = getelementptr [3 x i32 ], [3 x i32 ]* %r277, i32 0, i32 %r301
  %r302 = load i32, i32* %r281
  store i32 %r302, i32* %r300
  %r303 = load i32, i32* %r281
  %r