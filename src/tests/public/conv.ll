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
  %r489 = phi i32 [ %r488, %bb10 ], [ %r502, %bb18 ]
  %r490 = phi i32 [ %r487, %bb10 ], [ %r500, %bb18 ]
  %r491 = load i32, i32* @max
  %r492 = icmp slt i32 %r489, %r491
  br i1 %r492, label %bb14, label %bb15

bb14:
  %r493 = sdiv i32 %r480, %r489
  %r494 = call i32 @mod(i32 %r493, i32 2)
  %r495 = sdiv i32 %r482, %r489
  %r496 = call i32 @mod(i32 %r495, i32 2)
  %r497 = icmp eq i32 %r494, %r496
  br i1 %r497, label %bb16, label %bb17

bb16:
  %r498 = mul i32 %r490, 2
  %r499 = add i32 %r498, 0
  br label %bb18

bb17:
  %r503 = mul i32 %r490, 2
  %r504 = add i32 %r503, 1
  %r505 = add i32 %r504, 0
  br label %bb18

bb18:
  %r500 = phi i32 [ %r499, %bb16 ], [ %r505, %bb17 ]
  %r501 = mul i32 %r489, 2
  %r502 = add i32 %r501, 0
  br label %bb13

bb15:
  ret i32 %r490
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

bb21:
  %r508 = icmp eq i32 %r478, 3
  br i1 %r508, label %bb25, label %bb26

bb25:
  %r509 = add i32 0, 0
  %r510 = add i32 1, 0
  br label %bb28

bb28:
  %r511 = phi i32 [ %r509, %bb25 ], [ %r532, %bb33 ]
  %r512 = phi i32 [ %r510, %bb25 ], [ %r534, %bb33 ]
  %r513 = load i32, i32* @max
  %r514 = icmp slt i32 %r512, %r513
  br i1 %r514, label %bb29, label %bb30

bb29:
  %r515 = sdiv i32 %r480, %r512
  %r516 = call i32 @mod(i32 %r515, i32 2)
  %r517 = icmp eq i32 %r516, 1
  br i1 %r517, label %bb35, label %bb36

bb35:
  %r536 = add i32 1, 0
  br label %bb37

bb36:
  %r535 = add i32 0, 0
  br label %bb37

bb37:
  %r518 = phi i32 [ %r536, %bb35 ], [ %r535, %bb36 ]
  %r519 = icmp ne i32 %r518, 0
  br i1 %r519, label %bb31, label %bb34

bb34:
  %r523 = sdiv i32 %r482, %r512
  %r524 = call i32 @mod(i32 %r523, i32 2)
  %r525 = icmp eq i32 %r524, 1
  br i1 %r525, label %bb38, label %bb39

bb38:
  %r531 = add i32 1, 0
  br label %bb40

bb39:
  %r526 = add i32 0, 0
  br label %bb40

bb40:
  %r527 = phi i32 [ %r531, %bb38 ], [ %r526, %bb39 ]
  %r528 = icmp ne i32 %r527, 0
  br i1 %r528, label %bb31, label %bb32

bb31:
  %r520 = mul i32 %r511, 2
  %r521 = add i32 %r520, 1
  %r522 = add i32 %r521, 0
  br label %bb33

bb32:
  %r529 = mul i32 %r511, 2
  %r530 = add i32 %r529, 0
  br label %bb33

bb33:
  %r532 = phi i32 [ %r522, %bb31 ], [ %r530, %bb32 ]
  %r533 = mul i32 %r512, 2
  %r534 = add i32 %r533, 0
  br label %bb28

bb30:
  ret i32 %r511
bb26:
  br label %bb27

bb27:
  %r537 = icmp eq i32 %r478, 4
  br i1 %r537, label %bb41, label %bb42

bb41:
  %r538 = add i32 0, 0
  %r539 = add i32 1, 0
  br label %bb44

bb44:
  %r540 = phi i32 [ %r538, %bb41 ], [ %r549, %bb49 ]
  %r541 = phi i32 [ %r539, %bb41 ], [ %r551, %bb49 ]
  %r542 = load i32, i32* @max
  %r543 = icmp slt i32 %r541, %r542
  br i1 %r543, label %bb45, label %bb46

bb45:
  %r544 = sdiv i32 %r480, %r541
  %r545 = call i32 @mod(i32 %r544, i32 2)
  %r546 = icmp eq i32 %r545, 1
  br i1 %r546, label %bb51, label %bb52

bb51:
  %r564 = add i32 1, 0
  br label %bb53

bb52:
  %r565 = add i32 0, 0
  br label %bb53

bb53:
  %r547 = phi i32 [ %r564, %bb51 ], [ %r565, %bb52 ]
  %r548 = icmp ne i32 %r547, 0
  br i1 %r548, label %bb50, label %bb48

bb50:
  %r554 = sdiv i32 %r482, %r541
  %r555 = call i32 @mod(i32 %r554, i32 2)
  %r556 = icmp eq i32 %r555, 1
  br i1 %r556, label %bb54, label %bb55

bb54:
  %r562 = add i32 1, 0
  br label %bb56

bb55:
  %r563 = add i32 0, 0
  br label %bb56

bb56:
  %r557 = phi i32 [ %r562, %bb54 ], [ %r563, %bb55 ]
  %r558 = icmp ne i32 %r557, 0
  br i1 %r558, label %bb47, label %bb48

bb47:
  %r559 = mul i32 %r540, 2
  %r560 = add i32 %r559, 1
  %r561 = add i32 %r560, 0
  br label %bb49

bb48:
  %r552 = mul i32 %r540, 2
  %r553 = add i32 %r552, 0
  br label %bb49

bb49:
  %r549 = phi i32 [ %r561, %bb47 ], [ %r553, %bb48 ]
  %r550 = mul i32 %r541, 2
  %r551 = add i32 %r550, 0
  br label %bb44

bb46:
  ret i32 %r540
bb42:
  br label %bb43

bb43:
  ret i32 0
}

define i32 @getvalue( i32* %r239, i32 %r240, i32 %r242, i32 %r244, i32 %r246 ) {
getvalue:
  %r577 = add i32 0, 0
  %r578 = add i32 0, 0
  %r579 = add i32 0, 0
  %r580 = add i32 0, 0
  %r581 = add i32 0, 0
  %r582 = add i32 %r240, 0
  %r583 = add i32 0, 0
  %r584 = add i32 %r242, 0
  %r585 = add i32 0, 0
  %r586 = add i32 %r244, 0
  %r587 = add i32 0, 0
  %r588 = add i32 %r246, 0
  %r589 = add i32 0, 0
  %r590 = add i32 0, 0
  %r591 = add i32 0, 0
  %r592 = icmp slt i32 %r586, 0
  br i1 %r592, label %bb69, label %bb70

bb69:
  %r593 = add i32 1, 0
  br label %bb71

bb70:
  %r623 = add i32 0, 0
  br label %bb71

bb71:
  %r594 = phi i32 [ %r593, %bb69 ], [ %r623, %bb70 ]
  %r595 = icmp ne i32 %r594, 0
  br i1 %r595, label %bb65, label %bb68

bb68:
  %r617 = icmp slt i32 %r588, 0
  br i1 %r617, label %bb72, label %bb73

bb72:
  %r622 = add i32 1, 0
  br label %bb74

bb73:
  %r621 = add i32 0, 0
  br label %bb74

bb74:
  %r618 = phi i32 [ %r622, %bb72 ], [ %r621, %bb73 ]
  %r619 = icmp ne i32 %r618, 0
  br i1 %r619, label %bb65, label %bb66

bb65:
  %r596 = add i32 1, 0
  br label %bb67

bb66:
  %r620 = add i32 0, 0
  br label %bb67

bb67:
  %r597 = phi i32 [ %r596, %bb65 ], [ %r620, %bb66 ]
  %r598 = icmp ne i32 %r597, 0
  br i1 %r598, label %bb61, label %bb64

bb64:
  %r611 = icmp sge i32 %r586, %r582
  br i1 %r611, label %bb75, label %bb76

bb75:
  %r612 = add i32 1, 0
  br label %bb77

bb76:
  %r616 = add i32 0, 0
  br label %bb77

bb77:
  %r613 = phi i32 [ %r612, %bb75 ], [ %r616, %bb76 ]
  %r614 = icmp ne i32 %r613, 0
  br i1 %r614, label %bb61, label %bb62

bb61:
  %r599 = add i32 1, 0
  br label %bb63

bb62:
  %r615 = add i32 0, 0
  br label %bb63

bb63:
  %r600 = phi i32 [ %r599, %bb61 ], [ %r615, %bb62 ]
  %r601 = icmp ne i32 %r600, 0
  br i1 %r601, label %bb57, label %bb60

bb60:
  %r602 = icmp sge i32 %r588, %r584
  br i1 %r602, label %bb78, label %bb79

bb78:
  %r610 = add i32 1, 0
  br label %bb80

bb79:
  %r603 = add i32 0, 0
  br label %bb80

bb80:
  %r604 = phi i32 [ %r610, %bb78 ], [ %r603, %bb79 ]
  %r605 = icmp ne i32 %r604, 0
  br i1 %r605, label %bb57, label %bb58

bb57:
  ret i32 0
bb58:
  br label %bb59

bb59:
  %r606 = mul i32 %r586, %r584
  %r607 = add i32 %r606, %r588
  %r608 = add i32 %r607, 0
  %r283 = getelementptr i32, i32* %r239, i32 %r608
  %r609 = load i32, i32* %r283
  ret i32 %r609
}

define i32 @convn( i32 %r286, i32* %r288, i32* %r289, i32 %r290, i32 %r292, i32 %r294 ) {
convn:
  %r635 = add i32 0, 0
  %r636 = add i32 0, 0
  %r637 = add i32 %r286, 0
  %r638 = add i32 0, 0
  %r639 = add i32 %r290, 0
  %r640 = add i32 0, 0
  %r641 = add i32 %r292, 0
  %r642 = add i32 0, 0
  %r643 = add i32 %r294, 0
  %r644 = add i32 0, 0
  %r645 = add i32 0, 0
  %r646 = add i32 0, 0
  %r647 = add i32 0, 0
  %r648 = add i32 0, 0
  %r649 = add i32 0, 0
  %r650 = add i32 0, 0
  %r651 = add i32 0, 0
  %r652 = add i32 1, 0
  br label %bb81

bb81:
  %r653 = phi i32 [ %r645, %convn ], [ %r659, %bb104 ]
  %r654 = icmp eq i32 %r652, %r652
  br i1 %r654, label %bb82, label %bb83

bb82:
  %r655 = add i32 0, 0
  br label %bb84

bb84:
  %r656 = phi i32 [ %r655, %bb82 ], [ %r673, %bb101 ]
  %r657 = icmp eq i32 %r652, %r652
  br i1 %r657, label %bb85, label %bb86

bb85:
  %r661 = add i32 0, 0
  %r662 = sdiv i32 %r643, 2
  %r663 = sub i32 %r653, %r662
  %r664 = add i32 %r663, 0
  br label %bb87

bb87:
  %r665 = phi i32 [ %r664, %bb85 ], [ %r683, %bb98 ]
  %r666 = phi i32 [ %r661, %bb85 ], [ %r681, %bb98 ]
  %r667 = icmp eq i32 %r652, %r652
  br i1 %r667, label %bb88, label %bb89

bb88:
  %r675 = sdiv i32 %r643, 2
  %r676 = sub i32 %r656, %r675
  %r677 = add i32 %r676, 0
  br label %bb90

bb90:
  %r678 = phi i32 [ %r677, %bb88 ], [ %r691, %bb95 ]
  %r679 = phi i32 [ %r666, %bb88 ], [ %r689, %bb95 ]
  %r680 = icmp eq i32 %r652, %r652
  br i1 %r680, label %bb91, label %bb92

bb91:
  %r687 = call i32 @getvalue(i32* %r288, i32 %r639, i32 %r641, i32 %r665, i32 %r678)
  %r688 = call i32 @reduce(i32 %r637, i32 %r679, i32 %r687)
  %r689 = add i32 %r688, 0
  %r690 = add i32 %r678, 1
  %r691 = add i32 %r690, 0
  %r692 = sdiv i32 %r643, 2
  %r693 = add i32 %r656, %r692
  %r694 = icmp sge i32 %r691, %r693
  br i1 %r694, label %bb93, label %bb94

bb93:
  br label %bb92

bb94:
  br label %bb95

bb95:
  br label %bb90

bb92:
  %r681 = phi i32 [ %r679, %bb90 ], [ %r689, %bb93 ]
  %r682 = add i32 %r665, 1
  %r683 = add i32 %r682, 0
  %r684 = sdiv i32 %r643, 2
  %r685 = add i32 %r653, %r684
  %r686 = icmp sge i32 %r683, %r685
  br i1 %r686, label %bb96, label %bb97

bb96:
  br label %bb89

bb97:
  br label %bb98

bb98:
  br label %bb87

bb89:
  %r668 = phi i32 [ %r666, %bb87 ], [ %r681, %bb96 ]
  %r669 = mul i32 %r653, %r641
  %r670 = add i32 %r669, %r656
  %r671 = add i32 %r670, 0
  %r354 = getelementptr i32, i32* %r289, i32 %r671
  store i32 %r668, i32* %r354
  %r672 = add i32 %r656, 1
  %r673 = add i32 %r672, 0
  %r674 = icmp sge i32 %r673, %r641
  br i1 %r674, label %bb99, label %bb100

bb99:
  br label %bb86

bb100:
  br label %bb101

bb101:
  br label %bb84

bb86:
  %r658 = add i32 %r653, 1
  %r659 = add i32 %r658, 0
  %r660 = icmp sge i32 %r659, %r639
  br i1 %r660, label %bb102, label %bb103

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
  %r697 = add i32 0, 0
  %r698 = add i32 %r371, 0
  %r699 = add i32 0, 0
  %r700 = add i32 0, 0
  br label %bb105

bb105:
  %r701 = phi i32 [ %r700, %memmove ], [ %r705, %bb106 ]
  %r702 = icmp slt i32 %r701, %r698
  br i1 %r702, label %bb106, label %bb107

bb106:
  %r377 = getelementptr i32, i32* %r369, i32 %r701
  %r379 = getelementptr i32, i32* %r370, i32 %r701
  %r703 = load i32, i32* %r379
  store i32 %r703, i32* %r377
  %r704 = add i32 %r701, 1
  %r705 = add i32 %r704, 0
  br label %bb105

bb107:
  ret void
}

define i32 @main( ) {
main:
  %r713 = add i32 0, 0
  %r714 = add i32 0, 0
  %r715 = call i32 @getint()
  %r716 = add i32 0, 0
  %r717 = add i32 %r715, 0
  %r718 = call i32 @getint()
  %r719 = add i32 0, 0
  %r720 = add i32 %r718, 0
  %r721 = call i32 @getint()
  %r722 = add i32 0, 0
  %r723 = add i32 %r721, 0
  %r724 = add i32 0, 0
  %r725 = call i32 @getint()
  %r726 = add i32 %r725, 0
  %r727 = add i32 0, 0
  %r728 = add i32 0, 0
  br label %bb108

bb108:
  %r729 = phi i32 [ %r728, %main ], [ %r733, %bb109 ]
  %r730 = icmp slt i32 %r729, %r726
  br i1 %r730, label %bb109, label %bb110

bb109:
  %r396 = getelementptr [10000000 x i32 ], [10000000 x i32 ]* @a, i32 0, i32 %r729
  %r731 = call i32 @getint()
  store i32 %r731, i32* %r396
  %r732 = add i32 %r729, 1
  %r733 = add i32 %r732, 0
  br label %bb108

bb110:
  %r734 = call i32 @getint()
  %r735 = add i32 %r734, 0
  %r736 = add i32 0, 0
  br label %bb111

bb111:
  %r737 = phi i32 [ %r736, %bb110 ], [ %r741, %bb112 ]
  %r738 = icmp slt i32 %r737, %r735
  br i1 %r738, label %bb112, label %bb113

bb112:
  %r405 = getelementptr [10000 x i32 ], [10000 x i32 ]* @kernelid, i32 0, i32 %r737
  %r739 = call i32 @getint()
  store i32 %r739, i32* %r405
  %r740 = add i32 %r737, 1
  %r741 = add i32 %r740, 0
  br label %bb111

bb113:
  %r742 = add i32 %r735, 0
  call void @_sysy_starttime(i32 209)
  %r743 = add i32 0, 0
  br label %bb114

bb114:
  %r744 = phi i32 [ %r743, %bb113 ], [ %r750, %bb115 ]
  %r745 = icmp slt i32 %r744, %r742
  br i1 %r745, label %bb115, label %bb116

bb115:
  %r416 = getelementptr [10000 x i32 ], [10000 x i32 ]* @kernelid, i32 0, i32 %r744
  %r746 = load i32, i32* %r416
  %r747 = call i32 @convn(i32 %r746, i32* @a, i32* @b, i32 %r720, i32 %r723, i32 %r717)
  %r748 = mul i32 %r720, %r723
  call void @memmove(i32* @a, i32* @b, i32 %r748)
  %r749 = add i32 %r744, 1
  %r750 = add i32 %r749, 0
  br label %bb114

bb116:
  call void @_sysy_stoptime(i32 312)
  %r751 = mul i32 %r720, %r723
  call void @putarray(i32 %r751, i32* @a)
  ret i32 0
}

