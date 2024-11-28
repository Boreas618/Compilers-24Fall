declare i32 @getch( )
declare i32 @getint( )
declare void @putch( i32 )
declare void @putint( i32 )
declare void @putarray( i32, i32* )
declare void @_sysy_starttime( i32 )
declare void @_sysy_stoptime( i32 )
@a = global i32 0
@b = global i32 0
@d = global i32 0
define i32 @set_a( i32 %r100 ) {
set_a:
  %r258 = add i32 0, 0
  %r259 = add i32 %r100, 0
  store i32 %r259, i32* @a
  %r260 = load i32, i32* @a
  ret i32 %r260
}

define i32 @set_b( i32 %r104 ) {
set_b:
  %r262 = add i32 0, 0
  %r263 = add i32 %r104, 0
  store i32 %r263, i32* @b
  %r264 = load i32, i32* @b
  ret i32 %r264
}

define i32 @set_d( i32 %r108 ) {
set_d:
  %r266 = add i32 0, 0
  %r267 = add i32 %r108, 0
  store i32 %r267, i32* @d
  %r268 = load i32, i32* @d
  ret i32 %r268
}

define i32 @main( ) {
main:
  %r299 = add i32 0, 0
  %r300 = add i32 0, 0
  %r301 = add i32 0, 0
  %r302 = add i32 0, 0
  %r303 = add i32 0, 0
  %r304 = add i32 0, 0
  %r305 = add i32 0, 0
  %r306 = add i32 0, 0
  %r307 = add i32 0, 0
  %r308 = add i32 0, 0
  %r309 = add i32 0, 0
  %r310 = add i32 0, 0
  %r311 = add i32 0, 0
  %r312 = add i32 0, 0
  %r313 = add i32 0, 0
  %r314 = add i32 0, 0
  %r315 = add i32 0, 0
  %r316 = add i32 0, 0
  %r317 = add i32 0, 0
  %r318 = add i32 0, 0
  %r319 = add i32 0, 0
  %r320 = add i32 0, 0
  %r321 = add i32 0, 0
  %r322 = add i32 0, 0
  %r323 = add i32 0, 0
  %r324 = add i32 0, 0
  %r325 = add i32 0, 0
  %r326 = add i32 0, 0
  %r327 = add i32 0, 0
  call void @_sysy_starttime(i32 97)
  store i32 2, i32* @a
  store i32 3, i32* @b
  %r328 = add i32 0, 0
  %r329 = call i32 @set_a(i32 0)
  %r330 = icmp ne i32 %r329, 0
  br i1 %r330, label %bb5, label %bb6

bb5:
  %r332 = add i32 1, 0
  br label %bb7

bb6:
  %r331 = add i32 0, 0
  br label %bb7

bb7:
  %r333 = phi i32 [ %r332, %bb5 ], [ %r331, %bb6 ]
  %r334 = icmp ne i32 %r333, 0
  br i1 %r334, label %bb4, label %bb2

bb4:
  %r459 = call i32 @set_b(i32 1)
  %r460 = icmp ne i32 %r459, 0
  br i1 %r460, label %bb8, label %bb9

bb8:
  %r462 = add i32 1, 0
  br label %bb10

bb9:
  %r461 = add i32 0, 0
  br label %bb10

bb10:
  %r463 = phi i32 [ %r462, %bb8 ], [ %r461, %bb9 ]
  %r464 = icmp ne i32 %r463, 0
  br i1 %r464, label %bb1, label %bb2

bb1:
  br label %bb3

bb2:
  br label %bb3

bb3:
  %r335 = load i32, i32* @a
  call void @putint(i32 %r335)
  call void @putch(i32 32)
  %r336 = load i32, i32* @b
  call void @putint(i32 %r336)
  call void @putch(i32 32)
  store i32 2, i32* @a
  store i32 3, i32* @b
  %r337 = call i32 @set_a(i32 0)
  %r338 = icmp ne i32 %r337, 0
  br i1 %r338, label %bb15, label %bb16

bb15:
  %r458 = add i32 1, 0
  br label %bb17

bb16:
  %r339 = add i32 0, 0
  br label %bb17

bb17:
  %r340 = phi i32 [ %r458, %bb15 ], [ %r339, %bb16 ]
  %r341 = icmp ne i32 %r340, 0
  br i1 %r341, label %bb14, label %bb12

bb14:
  %r342 = call i32 @set_b(i32 1)
  %r343 = icmp ne i32 %r342, 0
  br i1 %r343, label %bb18, label %bb19

bb18:
  %r344 = add i32 1, 0
  br label %bb20

bb19:
  %r345 = add i32 0, 0
  br label %bb20

bb20:
  %r346 = phi i32 [ %r344, %bb18 ], [ %r345, %bb19 ]
  %r347 = icmp ne i32 %r346, 0
  br i1 %r347, label %bb11, label %bb12

bb11:
  br label %bb13

bb12:
  br label %bb13

bb13:
  %r348 = load i32, i32* @a
  call void @putint(i32 %r348)
  call void @putch(i32 32)
  %r349 = load i32, i32* @b
  call void @putint(i32 %r349)
  call void @putch(i32 10)
  %r350 = add i32 1, 0
  store i32 2, i32* @d
  %r351 = icmp sge i32 %r350, 1
  br i1 %r351, label %bb25, label %bb26

bb25:
  %r456 = add i32 1, 0
  br label %bb27

bb26:
  %r457 = add i32 0, 0
  br label %bb27

bb27:
  %r352 = phi i32 [ %r456, %bb25 ], [ %r457, %bb26 ]
  %r353 = icmp ne i32 %r352, 0
  br i1 %r353, label %bb24, label %bb22

bb24:
  %r354 = call i32 @set_d(i32 3)
  %r355 = icmp ne i32 %r354, 0
  br i1 %r355, label %bb28, label %bb29

bb28:
  %r356 = add i32 1, 0
  br label %bb30

bb29:
  %r357 = add i32 0, 0
  br label %bb30

bb30:
  %r358 = phi i32 [ %r356, %bb28 ], [ %r357, %bb29 ]
  %r359 = icmp ne i32 %r358, 0
  br i1 %r359, label %bb21, label %bb22

bb21:
  br label %bb23

bb22:
  br label %bb23

bb23:
  %r360 = load i32, i32* @d
  call void @putint(i32 %r360)
  call void @putch(i32 32)
  %r361 = icmp sle i32 %r350, 1
  br i1 %r361, label %bb35, label %bb36

bb35:
  %r454 = add i32 1, 0
  br label %bb37

bb36:
  %r455 = add i32 0, 0
  br label %bb37

bb37:
  %r362 = phi i32 [ %r454, %bb35 ], [ %r455, %bb36 ]
  %r363 = icmp ne i32 %r362, 0
  br i1 %r363, label %bb31, label %bb34

bb34:
  %r448 = call i32 @set_d(i32 4)
  %r449 = icmp ne i32 %r448, 0
  br i1 %r449, label %bb38, label %bb39

bb38:
  %r453 = add i32 1, 0
  br label %bb40

bb39:
  %r452 = add i32 0, 0
  br label %bb40

bb40:
  %r450 = phi i32 [ %r453, %bb38 ], [ %r452, %bb39 ]
  %r451 = icmp ne i32 %r450, 0
  br i1 %r451, label %bb31, label %bb32

bb31:
  br label %bb33

bb32:
  br label %bb33

bb33:
  %r364 = load i32, i32* @d
  call void @putint(i32 %r364)
  call void @putch(i32 10)
  call void @putch(i32 10)
  %r365 = add i32 0, 0
  %r366 = add i32 1, 0
  %r367 = add i32 2, 0
  %r368 = add i32 3, 0
  %r369 = add i32 4, 0
  br label %bb41

bb41:
  %r370 = icmp ne i32 %r365, 0
  br i1 %r370, label %bb45, label %bb46

bb45:
  %r447 = add i32 1, 0
  br label %bb47

bb46:
  %r371 = add i32 0, 0
  br label %bb47

bb47:
  %r372 = phi i32 [ %r447, %bb45 ], [ %r371, %bb46 ]
  %r373 = icmp ne i32 %r372, 0
  br i1 %r373, label %bb44, label %bb43

bb44:
  %r374 = icmp ne i32 %r366, 0
  br i1 %r374, label %bb48, label %bb49

bb48:
  %r376 = add i32 1, 0
  br label %bb50

bb49:
  %r375 = add i32 0, 0
  br label %bb50

bb50:
  %r377 = phi i32 [ %r376, %bb48 ], [ %r375, %bb49 ]
  %r378 = icmp ne i32 %r377, 0
  br i1 %r378, label %bb42, label %bb43

bb42:
  call void @putch(i32 32)
  br label %bb41

bb43:
  %r379 = icmp ne i32 %r365, 0
  br i1 %r379, label %bb55, label %bb56

bb55:
  %r445 = add i32 1, 0
  br label %bb57

bb56:
  %r446 = add i32 0, 0
  br label %bb57

bb57:
  %r380 = phi i32 [ %r445, %bb55 ], [ %r446, %bb56 ]
  %r381 = icmp ne i32 %r380, 0
  br i1 %r381, label %bb51, label %bb54

bb54:
  %r382 = icmp ne i32 %r366, 0
  br i1 %r382, label %bb58, label %bb59

bb58:
  %r384 = add i32 1, 0
  br label %bb60

bb59:
  %r383 = add i32 0, 0
  br label %bb60

bb60:
  %r385 = phi i32 [ %r384, %bb58 ], [ %r383, %bb59 ]
  %r386 = icmp ne i32 %r385, 0
  br i1 %r386, label %bb51, label %bb52

bb51:
  call void @putch(i32 67)
  br label %bb53

bb52:
  br label %bb53

bb53:
  %r387 = icmp sge i32 %r365, %r366
  br i1 %r387, label %bb65, label %bb66

bb65:
  %r443 = add i32 1, 0
  br label %bb67

bb66:
  %r444 = add i32 0, 0
  br label %bb67

bb67:
  %r388 = phi i32 [ %r443, %bb65 ], [ %r444, %bb66 ]
  %r389 = icmp ne i32 %r388, 0
  br i1 %r389, label %bb61, label %bb64

bb64:
  %r390 = icmp sle i32 %r366, %r365
  br i1 %r390, label %bb68, label %bb69

bb68:
  %r392 = add i32 1, 0
  br label %bb70

bb69:
  %r391 = add i32 0, 0
  br label %bb70

bb70:
  %r393 = phi i32 [ %r392, %bb68 ], [ %r391, %bb69 ]
  %r394 = icmp ne i32 %r393, 0
  br i1 %r394, label %bb61, label %bb62

bb61:
  call void @putch(i32 72)
  br label %bb63

bb62:
  br label %bb63

bb63:
  %r395 = icmp sge i32 %r367, %r366
  br i1 %r395, label %bb75, label %bb76

bb75:
  %r396 = add i32 1, 0
  br label %bb77

bb76:
  %r442 = add i32 0, 0
  br label %bb77

bb77:
  %r397 = phi i32 [ %r396, %bb75 ], [ %r442, %bb76 ]
  %r398 = icmp ne i32 %r397, 0
  br i1 %r398, label %bb74, label %bb72

bb74:
  %r399 = icmp ne i32 %r369, %r368
  br i1 %r399, label %bb78, label %bb79

bb78:
  %r401 = add i32 1, 0
  br label %bb80

bb79:
  %r400 = add i32 0, 0
  br label %bb80

bb80:
  %r402 = phi i32 [ %r401, %bb78 ], [ %r400, %bb79 ]
  %r403 = icmp ne i32 %r402, 0
  br i1 %r403, label %bb71, label %bb72

bb71:
  call void @putch(i32 73)
  br label %bb73

bb72:
  br label %bb73

bb73:
  %r404 = icmp ne i32 %r366, 0
  br i1 %r404, label %bb90, label %bb89

bb89:
  %r441 = add i32 1, 0
  br label %bb91

bb90:
  %r440 = add i32 0, 0
  br label %bb91

bb91:
  %r405 = phi i32 [ %r441, %bb89 ], [ %r440, %bb90 ]
  %r406 = icmp ne i32 %r405, 0
  br i1 %r406, label %bb88, label %bb86

bb88:
  %r408 = icmp slt i32 %r368, %r368
  br i1 %r408, label %bb92, label %bb93

bb92:
  %r409 = add i32 1, 0
  br label %bb94

bb93:
  %r413 = add i32 0, 0
  br label %bb94

bb94:
  %r410 = phi i32 [ %r409, %bb92 ], [ %r413, %bb93 ]
  %r411 = icmp ne i32 %r410, 0
  br i1 %r411, label %bb85, label %bb86

bb85:
  %r412 = add i32 1, 0
  br label %bb87

bb86:
  %r407 = add i32 0, 0
  br label %bb87

bb87:
  %r414 = phi i32 [ %r412, %bb85 ], [ %r407, %bb86 ]
  %r415 = icmp ne i32 %r414, 0
  br i1 %r415, label %bb81, label %bb84

bb84:
  %r435 = icmp sge i32 %r369, %r369
  br i1 %r435, label %bb95, label %bb96

bb95:
  %r438 = add i32 1, 0
  br label %bb97

bb96:
  %r439 = add i32 0, 0
  br label %bb97

bb97:
  %r436 = phi i32 [ %r438, %bb95 ], [ %r439, %bb96 ]
  %r437 = icmp ne i32 %r436, 0
  br i1 %r437, label %bb81, label %bb82

bb81:
  call void @putch(i32 74)
  br label %bb83

bb82:
  br label %bb83

bb83:
  %r416 = icmp ne i32 %r366, 0
  br i1 %r416, label %bb103, label %bb102

bb102:
  %r434 = add i32 1, 0
  br label %bb104

bb103:
  %r433 = add i32 0, 0
  br label %bb104

bb104:
  %r417 = phi i32 [ %r434, %bb102 ], [ %r433, %bb103 ]
  %r418 = icmp ne i32 %r417, 0
  br i1 %r418, label %bb98, label %bb101

bb101:
  %r419 = icmp slt i32 %r368, %r368
  br i1 %r419, label %bb109, label %bb110

bb109:
  %r432 = add i32 1, 0
  br label %bb111

bb110:
  %r420 = add i32 0, 0
  br label %bb111

bb111:
  %r421 = phi i32 [ %r432, %bb109 ], [ %r420, %bb110 ]
  %r422 = icmp ne i32 %r421, 0
  br i1 %r422, label %bb108, label %bb106

bb108:
  %r424 = icmp sge i32 %r369, %r369
  br i1 %r424, label %bb112, label %bb113

bb112:
  %r428 = add i32 1, 0
  br label %bb114

bb113:
  %r429 = add i32 0, 0
  br label %bb114

bb114:
  %r425 = phi i32 [ %r428, %bb112 ], [ %r429, %bb113 ]
  %r426 = icmp ne i32 %r425, 0
  br i1 %r426, label %bb105, label %bb106

bb105:
  %r427 = add i32 1, 0
  br label %bb107

bb106:
  %r423 = add i32 0, 0
  br label %bb107

bb107:
  %r430 = phi i32 [ %r427, %bb105 ], [ %r423, %bb106 ]
  %r431 = icmp ne i32 %r430, 0
  br i1 %r431, label %bb98, label %bb99

bb98:
  call void @putch(i32 75)
  br label %bb100

bb99:
  br label %bb100

bb100:
  call void @putch(i32 10)
  call void @_sysy_stoptime(i32 117)
  ret i32 0
}

