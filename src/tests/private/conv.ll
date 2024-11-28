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
  %r434 = add i32 0, 0
  %r435 = add i32 %r100, 0
  br label %bb1

bb1:
  %r436 = phi i32 [ %r435, %checkrange ], [ %r441, %bb2 ]
  %r437 = load i32, i32* @max
  %r438 = icmp sgt i32 %r436, %r437
  br i1 %r438, label %bb2, label %bb3

bb2:
  %r439 = load i32, i32* @max
  %r440 = sub i32 %r436, %r439
  %r441 = add i32 %r440, 0
  br label %bb1

bb3:
  br label %bb4

bb4:
  %r442 = phi i32 [ %r436, %bb3 ], [ %r446, %bb5 ]
  %r443 = icmp slt i32 %r442, 0
  br i1 %r443, label %bb5, label %bb6

bb5:
  %r444 = load i32, i32* @max
  %r445 = add i32 %r442, %r444
  %r446 = add i32 %r445, 0
  br label %bb4

bb6:
  ret i32 %r442
}

define i32 @mod( i32 %r114, i32 %r116 ) {
mod:
  %r453 = add i32 0, 0
  %r454 = add i32 %r114, 0
  %r455 = add i32 0, 0
  %r456 = add i32 %r116, 0
  %r457 = sdiv i32 %r454, %r456
  %r458 = mul i32 %r457, %r456
  %r459 = sub i32 %r454, %r458
  ret i32 %r459
}

define i32 @reduce( i32 %r125, i32 %r127, i32 %r129 ) {
reduce:
  %r499 = add i32 0, 0
  %r500 = add i32 0, 0
  %r501 = add i32 0, 0
  %r502 = add i32 0, 0
  %r503 = add i32 0, 0
  %r504 = add i32 0, 0
  %r505 = add i32 0, 0
  %r506 = add i32 0, 0
  %r507 = add i32 0, 0
  %r508 = add i32 0, 0
  %r509 = add i32 0, 0
  %r510 = add i32 %r125, 0
  %r511 = add i32 0, 0
  %r512 = add i32 %r127, 0
  %r513 = add i32 0, 0
  %r514 = add i32 %r129, 0
  %r515 = icmp eq i32 %r510, 0
  br i1 %r515, label %bb7, label %bb8

bb7:
  %r516 = add i32 %r512, %r514
  %r517 = call i32 @checkrange(i32 %r516)
  ret i32 %r517
bb8:
  br label %bb9

bb9:
  %r518 = icmp eq i32 %r510, 1
  br i1 %r518, label %bb10, label %bb11

bb10:
  %r519 = add i32 0, 0
  %r520 = add i32 1, 0
  br label %bb13

bb13:
  %r521 = phi i32 [ %r520, %bb10 ], [ %r537, %bb18 ]
  %r522 = phi i32 [ %r519, %bb10 ], [ %r535, %bb18 ]
  %r523 = load i32, i32* @max
  %r524 = icmp slt i32 %r521, %r523
  br i1 %r524, label %bb14, label %bb15

bb14:
  %r525 = sdiv i32 %r512, %r521
  %r526 = call i32 @mod(i32 %r525, i32 2)
  %r527 = sdiv i32 %r514, %r521
  %r528 = call i32 @mod(i32 %r527, i32 2)
  %r529 = icmp eq i32 %r526, %r528
  br i1 %r529, label %bb16, label %bb17

bb16:
  %r530 = mul i32 %r522, 2
  %r531 = add i32 %r530, 0
  br label %bb18

bb17:
  %r532 = mul i32 %r522, 2
  %r533 = add i32 %r532, 1
  %r534 = add i32 %r533, 0
  br label %bb18

bb18:
  %r535 = phi i32 [ %r531, %bb16 ], [ %r534, %bb17 ]
  %r536 = mul i32 %r521, 2
  %r537 = add i32 %r536, 0
  br label %bb13

bb15:
  ret i32 %r522
bb11:
  br label %bb12

bb12:
  %r538 = icmp eq i32 %r510, 2
  br i1 %r538, label %bb19, label %bb20

bb19:
  %r539 = icmp sgt i32 %r512, %r514
  br i1 %r539, label %bb22, label %bb23

bb22:
  ret i32 %r512
bb23:
  ret i32 %r514
bb20:
  br label %bb21

bb21:
  %r497 = phi i32 [ %r497, %bb24 ], [ %r514, %bb20 ]
  %r491 = phi i32 [ %r491, %bb24 ], [ %r510, %bb20 ]
  %r494 = phi i32 [ %r494, %bb24 ], [ %r512, %bb20 ]
  %r174 = icmp eq i32 %r491, 3
  br i1 %r174, label %bb25, label %bb26

bb25:
  %r482 = add i32 0, 0
  %r479 = add i32 1, 0
  br label %bb28

bb28:
  %r180 = load i32, i32* @max
  %r178 = icmp slt i32 %r479, %r180
  br i1 %r178, label %bb29, label %bb30

bb29:
  %r187 = sdiv i32 %r494, %r479
  %r184 = call i32 @mod(i32 %r187, i32 2)
  %r183 = icmp eq i32 %r184, 1
  br i1 %r183, label %bb35, label %bb36

bb35:
  %r476 = add i32 1, 0
  br label %bb37

bb36:
  %r476 = add i32 0, 0
  br label %bb37

bb37:
  %r188 = icmp ne i32 %r476, 0
  br i1 %r188, label %bb31, label %bb34

bb34:
  %r195 = sdiv i32 %r497, %r479
  %r192 = call i32 @mod(i32 %r195, i32 2)
  %r191 = icmp eq i32 %r192, 1
  br i1 %r191, label %bb38, label %bb39

bb38:
  %r473 = add i32 1, 0
  br label %bb40

bb39:
  %r473 = add i32 0, 0
  br label %bb40

bb40:
  %r196 = icmp ne i32 %r473, 0
  br i1 %r196, label %bb31, label %bb32

bb31:
  %r199 = mul i32 %r482, 2
  %r200 = add i32 %r199, 1
  %r482 = add i32 %r200, 0
  br label %bb33

bb32:
  %r202 = mul i32 %r482, 2
  %r482 = add i32 %r202, 0
  br label %bb33

bb33:
  %r204 = mul i32 %r479, 2
  %r479 = add i32 %r204, 0
  br label %bb28

bb30:
  ret i32 %r482
bb26:
  br label %bb27

bb27:
  %r207 = icmp eq i32 %r491, 4
  br i1 %r207, label %bb41, label %bb42

bb41:
  %r470 = add i32 0, 0
  %r467 = add i32 1, 0
  br label %bb44

bb44:
  %r213 = load i32, i32* @max
  %r211 = icmp slt i32 %r467, %r213
  br i1 %r211, label %bb45, label %bb46

bb45:
  %r220 = sdiv i32 %r494, %r467
  %r217 = call i32 @mod(i32 %r220, i32 2)
  %r216 = icmp eq i32 %r217, 1
  br i1 %r216, label %bb51, label %bb52

bb51:
  %r464 = add i32 1, 0
  br label %bb53

bb52:
  %r464 = add i32 0, 0
  br label %bb53

bb53:
  %r221 = icmp ne i32 %r464, 0
  br i1 %r221, label %bb50, label %bb48

bb50:
  %r228 = sdiv i32 %r497, %r467
  %r225 = call i32 @mod(i32 %r228, i32 2)
  %r224 = icmp eq i32 %r225, 1
  br i1 %r224, label %bb54, label %bb55

bb54:
  %r461 = add i32 1, 0
  br label %bb56

bb55:
  %r461 = add i32 0, 0
  br label %bb56

bb56:
  %r229 = icmp ne i32 %r461, 0
  br i1 %r229, label %bb47, label %bb48

bb47:
  %r232 = mul i32 %r470, 2
  %r233 = add i32 %r232, 1
  %r470 = add i32 %r233, 0
  br label %bb49

bb48:
  %r235 = mul i32 %r470, 2
  %r470 = add i32 %r235, 0
  br label %bb49

bb49:
  %r237 = mul i32 %r467, 2
  %r467 = add i32 %r237, 0
  br label %bb44

bb46:
  ret i32 %r470
bb42:
  br label %bb43

bb43:
  ret i32 0
}

define i32 @getvalue( i32* %r239, i32 %r240, i32 %r242, i32 %r244, i32 %r246 ) {
getvalue:
  %r573 = add i32 0, 0
  %r574 = add i32 0, 0
  %r575 = add i32 0, 0
  %r576 = add i32 0, 0
  %r577 = add i32 0, 0
  %r578 = add i32 %r240, 0
  %r579 = add i32 0, 0
  %r580 = add i32 %r242, 0
  %r581 = add i32 0, 0
  %r582 = add i32 %r244, 0
  %r583 = add i32 0, 0
  %r584 = add i32 %r246, 0
  %r585 = add i32 0, 0
  %r586 = add i32 0, 0
  %r587 = add i32 0, 0
  %r588 = icmp slt i32 %r582, 0
  br i1 %r588, label %bb69, label %bb70

bb69:
  %r618 = add i32 1, 0
  br label %bb71

bb70:
  %r619 = add i32 0, 0
  br label %bb71

bb71:
  %r589 = phi i32 [ %r618, %bb69 ], [ %r619, %bb70 ]
  %r590 = icmp ne i32 %r589, 0
  br i1 %r590, label %bb65, label %bb68

bb68:
  %r612 = icmp slt i32 %r584, 0
  br i1 %r612, label %bb72, label %bb73

bb72:
  %r617 = add i32 1, 0
  br label %bb74

bb73:
  %r616 = add i32 0, 0
  br label %bb74

bb74:
  %r613 = phi i32 [ %r617, %bb72 ], [ %r616, %bb73 ]
  %r614 = icmp ne i32 %r613, 0
  br i1 %r614, label %bb65, label %bb66

bb65:
  %r611 = add i32 1, 0
  br label %bb67

bb66:
  %r615 = add i32 0, 0
  br label %bb67

bb67:
  %r591 = phi i32 [ %r611, %bb65 ], [ %r615, %bb66 ]
  %r592 = icmp ne i32 %r591, 0
  br i1 %r592, label %bb61, label %bb64

bb64:
  %r605 = icmp sge i32 %r582, %r578
  br i1 %r605, label %bb75, label %bb76

bb75:
  %r609 = add i32 1, 0
  br label %bb77

bb76:
  %r610 = add i32 0, 0
  br label %bb77

bb77:
  %r606 = phi i32 [ %r609, %bb75 ], [ %r610, %bb76 ]
  %r607 = icmp ne i32 %r606, 0
  br i1 %r607, label %bb61, label %bb62

bb61:
  %r604 = add i32 1, 0
  br label %bb63

bb62:
  %r608 = add i32 0, 0
  br label %bb63

bb63:
  %r593 = phi i32 [ %r604, %bb61 ], [ %r608, %bb62 ]
  %r594 = icmp ne i32 %r593, 0
  br i1 %r594, label %bb57, label %bb60

bb60:
  %r595 = icmp sge i32 %r584, %r580
  br i1 %r595, label %bb78, label %bb79

bb78:
  %r602 = add i32 1, 0
  br label %bb80

bb79:
  %r603 = add i32 0, 0
  br label %bb80

bb80:
  %r596 = phi i32 [ %r602, %bb78 ], [ %r603, %bb79 ]
  %r597 = icmp ne i32 %r596, 0
  br i1 %r597, label %bb57, label %bb58

bb57:
  ret i32 0
bb58:
  br label %bb59

bb59:
  %r598 = mul i32 %r582, %r580
  %r599 = add i32 %r598, %r584
  %r600 = add i32 %r599, 0
  %r283 = getelementptr i32, i32* %r239, i32 %r600
  %r601 = load i32, i32* %r283
  ret i32 %r601
}

define i32 @convn( i32 %r286, i32* %r288, i32* %r289, i32 %r290, i32 %r292, i32 %r294 ) {
convn:
  %r653 = add i32 0, 0
  %r654 = add i32 0, 0
  %r655 = add i32 %r286, 0
  %r656 = add i32 0, 0
  %r657 = add i32 %r290, 0
  %r658 = add i32 0, 0
  %r659 = add i32 %r292, 0
  %r660 = add i32 0, 0
  %r661 = add i32 %r294, 0
  %r662 = add i32 0, 0
  %r663 = add i32 0, 0
  %r664 = add i32 0, 0
  %r665 = add i32 0, 0
  %r666 = add i32 0, 0
  %r667 = add i32 0, 0
  %r668 = add i32 0, 0
  %r669 = add i32 0, 0
  %r670 = add i32 1, 0
  br label %bb81

bb81:
  %r671 = phi i32 [ %r663, %convn ], [ %r711, %bb104 ]
  %r672 = icmp eq i32 %r670, %r670
  br i1 %r672, label %bb82, label %bb83

bb82:
  %r673 = add i32 0, 0
  br label %bb84

bb84:
  %r674 = phi i32 [ %r673, %bb82 ], [ %r688, %bb101 ]
  %r675 = icmp eq i32 %r670, %r670
  br i1 %r675, label %bb85, label %bb86

bb85:
  %r676 = add i32 0, 0
  %r677 = sdiv i32 %r661, 2
  %r678 = sub i32 %r671, %r677
  %r679 = add i32 %r678, 0
  br label %bb87

bb87:
  %r680 = phi i32 [ %r679, %bb85 ], [ %r698, %bb98 ]
  %r681 = phi i32 [ %r676, %bb85 ], [ %r696, %bb98 ]
  %r682 = icmp eq i32 %r670, %r670
  br i1 %r682, label %bb88, label %bb89

bb88:
  %r690 = sdiv i32 %r661, 2
  %r691 = sub i32 %r674, %r690
  %r692 = add i32 %r691, 0
  br label %bb90

bb90:
  %r693 = phi i32 [ %r681, %bb88 ], [ %r704, %bb95 ]
  %r694 = phi i32 [ %r692, %bb88 ], [ %r706, %bb95 ]
  %r695 = icmp eq i32 %r670, %r670
  br i1 %r695, label %bb91, label %bb92

bb91:
  %r702 = call i32 @getvalue(i32* %r288, i32 %r657, i32 %r659, i32 %r680, i32 %r694)
  %r703 = call i32 @reduce(i32 %r655, i32 %r693, i32 %r702)
  %r704 = add i32 %r703, 0
  %r705 = add i32 %r694, 1
  %r706 = add i32 %r705, 0
  %r707 = sdiv i32 %r661, 2
  %r708 = add i32 %r674, %r707
  %r709 = icmp sge i32 %r706, %r708
  br i1 %r709, label %bb93, label %bb94

bb93:
  br label %bb92

bb94:
  br label %bb95

bb95:
  br label %bb90

bb92:
  %r696 = phi i32 [ %r693, %bb90 ], [ %r704, %bb93 ]
  %r697 = add i32 %r680, 1
  %r698 = add i32 %r697, 0
  %r699 = sdiv i32 %r661, 2
  %r700 = add i32 %r671, %r699
  %r701 = icmp sge i32 %r698, %r700
  br i1 %r701, label %bb96, label %bb97

bb96:
  br label %bb89

bb97:
  br label %bb98

bb98:
  br label %bb87

bb89:
  %r683 = phi i32 [ %r681, %bb87 ], [ %r696, %bb96 ]
  %r684 = mul i32 %r671, %r659
  %r685 = add i32 %r684, %r674
  %r686 = add i32 %r685, 0
  %r354 = getelementptr i32, i32* %r289, i32 %r686
  store i32 %r683, i32* %r354
  %r687 = add i32 %r674, 1
  %r688 = add i32 %r687, 0
  %r689 = icmp sge i32 %r688, %r659
  br i1 %r689, label %bb99, label %bb100

bb99:
  br label %bb86

bb100:
  br label %bb101

bb101:
  br label %bb84

bb86:
  %r710 = add i32 %r671, 1
  %r711 = add i32 %r710, 0
  %r712 = icmp sge i32 %r711, %r657
  br i1 %r712, label %bb102, label %bb103

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
  %r719 = add i32 0, 0
  %r720 = add i32 %r371, 0
  %r721 = add i32 0, 0
  %r722 = add i32 0, 0
  br label %bb105

bb105:
  %r723 = phi i32 [ %r722, %memmove ], [ %r727, %bb106 ]
  %r724 = icmp slt i32 %r723, %r720
  br i1 %r724, label %bb106, label %bb107

bb106:
  %r377 = getelementptr i32, i32* %r369, i32 %r723
  %r379 = getelementptr i32, i32* %r370, i32 %r723
  %r725 = load i32, i32* %r379
  store i32 %r725, i32* %r377
  %r726 = add i32 %r723, 1
  %r727 = add i32 %r726, 0
  br label %bb105

bb107:
  ret void
}

define i32 @main( ) {
main:
  %r749 = add i32 0, 0
  %r750 = add i32 0, 0
  %r751 = call i32 @getint()
  %r752 = add i32 0, 0
  %r753 = add i32 %r751, 0
  %r754 = call i32 @getint()
  %r755 = add i32 0, 0
  %r756 = add i32 %r754, 0
  %r757 = call i32 @getint()
  %r758 = add i32 0, 0
  %r759 = add i32 %r757, 0
  %r760 = add i32 0, 0
  %r761 = call i32 @getint()
  %r762 = add i32 %r761, 0
  %r763 = add i32 0, 0
  %r764 = add i32 0, 0
  br label %bb108

bb108:
  %r765 = phi i32 [ %r764, %main ], [ %r769, %bb109 ]
  %r766 = icmp slt i32 %r765, %r762
  br i1 %r766, label %bb109, label %bb110

bb109:
  %r396 = getelementptr [10000000 x i32 ], [10000000 x i32 ]* @a, i32 0, i32 %r765
  %r767 = call i32 @getint()
  store i32 %r767, i32* %r396
  %r768 = add i32 %r765, 1
  %r769 = add i32 %r768, 0
  br label %bb108

bb110:
  %r770 = call i32 @getint()
  %r771 = add i32 %r770, 0
  %r772 = add i32 0, 0
  br label %bb111

bb111:
  %r773 = phi i32 [ %r772, %bb110 ], [ %r777, %bb112 ]
  %r774 = icmp slt i32 %r773, %r771
  br i1 %r774, label %bb112, label %bb113

bb112:
  %r405 = getelementptr [10000 x i32 ], [10000 x i32 ]* @kernelid, i32 0, i32 %r773
  %r775 = call i32 @getint()
  store i32 %r775, i32* %r405
  %r776 = add i32 %r773, 1
  %r777 = add i32 %r776, 0
  br label %bb111

bb113:
  %r778 = add i32 %r771, 0
  call void @_sysy_starttime(i32 209)
  %r779 = add i32 0, 0
  br label %bb114

bb114:
  %r780 = phi i32 [ %r779, %bb113 ], [ %r786, %bb115 ]
  %r781 = icmp slt i32 %r780, %r778
  br i1 %r781, label %bb115, label %bb116

bb115:
  %r416 = getelementptr [10000 x i32 ], [10000 x i32 ]* @kernelid, i32 0, i32 %r780
  %r782 = load i32, i32* %r416
  %r783 = call i32 @convn(i32 %r782, i32* @a, i32* @b, i32 %r756, i32 %r759, i32 %r753)
  %r784 = mul i32 %r756, %r759
  call void @memmove(i32* @a, i32* @b, i32 %r784)
  %r785 = add i32 %r780, 1
  %r786 = add i32 %r785, 0
  br label %bb114

bb116:
  call void @_sysy_stoptime(i32 312)
  %r787 = mul i32 %r756, %r759
  call void @putarray(i32 %r787, i32* @a)
  ret i32 0
}

