declare i32 @getch( )
declare i32 @getint( )
declare void @putch( i32 )
declare void @putint( i32 )
declare void @putarray( i32, i32* )
declare void @_sysy_starttime( i32 )
declare void @_sysy_stoptime( i32 )
@n = global i32 0
define i32 @bubblesort( i32* %r100 ) {
bubblesort:
  %r583 = add i32 0, 0
  %r584 = add i32 0, 0
  %r585 = add i32 0, 0
  %r586 = add i32 0, 0
  %r587 = add i32 0, 0
  %r588 = add i32 0, 0
  br label %bb1

bb1:
  %r589 = phi i32 [ %r588, %bubblesort ], [ %r612, %bb6 ]
  %r590 = load i32, i32* @n
  %r591 = sub i32 %r590, 1
  %r592 = icmp slt i32 %r589, %r591
  br i1 %r592, label %bb2, label %bb3

bb2:
  %r593 = add i32 0, 0
  br label %bb4

bb4:
  %r594 = phi i32 [ %r593, %bb2 ], [ %r605, %bb9 ]
  %r595 = load i32, i32* @n
  %r596 = sub i32 %r595, %r589
  %r597 = sub i32 %r596, 1
  %r598 = icmp slt i32 %r594, %r597
  br i1 %r598, label %bb5, label %bb6

bb5:
  %r599 = add i32 %r594, 1
  %r600 = add i32 %r599, 0
  %r118 = getelementptr i32, i32* %r100, i32 %r594
  %r601 = load i32, i32* %r118
  %r121 = getelementptr i32, i32* %r100, i32 %r600
  %r602 = load i32, i32* %r121
  %r603 = icmp sgt i32 %r601, %r602
  br i1 %r603, label %bb7, label %bb8

bb7:
  %r606 = add i32 %r594, 1
  %r607 = add i32 %r606, 0
  %r128 = getelementptr i32, i32* %r100, i32 %r607
  %r608 = load i32, i32* %r128
  %r609 = add i32 %r608, 0
  %r131 = getelementptr i32, i32* %r100, i32 %r607
  %r133 = getelementptr i32, i32* %r100, i32 %r594
  %r610 = load i32, i32* %r133
  %r136 = getelementptr i32, i32* %r100, i32 %r594
  br label %bb9

bb8:
  br label %bb9

bb9:
  %r604 = add i32 %r594, 1
  %r605 = add i32 %r604, 0
  br label %bb4

bb6:
  %r611 = add i32 %r589, 1
  %r612 = add i32 %r611, 0
  br label %bb1

bb3:
  ret i32 0
}

define i32 @insertsort( i32* %r143 ) {
insertsort:
  %r620 = add i32 0, 0
  %r621 = add i32 0, 0
  %r622 = add i32 0, 0
  %r623 = add i32 0, 0
  %r624 = add i32 0, 0
  %r625 = add i32 0, 0
  %r626 = add i32 0, 0
  %r627 = add i32 1, 0
  br label %bb10

bb10:
  %r628 = phi i32 [ %r627, %insertsort ], [ %r655, %bb15 ]
  %r629 = load i32, i32* @n
  %r630 = icmp slt i32 %r628, %r629
  br i1 %r630, label %bb11, label %bb12

bb11:
  %r149 = getelementptr i32, i32* %r143, i32 %r628
  %r631 = load i32, i32* %r149
  %r632 = add i32 %r631, 0
  %r633 = sub i32 %r628, 1
  %r634 = add i32 %r633, 0
  br label %bb13

bb13:
  %r635 = phi i32 [ %r634, %bb11 ], [ %r650, %bb14 ]
  %r636 = icmp sgt i32 %r635, -1
  br i1 %r636, label %bb17, label %bb18

bb17:
  %r637 = add i32 1, 0
  br label %bb19

bb18:
  %r638 = add i32 0, 0
  br label %bb19

bb19:
  %r639 = phi i32 [ %r637, %bb17 ], [ %r638, %bb18 ]
  %r640 = icmp ne i32 %r639, 0
  br i1 %r640, label %bb16, label %bb15

bb16:
  %r163 = getelementptr i32, i32* %r143, i32 %r635
  %r641 = load i32, i32* %r163
  %r642 = icmp slt i32 %r632, %r641
  br i1 %r642, label %bb20, label %bb21

bb20:
  %r651 = add i32 1, 0
  br label %bb22

bb21:
  %r643 = add i32 0, 0
  br label %bb22

bb22:
  %r644 = phi i32 [ %r651, %bb20 ], [ %r643, %bb21 ]
  %r645 = icmp ne i32 %r644, 0
  br i1 %r645, label %bb14, label %bb15

bb14:
  %r646 = add i32 %r635, 1
  %r647 = add i32 %r646, 0
  %r171 = getelementptr i32, i32* %r143, i32 %r647
  %r173 = getelementptr i32, i32* %r143, i32 %r635
  %r648 = load i32, i32* %r173
  %r649 = sub i32 %r635, 1
  %r650 = add i32 %r649, 0
  br label %bb13

bb15:
  %r652 = add i32 %r635, 1
  %r653 = add i32 %r652, 0
  %r181 = getelementptr i32, i32* %r143, i32 %r653
  %r654 = add i32 %r628, 1
  %r655 = add i32 %r654, 0
  br label %bb10

bb12:
  ret i32 0
}

define i32 @QuickSort( i32* %r186, i32 %r187, i32 %r189 ) {
QuickSort:
  %r666 = add i32 0, 0
  %r667 = add i32 0, 0
  %r668 = add i32 0, 0
  %r669 = add i32 0, 0
  %r670 = add i32 0, 0
  %r671 = add i32 0, 0
  %r672 = add i32 0, 0
  %r673 = add i32 0, 0
  %r674 = add i32 0, 0
  %r675 = add i32 %r187, 0
  %r676 = add i32 0, 0
  %r677 = add i32 %r189, 0
  %r678 = icmp slt i32 %r675, %r677
  br i1 %r678, label %bb23, label %bb24

bb23:
  %r679 = add i32 %r675, 0
  %r680 = add i32 %r677, 0
  %r200 = getelementptr i32, i32* %r186, i32 %r675
  %r681 = load i32, i32* %r200
  %r682 = add i32 %r681, 0
  br label %bb26

bb26:
  %r683 = phi i32 [ %r679, %bb23 ], [ %r692, %bb54 ]
  %r684 = phi i32 [ %r680, %bb23 ], [ %r700, %bb54 ]
  %r685 = icmp slt i32 %r683, %r684
  br i1 %r685, label %bb27, label %bb28

bb27:
  br label %bb29

bb29:
  %r686 = phi i32 [ %r684, %bb27 ], [ %r720, %bb30 ]
  %r687 = icmp slt i32 %r683, %r686
  br i1 %r687, label %bb33, label %bb34

bb33:
  %r724 = add i32 1, 0
  br label %bb35

bb34:
  %r723 = add i32 0, 0
  br label %bb35

bb35:
  %r688 = phi i32 [ %r724, %bb33 ], [ %r723, %bb34 ]
  %r689 = icmp ne i32 %r688, 0
  br i1 %r689, label %bb32, label %bb31

bb32:
  %r214 = getelementptr i32, i32* %r186, i32 %r686
  %r714 = load i32, i32* %r214
  %r715 = sub i32 %r682, 1
  %r716 = icmp sgt i32 %r714, %r715
  br i1 %r716, label %bb36, label %bb37

bb36:
  %r721 = add i32 1, 0
  br label %bb38

bb37:
  %r722 = add i32 0, 0
  br label %bb38

bb38:
  %r717 = phi i32 [ %r721, %bb36 ], [ %r722, %bb37 ]
  %r718 = icmp ne i32 %r717, 0
  br i1 %r718, label %bb30, label %bb31

bb30:
  %r719 = sub i32 %r686, 1
  %r720 = add i32 %r719, 0
  br label %bb29

bb31:
  %r690 = icmp slt i32 %r683, %r686
  br i1 %r690, label %bb39, label %bb40

bb39:
  %r227 = getelementptr i32, i32* %r186, i32 %r683
  %r229 = getelementptr i32, i32* %r186, i32 %r686
  %r711 = load i32, i32* %r229
  %r712 = add i32 %r683, 1
  %r713 = add i32 %r712, 0
  br label %bb41

bb40:
  br label %bb41

bb41:
  %r691 = phi i32 [ %r713, %bb39 ], [ %r683, %bb40 ]
  br label %bb42

bb42:
  %r692 = phi i32 [ %r691, %bb41 ], [ %r706, %bb43 ]
  %r693 = icmp slt i32 %r692, %r686
  br i1 %r693, label %bb46, label %bb47

bb46:
  %r709 = add i32 1, 0
  br label %bb48

bb47:
  %r710 = add i32 0, 0
  br label %bb48

bb48:
  %r694 = phi i32 [ %r709, %bb46 ], [ %r710, %bb47 ]
  %r695 = icmp ne i32 %r694, 0
  br i1 %r695, label %bb45, label %bb44

bb45:
  %r242 = getelementptr i32, i32* %r186, i32 %r692
  %r701 = load i32, i32* %r242
  %r702 = icmp slt i32 %r701, %r682
  br i1 %r702, label %bb49, label %bb50

bb49:
  %r707 = add i32 1, 0
  br label %bb51

bb50:
  %r708 = add i32 0, 0
  br label %bb51

bb51:
  %r703 = phi i32 [ %r707, %bb49 ], [ %r708, %bb50 ]
  %r704 = icmp ne i32 %r703, 0
  br i1 %r704, label %bb43, label %bb44

bb43:
  %r705 = add i32 %r692, 1
  %r706 = add i32 %r705, 0
  br label %bb42

bb44:
  %r696 = icmp slt i32 %r692, %r686
  br i1 %r696, label %bb52, label %bb53

bb52:
  %r254 = getelementptr i32, i32* %r186, i32 %r686
  %r256 = getelementptr i32, i32* %r186, i32 %r692
  %r697 = load i32, i32* %r256
  %r698 = sub i32 %r686, 1
  %r699 = add i32 %r698, 0
  br label %bb54

bb53:
  br label %bb54

bb54:
  %r700 = phi i32 [ %r699, %bb52 ], [ %r686, %bb53 ]
  br label %bb26

bb28:
  %r261 = getelementptr i32, i32* %r186, i32 %r683
  %r725 = sub i32 %r683, 1
  %r726 = add i32 %r725, 0
  %r727 = call i32 @QuickSort(i32* %r186, i32 %r675, i32 %r726)
  %r728 = add i32 %r727, 0
  %r729 = add i32 %r683, 1
  %r730 = add i32 %r729, 0
  %r731 = call i32 @QuickSort(i32* %r186, i32 %r730, i32 %r677)
  %r732 = add i32 %r731, 0
  br label %bb25

bb24:
  br label %bb25

bb25:
  ret i32 0
}

define i32 @getMid( i32* %r275 ) {
getMid:
  %r735 = add i32 0, 0
  %r736 = add i32 0, 0
  %r737 = load i32, i32* @n
  %r738 = sdiv i32 %r737, 2
  %r739 = mul i32 %r738, 2
  %r740 = load i32, i32* @n
  %r741 = icmp eq i32 %r739, %r740
  br i1 %r741, label %bb55, label %bb56

bb55:
  %r742 = load i32, i32* @n
  %r743 = sdiv i32 %r742, 2
  %r744 = add i32 %r743, 0
  %r745 = sub i32 %r744, 1
  %r746 = add i32 %r745, 0
  %r288 = getelementptr i32, i32* %r275, i32 %r744
  %r747 = load i32, i32* %r288
  %r291 = getelementptr i32, i32* %r275, i32 %r746
  %r748 = load i32, i32* %r291
  %r749 = add i32 %r747, %r748
  %r750 = sdiv i32 %r749, 2
  ret i32 %r750
bb56:
  %r751 = load i32, i32* @n
  %r752 = sdiv i32 %r751, 2
  %r753 = add i32 %r752, 0
  %r298 = getelementptr i32, i32* %r275, i32 %r753
  %r754 = load i32, i32* %r298
  ret i32 %r754
}

define i32 @getMost( i32* %r301 ) {
getMost:
  %r759 = add i32 0, 0
  %r760 = add i32 0, 0
  %r761 = add i32 0, 0
  %r302 = alloca [ 1000 x i32 ]
  %r762 = add i32 0, 0
  %r763 = add i32 0, 0
  br label %bb58

bb58:
  %r764 = phi i32 [ %r763, %getMost ], [ %r767, %bb59 ]
  %r765 = icmp slt i32 %r764, 1000
  br i1 %r765, label %bb59, label %bb60

bb59:
  %r306 = getelementptr [1000 x i32 ], [1000 x i32 ]* %r302, i32 0, i32 %r764
  %r766 = add i32 %r764, 1
  %r767 = add i32 %r766, 0
  br label %bb58

bb60:
  %r768 = add i32 0, 0
  %r769 = add i32 0, 0
  br label %bb61

bb61:
  %r770 = phi i32 [ %r760, %bb60 ], [ %r784, %bb66 ]
  %r771 = phi i32 [ %r768, %bb60 ], [ %r787, %bb66 ]
  %r772 = phi i32 [ %r769, %bb60 ], [ %r785, %bb66 ]
  %r773 = load i32, i32* @n
  %r774 = icmp slt i32 %r771, %r773
  br i1 %r774, label %bb62, label %bb63

bb62:
  %r316 = getelementptr i32, i32* %r301, i32 %r771
  %r775 = load i32, i32* %r316
  %r776 = add i32 %r775, 0
  %r319 = getelementptr [1000 x i32 ], [1000 x i32 ]* %r302, i32 0, i32 %r776
  %r321 = getelementptr [1000 x i32 ], [1000 x i32 ]* %r302, i32 0, i32 %r776
  %r777 = load i32, i32* %r321
  %r778 = add i32 %r777, 1
  %r327 = getelementptr [1000 x i32 ], [1000 x i32 ]* %r302, i32 0, i32 %r776
  %r779 = load i32, i32* %r327
  %r780 = icmp sgt i32 %r779, %r772
  br i1 %r780, label %bb64, label %bb65

bb64:
  %r331 = getelementptr [1000 x i32 ], [1000 x i32 ]* %r302, i32 0, i32 %r776
  %r781 = load i32, i32* %r331
  %r782 = add i32 %r781, 0
  %r783 = add i32 %r776, 0
  br label %bb66

bb65:
  br label %bb66

bb66:
  %r784 = phi i32 [ %r783, %bb64 ], [ %r770, %bb65 ]
  %r785 = phi i32 [ %r782, %bb64 ], [ %r772, %bb65 ]
  %r786 = add i32 %r771, 1
  %r787 = add i32 %r786, 0
  br label %bb61

bb63:
  ret i32 %r770
}

define i32 @revert( i32* %r338 ) {
revert:
  %r791 = add i32 0, 0
  %r792 = add i32 0, 0
  %r793 = add i32 0, 0
  %r794 = add i32 0, 0
  %r795 = add i32 0, 0
  br label %bb67

bb67:
  %r796 = phi i32 [ %r794, %revert ], [ %r803, %bb68 ]
  %r797 = phi i32 [ %r795, %revert ], [ %r805, %bb68 ]
  %r798 = icmp slt i32 %r796, %r797
  br i1 %r798, label %bb68, label %bb69

bb68:
  %r345 = getelementptr i32, i32* %r338, i32 %r796
  %r799 = load i32, i32* %r345
  %r800 = add i32 %r799, 0
  %r348 = getelementptr i32, i32* %r338, i32 %r796
  %r350 = getelementptr i32, i32* %r338, i32 %r797
  %r801 = load i32, i32* %r350
  %r353 = getelementptr i32, i32* %r338, i32 %r797
  %r802 = add i32 %r796, 1
  %r803 = add i32 %r802, 0
  %r804 = sub i32 %r797, 1
  %r805 = add i32 %r804, 0
  br label %bb67

bb69:
  ret i32 0
}

define i32 @arrCopy( i32* %r360, i32* %r361 ) {
arrCopy:
  %r807 = add i32 0, 0
  %r808 = add i32 0, 0
  br label %bb70

bb70:
  %r809 = phi i32 [ %r808, %arrCopy ], [ %r814, %bb71 ]
  %r810 = load i32, i32* @n
  %r811 = icmp slt i32 %r809, %r810
  br i1 %r811, label %bb71, label %bb72

bb71:
  %r366 = getelementptr i32, i32* %r361, i32 %r809
  %r368 = getelementptr i32, i32* %r360, i32 %r809
  %r812 = load i32, i32* %r368
  %r813 = add i32 %r809, 1
  %r814 = add i32 %r813, 0
  br label %bb70

bb72:
  ret i32 0
}

define i32 @calSum( i32* %r373, i32 %r374 ) {
calSum:
  %r818 = add i32 0, 0
  %r819 = add i32 %r374, 0
  %r820 = add i32 0, 0
  %r821 = add i32 0, 0
  %r822 = add i32 0, 0
  %r823 = add i32 0, 0
  br label %bb73

bb73:
  %r824 = phi i32 [ %r823, %calSum ], [ %r838, %bb78 ]
  %r825 = phi i32 [ %r821, %calSum ], [ %r836, %bb78 ]
  %r826 = load i32, i32* @n
  %r827 = icmp slt i32 %r824, %r826
  br i1 %r827, label %bb74, label %bb75

bb74:
  %r382 = getelementptr i32, i32* %r373, i32 %r824
  %r828 = load i32, i32* %r382
  %r829 = add i32 %r825, %r828
  %r830 = add i32 %r829, 0
  %r831 = sdiv i32 %r824, %r819
  %r832 = mul i32 %r831, %r819
  %r833 = sub i32 %r824, %r832
  %r834 = sub i32 %r819, 1
  %r835 = icmp ne i32 %r833, %r834
  br i1 %r835, label %bb76, label %bb77

bb76:
  %r397 = getelementptr i32, i32* %r373, i32 %r824
  br label %bb78

bb77:
  %r399 = getelementptr i32, i32* %r373, i32 %r824
  %r839 = add i32 0, 0
  br label %bb78

bb78:
  %r836 = phi i32 [ %r830, %bb76 ], [ %r839, %bb77 ]
  %r837 = add i32 %r824, 1
  %r838 = add i32 %r837, 0
  br label %bb73

bb75:
  ret i32 0
}

define i32 @avgPooling( i32* %r404, i32 %r405 ) {
avgPooling:
  %r845 = add i32 0, 0
  %r846 = add i32 0, 0
  %r847 = add i32 %r405, 0
  %r848 = add i32 0, 0
  %r849 = add i32 0, 0
  %r850 = add i32 0, 0
  %r851 = add i32 0, 0
  %r852 = add i32 0, 0
  br label %bb79

bb79:
  %r853 = phi i32 [ %r850, %avgPooling ], [ %r863, %bb84 ]
  %r854 = phi i32 [ %r851, %avgPooling ], [ %r860, %bb84 ]
  %r855 = phi i32 [ %r852, %avgPooling ], [ %r861, %bb84 ]
  %r856 = load i32, i32* @n
  %r857 = icmp slt i32 %r853, %r856
  br i1 %r857, label %bb80, label %bb81

bb80:
  %r858 = sub i32 %r847, 1
  %r859 = icmp slt i32 %r853, %r858
  br i1 %r859, label %bb82, label %bb83

bb82:
  %r419 = getelementptr i32, i32* %r404, i32 %r853
  %r881 = load i32, i32* %r419
  %r882 = add i32 %r854, %r881
  %r883 = add i32 %r882, 0
  br label %bb84

bb83:
  %r864 = sub i32 %r847, 1
  %r865 = icmp eq i32 %r853, %r864
  br i1 %r865, label %bb85, label %bb86

bb85:
  %r428 = getelementptr i32, i32* %r404, i32 0
  %r878 = load i32, i32* %r428
  %r879 = add i32 %r878, 0
  %r430 = getelementptr i32, i32* %r404, i32 0
  %r880 = sdiv i32 %r854, %r847
  br label %bb87

bb86:
  %r435 = getelementptr i32, i32* %r404, i32 %r853
  %r866 = load i32, i32* %r435
  %r867 = add i32 %r854, %r866
  %r868 = sub i32 %r867, %r855
  %r869 = add i32 %r868, 0
  %r870 = sub i32 %r853, %r847
  %r871 = add i32 %r870, 1
  %r872 = add i32 %r871, 0
  %r446 = getelementptr i32, i32* %r404, i32 %r872
  %r873 = load i32, i32* %r446
  %r874 = add i32 %r873, 0
  %r449 = getelementptr i32, i32* %r404, i32 %r872
  %r875 = sdiv i32 %r869, %r847
  br label %bb87

bb87:
  %r876 = phi i32 [ %r854, %bb85 ], [ %r869, %bb86 ]
  %r877 = phi i32 [ %r879, %bb85 ], [ %r874, %bb86 ]
  br label %bb84

bb84:
  %r860 = phi i32 [ %r883, %bb82 ], [ %r876, %bb87 ]
  %r861 = phi i32 [ %r855, %bb82 ], [ %r877, %bb87 ]
  %r862 = add i32 %r853, 1
  %r863 = add i32 %r862, 0
  br label %bb79

bb81:
  %r884 = load i32, i32* @n
  %r885 = sub i32 %r884, %r847
  %r886 = add i32 %r885, 1
  %r887 = add i32 %r886, 0
  br label %bb88

bb88:
  %r888 = phi i32 [ %r887, %bb81 ], [ %r892, %bb89 ]
  %r889 = load i32, i32* @n
  %r890 = icmp slt i32 %r888, %r889
  br i1 %r890, label %bb89, label %bb90

bb89:
  %r463 = getelementptr i32, i32* %r404, i32 %r888
  %r891 = add i32 %r888, 1
  %r892 = add i32 %r891, 0
  br label %bb88

bb90:
  ret i32 0
}

define i32 @main( ) {
main:
  call void @_sysy_starttime(i32 209)
  store i32 32, i32* @n
  %r467 = alloca [ 32 x i32 ]
  %r468 = alloca [ 32 x i32 ]
  %r469 = getelementptr [32 x i32 ], [32 x i32 ]* %r467, i32 0, i32 0
  %r470 = getelementptr [32 x i32 ], [32 x i32 ]* %r467, i32 0, i32 1
  %r471 = getelementptr [32 x i32 ], [32 x i32 ]* %r467, i32 0, i32 2
  %r472 = getelementptr [32 x i32 ], [32 x i32 ]* %r467, i32 0, i32 3
  %r473 = getelementptr [32 x i32 ], [32 x i32 ]* %r467, i32 0, i32 4
  %r474 = getelementptr [32 x i32 ], [32 x i32 ]* %r467, i32 0, i32 5
  %r475 = getelementptr [32 x i32 ], [32 x i32 ]* %r467, i32 0, i32 6
  %r476 = getelementptr [32 x i32 ], [32 x i32 ]* %r467, i32 0, i32 7
  %r477 = getelementptr [32 x i32 ], [32 x i32 ]* %r467, i32 0, i32 8
  %r478 = getelementptr [32 x i32 ], [32 x i32 ]* %r467, i32 0, i32 9
  %r479 = getelementptr [32 x i32 ], [32 x i32 ]* %r467, i32 0, i32 10
  %r480 = getelementptr [32 x i32 ], [32 x i32 ]* %r467, i32 0, i32 11
  %r481 = getelementptr [32 x i32 ], [32 x i32 ]* %r467, i32 0, i32 12
  %r482 = getelementptr [32 x i32 ], [32 x i32 ]* %r467, i32 0, i32 13
  %r483 = getelementptr [32 x i32 ], [32 x i32 ]* %r467, i32 0, i32 14
  %r484 = getelementptr [32 x i32 ], [32 x i32 ]* %r467, i32 0, i32 15
  %r485 = getelementptr [32 x i32 ], [32 x i32 ]* %r467, i32 0, i32 16
  %r486 = getelementptr [32 x i32 ], [32 x i32 ]* %r467, i32 0, i32 17
  %r487 = getelementptr [32 x i32 ], [32 x i32 ]* %r467, i32 0, i32 18
  %r488 = getelementptr [32 x i32 ], [32 x i32 ]* %r467, i32 0, i32 19
  %r489 = getelementptr [32 x i32 ], [32 x i32 ]* %r467, i32 0, i32 20
  %r490 = getelementptr [32 x i32 ], [32 x i32 ]* %r467, i32 0, i32 21
  %r491 = getelementptr [32 x i32 ], [32 x i32 ]* %r467, i32 0, i32 22
  %r492 = getelementptr [32 x i32 ], [32 x i32 ]* %r467, i32 0, i32 23
  %r493 = getelementptr [32 x i32 ], [32 x i32 ]* %r467, i32 0, i32 24
  %r494 = getelementptr [32 x i32 ], [32 x i32 ]* %r467, i32 0, i32 25
  %r495 = getelementptr [32 x i32 ], [32 x i32 ]* %r467, i32 0, i32 26
  %r496 = getelementptr [32 x i32 ], [32 x i32 ]* %r467, i32 0, i32 27
  %r497 = getelementptr [32 x i32 ], [32 x i32 ]* %r467, i32 0, i32 28
  %r498 = getelementptr [32 x i32 ], [32 x i32 ]* %r467, i32 0, i32 29
  %r499 = getelementptr [32 x i32 ], [32 x i32 ]* %r467, i32 0, i32 30
  %r500 = getelementptr [32 x i32 ], [32 x i32 ]* %r467, i32 0, i32 31
  %r895 = add i32 0, 0
  %r896 = call i32 @arrCopy(i32* %r467, i32* %r468)
  %r897 = add i32 %r896, 0
  %r898 = call i32 @revert(i32* %r468)
  %r899 = add i32 %r898, 0
  %r900 = add i32 0, 0
  %r901 = add i32 0, 0
  br label %bb91

bb91:
  %r902 = phi i32 [ %r901, %main ], [ %r907, %bb92 ]
  %r903 = icmp slt i32 %r902, 32
  br i1 %r903, label %bb92, label %bb93

bb92:
  %r507 = getelementptr [32 x i32 ], [32 x i32 ]* %r468, i32 0, i32 %r902
  %r904 = load i32, i32* %r507
  %r905 = add i32 %r904, 0
  call void @putint(i32 %r905)
  %r906 = add i32 %r902, 1
  %r907 = add i32 %r906, 0
  br label %bb91

bb93:
  %r908 = call i32 @bubblesort(i32* %r468)
  %r909 = add i32 %r908, 0
  %r910 = add i32 0, 0
  br label %bb94

bb94:
  %r911 = phi i32 [ %r910, %bb93 ], [ %r916, %bb95 ]
  %r912 = icmp slt i32 %r911, 32
  br i1 %r912, label %bb95, label %bb96

bb95:
  %r516 = getelementptr [32 x i32 ], [32 x i32 ]* %r468, i32 0, i32 %r911
  %r913 = load i32, i32* %r516
  %r914 = add i32 %r913, 0
  call void @putint(i32 %r914)
  %r915 = add i32 %r911, 1
  %r916 = add i32 %r915, 0
  br label %bb94

bb96:
  %r917 = call i32 @getMid(i32* %r468)
  %r918 = add i32 %r917, 0
  call void @putint(i32 %r918)
  %r919 = call i32 @getMost(i32* %r468)
  %r920 = add i32 %r919, 0
  call void @putint(i32 %r920)
  %r921 = call i32 @arrCopy(i32* %r467, i32* %r468)
  %r922 = add i32 %r921, 0
  %r923 = call i32 @bubblesort(i32* %r468)
  %r924 = add i32 %r923, 0
  %r925 = add i32 0, 0
  br label %bb97

bb97:
  %r926 = phi i32 [ %r925, %bb96 ], [ %r931, %bb98 ]
  %r927 = icmp slt i32 %r926, 32
  br i1 %r927, label %bb98, label %bb99

bb98:
  %r530 = getelementptr [32 x i32 ], [32 x i32 ]* %r468, i32 0, i32 %r926
  %r928 = load i32, i32* %r530
  %r929 = add i32 %r928, 0
  call void @putint(i32 %r929)
  %r930 = add i32 %r926, 1
  %r931 = add i32 %r930, 0
  br label %bb97

bb99:
  %r932 = call i32 @arrCopy(i32* %r467, i32* %r468)
  %r933 = add i32 %r932, 0
  %r934 = call i32 @insertsort(i32* %r468)
  %r935 = add i32 %r934, 0
  %r936 = add i32 0, 0
  br label %bb100

bb100:
  %r937 = phi i32 [ %r936, %bb99 ], [ %r942, %bb101 ]
  %r938 = icmp slt i32 %r937, 32
  br i1 %r938, label %bb101, label %bb102

bb101:
  %r540 = getelementptr [32 x i32 ], [32 x i32 ]* %r468, i32 0, i32 %r937
  %r939 = load i32, i32* %r540
  %r940 = add i32 %r939, 0
  call void @putint(i32 %r940)
  %r941 = add i32 %r937, 1
  %r942 = add i32 %r941, 0
  br label %bb100

bb102:
  %r943 = call i32 @arrCopy(i32* %r467, i32* %r468)
  %r944 = add i32 %r943, 0
  %r945 = add i32 0, 0
  %r946 = add i32 31, 0
  %r947 = call i32 @QuickSort(i32* %r468, i32 %r945, i32 %r946)
  %r948 = add i32 %r947, 0
  br label %bb103

bb103:
  %r949 = phi i32 [ %r945, %bb102 ], [ %r976, %bb104 ]
  %r950 = icmp slt i32 %r949, 32
  br i1 %r950, label %bb104, label %bb105

bb104:
  %r552 = getelementptr [32 x i32 ], [32 x i32 ]* %r468, i32 0, i32 %r949
  %r973 = load i32, i32* %r552
  %r974 = add i32 %r973, 0
  call void @putint(i32 %r974)
  %r975 = add i32 %r949, 1
  %r976 = add i32 %r975, 0
  br label %bb103

bb105:
  %r951 = call i32 @arrCopy(i32* %r467, i32* %r468)
  %r952 = add i32 %r951, 0
  %r953 = call i32 @calSum(i32* %r468, i32 4)
  %r954 = add i32 %r953, 0
  %r955 = add i32 0, 0
  br label %bb106

bb106:
  %r956 = phi i32 [ %r955, %bb105 ], [ %r972, %bb107 ]
  %r957 = icmp slt i32 %r956, 32
  br i1 %r957, label %bb107, label %bb108

bb107:
  %r562 = getelementptr [32 x i32 ], [32 x i32 ]* %r468, i32 0, i32 %r956
  %r969 = load i32, i32* %r562
  %r970 = add i32 %r969, 0
  call void @putint(i32 %r970)
  %r971 = add i32 %r956, 1
  %r972 = add i32 %r971, 0
  br label %bb106

bb108:
  %r958 = call i32 @arrCopy(i32* %r467, i32* %r468)
  %r959 = add i32 %r958, 0
  %r960 = call i32 @avgPooling(i32* %r468, i32 3)
  %r961 = add i32 %r960, 0
  %r962 = add i32 0, 0
  br label %bb109

bb109:
  %r963 = phi i32 [ %r962, %bb108 ], [ %r968, %bb110 ]
  %r964 = icmp slt i32 %r963, 32
  br i1 %r964, label %bb110, label %bb111

bb110:
  %r572 = getelementptr [32 x i32 ], [32 x i32 ]* %r468, i32 0, i32 %r963
  %r965 = load i32, i32* %r572
  %r966 = add i32 %r965, 0
  call void @putint(i32 %r966)
  %r967 = add i32 %r963, 1
  %r968 = add i32 %r967, 0
  br label %bb109

bb111:
  call void @_sysy_stoptime(i32 312)
  ret i32 0
}

