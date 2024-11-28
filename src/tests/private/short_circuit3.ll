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
  %r260 = add i32 0, 0
  %r261 = add i32 %r100, 0
  store i32 %r261, i32* @a
  %r262 = load i32, i32* @a
  ret i32 %r262
}

define i32 @set_b( i32 %r104 ) {
set_b:
  %r266 = add i32 0, 0
  %r267 = add i32 %r104, 0
  store i32 %r267, i32* @b
  %r268 = load i32, i32* @b
  ret i32 %r268
}

define i32 @set_d( i32 %r108 ) {
set_d:
  %r272 = add i32 0, 0
  %r273 = add i32 %r108, 0
  store i32 %r273, i32* @d
  %r274 = load i32, i32* @d
  ret i32 %r274
}

define i32 @main( ) {
main:
  %r365 = add i32 0, 0
  %r366 = add i32 0, 0
  %r367 = add i32 0, 0
  %r368 = add i32 0, 0
  %r369 = add i32 0, 0
  %r370 = add i32 0, 0
  %r371 = add i32 0, 0
  %r372 = add i32 0, 0
  %r373 = add i32 0, 0
  %r374 = add i32 0, 0
  %r375 = add i32 0, 0
  %r376 = add i32 0, 0
  %r377 = add i32 0, 0
  %r378 = add i32 0, 0
  %r379 = add i32 0, 0
  %r380 = add i32 0, 0
  %r381 = add i32 0, 0
  %r382 = add i32 0, 0
  %r383 = add i32 0, 0
  %r384 = add i32 0, 0
  %r385 = add i32 0, 0
  %r386 = add i32 0, 0
  %r387 = add i32 0, 0
  %r388 = add i32 0, 0
  %r389 = add i32 0, 0
  %r390 = add i32 0, 0
  %r391 = add i32 0, 0
  %r392 = add i32 0, 0
  %r393 = add i32 0, 0
  call void @_sysy_starttime(i32 97)
  store i32 2, i32* @a
  store i32 3, i32* @b
  %r394 = add i32 0, 0
  %r395 = call i32 @set_a(i32 0)
  %r396 = icmp ne i32 %r395, 0
  br i1 %r396, label %bb5, label %bb6

bb5:
  %r397 = add i32 1, 0
  br label %bb7

bb6:
  %r530 = add i32 0, 0
  br label %bb7

bb7:
  %r398 = phi i32 [ %r397, %bb5 ], [ %r530, %bb6 ]
  %r399 = icmp ne i32 %r398, 0
  br i1 %r399, label %bb4, label %bb2

bb4:
  %r524 = call i32 @set_b(i32 1)
  %r525 = icmp ne i32 %r524, 0
  br i1 %r525, label %bb8, label %bb9

bb8:
  %r526 = add i32 1, 0
  br label %bb10

bb9:
  %r527 = add i32 0, 0
  br label %bb10

bb10:
  %r528 = phi i32 [ %r526, %bb8 ], [ %r527, %bb9 ]
  %r529 = icmp ne i32 %r528, 0
  br i1 %r529, label %bb1, label %bb2

bb1:
  br label %bb3

bb2:
  br label %bb3

bb3:
  %r400 = load i32, i32* @a
  call void @putint(i32 %r400)
  call void @putch(i32 32)
  %r401 = load i32, i32* @b
  call void @putint(i32 %r401)
  call void @putch(i32 32)
  store i32 2, i32* @a
  store i32 3, i32* @b
  %r402 = call i32 @set_a(i32 0)
  %r403 = icmp ne i32 %r402, 0
  br i1 %r403, label %bb15, label %bb16

bb15:
  %r523 = add i32 1, 0
  br label %bb17

bb16:
  %r522 = add i32 0, 0
  br label %bb17

bb17:
  %r404 = phi i32 [ %r523, %bb15 ], [ %r522, %bb16 ]
  %r405 = icmp ne i32 %r404, 0
  br i1 %r405, label %bb14, label %bb12

bb14:
  %r516 = call i32 @set_b(i32 1)
  %r517 = icmp ne i32 %r516, 0
  br i1 %r517, label %bb18, label %bb19

bb18:
  %r518 = add i32 1, 0
  br label %bb20

bb19:
  %r521 = add i32 0, 0
  br label %bb20

bb20:
  %r519 = phi i32 [ %r518, %bb18 ], [ %r521, %bb19 ]
  %r520 = icmp ne i32 %r519, 0
  br i1 %r520, label %bb11, label %bb12

bb11:
  br label %bb13

bb12:
  br label %bb13

bb13:
  %r406 = load i32, i32* @a
  call void @putint(i32 %r406)
  call void @putch(i32 32)
  %r407 = load i32, i32* @b
  call void @putint(i32 %r407)
  call void @putch(i32 10)
  %r408 = add i32 1, 0
  store i32 2, i32* @d
  %r409 = icmp sge i32 %r408, 1
  br i1 %r409, label %bb25, label %bb26

bb25:
  %r411 = add i32 1, 0
  br label %bb27

bb26:
  %r410 = add i32 0, 0
  br label %bb27

bb27:
  %r412 = phi i32 [ %r411, %bb25 ], [ %r410, %bb26 ]
  %r413 = icmp ne i32 %r412, 0
  br i1 %r413, label %bb24, label %bb22

bb24:
  %r510 = call i32 @set_d(i32 3)
  %r511 = icmp ne i32 %r510, 0
  br i1 %r511, label %bb28, label %bb29

bb28:
  %r512 = add i32 1, 0
  br label %bb30

bb29:
  %r515 = add i32 0, 0
  br label %bb30

bb30:
  %r513 = phi i32 [ %r512, %bb28 ], [ %r515, %bb29 ]
  %r514 = icmp ne i32 %r513, 0
  br i1 %r514, label %bb21, label %bb22

bb21:
  br label %bb23

bb22:
  br label %bb23

bb23:
  %r414 = load i32, i32* @d
  call void @putint(i32 %r414)
  call void @putch(i32 32)
  %r415 = icmp sle i32 %r408, 1
  br i1 %r415, label %bb35, label %bb36

bb35:
  %r509 = add i32 1, 0
  br label %bb37

bb36:
  %r508 = add i32 0, 0
  br label %bb37

bb37:
  %r416 = phi i32 [ %r509, %bb35 ], [ %r508, %bb36 ]
  %r417 = icmp ne i32 %r416, 0
  br i1 %r417, label %bb31, label %bb34

bb34:
  %r418 = call i32 @set_d(i32 4)
  %r419 = icmp ne i32 %r418, 0
  br i1 %r419, label %bb38, label %bb39

bb38:
  %r422 = add i32 1, 0
  br label %bb40

bb39:
  %r423 = add i32 0, 0
  br label %bb40

bb40:
  %r420 = phi i32 [ %r422, %bb38 ], [ %r423, %bb39 ]
  %r421 = icmp ne i32 %r420, 0
  br i1 %r421, label %bb31, label %bb32

bb31:
  br label %bb33

bb32:
  br label %bb33

bb33:
  %r424 = load i32, i32* @d
  call void @putint(i32 %r424)
  call void @putch(i32 10)
  call void @putch(i32 10)
  %r425 = add i32 0, 0
  %r426 = add i32 1, 0
  %r427 = add i32 2, 0
  %r428 = add i32 3, 0
  %r429 = add i32 4, 0
  br label %bb41

bb41:
  %r430 = icmp ne i32 %r425, 0
  br i1 %r430, label %bb45, label %bb46

bb45:
  %r431 = add i32 1, 0
  br label %bb47

bb46:
  %r432 = add i32 0, 0
  br label %bb47

bb47:
  %r433 = phi i32 [ %r431, %bb45 ], [ %r432, %bb46 ]
  %r434 = icmp ne i32 %r433, 0
  br i1 %r434, label %bb44, label %bb43

bb44:
  %r435 = icmp ne i32 %r426, 0
  br i1 %r435, label %bb48, label %bb49

bb48:
  %r436 = add i32 1, 0
  br label %bb50

bb49:
  %r437 = add i32 0, 0
  br label %bb50

bb50:
  %r438 = phi i32 [ %r436, %bb48 ], [ %r437, %bb49 ]
  %r439 = icmp ne i32 %r438, 0
  br i1 %r439, label %bb42, label %bb43

bb42:
  call void @putch(i32 32)
  br label %bb41

bb43:
  %r440 = icmp ne i32 %r425, 0
  br i1 %r440, label %bb55, label %bb56

bb55:
  %r442 = add i32 1, 0
  br label %bb57

bb56:
  %r441 = add i32 0, 0
  br label %bb57

bb57:
  %r443 = phi i32 [ %r442, %bb55 ], [ %r441, %bb56 ]
  %r444 = icmp ne i32 %r443, 0
  br i1 %r444, label %bb51, label %bb54

bb54:
  %r503 = icmp ne i32 %r426, 0
  br i1 %r503, label %bb58, label %bb59

bb58:
  %r504 = add i32 1, 0
  br label %bb60

bb59:
  %r505 = add i32 0, 0
  br label %bb60

bb60:
  %r506 = phi i32 [ %r504, %bb58 ], [ %r505, %bb59 ]
  %r507 = icmp ne i32 %r506, 0
  br i1 %r507, label %bb51, label %bb52

bb51:
  call void @putch(i32 67)
  br label %bb53

bb52:
  br label %bb53

bb53:
  %r445 = icmp sge i32 %r425, %r426
  br i1 %r445, label %bb65, label %bb66

bb65:
  %r446 = add i32 1, 0
  br label %bb67

bb66:
  %r447 = add i32 0, 0
  br label %bb67

bb67:
  %r448 = phi i32 [ %r446, %bb65 ], [ %r447, %bb66 ]
  %r449 = icmp ne i32 %r448, 0
  br i1 %r449, label %bb61, label %bb64

bb64:
  %r450 = icmp sle i32 %r426, %r425
  br i1 %r450, label %bb68, label %bb69

bb68:
  %r454 = add i32 1, 0
  br label %bb70

bb69:
  %r451 = add i32 0, 0
  br label %bb70

bb70:
  %r452 = phi i32 [ %r454, %bb68 ], [ %r451, %bb69 ]
  %r453 = icmp ne i32 %r452, 0
  br i1 %r453, label %bb61, label %bb62

bb61:
  call void @putch(i32 72)
  br label %bb63

bb62:
  br label %bb63

bb63:
  %r455 = icmp sge i32 %r427, %r426
  br i1 %r455, label %bb75, label %bb76

bb75:
  %r501 = add i32 1, 0
  br label %bb77

bb76:
  %r502 = add i32 0, 0
  br label %bb77

bb77:
  %r456 = phi i32 [ %r501, %bb75 ], [ %r502, %bb76 ]
  %r457 = icmp ne i32 %r456, 0
  br i1 %r457, label %bb74, label %bb72

bb74:
  %r458 = icmp ne i32 %r429, %r428
  br i1 %r458, label %bb78, label %bb79

bb78:
  %r461 = add i32 1, 0
  br label %bb80

bb79:
  %r462 = add i32 0, 0
  br label %bb80

bb80:
  %r459 = phi i32 [ %r461, %bb78 ], [ %r462, %bb79 ]
  %r460 = icmp ne i32 %r459, 0
  br i1 %r460, label %bb71, label %bb72

bb71:
  call void @putch(i32 73)
  br label %bb73

bb72:
  br label %bb73

bb73:
  %r463 = icmp ne i32 %r426, 0
  br i1 %r463, label %bb90, label %bb89

bb89:
  %r499 = add i32 1, 0
  br label %bb91

bb90:
  %r500 = add i32 0, 0
  br label %bb91

bb91:
  %r464 = phi i32 [ %r499, %bb89 ], [ %r500, %bb90 ]
  %r465 = icmp ne i32 %r464, 0
  br i1 %r465, label %bb88, label %bb86

bb88:
  %r493 = icmp slt i32 %r428, %r428
  br i1 %r493, label %bb92, label %bb93

bb92:
  %r497 = add i32 1, 0
  br label %bb94

bb93:
  %r498 = add i32 0, 0
  br label %bb94

bb94:
  %r494 = phi i32 [ %r497, %bb92 ], [ %r498, %bb93 ]
  %r495 = icmp ne i32 %r494, 0
  br i1 %r495, label %bb85, label %bb86

bb85:
  %r496 = add i32 1, 0
  br label %bb87

bb86:
  %r492 = add i32 0, 0
  br label %bb87

bb87:
  %r466 = phi i32 [ %r496, %bb85 ], [ %r492, %bb86 ]
  %r467 = icmp ne i32 %r466, 0
  br i1 %r467, label %bb81, label %bb84

bb84:
  %r487 = icmp sge i32 %r429, %r429
  br i1 %r487, label %bb95, label %bb96

bb95:
  %r489 = add i32 1, 0
  br label %bb97

bb96:
  %r488 = add i32 0, 0
  br label %bb97

bb97:
  %r490 = phi i32 [ %r489, %bb95 ], [ %r488, %bb96 ]
  %r491 = icmp ne i32 %r490, 0
  br i1 %r491, label %bb81, label %bb82

bb81:
  call void @putch(i32 74)
  br label %bb83

bb82:
  br label %bb83

bb83:
  %r468 = icmp ne i32 %r426, 0
  br i1 %r468, label %bb103, label %bb102

bb102:
  %r470 = add i32 1, 0
  br label %bb104

bb103:
  %r469 = add i32 0, 0
  br label %bb104

bb104:
  %r471 = phi i32 [ %r470, %bb102 ], [ %r469, %bb103 ]
  %r472 = icmp ne i32 %r471, 0
  br i1 %r472, label %bb98, label %bb101

bb101:
  %r473 = icmp slt i32 %r428, %r428
  br i1 %r473, label %bb109, label %bb110

bb109:
  %r486 = add i32 1, 0
  br label %bb111

bb110:
  %r485 = add i32 0, 0
  br label %bb111

bb111:
  %r474 = phi i32 [ %r486, %bb109 ], [ %r485, %bb110 ]
  %r475 = icmp ne i32 %r474, 0
  br i1 %r475, label %bb108, label %bb106

bb108:
  %r479 = icmp sge i32 %r429, %r429
  br i1 %r479, label %bb112, label %bb113

bb112:
  %r480 = add i32 1, 0
  br label %bb114

bb113:
  %r484 = add i32 0, 0
  br label %bb114

bb114:
  %r481 = phi i32 [ %r480, %bb112 ], [ %r484, %bb113 ]
  %r482 = icmp ne i32 %r481, 0
  br i1 %r482, label %bb105, label %bb106

bb105:
  %r483 = add i32 1, 0
  br label %bb107

bb106:
  %r476 = add i32 0, 0
  br label %bb107

bb107:
  %r477 = phi i32 [ %r483, %bb105 ], [ %r476, %bb106 ]
  %r478 = icmp ne i32 %r477, 0
  br i1 %r478, label %bb98, label %bb99

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

