@max = global i32 1073741824
@a = global [ 10000000 x i32 ] zeroinitializer
@b = global [ 10000000 x i32 ] zeroinitializer
@kernelid = global [ 10000 x i32 ] zeroinitializer
define i32 @checkrange( i32 %r100 ) {
checkrange:
  %r101 = alloca i32
  store i32 %r100, i32* %r101
  br label %bb1

bb1:
  %r103 = load i32, i32* %r101
  %r104 = load i32, i32* @max
  %r102 = icmp sgt i32 %r103, %r104
  br i1 %r102, label %bb2, label %bb3

bb2:
  %r105 = load i32, i32* %r101
  %r106 = load i32, i32* @max
  %r107 = sub i32 %r105, %r106
  store i32 %r107, i32* %r101
  br label %bb1

bb3:
  br label %bb4

bb4:
  %r109 = load i32, i32* %r101
  %r108 = icmp slt i32 %r109, 0
  br i1 %r108, label %bb5, label %bb6

bb5:
  %r110 = load i32, i32* %r101
  %r111 = load i32, i32* @max
  %r112 = add i32 %r110, %r111
  store i32 %r112, i32* %r101
  br label %bb4

bb6:
  %r113 = load i32, i32* %r101
  ret i32 %r113
}

define i32 @mod( i32 %r114, i32 %r116 ) {
mod:
  %r115 = alloca i32
  store i32 %r114, i32* %r115
  %r117 = alloca i32
  store i32 %r116, i32* %r117
  %r118 = load i32, i32* %r115
  %r119 = load i32, i32* %r115
  %r120 = load i32, i32* %r117
  %r121 = sdiv i32 %r119, %r120
  %r122 = load i32, i32* %r117
  %r123 = mul i32 %r121, %r122
  %r124 = sub i32 %r118, %r123
  ret i32 %r124
}

define i32 @reduce( i32 %r125, i32 %r127, i32 %r129 ) {
reduce:
  %r223 = alloca i32
  %r215 = alloca i32
  %r210 = alloca i32
  %r209 = alloca i32
  %r190 = alloca i32
  %r182 = alloca i32
  %r177 = alloca i32
  %r176 = alloca i32
  %r142 = alloca i32
  %r141 = alloca i32
  %r126 = alloca i32
  store i32 %r125, i32* %r126
  %r128 = alloca i32
  store i32 %r127, i32* %r128
  %r130 = alloca i32
  store i32 %r129, i32* %r130
  %r133 = load i32, i32* %r126
  %r132 = icmp eq i32 %r133, 0
  br i1 %r132, label %bb7, label %bb8

bb7:
  %r135 = load i32, i32* %r128
  %r136 = load i32, i32* %r130
  %r137 = add i32 %r135, %r136
  %r134 = call i32 @checkrange(i32 %r137)
  ret i32 %r134
bb8:
  br label %bb9

bb9:
  %r140 = load i32, i32* %r126
  %r139 = icmp eq i32 %r140, 1
  br i1 %r139, label %bb10, label %bb11

bb10:
  store i32 0, i32* %r141
  store i32 1, i32* %r142
  br label %bb13

bb13:
  %r144 = load i32, i32* %r142
  %r145 = load i32, i32* @max
  %r143 = icmp slt i32 %r144, %r145
  br i1 %r143, label %bb14, label %bb15

bb14:
  %r149 = load i32, i32* %r128
  %r150 = load i32, i32* %r142
  %r151 = sdiv i32 %r149, %r150
  %r148 = call i32 @mod(i32 %r151, i32 2)
  %r153 = load i32, i32* %r130
  %r154 = load i32, i32* %r142
  %r155 = sdiv i32 %r153, %r154
  %r152 = call i32 @mod(i32 %r155, i32 2)
  %r147 = icmp eq i32 %r148, %r152
  br i1 %r147, label %bb16, label %bb17

bb16:
  %r156 = load i32, i32* %r141
  %r157 = mul i32 %r156, 2
  store i32 %r157, i32* %r141
  br label %bb18

bb17:
  %r158 = load i32, i32* %r141
  %r159 = mul i32 %r158, 2
  %r160 = add i32 %r159, 1
  store i32 %r160, i32* %r141
  br label %bb18

bb18:
  %r161 = load i32, i32* %r142
  %r162 = mul i32 %r161, 2
  store i32 %r162, i32* %r142
  br label %bb13

bb15:
  %r163 = load i32, i32* %r141
  ret i32 %r163
bb11:
  br label %bb12

bb12:
  %r166 = load i32, i32* %r126
  %r165 = icmp eq i32 %r166, 2
  br i1 %r165, label %bb19, label %bb20

bb19:
  %r169 = load i32, i32* %r128
  %r170 = load i32, i32* %r130
  %r168 = icmp sgt i32 %r169, %r170
  br i1 %r168, label %bb22, label %bb23

bb22:
  %r171 = load i32, i32* %r128
  ret i32 %r171
bb23:
  %r172 = load i32, i32* %r130
  ret i32 %r172
bb24:
  br label %bb21

bb20:
  br label %bb21

bb21:
  %r175 = load i32, i32* %r126
  %r174 = icmp eq i32 %r175, 3
  br i1 %r174, label %bb25, label %bb26

bb25:
  store i32 0, i32* %r176
  store i32 1, i32* %r177
  br label %bb28

bb28:
  %r179 = load i32, i32* %r177
  %r180 = load i32, i32* @max
  %r178 = icmp slt i32 %r179, %r180
  br i1 %r178, label %bb29, label %bb30

bb29:
  %r185 = load i32, i32* %r128
  %r186 = load i32, i32* %r177
  %r187 = sdiv i32 %r185, %r186
  %r184 = call i32 @mod(i32 %r187, i32 2)
  %r183 = icmp eq i32 %r184, 1
  br i1 %r183, label %bb35, label %bb36

bb35:
  store i32 1, i32* %r182
  br label %bb37

bb36:
  store i32 0, i32* %r182
  br label %bb37

bb37:
  %r189 = load i32, i32* %r182
  %r188 = icmp ne i32 %r189, 0
  br i1 %r188, label %bb31, label %bb34

bb34:
  %r193 = load i32, i32* %r130
  %r194 = load i32, i32* %r177
  %r195 = sdiv i32 %r193, %r194
  %r192 = call i32 @mod(i32 %r195, i32 2)
  %r191 = icmp eq i32 %r192, 1
  br i1 %r191, label %bb38, label %bb39

bb38:
  store i32 1, i32* %r190
  br label %bb40

bb39:
  store i32 0, i32* %r190
  br label %bb40

bb40:
  %r197 = load i32, i32* %r190
  %r196 = icmp ne i32 %r197, 0
  br i1 %r196, label %bb31, label %bb32

bb31:
  %r198 = load i32, i32* %r176
  %r199 = mul i32 %r198, 2
  %r200 = add i32 %r199, 1
  store i32 %r200, i32* %r176
  br label %bb33

bb32:
  %r201 = load i32, i32* %r176
  %r202 = mul i32 %r201, 2
  store i32 %r202, i32* %r176
  br label %bb33

bb33:
  %r203 = load i32, i32* %r177
  %r204 = mul i32 %r203, 2
  store i32 %r204, i32* %r177
  br label %bb28

bb30:
  %r205 = load i32, i32* %r176
  ret i32 %r205
bb26:
  br label %bb27

bb27:
  %r208 = load i32, i32* %r126
  %r207 = icmp eq i32 %r208, 4
  br i1 %r207, label %bb41, label %bb42

bb41:
  store i32 0, i32* %r209
  store i32 1, i32* %r210
  br label %bb44

bb44:
  %r212 = load i32, i32* %r210
  %r213 = load i32, i32* @max
  %r211 = icmp slt i32 %r212, %r213
  br i1 %r211, label %bb45, label %bb46

bb45:
  %r218 = load i32, i32* %r128
  %r219 = load i32, i32* %r210
  %r220 = sdiv i32 %r218, %r219
  %r217 = call i32 @mod(i32 %r220, i32 2)
  %r216 = icmp eq i32 %r217, 1
  br i1 %r216, label %bb51, label %bb52

bb51:
  store i32 1, i32* %r215
  br label %bb53

bb52:
  store i32 0, i32* %r215
  br label %bb53

bb53:
  %r222 = load i32, i32* %r215
  %r221 = icmp ne i32 %r222, 0
  br i1 %r221, label %bb50, label %bb48

bb50:
  %r226 = load i32, i32* %r130
  %r227 = load i32, i32* %r210
  %r228 = sdiv i32 %r226, %r227
  %r225 = call i32 @mod(i32 %r228, i32 2)
  %r224 = icmp eq i32 %r225, 1
  br i1 %r224, label %bb54, label %bb55

bb54:
  store i32 1, i32* %r223
  br label %bb56

bb55:
  store i32 0, i32* %r223
  br label %bb56

bb56:
  %r230 = load i32, i32* %r223
  %r229 = icmp ne i32 %r230, 0
  br i1 %r229, label %bb47, label %bb48

bb47:
  %r231 = load i32, i32* %r209
  %r232 = mul i32 %r231, 2
  %r233 = add i32 %r232, 1
  store i32 %r233, i32* %r209
  br label %bb49

bb48:
  %r234 = load i32, i32* %r209
  %r235 = mul i32 %r234, 2
  store i32 %r235, i32* %r209
  br label %bb49

bb49:
  %r236 = load i32, i32* %r210
  %r237 = mul i32 %r236, 2
  store i32 %r237, i32* %r210
  br label %bb44

bb46:
  %r238 = load i32, i32* %r209
  ret i32 %r238
bb42:
  br label %bb43

bb43:
  ret i32 0
}

define i32 @getvalue( i32* %r239, i32 %r240, i32 %r242, i32 %r244, i32 %r246 ) {
getvalue:
  %r282 = alloca i32
  %r271 = alloca i32
  %r263 = alloca i32
  %r256 = alloca i32
  %r241 = alloca i32
  store i32 %r240, i32* %r241
  %r243 = alloca i32
  store i32 %r242, i32* %r243
  %r245 = alloca i32
  store i32 %r244, i32* %r245
  %r247 = alloca i32
  store i32 %r246, i32* %r247
  %r249 = alloca i32
  %r250 = alloca i32
  %r251 = alloca i32
  %r253 = load i32, i32* %r245
  %r252 = icmp slt i32 %r253, 0
  br i1 %r252, label %bb69, label %bb70

bb69:
  store i32 1, i32* %r251
  br label %bb71

bb70:
  store i32 0, i32* %r251
  br label %bb71

bb71:
  %r255 = load i32, i32* %r251
  %r254 = icmp ne i32 %r255, 0
  br i1 %r254, label %bb65, label %bb68

bb68:
  %r258 = load i32, i32* %r247
  %r257 = icmp slt i32 %r258, 0
  br i1 %r257, label %bb72, label %bb73

bb72:
  store i32 1, i32* %r256
  br label %bb74

bb73:
  store i32 0, i32* %r256
  br label %bb74

bb74:
  %r260 = load i32, i32* %r256
  %r259 = icmp ne i32 %r260, 0
  br i1 %r259, label %bb65, label %bb66

bb65:
  store i32 1, i32* %r250
  br label %bb67

bb66:
  store i32 0, i32* %r250
  br label %bb67

bb67:
  %r262 = load i32, i32* %r250
  %r261 = icmp ne i32 %r262, 0
  br i1 %r261, label %bb61, label %bb64

bb64:
  %r265 = load i32, i32* %r245
  %r266 = load i32, i32* %r241
  %r264 = icmp sge i32 %r265, %r266
  br i1 %r264, label %bb75, label %bb76

bb75:
  store i32 1, i32* %r263
  br label %bb77

bb76:
  store i32 0, i32* %r263
  br label %bb77

bb77:
  %r268 = load i32, i32* %r263
  %r267 = icmp ne i32 %r268, 0
  br i1 %r267, label %bb61, label %bb62

bb61:
  store i32 1, i32* %r249
  br label %bb63

bb62:
  store i32 0, i32* %r249
  br label %bb63

bb63:
  %r270 = load i32, i32* %r249
  %r269 = icmp ne i32 %r270, 0
  br i1 %r269, label %bb57, label %bb60

bb60:
  %r273 = load i32, i32* %r247
  %r274 = load i32, i32* %r243
  %r272 = icmp sge i32 %r273, %r274
  br i1 %r272, label %bb78, label %bb79

bb78:
  store i32 1, i32* %r271
  br label %bb80

bb79:
  store i32 0, i32* %r271
  br label %bb80

bb80:
  %r276 = load i32, i32* %r271
  %r275 = icmp ne i32 %r276, 0
  br i1 %r275, label %bb57, label %bb58

bb57:
  ret i32 0
bb58:
  br label %bb59

bb59:
  %r277 = load i32, i32* %r245
  %r278 = load i32, i32* %r243
  %r279 = mul i32 %r277, %r278
  %r280 = load i32, i32* %r247
  %r281 = add i32 %r279, %r280
  store i32 %r281, i32* %r282
  %r284 = load i32, i32* %r282
  %r283 = getelementptr i32, i32* %r239, i32 %r284
  %r285 = load i32, i32* %r283
  ret i32 %r285
}

define i32 @convn( i32 %r286, i32* %r288, i32* %r289, i32 %r290, i32 %r292, i32 %r294 ) {
convn:
  %r353 = alloca i32
  %r287 = alloca i32
  store i32 %r286, i32* %r287
  %r291 = alloca i32
  store i32 %r290, i32* %r291
  %r293 = alloca i32
  store i32 %r292, i32* %r293
  %r295 = alloca i32
  store i32 %r294, i32* %r295
  %r296 = alloca i32
  store i32 0, i32* %r296
  %r297 = alloca i32
  store i32 0, i32* %r297
  %r298 = alloca i32
  %r299 = alloca i32
  %r300 = alloca i32
  %r301 = alloca i32
  store i32 1, i32* %r301
  br label %bb81

bb81:
  %r303 = load i32, i32* %r301
  %r304 = load i32, i32* %r301
  %r302 = icmp eq i32 %r303, %r304
  br i1 %r302, label %bb82, label %bb83

bb82:
  store i32 0, i32* %r297
  br label %bb84

bb84:
  %r306 = load i32, i32* %r301
  %r307 = load i32, i32* %r301
  %r305 = icmp eq i32 %r306, %r307
  br i1 %r305, label %bb85, label %bb86

bb85:
  store i32 0, i32* %r300
  %r308 = load i32, i32* %r296
  %r309 = load i32, i32* %r295
  %r310 = sdiv i32 %r309, 2
  %r311 = sub i32 %r308, %r310
  store i32 %r311, i32* %r298
  br label %bb87

bb87:
  %r313 = load i32, i32* %r301
  %r314 = load i32, i32* %r301
  %r312 = icmp eq i32 %r313, %r314
  br i1 %r312, label %bb88, label %bb89

bb88:
  %r315 = load i32, i32* %r297
  %r316 = load i32, i32* %r295
  %r317 = sdiv i32 %r316, 2
  %r318 = sub i32 %r315, %r317
  store i32 %r318, i32* %r299
  br label %bb90

bb90:
  %r320 = load i32, i32* %r301
  %r321 = load i32, i32* %r301
  %r319 = icmp eq i32 %r320, %r321
  br i1 %r319, label %bb91, label %bb92

bb91:
  %r323 = load i32, i32* %r287
  %r324 = load i32, i32* %r300
  %r326 = load i32, i32* %r291
  %r327 = load i32, i32* %r293
  %r328 = load i32, i32* %r298
  %r329 = load i32, i32* %r299
  %r325 = call i32 @getvalue(i32* %r288, i32 %r326, i32 %r327, i32 %r328, i32 %r329)
  %r322 = call i32 @reduce(i32 %r323, i32 %r324, i32 %r325)
  store i32 %r322, i32* %r300
  %r330 = load i32, i32* %r299
  %r331 = add i32 %r330, 1
  store i32 %r331, i32* %r299
  %r334 = load i32, i32* %r299
  %r335 = load i32, i32* %r297
  %r336 = load i32, i32* %r295
  %r337 = sdiv i32 %r336, 2
  %r338 = add i32 %r335, %r337
  %r333 = icmp sge i32 %r334, %r338
  br i1 %r333, label %bb93, label %bb94

bb93:
  br label %bb92

bb94:
  br label %bb95

bb95:
  br label %bb90

bb92:
  %r339 = load i32, i32* %r298
  %r340 = add i32 %r339, 1
  store i32 %r340, i32* %r298
  %r343 = load i32, i32* %r298
  %r344 = load i32, i32* %r296
  %r345 = load i32, i32* %r295
  %r346 = sdiv i32 %r345, 2
  %r347 = add i32 %r344, %r346
  %r342 = icmp sge i32 %r343, %r347
  br i1 %r342, label %bb96, label %bb97

bb96:
  br label %bb89

bb97:
  br label %bb98

bb98:
  br label %bb87

bb89:
  %r348 = load i32, i32* %r296
  %r349 = load i32, i32* %r293
  %r350 = mul i32 %r348, %r349
  %r351 = load i32, i32* %r297
  %r352 = add i32 %r350, %r351
  store i32 %r352, i32* %r353
  %r355 = load i32, i32* %r353
  %r354 = getelementptr i32