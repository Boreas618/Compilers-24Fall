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
  %r464 = add i32 1, 0
  br label %bb7

bb6:
  %r331 = add i32 0, 0
  br label %bb7

bb7:
  %r332 = phi i32 [ %r464, %bb5 ], [ %r331, %bb6 ]
  %r333 = icmp ne i32 %r332, 0
  br i1 %r333, label %bb4, label %bb2

bb4:
  %r458 = call i32 @set_b(i32 1)
  %r459 = icmp ne i32 %r458, 0
  br i1 %r459, label %bb8, label %bb9

bb8:
  %r460 = add i32 1, 0
  br label %bb10

bb9:
  %r463 = add i32 0, 0
  br label %bb10

bb10:
  %r461 = phi i32 [ %r460, %bb8 ], [ %r463, %bb9 ]
  %r462 = icmp ne i32 %r461, 0
  br i1 %r462, label %bb1, label %bb2

bb1:
  br label %bb3

bb2:
  br label %bb3

bb3:
  %r334 = load i32, i32* @a
  call void @putint(i32 %r334)
  call void @putch(i32 32)
  %r335 = load i32, i32* @b
  call void @putint(i32 %r335)
  call void @putch(i32 32)
  store i32 2, i32* @a
  store i32 3, i32* @b
  %r336 = call i32 @set_a(i32 0)
  %r337 = icmp ne i32 %r336, 0
  br i1 %r337, label %bb15, label %bb16

bb15:
  %r457 = add i32 1, 0
  br label %bb17

bb16:
  %r338 = add i32 0, 0
  br label %bb17

bb17:
  %r339 = phi i32 [ %r457, %bb15 ], [ %r338, %bb16 ]
  %r340 = icmp ne i32 %r339, 0
  br i1 %r340, label %bb14, label %bb12

bb14:
  %r341 = call i32 @set_b(i32 1)
  %r342 = icmp ne i32 %r341, 0
  br i1 %r342, label %bb18, label %bb19

bb18:
  %r345 = add i32 1, 0
  br label %bb20

bb19:
  %r346 = add i32 0, 0
  br label %bb20

bb20:
  %r343 = phi i32 [ %r345, %bb18 ], [ %r346, %bb19 ]
  %r344 = icmp ne i32 %r343, 0
  br i1 %r344, label %bb11, label %bb12

bb11:
  br label %bb13

bb12:
  br label %bb13

bb13:
  %r347 = load i32, i32* @a
  call void @putint(i32 %r347)
  call void @putch(i32 32)
  %r348 = load i32, i32* @b
  call void @putint(i32 %r348)
  call void @putch(i32 10)
  %r349 = add i32 1, 0
  store i32 2, i32* @d
  %r350 = icmp sge i32 %r349, 1
  br i1 %r350, label %bb25, label %bb26

bb25:
  %r455 = add i32 1, 0
  br label %bb27

bb26:
  %r456 = add i32 0, 0
  br label %bb27

bb27:
  %r351 = phi i32 [ %r455, %bb25 ], [ %r456, %bb26 ]
  %r352 = icmp ne i32 %r351, 0
  br i1 %r352, label %bb24, label %bb22

bb24:
  %r353 = call i32 @set_d(i32 3)
  %r354 = icmp ne i32 %r353, 0
  br i1 %r354, label %bb28, label %bb29

bb28:
  %r357 = add i32 1, 0
  br label %bb30

bb29:
  %r358 = add i32 0, 0
  br label %bb30

bb30:
  %r355 = phi i32 [ %r357, %bb28 ], [ %r358, %bb29 ]
  %r356 = icmp ne i32 %r355, 0
  br i1 %r356, label %bb21, label %bb22

bb21:
  br label %bb23

bb22:
  br label %bb23

bb23:
  %r359 = load i32, i32* @d
  call void @putint(i32 %r359)
  call void @putch(i32 32)
  %r360 = icmp sle i32 %r349, 1
  br i1 %r360, label %bb35, label %bb36

bb35:
  %r361 = add i32 1, 0
  br label %bb37

bb36:
  %r362 = add i32 0, 0
  br label %bb37

bb37:
  %r363 = phi i32 [ %r361, %bb35 ], [ %r362, %bb36 ]
  %r364 = icmp ne i32 %r363, 0
  br i1 %r364, label %bb31, label %bb34

bb34:
  %r449 = call i32 @set_d(i32 4)
  %r450 = icmp ne i32 %r449, 0
  br i1 %r450, label %bb38, label %bb39

bb38:
  %r452 = add i32 1, 0
  br label %bb40

bb39:
  %r451 = add i32 0, 0
  br label %bb40

bb40:
  %r453 = phi i32 [ %r452, %bb38 ], [ %r451, %bb39 ]
  %r454 = icmp ne i32 %r453, 0
  br i1 %r454, label %bb31, label %bb32

bb31:
  br label %bb33

bb32:
  br label %bb33

bb33:
  %r365 = load i32, i32* @d
  call void @putint(i32 %r365)
  call void @putch(i32 10)
  call void @putch(i32 10)
  %r366 = add i32 0, 0
  %r367 = add i32 1, 0
  %r368 = add i32 2, 0
  %r369 = add i32 3, 0
  %r370 = add i32 4, 0
  br label %bb41

bb41:
  %r371 = icmp ne i32 %r366, 0
  br i1 %r371, label %bb45, label %bb46

bb45:
  %r372 = add i32 1, 0
  br label %bb47

bb46:
  %r448 = add i32 0, 0
  br label %bb47

bb47:
  %r373 = phi i32 [ %r372, %bb45 ], [ %r448, %bb46 ]
  %r374 = icmp ne i32 %r373, 0
  br i1 %r374, label %bb44, label %bb43

bb44:
  %r375 = icmp ne i32 %r367, 0
  br i1 %r375, label %bb48, label %bb49

bb48:
  %r376 = add i32 1, 0
  br label %bb50

bb49:
  %r379 = add i32 0, 0
  br label %bb50

bb50:
  %r377 = phi i32 [ %r376, %bb48 ], [ %r379, %bb49 ]
  %r378 = icmp ne i32 %r377, 0
  br i1 %r378, label %bb42, label %bb43

bb42:
  call void @putch(i32 32)
  br label %bb41

bb43:
  %r380 = icmp ne i32 %r366, 0
  br i1 %r380, label %bb55, label %bb56

bb55:
  %r381 = add i32 1, 0
  br label %bb57

bb56:
  %r447 = add i32 0, 0
  br label %bb57

bb57:
  %r382 = phi i32 [ %r381, %bb55 ], [ %r447, %bb56 ]
  %r383 = icmp ne i32 %r382, 0
  br i1 %r383, label %bb51, label %bb54

bb54:
  %r384 = icmp ne i32 %r367, 0
  br i1 %r384, label %bb58, label %bb59

bb58:
  %r388 = add i32 1, 0
  br label %bb60

bb59:
  %r387 = add i32 0, 0
  br label %bb60

bb60:
  %r385 = phi i32 [ %r388, %bb58 ], [ %r387, %bb59 ]
  %r386 = icmp ne i32 %r385, 0
  br i1 %r386, label %bb51, label %bb52

bb51:
  call void @putch(i32 67)
  br label %bb53

bb52:
  br label %bb53

bb53:
  %r389 = icmp sge i32 %r366, %r367
  br i1 %r389, label %bb65, label %bb66

bb65:
  %r446 = add i32 1, 0
  br label %bb67

bb66:
  %r390 = add i32 0, 0
  br label %bb67

bb67:
  %r391 = phi i32 [ %r446, %bb65 ], [ %r390, %bb66 ]
  %r392 = icmp ne i32 %r391, 0
  br i1 %r392, label %bb61, label %bb64

bb64:
  %r441 = icmp sle i32 %r367, %r366
  br i1 %r441, label %bb68, label %bb69

bb68:
  %r445 = add i32 1, 0
  br label %bb70

bb69:
  %r442 = add i32 0, 0
  br label %bb70

bb70:
  %r443 = phi i32 [ %r445, %bb68 ], [ %r442, %bb69 ]
  %r444 = icmp ne i32 %r443, 0
  br i1 %r444, label %bb61, label %bb62

bb61:
  call void @putch(i32 72)
  br label %bb63

bb62:
  br label %bb63

bb63:
  %r393 = icmp sge i32 %r368, %r367
  br i1 %r393, label %bb75, label %bb76

bb75:
  %r394 = add i32 1, 0
  br label %bb77

bb76:
  %r440 = add i32 0, 0
  br label %bb77

bb77:
  %r395 = phi i32 [ %r394, %bb75 ], [ %r440, %bb76 ]
  %r396 = icmp ne i32 %r395, 0
  br i1 %r396, label %bb74, label %bb72

bb74:
  %r397 = icmp ne i32 %r370, %r369
  br i1 %r397, label %bb78, label %bb79

bb78:
  %r399 = add i32 1, 0
  br label %bb80

bb79:
  %r398 = add i32 0, 0
  br label %bb80

bb80:
  %r400 = phi i32 [ %r399, %bb78 ], [ %r398, %bb79 ]
  %r401 = icmp ne i32 %r400, 0
  br i1 %r401, label %bb71, label %bb72

bb71:
  call void @putch(i32 73)
  br label %bb73

bb72:
  br label %bb73

bb73:
  %r402 = icmp ne i32 %r367, 0
  br i1 %r402, label %bb90, label %bb89

bb89:
  %r404 = add i32 1, 0
  br label %bb91

bb90:
  %r403 = add i32 0, 0
  br label %bb91

bb91:
  %r405 = phi i32 [ %r404, %bb89 ], [ %r403, %bb90 ]
  %r406 = icmp ne i32 %r405, 0
  br i1 %r406, label %bb88, label %bb86

bb88:
  %r407 = icmp slt i32 %r369, %r369
  br i1 %r407, label %bb92, label %bb93

bb92:
  %r409 = add i32 1, 0
  br label %bb94

bb93:
  %r408 = add i32 0, 0
  br label %bb94

bb94:
  %r410 = phi i32 [ %r409, %bb92 ], [ %r408, %bb93 ]
  %r411 = icmp ne i32 %r410, 0
  br i1 %r411, label %bb85, label %bb86

bb85:
  %r412 = add i32 1, 0
  br label %bb87

bb86:
  %r413 = add i32 0, 0
  br label %bb87

bb87:
  %r414 = phi i32 [ %r412, %bb85 ], [ %r413, %bb86 ]
  %r415 = icmp ne i32 %r414, 0
  br i1 %r415, label %bb81, label %bb84

bb84:
  %r435 = icmp sge i32 %r370, %r370
  br i1 %r435, label %bb95, label %bb96

bb95:
  %r437 = add i32 1, 0
  br label %bb97

bb96:
  %r436 = add i32 0, 0
  br label %bb97

bb97:
  %r438 = phi i32 [ %r437, %bb95 ], [ %r436, %bb96 ]
  %r439 = icmp ne i32 %r438, 0
  br i1 %r439, label %bb81, label %bb82

bb81:
  call void @putch(i32 74)
  br label %bb83

bb82:
  br label %bb83

bb83:
  %r416 = icmp ne i32 %r367, 0
  br i1 %r416, label %bb103, label %bb102

bb102:
  %r434 = add i32 1, 0
  br label %bb104

bb103:
  %r417 = add i32 0, 0
  br label %bb104

bb104:
  %r418 = phi i32 [ %r434, %bb102 ], [ %r417, %bb103 ]
  %r419 = icmp ne i32 %r418, 0
  br i1 %r419, label %bb98, label %bb101

bb101:
  %r420 = icmp slt i32 %r369, %r369
  br i1 %r420, label %bb109, label %bb110

bb109:
  %r432 = add i32 1, 0
  br label %bb111

bb110:
  %r433 = add i32 0, 0
  br label %bb111

bb111:
  %r421 = phi i32 [ %r432, %bb109 ], [ %r433, %bb110 ]
  %r422 = icmp ne i32 %r421, 0
  br i1 %r422, label %bb108, label %bb106

bb108:
  %r425 = icmp sge i32 %r370, %r370
  br i1 %r425, label %bb112, label %bb113

bb112:
  %r429 = add i32 1, 0
  br label %bb114

bb113:
  %r430 = add i32 0, 0
  br label %bb114

bb114:
  %r426 = phi i32 [ %r429, %bb112 ], [ %r430, %bb113 ]
  %r427 = icmp ne i32 %r426, 0
  br i1 %r427, label %bb105, label %bb106

bb105:
  %r428 = add i32 1, 0
  br label %bb107

bb106:
  %r431 = add i32 0, 0
  br label %bb107

bb107:
  %r423 = phi i32 [ %r428, %bb105 ], [ %r431, %bb106 ]
  %r424 = icmp ne i32 %r423, 0
  br i1 %r424, label %bb98, label %bb99

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

