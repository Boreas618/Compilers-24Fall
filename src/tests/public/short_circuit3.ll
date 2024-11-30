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
  %r400 = call i32 @set_b(i32 1)
  %r401 = icmp ne i32 %r400, 0
  br i1 %r401, label %bb8, label %bb9

bb8:
  %r405 = add i32 1, 0
  br label %bb10

bb9:
  %r404 = add i32 0, 0
  br label %bb10

bb10:
  %r402 = phi i32 [ %r405, %bb8 ], [ %r404, %bb9 ]
  %r403 = icmp ne i32 %r402, 0
  br i1 %r403, label %bb1, label %bb2

bb1:
  br label %bb3

bb2:
  br label %bb3

bb3:
  %r406 = load i32, i32* @a
  call void @putint(i32 %r406)
  call void @putch(i32 32)
  %r407 = load i32, i32* @b
  call void @putint(i32 %r407)
  call void @putch(i32 32)
  store i32 2, i32* @a
  store i32 3, i32* @b
  %r408 = call i32 @set_a(i32 0)
  %r409 = icmp ne i32 %r408, 0
  br i1 %r409, label %bb15, label %bb16

bb15:
  %r528 = add i32 1, 0
  br label %bb17

bb16:
  %r529 = add i32 0, 0
  br label %bb17

bb17:
  %r410 = phi i32 [ %r528, %bb15 ], [ %r529, %bb16 ]
  %r411 = icmp ne i32 %r410, 0
  br i1 %r411, label %bb14, label %bb12

bb14:
  %r522 = call i32 @set_b(i32 1)
  %r523 = icmp ne i32 %r522, 0
  br i1 %r523, label %bb18, label %bb19

bb18:
  %r524 = add i32 1, 0
  br label %bb20

bb19:
  %r527 = add i32 0, 0
  br label %bb20

bb20:
  %r525 = phi i32 [ %r524, %bb18 ], [ %r527, %bb19 ]
  %r526 = icmp ne i32 %r525, 0
  br i1 %r526, label %bb11, label %bb12

bb11:
  br label %bb13

bb12:
  br label %bb13

bb13:
  %r412 = load i32, i32* @a
  call void @putint(i32 %r412)
  call void @putch(i32 32)
  %r413 = load i32, i32* @b
  call void @putint(i32 %r413)
  call void @putch(i32 10)
  %r414 = add i32 1, 0
  store i32 2, i32* @d
  %r415 = icmp sge i32 %r414, 1
  br i1 %r415, label %bb25, label %bb26

bb25:
  %r521 = add i32 1, 0
  br label %bb27

bb26:
  %r520 = add i32 0, 0
  br label %bb27

bb27:
  %r416 = phi i32 [ %r521, %bb25 ], [ %r520, %bb26 ]
  %r417 = icmp ne i32 %r416, 0
  br i1 %r417, label %bb24, label %bb22

bb24:
  %r514 = call i32 @set_d(i32 3)
  %r515 = icmp ne i32 %r514, 0
  br i1 %r515, label %bb28, label %bb29

bb28:
  %r518 = add i32 1, 0
  br label %bb30

bb29:
  %r519 = add i32 0, 0
  br label %bb30

bb30:
  %r516 = phi i32 [ %r518, %bb28 ], [ %r519, %bb29 ]
  %r517 = icmp ne i32 %r516, 0
  br i1 %r517, label %bb21, label %bb22

bb21:
  br label %bb23

bb22:
  br label %bb23

bb23:
  %r418 = load i32, i32* @d
  call void @putint(i32 %r418)
  call void @putch(i32 32)
  %r419 = icmp sle i32 %r414, 1
  br i1 %r419, label %bb35, label %bb36

bb35:
  %r512 = add i32 1, 0
  br label %bb37

bb36:
  %r513 = add i32 0, 0
  br label %bb37

bb37:
  %r420 = phi i32 [ %r512, %bb35 ], [ %r513, %bb36 ]
  %r421 = icmp ne i32 %r420, 0
  br i1 %r421, label %bb31, label %bb34

bb34:
  %r506 = call i32 @set_d(i32 4)
  %r507 = icmp ne i32 %r506, 0
  br i1 %r507, label %bb38, label %bb39

bb38:
  %r509 = add i32 1, 0
  br label %bb40

bb39:
  %r508 = add i32 0, 0
  br label %bb40

bb40:
  %r510 = phi i32 [ %r509, %bb38 ], [ %r508, %bb39 ]
  %r511 = icmp ne i32 %r510, 0
  br i1 %r511, label %bb31, label %bb32

bb31:
  br label %bb33

bb32:
  br label %bb33

bb33:
  %r422 = load i32, i32* @d
  call void @putint(i32 %r422)
  call void @putch(i32 10)
  call void @putch(i32 10)
  %r423 = add i32 0, 0
  %r424 = add i32 1, 0
  %r425 = add i32 2, 0
  %r426 = add i32 3, 0
  %r427 = add i32 4, 0
  br label %bb41

bb41:
  %r428 = icmp ne i32 %r423, 0
  br i1 %r428, label %bb45, label %bb46

bb45:
  %r429 = add i32 1, 0
  br label %bb47

bb46:
  %r430 = add i32 0, 0
  br label %bb47

bb47:
  %r431 = phi i32 [ %r429, %bb45 ], [ %r430, %bb46 ]
  %r432 = icmp ne i32 %r431, 0
  br i1 %r432, label %bb44, label %bb43

bb44:
  %r433 = icmp ne i32 %r424, 0
  br i1 %r433, label %bb48, label %bb49

bb48:
  %r436 = add i32 1, 0
  br label %bb50

bb49:
  %r437 = add i32 0, 0
  br label %bb50

bb50:
  %r434 = phi i32 [ %r436, %bb48 ], [ %r437, %bb49 ]
  %r435 = icmp ne i32 %r434, 0
  br i1 %r435, label %bb42, label %bb43

bb42:
  call void @putch(i32 32)
  br label %bb41

bb43:
  %r438 = icmp ne i32 %r423, 0
  br i1 %r438, label %bb55, label %bb56

bb55:
  %r505 = add i32 1, 0
  br label %bb57

bb56:
  %r504 = add i32 0, 0
  br label %bb57

bb57:
  %r439 = phi i32 [ %r505, %bb55 ], [ %r504, %bb56 ]
  %r440 = icmp ne i32 %r439, 0
  br i1 %r440, label %bb51, label %bb54

bb54:
  %r441 = icmp ne i32 %r424, 0
  br i1 %r441, label %bb58, label %bb59

bb58:
  %r442 = add i32 1, 0
  br label %bb60

bb59:
  %r445 = add i32 0, 0
  br label %bb60

bb60:
  %r443 = phi i32 [ %r442, %bb58 ], [ %r445, %bb59 ]
  %r444 = icmp ne i32 %r443, 0
  br i1 %r444, label %bb51, label %bb52

bb51:
  call void @putch(i32 67)
  br label %bb53

bb52:
  br label %bb53

bb53:
  %r446 = icmp sge i32 %r423, %r424
  br i1 %r446, label %bb65, label %bb66

bb65:
  %r447 = add i32 1, 0
  br label %bb67

bb66:
  %r503 = add i32 0, 0
  br label %bb67

bb67:
  %r448 = phi i32 [ %r447, %bb65 ], [ %r503, %bb66 ]
  %r449 = icmp ne i32 %r448, 0
  br i1 %r449, label %bb61, label %bb64

bb64:
  %r498 = icmp sle i32 %r424, %r423
  br i1 %r498, label %bb68, label %bb69

bb68:
  %r501 = add i32 1, 0
  br label %bb70

bb69:
  %r502 = add i32 0, 0
  br label %bb70

bb70:
  %r499 = phi i32 [ %r501, %bb68 ], [ %r502, %bb69 ]
  %r500 = icmp ne i32 %r499, 0
  br i1 %r500, label %bb61, label %bb62

bb61:
  call void @putch(i32 72)
  br label %bb63

bb62:
  br label %bb63

bb63:
  %r450 = icmp sge i32 %r425, %r424
  br i1 %r450, label %bb75, label %bb76

bb75:
  %r451 = add i32 1, 0
  br label %bb77

bb76:
  %r497 = add i32 0, 0
  br label %bb77

bb77:
  %r452 = phi i32 [ %r451, %bb75 ], [ %r497, %bb76 ]
  %r453 = icmp ne i32 %r452, 0
  br i1 %r453, label %bb74, label %bb72

bb74:
  %r492 = icmp ne i32 %r427, %r426
  br i1 %r492, label %bb78, label %bb79

bb78:
  %r496 = add i32 1, 0
  br label %bb80

bb79:
  %r495 = add i32 0, 0
  br label %bb80

bb80:
  %r493 = phi i32 [ %r496, %bb78 ], [ %r495, %bb79 ]
  %r494 = icmp ne i32 %r493, 0
  br i1 %r494, label %bb71, label %bb72

bb71:
  call void @putch(i32 73)
  br label %bb73

bb72:
  br label %bb73

bb73:
  %r454 = icmp ne i32 %r424, 0
  br i1 %r454, label %bb90, label %bb89

bb89:
  %r491 = add i32 1, 0
  br label %bb91

bb90:
  %r490 = add i32 0, 0
  br label %bb91

bb91:
  %r455 = phi i32 [ %r491, %bb89 ], [ %r490, %bb90 ]
  %r456 = icmp ne i32 %r455, 0
  br i1 %r456, label %bb88, label %bb86

bb88:
  %r457 = icmp slt i32 %r426, %r426
  br i1 %r457, label %bb92, label %bb93

bb92:
  %r462 = add i32 1, 0
  br label %bb94

bb93:
  %r461 = add i32 0, 0
  br label %bb94

bb94:
  %r458 = phi i32 [ %r462, %bb92 ], [ %r461, %bb93 ]
  %r459 = icmp ne i32 %r458, 0
  br i1 %r459, label %bb85, label %bb86

bb85:
  %r460 = add i32 1, 0
  br label %bb87

bb86:
  %r463 = add i32 0, 0
  br label %bb87

bb87:
  %r464 = phi i32 [ %r460, %bb85 ], [ %r463, %bb86 ]
  %r465 = icmp ne i32 %r464, 0
  br i1 %r465, label %bb81, label %bb84

bb84:
  %r485 = icmp sge i32 %r427, %r427
  br i1 %r485, label %bb95, label %bb96

bb95:
  %r486 = add i32 1, 0
  br label %bb97

bb96:
  %r489 = add i32 0, 0
  br label %bb97

bb97:
  %r487 = phi i32 [ %r486, %bb95 ], [ %r489, %bb96 ]
  %r488 = icmp ne i32 %r487, 0
  br i1 %r488, label %bb81, label %bb82

bb81:
  call void @putch(i32 74)
  br label %bb83

bb82:
  br label %bb83

bb83:
  %r466 = icmp ne i32 %r424, 0
  br i1 %r466, label %bb103, label %bb102

bb102:
  %r468 = add i32 1, 0
  br label %bb104

bb103:
  %r467 = add i32 0, 0
  br label %bb104

bb104:
  %r469 = phi i32 [ %r468, %bb102 ], [ %r467, %bb103 ]
  %r470 = icmp ne i32 %r469, 0
  br i1 %r470, label %bb98, label %bb101

bb101:
  %r471 = icmp slt i32 %r426, %r426
  br i1 %r471, label %bb109, label %bb110

bb109:
  %r473 = add i32 1, 0
  br label %bb111

bb110:
  %r472 = add i32 0, 0
  br label %bb111

bb111:
  %r474 = phi i32 [ %r473, %bb109 ], [ %r472, %bb110 ]
  %r475 = icmp ne i32 %r474, 0
  br i1 %r475, label %bb108, label %bb106

bb108:
  %r478 = icmp sge i32 %r427, %r427
  br i1 %r478, label %bb112, label %bb113

bb112:
  %r479 = add i32 1, 0
  br label %bb114

bb113:
  %r483 = add i32 0, 0
  br label %bb114

bb114:
  %r480 = phi i32 [ %r479, %bb112 ], [ %r483, %bb113 ]
  %r481 = icmp ne i32 %r480, 0
  br i1 %r481, label %bb105, label %bb106

bb105:
  %r482 = add i32 1, 0
  br label %bb107

bb106:
  %r484 = add i32 0, 0
  br label %bb107

bb107:
  %r476 = phi i32 [ %r482, %bb105 ], [ %r484, %bb106 ]
  %r477 = icmp ne i32 %r476, 0
  br i1 %r477, label %bb98, label %bb99

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

