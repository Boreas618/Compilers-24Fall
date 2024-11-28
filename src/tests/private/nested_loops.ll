declare i32 @getch( )
declare i32 @getint( )
declare void @putch( i32 )
declare void @putint( i32 )
declare void @putarray( i32, i32* )
declare void @_sysy_starttime( i32 )
declare void @_sysy_stoptime( i32 )
%my_struct_1 = type { [7 x i32 ] }
%my_struct_2 = type { [8 x %my_struct_1 ] }
%my_struct_3 = type { [5 x %my_struct_2 ] }
%my_struct_4 = type { [4 x %my_struct_3 ] }
%my_struct_5 = type { [3 x %my_struct_4 ] }
%my_struct_6 = type { [2 x %my_struct_5 ] }
@arr1 = global [ 10 x %my_struct_6 ] zeroinitializer
@arr2 = global [ 10 x %my_struct_6 ] zeroinitializer
define i32 @loop1( i32 %r100, i32 %r102 ) {
loop1:
  %r440 = add i32 0, 0
  %r441 = add i32 0, 0
  %r442 = add i32 0, 0
  %r443 = add i32 %r100, 0
  %r444 = add i32 0, 0
  %r445 = add i32 %r102, 0
  %r446 = add i32 0, 0
  %r447 = add i32 0, 0
  %r448 = add i32 0, 0
  %r449 = add i32 0, 0
  %r450 = add i32 0, 0
  %r451 = add i32 0, 0
  %r452 = add i32 0, 0
  %r453 = add i32 0, 0
  br label %bb1

bb1:
  %r454 = phi i32 [ %r453, %loop1 ], [ %r504, %bb13 ]
  %r455 = icmp slt i32 %r454, %r443
  br i1 %r455, label %bb5, label %bb6

bb5:
  %r457 = add i32 1, 0
  br label %bb7

bb6:
  %r456 = add i32 0, 0
  br label %bb7

bb7:
  %r458 = phi i32 [ %r457, %bb5 ], [ %r456, %bb6 ]
  %r459 = icmp ne i32 %r458, 0
  br i1 %r459, label %bb4, label %bb3

bb4:
  %r460 = icmp slt i32 %r454, %r445
  br i1 %r460, label %bb8, label %bb9

bb8:
  %r461 = add i32 1, 0
  br label %bb10

bb9:
  %r462 = add i32 0, 0
  br label %bb10

bb10:
  %r463 = phi i32 [ %r461, %bb8 ], [ %r462, %bb9 ]
  %r464 = icmp ne i32 %r463, 0
  br i1 %r464, label %bb2, label %bb3

bb2:
  %r465 = add i32 0, 0
  br label %bb11

bb11:
  %r466 = phi i32 [ %r465, %bb2 ], [ %r502, %bb16 ]
  %r467 = icmp slt i32 %r466, 2
  br i1 %r467, label %bb12, label %bb13

bb12:
  %r468 = add i32 0, 0
  br label %bb14

bb14:
  %r469 = phi i32 [ %r468, %bb12 ], [ %r500, %bb19 ]
  %r470 = icmp slt i32 %r469, 3
  br i1 %r470, label %bb15, label %bb16

bb15:
  %r471 = add i32 0, 0
  br label %bb17

bb17:
  %r472 = phi i32 [ %r471, %bb15 ], [ %r478, %bb22 ]
  %r473 = icmp slt i32 %r472, 4
  br i1 %r473, label %bb18, label %bb19

bb18:
  %r474 = add i32 0, 0
  br label %bb20

bb20:
  %r475 = phi i32 [ %r474, %bb18 ], [ %r498, %bb25 ]
  %r476 = icmp slt i32 %r475, 5
  br i1 %r476, label %bb21, label %bb22

bb21:
  %r479 = add i32 0, 0
  br label %bb23

bb23:
  %r480 = phi i32 [ %r479, %bb21 ], [ %r496, %bb28 ]
  %r481 = icmp slt i32 %r480, 6
  br i1 %r481, label %bb24, label %bb25

bb24:
  %r482 = add i32 0, 0
  br label %bb26

bb26:
  %r483 = phi i32 [ %r482, %bb24 ], [ %r494, %bb27 ]
  %r484 = icmp slt i32 %r483, 2
  br i1 %r484, label %bb27, label %bb28

bb27:
  %r135 = getelementptr [10 x %my_struct_6 ], [10 x %my_struct_6 ]* @arr1, i32 0, i32 %r454
  %r137 = getelementptr %my_struct_6, %my_struct_6* %r135, i32 0, i32 0
  %r138 = getelementptr [2 x %my_struct_5 ], [2 x %my_struct_5 ]* %r137, i32 0, i32 %r466
  %r140 = getelementptr %my_struct_5, %my_struct_5* %r138, i32 0, i32 0
  %r141 = getelementptr [3 x %my_struct_4 ], [3 x %my_struct_4 ]* %r140, i32 0, i32 %r469
  %r143 = getelementptr %my_struct_4, %my_struct_4* %r141, i32 0, i32 0
  %r144 = getelementptr [4 x %my_struct_3 ], [4 x %my_struct_3 ]* %r143, i32 0, i32 %r472
  %r146 = getelementptr %my_struct_3, %my_struct_3* %r144, i32 0, i32 0
  %r147 = getelementptr [5 x %my_struct_2 ], [5 x %my_struct_2 ]* %r146, i32 0, i32 %r475
  %r149 = getelementptr %my_struct_2, %my_struct_2* %r147, i32 0, i32 0
  %r150 = getelementptr [8 x %my_struct_1 ], [8 x %my_struct_1 ]* %r149, i32 0, i32 %r480
  %r152 = getelementptr %my_struct_1, %my_struct_1* %r150, i32 0, i32 0
  %r153 = getelementptr [7 x i32 ], [7 x i32 ]* %r152, i32 0, i32 %r483
  %r485 = add i32 %r454, %r466
  %r486 = add i32 %r485, %r469
  %r487 = add i32 %r486, %r472
  %r488 = add i32 %r487, %r475
  %r489 = add i32 %r488, %r480
  %r490 = add i32 %r489, %r483
  %r491 = add i32 %r490, %r443
  %r492 = add i32 %r491, %r445
  store i32 %r492, i32* %r153
  %r493 = add i32 %r483, 1
  %r494 = add i32 %r493, 0
  br label %bb26

bb28:
  %r495 = add i32 %r480, 1
  %r496 = add i32 %r495, 0
  br label %bb23

bb25:
  %r497 = add i32 %r475, 1
  %r498 = add i32 %r497, 0
  br label %bb20

bb22:
  %r477 = add i32 %r472, 1
  %r478 = add i32 %r477, 0
  br label %bb17

bb19:
  %r499 = add i32 %r469, 1
  %r500 = add i32 %r499, 0
  br label %bb14

bb16:
  %r501 = add i32 %r466, 1
  %r502 = add i32 %r501, 0
  br label %bb11

bb13:
  %r503 = add i32 %r454, 1
  %r504 = add i32 %r503, 0
  br label %bb1

bb3:
  ret i32 0
}

define i32 @loop2( ) {
loop2:
  %r526 = add i32 0, 0
  %r527 = add i32 0, 0
  %r528 = add i32 0, 0
  %r529 = add i32 0, 0
  %r530 = add i32 0, 0
  %r531 = add i32 0, 0
  %r532 = add i32 0, 0
  %r533 = add i32 0, 0
  br label %bb29

bb29:
  %r534 = phi i32 [ %r533, %loop2 ], [ %r540, %bb34 ]
  %r535 = icmp slt i32 %r534, 10
  br i1 %r535, label %bb30, label %bb31

bb30:
  %r536 = add i32 0, 0
  br label %bb32

bb32:
  %r537 = phi i32 [ %r536, %bb30 ], [ %r570, %bb37 ]
  %r538 = icmp slt i32 %r537, 2
  br i1 %r538, label %bb33, label %bb34

bb33:
  %r541 = add i32 0, 0
  br label %bb35

bb35:
  %r542 = phi i32 [ %r541, %bb33 ], [ %r568, %bb40 ]
  %r543 = icmp slt i32 %r542, 3
  br i1 %r543, label %bb36, label %bb37

bb36:
  %r544 = add i32 0, 0
  br label %bb38

bb38:
  %r545 = phi i32 [ %r544, %bb36 ], [ %r566, %bb43 ]
  %r546 = icmp slt i32 %r545, 2
  br i1 %r546, label %bb39, label %bb40

bb39:
  %r547 = add i32 0, 0
  br label %bb41

bb41:
  %r548 = phi i32 [ %r547, %bb39 ], [ %r554, %bb46 ]
  %r549 = icmp slt i32 %r548, 4
  br i1 %r549, label %bb42, label %bb43

bb42:
  %r550 = add i32 0, 0
  br label %bb44

bb44:
  %r551 = phi i32 [ %r550, %bb42 ], [ %r559, %bb49 ]
  %r552 = icmp slt i32 %r551, 8
  br i1 %r552, label %bb45, label %bb46

bb45:
  %r555 = add i32 0, 0
  br label %bb47

bb47:
  %r556 = phi i32 [ %r555, %bb45 ], [ %r564, %bb48 ]
  %r557 = icmp slt i32 %r556, 7
  br i1 %r557, label %bb48, label %bb49

bb48:
  %r207 = getelementptr [10 x %my_struct_6 ], [10 x %my_struct_6 ]* @arr2, i32 0, i32 %r534
  %r209 = getelementptr %my_struct_6, %my_struct_6* %r207, i32 0, i32 0
  %r210 = getelementptr [2 x %my_struct_5 ], [2 x %my_struct_5 ]* %r209, i32 0, i32 %r537
  %r212 = getelementptr %my_struct_5, %my_struct_5* %r210, i32 0, i32 0
  %r213 = getelementptr [3 x %my_struct_4 ], [3 x %my_struct_4 ]* %r212, i32 0, i32 %r542
  %r215 = getelementptr %my_struct_4, %my_struct_4* %r213, i32 0, i32 0
  %r216 = getelementptr [4 x %my_struct_3 ], [4 x %my_struct_3 ]* %r215, i32 0, i32 %r545
  %r218 = getelementptr %my_struct_3, %my_struct_3* %r216, i32 0, i32 0
  %r219 = getelementptr [5 x %my_struct_2 ], [5 x %my_struct_2 ]* %r218, i32 0, i32 %r548
  %r221 = getelementptr %my_struct_2, %my_struct_2* %r219, i32 0, i32 0
  %r222 = getelementptr [8 x %my_struct_1 ], [8 x %my_struct_1 ]* %r221, i32 0, i32 %r551
  %r224 = getelementptr %my_struct_1, %my_struct_1* %r222, i32 0, i32 0
  %r225 = getelementptr [7 x i32 ], [7 x i32 ]* %r224, i32 0, i32 %r556
  %r560 = add i32 %r534, %r537
  %r561 = add i32 %r560, %r545
  %r562 = add i32 %r561, %r556
  store i32 %r562, i32* %r225
  %r563 = add i32 %r556, 1
  %r564 = add i32 %r563, 0
  br label %bb47

bb49:
  %r558 = add i32 %r551, 1
  %r559 = add i32 %r558, 0
  br label %bb44

bb46:
  %r553 = add i32 %r548, 1
  %r554 = add i32 %r553, 0
  br label %bb41

bb43:
  %r565 = add i32 %r545, 1
  %r566 = add i32 %r565, 0
  br label %bb38

bb40:
  %r567 = add i32 %r542, 1
  %r568 = add i32 %r567, 0
  br label %bb35

bb37:
  %r569 = add i32 %r537, 1
  %r570 = add i32 %r569, 0
  br label %bb32

bb34:
  %r539 = add i32 %r534, 1
  %r540 = add i32 %r539, 0
  br label %bb29

bb31:
  ret i32 0
}

define i32 @loop3( i32 %r248, i32 %r250, i32 %r252, i32 %r254, i32 %r256, i32 %r258, i32 %r260 ) {
loop3:
  %r616 = add i32 0, 0
  %r617 = add i32 %r248, 0
  %r618 = add i32 0, 0
  %r619 = add i32 %r250, 0
  %r620 = add i32 0, 0
  %r621 = add i32 %r252, 0
  %r622 = add i32 0, 0
  %r623 = add i32 %r254, 0
  %r624 = add i32 0, 0
  %r625 = add i32 %r256, 0
  %r626 = add i32 0, 0
  %r627 = add i32 %r258, 0
  %r628 = add i32 0, 0
  %r629 = add i32 %r260, 0
  %r630 = add i32 0, 0
  %r631 = add i32 0, 0
  %r632 = add i32 0, 0
  %r633 = add i32 0, 0
  %r634 = add i32 0, 0
  %r635 = add i32 0, 0
  %r636 = add i32 0, 0
  %r637 = add i32 0, 0
  %r638 = add i32 0, 0
  %r639 = add i32 0, 0
  br label %bb50

bb50:
  %r640 = phi i32 [ %r638, %loop3 ], [ %r648, %bb91 ]
  %r641 = phi i32 [ %r639, %loop3 ], [ %r650, %bb91 ]
  %r642 = icmp slt i32 %r641, 10
  br i1 %r642, label %bb51, label %bb52

bb51:
  %r644 = add i32 0, 0
  br label %bb53

bb53:
  %r645 = phi i32 [ %r640, %bb51 ], [ %r656, %bb88 ]
  %r646 = phi i32 [ %r644, %bb51 ], [ %r658, %bb88 ]
  %r647 = icmp slt i32 %r646, 100
  br i1 %r647, label %bb54, label %bb55

bb54:
  %r652 = add i32 0, 0
  br label %bb56

bb56:
  %r653 = phi i32 [ %r645, %bb54 ], [ %r699, %bb85 ]
  %r654 = phi i32 [ %r652, %bb54 ], [ %r701, %bb85 ]
  %r655 = icmp slt i32 %r654, 1000
  br i1 %r655, label %bb57, label %bb58

bb57:
  %r660 = add i32 0, 0
  br label %bb59

bb59:
  %r661 = phi i32 [ %r653, %bb57 ], [ %r668, %bb82 ]
  %r662 = phi i32 [ %r660, %bb57 ], [ %r670, %bb82 ]
  %r663 = icmp slt i32 %r662, 10000
  br i1 %r663, label %bb60, label %bb61

bb60:
  %r664 = add i32 0, 0
  br label %bb62

bb62:
  %r665 = phi i32 [ %r661, %bb60 ], [ %r676, %bb79 ]
  %r666 = phi i32 [ %r664, %bb60 ], [ %r678, %bb79 ]
  %r667 = icmp slt i32 %r666, 100000
  br i1 %r667, label %bb63, label %bb64

bb63:
  %r672 = add i32 0, 0
  br label %bb65

bb65:
  %r673 = phi i32 [ %r672, %bb63 ], [ %r686, %bb76 ]
  %r674 = phi i32 [ %r665, %bb63 ], [ %r684, %bb76 ]
  %r675 = icmp slt i32 %r673, 1000000
  br i1 %r675, label %bb66, label %bb67

bb66:
  %r680 = add i32 0, 0
  br label %bb68

bb68:
  %r681 = phi i32 [ %r674, %bb66 ], [ %r695, %bb73 ]
  %r682 = phi i32 [ %r680, %bb66 ], [ %r697, %bb73 ]
  %r683 = icmp slt i32 %r682, 10000000
  br i1 %r683, label %bb69, label %bb70

bb69:
  %r688 = sdiv i32 %r681, 817
  %r689 = mul i32 %r688, 817
  %r690 = sub i32 %r681, %r689
  %r289 = getelementptr [10 x %my_struct_6 ], [10 x %my_struct_6 ]* @arr1, i32 0, i32 %r641
  %r291 = getelementptr %my_struct_6, %my_struct_6* %r289, i32 0, i32 0
  %r292 = getelementptr [2 x %my_struct_5 ], [2 x %my_struct_5 ]* %r291, i32 0, i32 %r646
  %r294 = getelementptr %my_struct_5, %my_struct_5* %r292, i32 0, i32 0
  %r295 = getelementptr [3 x %my_struct_4 ], [3 x %my_struct_4 ]* %r294, i32 0, i32 %r654
  %r297 = getelementptr %my_struct_4, %my_struct_4* %r295, i32 0, i32 0
  %r298 = getelementptr [4 x %my_struct_3 ], [4 x %my_struct_3 ]* %r297, i32 0, i32 %r662
  %r300 = getelementptr %my_struct_3, %my_struct_3* %r298, i32 0, i32 0
  %r301 = getelementptr [5 x %my_struct_2 ], [5 x %my_struct_2 ]* %r300, i32 0, i32 %r666
  %r303 = getelementptr %my_struct_2, %my_struct_2* %r301, i32 0, i32 0
  %r304 = getelementptr [8 x %my_struct_1 ], [8 x %my_struct_1 ]* %r303, i32 0, i32 %r673
  %r306 = getelementptr %my_struct_1, %my_struct_1* %r304, i32 0, i32 0
  %r307 = getelementptr [7 x i32 ], [7 x i32 ]* %r306, i32 0, i32 %r682
  %r691 = load i32, i32* %r307
  %r692 = add i32 %r690, %r691
  %r311 = getelementptr [10 x %my_struct_6 ], [10 x %my_struct_6 ]* @arr2, i32 0, i32 %r641
  %r313 = getelementptr %my_struct_6, %my_struct_6* %r311, i32 0, i32 0
  %r314 = getelementptr [2 x %my_struct_5 ], [2 x %my_struct_5 ]* %r313, i32 0, i32 %r646
  %r316 = getelementptr %my_struct_5, %my_struct_5* %r314, i32 0, i32 0
  %r317 = getelementptr [3 x %my_struct_4 ], [3 x %my_struct_4 ]* %r316, i32 0, i32 %r654
  %r319 = getelementptr %my_struct_4, %my_struct_4* %r317, i32 0, i32 0
  %r320 = getelementptr [4 x %my_struct_3 ], [4 x %my_struct_3 ]* %r319, i32 0, i32 %r662
  %r322 = getelementptr %my_struct_3, %my_struct_3* %r320, i32 0, i32 0
  %r323 = getelementptr [5 x %my_struct_2 ], [5 x %my_struct_2 ]* %r322, i32 0, i32 %r666
  %r325 = getelementptr %my_struct_2, %my_struct_2* %r323, i32 0, i32 0
  %r326 = getelementptr [8 x %my_struct_1 ], [8 x %my_struct_1 ]* %r325, i32 0, i32 %r673
  %r328 = getelementptr %my_struct_1, %my_struct_1* %r326, i32 0, i32 0
  %r329 = getelementptr [7 x i32 ], [7 x i32 ]* %r328, i32 0, i32 %r682
  %r693 = load i32, i32* %r329
  %r694 = add i32 %r692, %r693
  %r695 = add i32 %r694, 0
  %r696 = add i32 %r682, 1
  %r697 = add i32 %r696, 0
  %r698 = icmp sge i32 %r697, %r629
  br i1 %r698, label %bb71, label %bb72

bb71:
  br label %bb70

bb72:
  br label %bb73

bb73:
  br label %bb68

bb70:
  %r684 = phi i32 [ %r681, %bb68 ], [ %r695, %bb71 ]
  %r685 = add i32 %r673, 1
  %r686 = add i32 %r685, 0
  %r687 = icmp sge i32 %r686, %r627
  br i1 %r687, label %bb74, label %bb75

bb74:
  br label %bb67

bb75:
  br label %bb76

bb76:
  br label %bb65

bb67:
  %r676 = phi i32 [ %r674, %bb65 ], [ %r684, %bb74 ]
  %r677 = add i32 %r666, 1
  %r678 = add i32 %r677, 0
  %r679 = icmp sge i32 %r678, %r625
  br i1 %r679, label %bb77, label %bb78

bb77:
  br label %bb64

bb78:
  br label %bb79

bb79:
  br label %bb62

bb64:
  %r668 = phi i32 [ %r665, %bb62 ], [ %r676, %bb77 ]
  %r669 = add i32 %r662, 1
  %r670 = add i32 %r669, 0
  %r671 = icmp sge i32 %r670, %r623
  br i1 %r671, label %bb80, label %bb81

bb80:
  br label %bb61

bb81:
  br label %bb82

bb82:
  br label %bb59

bb61:
  %r699 = phi i32 [ %r661, %bb59 ], [ %r668, %bb80 ]
  %r700 = add i32 %r654, 1
  %r701 = add i32 %r700, 0
  %r702 = icmp sge i32 %r701, %r621
  br i1 %r702, label %bb83, label %bb84

bb83:
  br label %bb58

bb84:
  br label %bb85

bb85:
  br label %bb56

bb58:
  %r656 = phi i32 [ %r653, %bb56 ], [ %r699, %bb83 ]
  %r657 = add i32 %r646, 1
  %r658 = add i32 %r657, 0
  %r659 = icmp sge i32 %r658, %r619
  br i1 %r659, label %bb86, label %bb87

bb86:
  br label %bb55

bb87:
  br label %bb88

bb88:
  br label %bb53

bb55:
  %r648 = phi i32 [ %r645, %bb53 ], [ %r656, %bb86 ]
  %r649 = add i32 %r641, 1
  %r650 = add i32 %r649, 0
  %r651 = icmp sge i32 %r650, %r617
  br i1 %r651, label %bb89, label %bb90

bb89:
  br label %bb52

bb90:
  br label %bb91

bb91:
  br label %bb50

bb52:
  %r643 = phi i32 [ %r640, %bb50 ], [ %r648, %bb89 ]
  ret i32 %r643
}

define i32 @main( ) {
main:
  call void @_sysy_starttime(i32 97)
  %r730 = call i32 @getint()
  %r731 = add i32 0, 0
  %r732 = add i32 %r730, 0
  %r733 = call i32 @getint()
  %r734 = add i32 0, 0
  %r735 = add i32 %r733, 0
  %r736 = call i32 @getint()
  %r737 = add i32 0, 0
  %r738 = add i32 %r736, 0
  %r739 = call i32 @getint()
  %r740 = add i32 0, 0
  %r741 = add i32 %r739, 0
  %r742 = call i32 @getint()
  %r743 = add i32 0, 0
  %r744 = add i32 %r742, 0
  %r745 = call i32 @getint()
  %r746 = add i32 0, 0
  %r747 = add i32 %r745, 0
  %r748 = call i32 @getint()
  %r749 = add i32 0, 0
  %r750 = add i32 %r748, 0
  %r751 = call i32 @getint()
  %r752 = add i32 0, 0
  %r753 = add i32 %r751, 0
  %r754 = call i32 @getint()
  %r755 = add i32 0, 0
  %r756 = add i32 %r754, 0
  %r757 = call i32 @loop1(i32 %r732, i32 %r735)
  %r758 = call i32 @loop2()
  %r759 = call i32 @loop3(i32 %r738, i32 %r741, i32 %r744, i32 %r747, i32 %r750, i32 %r753, i32 %r756)
  %r760 = add i32 %r759, 0
  call void @_sysy_stoptime(i32 117)
  ret i32 %r760
}

