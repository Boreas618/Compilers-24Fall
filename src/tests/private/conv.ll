declare i32 @getch( )
declare i32 @getint( )
declare void @putch( i32 )
declare void @putint( i32 )
declare void @putarray( i32, i32* )
declare void @_sysy_starttime( i32 )
declare void @_sysy_stoptime( i32 )
@max = global i32 1073741824
@a = global [ 10000000 x i32 ] zeroinitializer
@b = global [ 10000000 x i32 ] zeroinitializer
@kernelid = global [ 10000 x i32 ] zeroinitializer
define i32 @checkrange( i32 %r100 ) {
checkrange:
  %r432 = add i32 0, 0
  %r433 = add i32 %r100, 0
  br label %bb1

bb1:
  %r434 = phi i32 [ %r433, %checkrange ], [ %r439, %bb2 ]
  %r435 = load i32, i32* @max
  %r436 = icmp sgt i32 %r434, %r435
  br i1 %r436, label %bb2, label %bb3

bb2:
  %r437 = load i32, i32* @max
  %r438 = sub i32 %r434, %r437
  %r439 = add i32 %r438, 0
  br label %bb1

bb3:
  br label %bb4

bb4:
  %r440 = phi i32 [ %r434, %bb3 ], [ %r444, %bb5 ]
  %r441 = icmp slt i32 %r440, 0
  br i1 %r441, label %bb5, label %bb6

bb5:
  %r442 = load i32, i32* @max
  %r443 = add i32 %r440, %r442
  %r444 = add i32 %r443, 0
  br label %bb4

bb6:
  ret i32 %r440
}

define i32 @mod( i32 %r114, i32 %r116 ) {
mod:
  %r447 = add i32 0, 0
  %r448 = add i32 %r114, 0
  %r449 = add i32 0, 0
  %r450 = add i32 %r116, 0
  %r451 = sdiv i32 %r448, %r450
  %r452 = mul i32 %r451, %r450
  %r453 = sub i32 %r448, %r452
  ret i32 %r453
}

define i32 @reduce( i32 %r125, i32 %r127, i32 %r129 ) {
reduce:
  %r467 = add i32 0, 0
  %r468 = add i32 0, 0
  %r469 = add i32 0, 0
  %r470 = add i32 0, 0
  %r471 = add i32 0, 0
  %r472 = add i32 0, 0
  %r473 = add i32 0, 0
  %r474 = add i32 0, 0
  %r475 = add i32 0, 0
  %r476 = add i32 0, 0
  %r477 = add i32 0, 0
  %r478 = add i32 %r125, 0
  %r479 = add i32 0, 0
  %r480 = add i32 %r127, 0
  %r481 = add i32 0, 0
  %r482 = add i32 %r129, 0
  %r483 = icmp eq i32 %r478, 0
  br i1 %r483, label %bb7, label %bb8

bb7:
  %r484 = add i32 %r480, %r482
  %r485 = call i32 @checkrange(i32 %r484)
  ret i32 %r485
bb8:
  br label %bb9

bb9:
  %r486 = icmp eq i32 %r478, 1
  br i1 %r486, label %bb10, label %bb11

bb10:
  %r487 = add i32 0, 0
  %r488 = add i32 1, 0
  br label %bb13

bb13:
  %r489 = phi i32 [ %r487, %bb10 ], [ %r498, %bb18 ]
  %r490 = phi i32 [ %r488, %bb10 ], [ %r500, %bb18 ]
  %r491 = load i32, i32* @max
  %r492 = icmp slt i32 %r490, %r491
  br i1 %r492, label %bb14, label %bb15

bb14:
  %r493 = sdiv i32 %r480, %r490
  %r494 = call i32 @mod(i32 %r493, i32 2)
  %r495 = sdiv i32 %r482, %r490
  %r496 = call i32 @mod(i32 %r495, i32 2)
  %r497 = icmp eq i32 %r494, %r496
  br i1 %r497, label %bb16, label %bb17

bb16:
  %r504 = mul i32 %r489, 2
  %r505 = add i32 %r504, 0
  br label %bb18

bb17:
  %r501 = mul i32 %r489, 2
  %r502 = add i32 %r501, 1
  %r503 = add i32 %r502, 0
  br label %bb18

bb18:
  %r498 = phi i32 [ %r505, %bb16 ], [ %r503, %bb17 ]
  %r499 = mul i32 %r490, 2
  %r500 = add i32 %r499, 0
  br label %bb13

bb15:
  ret i32 %r489
bb11:
  br label %bb12

bb12:
  %r506 = icmp eq i32 %r478, 2
  br i1 %r506, label %bb19, label %bb20

bb19:
  %r507 = icmp sgt i32 %r480, %r482
  br i1 %r507, label %bb22, label %bb23

bb22:
  ret i32 %r480
bb23:
  ret i32 %r482
bb20:
  br label %bb21

//
bb21:
  %r464 = phi i32 [ %r464, %bb24 ], [ %r478, %bb20 ]
  %r466 = phi i32 [ %r466, %bb24 ], [ %r482, %bb20 ]
  %r465 = phi i32 [ %r465, %bb24 ], [ %r480, %bb20 ]
  %r174 = icmp eq i32 %r464, 3
  br i1 %r174, label %bb25, label %bb26

bb25:
  %r461 = add i32 0, 0
  %r460 = add i32 1, 0
  br label %bb28

bb28:
  %r180 = load i32, i32* @max
  %r178 = icmp slt i32 %r460, %r180
  br i1 %r178, label %bb29, label %bb30

bb29:
  %r187 = sdiv i32 %r465, %r460
  %r184 = call i32 @mod(i32 %r187, i32 2)
  %r183 = icmp eq i32 %r184, 1
  br i1 %r183, label %bb35, label %bb36

bb35:
  %r459 = add i32 1, 0
  br label %bb37

bb36:
  %r459 = add i32 0, 0
  br label %bb37

bb37:
  %r188 = icmp ne i32 %r459, 0
  br i1 %r188, label %bb31, label %bb34

bb34:
  %r195 = sdiv i32 %r466, %r460
  %r192 = call i32 @mod(i32 %r195, i32 2)
  %r191 = icmp eq i32 %r192, 1
  br i1 %r191, label %bb38, label %bb39

bb38:
  %r458 = add i32 1, 0
  br label %bb40

bb39:
  %r458 = add i32 0, 0
  br label %bb40

bb40:
  %r196 = icmp ne i32 %r458, 0
  br i1 %r196, label %bb31, label %bb32

bb31:
  %r199 = mul i32 %r461, 2
  %r200 = add i32 %r199, 1
  %r461 = add i32 %r200, 0
  br label %bb33

bb32:
  %r202 = mul i32 %r461, 2
  %r461 = add i32 %r202, 0
  br label %bb33

bb33:
  %r204 = mul i32 %r460, 2
  %r460 = add i32 %r204, 0
  br label %bb28

bb30:
  ret i32 %r461
bb26:
  br label %bb27

bb27:
  %r207 = icmp eq i32 %r464, 4
  br i1 %r207, label %bb41, label %bb42

bb41:
  %r457 = add i32 0, 0
  %r456 = add i32 1, 0
  br label %bb44

bb44:
  %r213 = load i32, i32* @max
  %r211 = icmp slt i32 %r456, %r213
  br i1 %r211, label %bb45, label %bb46

bb45:
  %r220 = sdiv i32 %r465, %r456
  %r217 = call i32 @mod(i32 %r220, i32 2)
  %r216 = icmp eq i32 %r217, 1
  br i1 %r216, label %bb51, label %bb52

bb51:
  %r455 = add i32 1, 0
  br label %bb53

bb52:
  %r455 = add i32 0, 0
  br label %bb53

bb53:
  %r221 = icmp ne i32 %r455, 0
  br i1 %r221, label %bb50, label %bb48

bb50:
  %r228 = sdiv i32 %r466, %r456
  %r225 = call i32 @mod(i32 %r228, i32 2)
  %r224 = icmp eq i32 %r225, 1
  br i1 %r224, label %bb54, label %bb55

bb54:
  %r454 = add i32 1, 0
  br label %bb56

bb55:
  %r454 = add i32 0, 0
  br label %bb56

bb56:
  %r229 = icmp ne i32 %r454, 0
  br i1 %r229, label %bb47, label %bb48

bb47:
  %r232 = mul i32 %r457, 2
  %r233 = add i32 %r232, 1
  %r457 = add i32 %r233, 0
  br label %bb49

bb48:
  %r235 = mul i32 %r457, 2
  %r457 = add i32 %r235, 0
  br label %bb49

bb49:
  %r237 = mul i32 %r456, 2
  %r456 = add i32 %r237, 0
  br label %bb44

bb46:
  ret i32 %r457
bb42:
  br label %bb43

bb43:
  ret i32 0
}

define i32 @getvalue( i32* %r239, i32 %r240, i32 %r242, i32 %r244, i32 %r246 ) {
getvalue:
  %r519 = add i32 0, 0
  %r520 = add i32 0, 0
  %r521 = add i32 0, 0
  %r522 = add i32 0, 0
  %r523 = add i32 0, 0
  %r524 = add i32 %r240, 0
  %r525 = add i32 0, 0
  %r526 = add i32 %r242, 0
  %r527 = add i32 0, 0
  %r528 = add i32 %r244, 0
  %r529 = add i32 0, 0
  %r530 = add i32 %r246, 0
  %r531 = add i32 0, 0
  %r532 = add i32 0, 0
  %r533 = add i32 0, 0
  %r534 = icmp slt i32 %r528, 0
  br i1 %r534, label %bb69, label %bb70

bb69:
  %r535 = add i32 1, 0
  br label %bb71

bb70:
  %r536 = add i32 0, 0
  br label %bb71

bb71:
  %r537 = phi i32 [ %r535, %bb69 ], [ %r536, %bb70 ]
  %r538 = icmp ne i32 %r537, 0
  br i1 %r538, label %bb65, label %bb68

bb68:
  %r539 = icmp slt i32 %r530, 0
  br i1 %r539, label %bb72, label %bb73

bb72:
  %r540 = add i32 1, 0
  br label %bb74

bb73:
  %r541 = add i32 0, 0
  br label %bb74

bb74:
  %r542 = phi i32 [ %r540, %bb72 ], [ %r541, %bb73 ]
  %r543 = icmp ne i32 %r542, 0
  br i1 %r543, label %bb65, label %bb66

bb65:
  %r565 = add i32 1, 0
  br label %bb67

bb66:
  %r544 = add i32 0, 0
  br label %bb67

bb67:
  %r545 = phi i32 [ %r565, %bb65 ], [ %r544, %bb66 ]
  %r546 = icmp ne i32 %r545, 0
  br i1 %r546, label %bb61, label %bb64

bb64:
  %r559 = icmp sge i32 %r528, %r524
  br i1 %r559, label %bb75, label %bb76

bb75:
  %r564 = add i32 1, 0
  br label %bb77

bb76:
  %r560 = add i32 0, 0
  br label %bb77

bb77:
  %r561 = phi i32 [ %r564, %bb75 ], [ %r560, %bb76 ]
  %r562 = icmp ne i32 %r561, 0
  br i1 %r562, label %bb61, label %bb62

bb61:
  %r558 = add i32 1, 0
  br label %bb63

bb62:
  %r563 = add i32 0, 0
  br label %bb63

bb63:
  %r547 = phi i32 [ %r558, %bb61 ], [ %r563, %bb62 ]
  %r548 = icmp ne i32 %r547, 0
  br i1 %r548, label %bb57, label %bb60

bb60:
  %r549 = icmp sge i32 %r530, %r526
  br i1 %r549, label %bb78, label %bb79

bb78:
  %r556 = add i32 1, 0
  br label %bb80

bb79:
  %r557 = add i32 0, 0
  br label %bb80

bb80:
  %r550 = phi i32 [ %r556, %bb78 ], [ %r557, %bb79 ]
  %r551 = icmp ne i32 %r550, 0
  br i1 %r551, label %bb57, label %bb58

bb57:
  ret i32 0
bb58:
  br label %bb59

bb59:
  %r552 = mul i32 %r528, %r526
  %r553 = add i32 %r552, %r530
  %r554 = add i32 %r553, 0
  %r283 = getelementptr i32, i32* %r239, i32 %r554
  %r555 = load i32, i32* %r283
  ret i32 %r555
}

define i32 @convn( i32 %r286, i32* %r288, i32* %r289, i32 %r290, i32 %r292, i32 %r294 ) {
convn:
  %r577 = add i32 0, 0
  %r578 = add i32 0, 0
  %r579 = add i32 %r286, 0
  %r580 = add i32 0, 0
  %r581 = add i32 %r290, 0
  %r582 = add i32 0, 0
  %r583 = add i32 %r292, 0
  %r584 = add i32 0, 0
  %r585 = add i32 %r294, 0
  %r586 = add i32 0, 0
  %r587 = add i32 0, 0
  %r588 = add i32 0, 0
  %r589 = add i32 0, 0
  %r590 = add i32 0, 0
  %r591 = add i32 0, 0
  %r592 = add i32 0, 0
  %r593 = add i32 0, 0
  %r594 = add i32 1, 0
  br label %bb81

bb81:
  %r595 = phi i32 [ %r587, %convn ], [ %r634, %bb104 ]
  %r596 = icmp eq i32 %r594, %r594
  br i1 %r596, label %bb82, label %bb83

bb82:
  %r597 = add i32 0, 0
  br label %bb84

bb84:
  %r598 = phi i32 [ %r597, %bb82 ], [ %r611, %bb101 ]
  %r599 = icmp eq i32 %r594, %r594
  br i1 %r599, label %bb85, label %bb86

bb85:
  %r600 = add i32 0, 0
  %r601 = sdiv i32 %r585, 2
  %r602 = sub i32 %r595, %r601
  %r603 = add i32 %r602, 0
  br label %bb87

bb87:
  %r604 = phi i32 [ %r603, %bb85 ], [ %r621, %bb98 ]
  %r605 = phi i32 [ %r600, %bb85 ], [ %r619, %bb98 ]
  %r606 = icmp eq i32 %r594, %r594
  br i1 %r606, label %bb88, label %bb89

bb88:
  %r613 = sdiv i32 %r585, 2
  %r614 = sub i32 %r598, %r613
  %r615 = add i32 %r614, 0
  br label %bb90

bb90:
  %r616 = phi i32 [ %r615, %bb88 ], [ %r629, %bb95 ]
  %r617 = phi i32 [ %r605, %bb88 ], [ %r627, %bb95 ]
  %r618 = icmp eq i32 %r594, %r594
  br i1 %r618, label %bb91, label %bb92

bb91:
  %r625 = call i32 @getvalue(i32* %r288, i32 %r581, i32 %r583, i32 %r604, i32 %r616)
  %r626 = call i32 @reduce(i32 %r579, i32 %r617, i32 %r625)
  %r627 = add i32 %r626, 0
  %r628 = add i32 %r616, 1
  %r629 = add i32 %r628, 0
  %r630 = sdiv i32 %r585, 2
  %r631 = add i32 %r598, %r630
  %r632 = icmp sge i32 %r629, %r631
  br i1 %r632, label %bb93, label %bb94

bb93:
  br label %bb92

bb94:
  br label %bb95

bb95:
  br label %bb90

bb92:
  %r619 = phi i32 [ %r617, %bb90 ], [ %r627, %bb93 ]
  %r620 = add i32 %r604, 1
  %r621 = add i32 %r620, 0
  %r622 = sdiv i32 %r585, 2
  %r623 = add i32 %r595, %r622
  %r624 = icmp sge i32 %r621, %r623
  br i1 %r624, label %bb96, label %bb97

bb96:
  br label %bb89

bb97:
  br label %bb98

bb98:
  br label %bb87

bb89:
  %r607 = mul i32 %r595, %r583
  %r608 = add i32 %r607, %r598
  %r609 = add i32 %r608, 0
  %r354 = getelementptr i32, i32* %r289, i32 %r609
  %r610 = add i32 %r598, 1
  %r611 = add i32 %r610, 0
  %r612 = icmp sge i32 %r611, %r583
  br i1 %r612, label %bb99, label %bb100

bb99:
  br label %bb86

bb100:
  br label %bb101

bb101:
  br label %bb84

bb86:
  %r633 = add i32 %r595, 1
  %r634 = add i32 %r633, 0
  %r635 = icmp sge i32 %r634, %r581
  br i1 %r635, label %bb102, label %bb103

bb102:
  br label %bb83

bb103:
  br label %bb104

bb104:
  br label %bb81

bb83:
  ret i32 0
}

define void @memmove( i32* %r369, i32* %r370, i32 %r371 ) {
memmove:
  %r638 = add i32 0, 0
  %r639 = add i32 %r371, 0
  %r640 = add i32 0, 0
  %r641 = add i32 0, 0
  br label %bb105

bb105:
  %r642 = phi i32 [ %r641, %memmove ], [ %r646, %bb106 ]
  %r643 = icmp slt i32 %r642, %r639
  br i1 %r643, label %bb106, label %bb107

bb106:
  %r377 = getelementptr i32, i32* %r369, i32 %r642
  %r379 = getelementptr i32, i32* %r370, i32 %r642
  %r644 = load i32, i32* %r379
  %r645 = add i32 %r642, 1
  %r646 = add i32 %r645, 0
  br label %bb105

bb107:
  ret void
}

define i32 @main( ) {
main:
  %r654 = add i32 0, 0
  %r655 = add i32 0, 0
  %r656 = call i32 @getint()
  %r657 = add i32 0, 0
  %r658 = add i32 %r656, 0
  %r659 = call i32 @getint()
  %r660 = add i32 0, 0
  %r661 = add i32 %r659, 0
  %r662 = call i32 @getint()
  %r663 = add i32 0, 0
  %r664 = add i32 %r662, 0
  %r665 = add i32 0, 0
  %r666 = call i32 @getint()
  %r667 = add i32 %r666, 0
  %r668 = add i32 0, 0
  %r669 = add i32 0, 0
  br label %bb108

bb108:
  %r670 = phi i32 [ %r669, %main ], [ %r674, %bb109 ]
  %r671 = icmp slt i32 %r670, %r667
  br i1 %r671, label %bb109, label %bb110

bb109:
  %r396 = getelementptr [10000000 x i32 ], [10000000 x i32 ]* @a, i32 0, i32 %r670
  %r672 = call i32 @getint()
  %r673 = add i32 %r670, 1
  %r674 = add i32 %r673, 0
  br label %bb108

bb110:
  %r675 = call i32 @getint()
  %r676 = add i32 %r675, 0
  %r677 = add i32 0, 0
  br label %bb111

bb111:
  %r678 = phi i32 [ %r677, %bb110 ], [ %r682, %bb112 ]
  %r679 = icmp slt i32 %r678, %r676
  br i1 %r679, label %bb112, label %bb113

bb112:
  %r405 = getelementptr [10000 x i32 ], [10000 x i32 ]* @kernelid, i32 0, i32 %r678
  %r680 = call i32 @getint()
  %r681 = add i32 %r678, 1
  %r682 = add i32 %r681, 0
  br label %bb111

bb113:
  %r683 = add i32 %r676, 0
  call void @_sysy_starttime(i32 209)
  %r684 = add i32 0, 0
  br label %bb114

bb114:
  %r685 = phi i32 [ %r684, %bb113 ], [ %r691, %bb115 ]
  %r686 = icmp slt i32 %r685, %r683
  br i1 %r686, label %bb115, label %bb116

bb115:
  %r416 = getelementptr [10000 x i32 ], [10000 x i32 ]* @kernelid, i32 0, i32 %r685
  %r687 = load i32, i32* %r416
  %r688 = call i32 @convn(i32 %r687, i32* @a, i32* @b, i32 %r661, i32 %r664, i32 %r658)
  %r689 = mul i32 %r661, %r664
  call void @memmove(i32* @a, i32* @b, i32 %r689)
  %r690 = add i32 %r685, 1
  %r691 = add i32 %r690, 0
  br label %bb114

bb116:
  call void @_sysy_stoptime(i32 312)
  %r692 = mul i32 %r661, %r664
  call void @putarray(i32 %r692, i32* @a)
  ret i32 0
}

