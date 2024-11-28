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
  %r593 = add i32 0, 0
  %r594 = add i32 0, 0
  %r595 = add i32 0, 0
  %r596 = add i32 0, 0
  %r597 = add i32 0, 0
  %r598 = add i32 0, 0
  br label %bb1

bb1:
  %r599 = phi i32 [ %r598, %bubblesort ], [ %r610, %bb6 ]
  %r600 = load i32, i32* @n
  %r601 = sub i32 %r600, 1
  %r602 = icmp slt i32 %r599, %r601
  br i1 %r602, label %bb2, label %bb3

bb2:
  %r603 = add i32 0, 0
  br label %bb4

bb4:
  %r604 = phi i32 [ %r603, %bb2 ], [ %r617, %bb9 ]
  %r605 = load i32, i32* @n
  %r606 = sub i32 %r605, %r599
  %r607 = sub i32 %r606, 1
  %r608 = icmp slt i32 %r604, %r607
  br i1 %r608, label %bb5, label %bb6

bb5:
  %r611 = add i32 %r604, 1
  %r612 = add i32 %r611, 0
  %r118 = getelementptr i32, i32* %r100, i32 %r604
  %r613 = load i32, i32* %r118
  %r121 = getelementptr i32, i32* %r100, i32 %r612
  %r614 = load i32, i32* %r121
  %r615 = icmp sgt i32 %r613, %r614
  br i1 %r615, label %bb7, label %bb8

bb7:
  %r618 = add i32 %r604, 1
  %r619 = add i32 %r618, 0
  %r128 = getelementptr i32, i32* %r100, i32 %r619
  %r620 = load i32, i32* %r128
  %r621 = add i32 %r620, 0
  %r131 = getelementptr i32, i32* %r100, i32 %r619
  %r133 = getelementptr i32, i32* %r100, i32 %r604
  %r622 = load i32, i32* %r133
  store i32 %r622, i32* %r131
  %r136 = getelementptr i32, i32* %r100, i32 %r604
  store i32 %r621, i32* %r136
  br label %bb9

bb8:
  br label %bb9

bb9:
  %r616 = add i32 %r604, 1
  %r617 = add i32 %r616, 0
  br label %bb4

bb6:
  %r609 = add i32 %r599, 1
  %r610 = add i32 %r609, 0
  br label %bb1

bb3:
  ret i32 0
}

define i32 @insertsort( i32* %r143 ) {
insertsort:
  %r644 = add i32 0, 0
  %r645 = add i32 0, 0
  %r646 = add i32 0, 0
  %r647 = add i32 0, 0
  %r648 = add i32 0, 0
  %r649 = add i32 0, 0
  %r650 = add i32 0, 0
  %r651 = add i32 1, 0
  br label %bb10

bb10:
  %r652 = phi i32 [ %r651, %insertsort ], [ %r677, %bb15 ]
  %r653 = load i32, i32* @n
  %r654 = icmp slt i32 %r652, %r653
  br i1 %r654, label %bb11, label %bb12

bb11:
  %r149 = getelementptr i32, i32* %r143, i32 %r652
  %r655 = load i32, i32* %r149
  %r656 = add i32 %r655, 0
  %r657 = sub i32 %r652, 1
  %r658 = add i32 %r657, 0
  br label %bb13

bb13:
  %r659 = phi i32 [ %r658, %bb11 ], [ %r673, %bb14 ]
  %r660 = icmp sgt i32 %r659, -1
  br i1 %r660, label %bb17, label %bb18

bb17:
  %r678 = add i32 1, 0
  br label %bb19

bb18:
  %r679 = add i32 0, 0
  br label %bb19

bb19:
  %r661 = phi i32 [ %r678, %bb17 ], [ %r679, %bb18 ]
  %r662 = icmp ne i32 %r661, 0
  br i1 %r662, label %bb16, label %bb15

bb16:
  %r163 = getelementptr i32, i32* %r143, i32 %r659
  %r663 = load i32, i32* %r163
  %r664 = icmp slt i32 %r656, %r663
  br i1 %r664, label %bb20, label %bb21

bb20:
  %r665 = add i32 1, 0
  br label %bb22

bb21:
  %r666 = add i32 0, 0
  br label %bb22

bb22:
  %r667 = phi i32 [ %r665, %bb20 ], [ %r666, %bb21 ]
  %r668 = icmp ne i32 %r667, 0
  br i1 %r668, label %bb14, label %bb15

bb14:
  %r669 = add i32 %r659, 1
  %r670 = add i32 %r669, 0
  %r171 = getelementptr i32, i32* %r143, i32 %r670
  %r173 = getelementptr i32, i32* %r143, i32 %r659
  %r671 = load i32, i32* %r173
  store i32 %r671, i32* %r171
  %r672 = sub i32 %r659, 1
  %r673 = add i32 %r672, 0
  br label %bb13

bb15:
  %r674 = add i32 %r659, 1
  %r675 = add i32 %r674, 0
  %r181 = getelementptr i32, i32* %r143, i32 %r675
  store i32 %r656, i32* %r181
  %r676 = add i32 %r652, 1
  %r677 = add i32 %r676, 0
  br label %bb10

bb12:
  ret i32 0
}

define i32 @QuickSort( i32* %r186, i32 %r187, i32 %r189 ) {
QuickSort:
  %r710 = add i32 0, 0
  %r711 = add i32 0, 0
  %r712 = add i32 0, 0
  %r713 = add i32 0, 0
  %r714 = add i32 0, 0
  %r715 = add i32 0, 0
  %r716 = add i32 0, 0
  %r717 = add i32 0, 0
  %r718 = add i32 0, 0
  %r719 = add i32 %r187, 0
  %r720 = add i32 0, 0
  %r721 = add i32 %r189, 0
  %r722 = icmp slt i32 %r719, %r721
  br i1 %r722, label %bb23, label %bb24

bb23:
  %r723 = add i32 %r719, 0
  %r724 = add i32 %r721, 0
  %r200 = getelementptr i32, i32* %r186, i32 %r719
  %r725 = load i32, i32* %r200
  %r726 = add i32 %r725, 0
  br label %bb26

bb26:
  %r727 = phi i32 [ %r724, %bb23 ], [ %r755, %bb54 ]
  %r728 = phi i32 [ %r723, %bb23 ], [ %r748, %bb54 ]
  %r729 = icmp slt i32 %r728, %r727
  br i1 %r729, label %bb27, label %bb28

bb27:
  br label %bb29

bb29:
  %r730 = phi i32 [ %r727, %bb27 ], [ %r741, %bb30 ]
  %r731 = icmp slt i32 %r728, %r730
  br i1 %r731, label %bb33, label %bb34

bb33:
  %r767 = add i32 1, 0
  br label %bb35

bb34:
  %r768 = add i32 0, 0
  br label %bb35

bb35:
  %r732 = phi i32 [ %r767, %bb33 ], [ %r768, %bb34 ]
  %r733 = icmp ne i32 %r732, 0
  br i1 %r733, label %bb32, label %bb31

bb32:
  %r214 = getelementptr i32, i32* %r186, i32 %r730
  %r734 = load i32, i32* %r214
  %r735 = sub i32 %r726, 1
  %r736 = icmp sgt i32 %r734, %r735
  br i1 %r736, label %bb36, label %bb37

bb36:
  %r742 = add i32 1, 0
  br label %bb38

bb37:
  %r737 = add i32 0, 0
  br label %bb38

bb38:
  %r738 = phi i32 [ %r742, %bb36 ], [ %r737, %bb37 ]
  %r739 = icmp ne i32 %r738, 0
  br i1 %r739, label %bb30, label %bb31

bb30:
  %r740 = sub i32 %r730, 1
  %r741 = add i32 %r740, 0
  br label %bb29

bb31:
  %r743 = icmp slt i32 %r728, %r730
  br i1 %r743, label %bb39, label %bb40

bb39:
  %r227 = getelementptr i32, i32* %r186, i32 %r728
  %r229 = getelementptr i32, i32* %r186, i32 %r730
  %r744 = load i32, i32* %r229
  store i32 %r744, i32* %r227
  %r745 = add i32 %r728, 1
  %r746 = add i32 %r745, 0
  br label %bb41

bb40:
  br label %bb41

bb41:
  %r747 = phi i32 [ %r746, %bb39 ], [ %r728, %bb40 ]
  br label %bb42

bb42:
  %r748 = phi i32 [ %r747, %bb41 ], [ %r766, %bb43 ]
  %r749 = icmp slt i32 %r748, %r730
  br i1 %r749, label %bb46, label %bb47

bb46:
  %r751 = add i32 1, 0
  br label %bb48

bb47:
  %r750 = add i32 0, 0
  br label %bb48

bb48:
  %r752 = phi i32 [ %r751, %bb46 ], [ %r750, %bb47 ]
  %r753 = icmp ne i32 %r752, 0
  br i1 %r753, label %bb45, label %bb44

bb45:
  %r242 = getelementptr i32, i32* %r186, i32 %r748
  %r759 = load i32, i32* %r242
  %r760 = icmp slt i32 %r759, %r726
  br i1 %r760, label %bb49, label %bb50

bb49:
  %r762 = add i32 1, 0
  br label %bb51

bb50:
  %r761 = add i32 0, 0
  br label %bb51

bb51:
  %r763 = phi i32 [ %r762, %bb49 ], [ %r761, %bb50 ]
  %r764 = icmp ne i32 %r763, 0
  br i1 %r764, label %bb43, label %bb44

bb43:
  %r765 = add i32 %r748, 1
  %r766 = add i32 %r765, 0
  br label %bb42

bb44:
  %r754 = icmp slt i32 %r748, %r730
  br i1 %r754, label %bb52, label %bb53

bb52:
  %r254 = getelementptr i32, i32* %r186, i32 %r730
  %r256 = getelementptr i32, i32* %r186, i32 %r748
  %r756 = load i32, i32* %r256
  store i32 %r756, i32* %r254
  %r757 = sub i32 %r730, 1
  %r758 = add i32 %r757, 0
  br label %bb54

bb53:
  br label %bb54

bb54:
  %r755 = phi i32 [ %r758, %bb52 ], [ %r730, %bb53 ]
  br label %bb26

bb28:
  %r261 = getelementptr i32, i32* %r186, i32 %r728
  store i32 %r726, i32* %r261
  %r769 = sub i32 %r728, 1
  %r770 = add i32 %r769, 0
  %r771 = call i32 @QuickSort(i32* %r186, i32 %r719, i32 %r770)
  %r772 = add i32 %r771, 0
  %r773 = add i32 %r728, 1
  %r774 = add i32 %r773, 0
  %r775 = call i32 @QuickSort(i32* %r186, i32 %r774, i32 %r721)
  %r776 = add i32 %r775, 0
  br label %bb25

bb24:
  br label %bb25

bb25:
  ret i32 0
}

define i32 @getMid( i32* %r275 ) {
getMid:
  %r783 = add i32 0, 0
  %r784 = add i32 0, 0
  %r785 = load i32, i32* @n
  %r786 = sdiv i32 %r785, 2
  %r787 = mul i32 %r786, 2
  %r788 = load i32, i32* @n
  %r789 = icmp eq i32 %r787, %r788
  br i1 %r789, label %bb55, label %bb56

bb55:
  %r790 = load i32, i32* @n
  %r791 = sdiv i32 %r790, 2
  %r792 = add i32 %r791, 0
  %r793 = sub i32 %r792, 1
  %r794 = add i32 %r793, 0
  %r288 = getelementptr i32, i32* %r275, i32 %r792
  %r795 = load i32, i32* %r288
  %r291 = getelementptr i32, i32* %r275, i32 %r794
  %r796 = load i32, i32* %r291
  %r797 = add i32 %r795, %r796
  %r798 = sdiv i32 %r797, 2
  ret i32 %r798
bb56:
  %r799 = load i32, i32* @n
  %r800 = sdiv i32 %r799, 2
  %r801 = add i32 %r800, 0
  %r298 = getelementptr i32, i32* %r275, i32 %r801
  %r802 = load i32, i32* %r298
  ret i32 %r802
}

define i32 @getMost( i32* %r301 ) {
getMost:
  %r815 = add i32 0, 0
  %r816 = add i32 0, 0
  %r817 = add i32 0, 0
  %r302 = alloca [ 1000 x i32 ]
  %r818 = add i32 0, 0
  %r819 = add i32 0, 0
  br label %bb58

bb58:
  %r820 = phi i32 [ %r819, %getMost ], [ %r823, %bb59 ]
  %r821 = icmp slt i32 %r820, 1000
  br i1 %r821, label %bb59, label %bb60

bb59:
  %r306 = getelementptr [1000 x i32 ], [1000 x i32 ]* %r302, i32 0, i32 %r820
  store i32 0, i32* %r306
  %r822 = add i32 %r820, 1
  %r823 = add i32 %r822, 0
  br label %bb58

bb60:
  %r824 = add i32 0, 0
  %r825 = add i32 0, 0
  br label %bb61

bb61:
  %r826 = phi i32 [ %r824, %bb60 ], [ %r843, %bb66 ]
  %r827 = phi i32 [ %r825, %bb60 ], [ %r840, %bb66 ]
  %r828 = phi i32 [ %r807, %bb60 ], [ %r841, %bb66 ]
  %r829 = load i32, i32* @n
  %r830 = icmp slt i32 %r826, %r829
  br i1 %r830, label %bb62, label %bb63

bb62:
  %r316 = getelementptr i32, i32* %r301, i32 %r826
  %r831 = load i32, i32* %r316
  %r832 = add i32 %r831, 0
  %r319 = getelementptr [1000 x i32 ], [1000 x i32 ]* %r302, i32 0, i32 %r832
  %r321 = getelementptr [1000 x i32 ], [1000 x i32 ]* %r302, i32 0, i32 %r832
  %r833 = load i32, i32* %r321
  %r834 = add i32 %r833, 1
  store i32 %r834, i32* %r319
  %r327 = getelementptr [1000 x i32 ], [1000 x i32 ]* %r302, i32 0, i32 %r832
  %r835 = load i32, i32* %r327
  %r836 = icmp sgt i32 %r835, %r827
  br i1 %r836, label %bb64, label %bb65

bb64:
  %r331 = getelementptr [1000 x i32 ], [1000 x i32 ]* %r302, i32 0, i32 %r832
  %r837 = load i32, i32* %r331
  %r838 = add i32 %r837, 0
  %r839 = add i32 %r832, 0
  br label %bb66

bb65:
  br label %bb66

bb66:
  %r840 = phi i32 [ %r838, %bb64 ], [ %r827, %bb65 ]
  %r841 = phi i32 [ %r839, %bb64 ], [ %r828, %bb65 ]
  %r842 = add i32 %r826, 1
  %r843 = add i32 %r842, 0
  br label %bb61

bb63:
  ret i32 %r828
}

define i32 @revert( i32* %r338 ) {
revert:
  %r853 = add i32 0, 0
  %r854 = add i32 0, 0
  %r855 = add i32 0, 0
  %r856 = add i32 0, 0
  %r857 = add i32 0, 0
  br label %bb67

bb67:
  %r858 = phi i32 [ %r857, %revert ], [ %r867, %bb68 ]
  %r859 = phi i32 [ %r856, %revert ], [ %r865, %bb68 ]
  %r860 = icmp slt i32 %r859, %r858
  br i1 %r860, label %bb68, label %bb69

bb68:
  %r345 = getelementptr i32, i32* %r338, i32 %r859
  %r861 = load i32, i32* %r345
  %r862 = add i32 %r861, 0
  %r348 = getelementptr i32, i32* %r338, i32 %r859
  %r350 = getelementptr i32, i32* %r338, i32 %r858
  %r863 = load i32, i32* %r350
  store i32 %r863, i32* %r348
  %r353 = getelementptr i32, i32* %r338, i32 %r858
  store i32 %r862, i32* %r353
  %r864 = add i32 %r859, 1
  %r865 = add i32 %r864, 0
  %r866 = sub i32 %r858, 1
  %r867 = add i32 %r866, 0
  br label %bb67

bb69:
  ret i32 0
}

define i32 @arrCopy( i32* %r360, i32* %r361 ) {
arrCopy:
  %r871 = add i32 0, 0
  %r872 = add i32 0, 0
  br label %bb70

bb70:
  %r873 = phi i32 [ %r872, %arrCopy ], [ %r878, %bb71 ]
  %r874 = load i32, i32* @n
  %r875 = icmp slt i32 %r873, %r874
  br i1 %r875, label %bb71, label %bb72

bb71:
  %r366 = getelementptr i32, i32* %r361, i32 %r873
  %r368 = getelementptr i32, i32* %r360, i32 %r873
  %r876 = load i32, i32* %r368
  store i32 %r876, i32* %r366
  %r877 = add i32 %r873, 1
  %r878 = add i32 %r877, 0
  br label %bb70

bb72:
  ret i32 0
}

define i32 @calSum( i32* %r373, i32 %r374 ) {
calSum:
  %r888 = add i32 0, 0
  %r889 = add i32 %r374, 0
  %r890 = add i32 0, 0
  %r891 = add i32 0, 0
  %r892 = add i32 0, 0
  %r893 = add i32 0, 0
  br label %bb73

bb73:
  %r894 = phi i32 [ %r893, %calSum ], [ %r908, %bb78 ]
  %r895 = phi i32 [ %r891, %calSum ], [ %r906, %bb78 ]
  %r896 = load i32, i32* @n
  %r897 = icmp slt i32 %r894, %r896
  br i1 %r897, label %bb74, label %bb75

bb74:
  %r382 = getelementptr i32, i32* %r373, i32 %r894
  %r898 = load i32, i32* %r382
  %r899 = add i32 %r895, %r898
  %r900 = add i32 %r899, 0
  %r901 = sdiv i32 %r894, %r889
  %r902 = mul i32 %r901, %r889
  %r903 = sub i32 %r894, %r902
  %r904 = sub i32 %r889, 1
  %r905 = icmp ne i32 %r903, %r904
  br i1 %r905, label %bb76, label %bb77

bb76:
  %r397 = getelementptr i32, i32* %r373, i32 %r894
  store i32 0, i32* %r397
  br label %bb78

bb77:
  %r399 = getelementptr i32, i32* %r373, i32 %r894
  store i32 %r900, i32* %r399
  %r909 = add i32 0, 0
  br label %bb78

bb78:
  %r906 = phi i32 [ %r900, %bb76 ], [ %r909, %bb77 ]
  %r907 = add i32 %r894, 1
  %r908 = add i32 %r907, 0
  br label %bb73

bb75:
  ret i32 0
}

define i32 @avgPooling( i32* %r404, i32 %r405 ) {
avgPooling:
  %r925 = add i32 0, 0
  %r926 = add i32 0, 0
  %r927 = add i32 %r405, 0
  %r928 = add i32 0, 0
  %r929 = add i32 0, 0
  %r930 = add i32 0, 0
  %r931 = add i32 0, 0
  %r932 = add i32 0, 0
  br label %bb79

bb79:
  %r933 = phi i32 [ %r930, %avgPooling ], [ %r943, %bb84 ]
  %r934 = phi i32 [ %r931, %avgPooling ], [ %r940, %bb84 ]
  %r935 = phi i32 [ %r923, %avgPooling ], [ %r941, %bb84 ]
  %r936 = load i32, i32* @n
  %r937 = icmp slt i32 %r933, %r936
  br i1 %r937, label %bb80, label %bb81

bb80:
  %r938 = sub i32 %r927, 1
  %r939 = icmp slt i32 %r933, %r938
  br i1 %r939, label %bb82, label %bb83

bb82:
  %r419 = getelementptr i32, i32* %r404, i32 %r933
  %r961 = load i32, i32* %r419
  %r962 = add i32 %r934, %r961
  %r963 = add i32 %r962, 0
  br label %bb84

bb83:
  %r944 = sub i32 %r927, 1
  %r945 = icmp eq i32 %r933, %r944
  br i1 %r945, label %bb85, label %bb86

bb85:
  %r428 = getelementptr i32, i32* %r404, i32 0
  %r958 = load i32, i32* %r428
  %r959 = add i32 %r958, 0
  %r430 = getelementptr i32, i32* %r404, i32 0
  %r960 = sdiv i32 %r934, %r927
  store i32 %r960, i32* %r430
  br label %bb87

bb86:
  %r435 = getelementptr i32, i32* %r404, i32 %r933
  %r948 = load i32, i32* %r435
  %r949 = add i32 %r934, %r948
  %r950 = sub i32 %r949, %r935
  %r951 = add i32 %r950, 0
  %r952 = sub i32 %r933, %r927
  %r953 = add i32 %r952, 1
  %r954 = add i32 %r953, 0
  %r446 = getelementptr i32, i32* %r404, i32 %r954
  %r955 = load i32, i32* %r446
  %r956 = add i32 %r955, 0
  %r449 = getelementptr i32, i32* %r404, i32 %r954
  %r957 = sdiv i32 %r951, %r927
  store i32 %r957, i32* %r449
  br label %bb87

bb87:
  %r946 = phi i32 [ %r934, %bb85 ], [ %r951, %bb86 ]
  %r947 = phi i32 [ %r959, %bb85 ], [ %r956, %bb86 ]
  br label %bb84

bb84:
  %r940 = phi i32 [ %r963, %bb82 ], [ %r946, %bb87 ]
  %r941 = phi i32 [ %r935, %bb82 ], [ %r947, %bb87 ]
  %r942 = add i32 %r933, 1
  %r943 = add i32 %r942, 0
  br label %bb79

bb81:
  %r964 = load i32, i32* @n
  %r965 = sub i32 %r964, %r927
  %r966 = add i32 %r965, 1
  %r967 = add i32 %r966, 0
  br label %bb88

bb88:
  %r968 = phi i32 [ %r967, %bb81 ], [ %r972, %bb89 ]
  %r969 = load i32, i32* @n
  %r970 = icmp slt i32 %r968, %r969
  br i1 %r970, label %bb89, label %bb90

bb89:
  %r463 = getelementptr i32, i32* %r404, i32 %r968
  store i32 0, i32* %r463
  %r971 = add i32 %r968, 1
  %r972 = add i32 %r971, 0
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
  store i32 7, i32* %r469
  %r470 = getelementptr [32 x i32 ], [32 x i32 ]* %r467, i32 0, i32 1
  store i32 23, i32* %r470
  %r471 = getelementptr [32 x i32 ], [32 x i32 ]* %r467, i32 0, i32 2
  store i32 89, i32* %r471
  %r472 = getelementptr [32 x i32 ], [32 x i32 ]* %r467, i32 0, i32 3
  store i32 26, i32* %r472
  %r473 = getelementptr [32 x i32 ], [32 x i32 ]* %r467, i32 0, i32 4
  store i32 282, i32* %r473
  %r474 = getelementptr [32 x i32 ], [32 x i32 ]* %r467, i32 0, i32 5
  store i32 254, i32* %r474
  %r475 = getelementptr [32 x i32 ], [32 x i32 ]* %r467, i32 0, i32 6
  store i32 27, i32* %r475
  %r476 = getelementptr [32 x i32 ], [32 x i32 ]* %r467, i32 0, i32 7
  store i32 5, i32* %r476
  %r477 = getelementptr [32 x i32 ], [32 x i32 ]* %r467, i32 0, i32 8
  store i32 83, i32* %r477
  %r478 = getelementptr [32 x i32 ], [32 x i32 ]* %r467, i32 0, i32 9
  store i32 273, i32* %r478
  %r479 = getelementptr [32 x i32 ], [32 x i32 ]* %r467, i32 0, i32 10
  store i32 574, i32* %r479
  %r480 = getelementptr [32 x i32 ], [32 x i32 ]* %r467, i32 0, i32 11
  store i32 905, i32* %r480
  %r481 = getelementptr [32 x i32 ], [32 x i32 ]* %r467, i32 0, i32 12
  store i32 354, i32* %r481
  %r482 = getelementptr [32 x i32 ], [32 x i32 ]* %r467, i32 0, i32 13
  store i32 657, i32* %r482
  %r483 = getelementptr [32 x i32 ], [32 x i32 ]* %r467, i32 0, i32 14
  store i32 935, i32* %r483
  %r484 = getelementptr [32 x i32 ], [32 x i32 ]* %r467, i32 0, i32 15
  store i32 264, i32* %r484
  %r485 = getelementptr [32 x i32 ], [32 x i32 ]* %r467, i32 0, i32 16
  store i32 639, i32* %r485
  %r486 = getelementptr [32 x i32 ], [32 x i32 ]* %r467, i32 0, i32 17
  store i32 459, i32* %r486
  %r487 = getelementptr [32 x i32 ], [32 x i32 ]* %r467, i32 0, i32 18
  store i32 29, i32* %r487
  %r488 = getelementptr [32 x i32 ], [32 x i32 ]* %r467, i32 0, i32 19
  store i32 68, i32* %r488
  %r489 = getelementptr [32 x i32 ], [32 x i32 ]* %r467, i32 0, i32 20
  store i32 929, i32* %r489
  %r490 = getelementptr [32 x i32 ], [32 x i32 ]* %r467, i32 0, i32 21
  store i32 756, i32* %r490
  %r491 = getelementptr [32 x i32 ], [32 x i32 ]* %r467, i32 0, i32 22
  store i32 452, i32* %r491
  %r492 = getelementptr [32 x i32 ], [32 x i32 ]* %r467, i32 0, i32 23
  store i32 279, i32* %r492
  %r493 = getelementptr [32 x i32 ], [32 x i32 ]* %r467, i32 0, i32 24
  store i32 58, i32* %r493
  %r494 = getelementptr [32 x i32 ], [32 x i32 ]* %r467, i32 0, i32 25
  store i32 87, i32* %r494
  %r495 = getelementptr [32 x i32 ], [32 x i32 ]* %r467, i32 0, i32 26
  store i32 96, i32* %r495
  %r496 = getelementptr [32 x i32 ], [32 x i32 ]* %r467, i32 0, i32 27
  store i32 36, i32* %r496
  %r497 = getelementptr [32 x i32 ], [32 x i32 ]* %r467, i32 0, i32 28
  store i32 39, i32* %r497
  %r498 = getelementptr [32 x i32 ], [32 x i32 ]* %r467, i32 0, i32 29
  store i32 28, i32* %r498
  %r499 = getelementptr [32 x i32 ], [32 x i32 ]* %r467, i32 0, i32 30
  store i32 1, i32* %r499
  %r500 = getelementptr [32 x i32 ], [32 x i32 ]* %r467, i32 0, i32 31
  store i32 290, i32* %r500
  %r979 = add i32 0, 0
  %r980 = call i32 @arrCopy(i32* %r467, i32* %r468)
  %r981 = add i32 %r980, 0
  %r982 = call i32 @revert(i32* %r468)
  %r983 = add i32 %r982, 0
  %r984 = add i32 0, 0
  %r985 = add i32 0, 0
  br label %bb91

bb91:
  %r986 = phi i32 [ %r985, %main ], [ %r991, %bb92 ]
  %r987 = icmp slt i32 %r986, 32
  br i1 %r987, label %bb92, label %bb93

bb92:
  %r507 = getelementptr [32 x i32 ], [32 x i32 ]* %r468, i32 0, i32 %r986
  %r988 = load i32, i32* %r507
  %r989 = add i32 %r988, 0
  call void @putint(i32 %r989)
  %r990 = add i32 %r986, 1
  %r991 = add i32 %r990, 0
  br label %bb91

bb93:
  %r992 = call i32 @bubblesort(i32* %r468)
  %r993 = add i32 %r992, 0
  %r994 = add i32 0, 0
  br label %bb94

bb94:
  %r995 = phi i32 [ %r994, %bb93 ], [ %r1000, %bb95 ]
  %r996 = icmp slt i32 %r995, 32
  br i1 %r996, label %bb95, label %bb96

bb95:
  %r516 = getelementptr [32 x i32 ], [32 x i32 ]* %r468, i32 0, i32 %r995
  %r997 = load i32, i32* %r516
  %r998 = add i32 %r997, 0
  call void @putint(i32 %r998)
  %r999 = add i32 %r995, 1
  %r1000 = add i32 %r999, 0
  br label %bb94

bb96:
  %r1001 = call i32 @getMid(i32* %r468)
  %r1002 = add i32 %r1001, 0
  call void @putint(i32 %r1002)
  %r1003 = call i32 @getMost(i32* %r468)
  %r1004 = add i32 %r1003, 0
  call void @putint(i32 %r1004)
  %r1005 = call i32 @arrCopy(i32* %r467, i32* %r468)
  %r1006 = add i32 %r1005, 0
  %r1007 = call i32 @bubblesort(i32* %r468)
  %r1008 = add i32 %r1007, 0
  %r1009 = add i32 0, 0
  br label %bb97

bb97:
  %r1010 = phi i32 [ %r1009, %bb96 ], [ %r1015, %bb98 ]
  %r1011 = icmp slt i32 %r1010, 32
  br i1 %r1011, label %bb98, label %bb99

bb98:
  %r530 = getelementptr [32 x i32 ], [32 x i32 ]* %r468, i32 0, i32 %r1010
  %r1012 = load i32, i32* %r530
  %r1013 = add i32 %r1012, 0
  call void @putint(i32 %r1013)
  %r1014 = add i32 %r1010, 1
  %r1015 = add i32 %r1014, 0
  br label %bb97

bb99:
  %r1016 = call i32 @arrCopy(i32* %r467, i32* %r468)
  %r1017 = add i32 %r1016, 0
  %r1018 = call i32 @insertsort(i32* %r468)
  %r1019 = add i32 %r1018, 0
  %r1020 = add i32 0, 0
  br label %bb100

bb100:
  %r1021 = phi i32 [ %r1020, %bb99 ], [ %r1026, %bb101 ]
  %r1022 = icmp slt i32 %r1021, 32
  br i1 %r1022, label %bb101, label %bb102

bb101:
  %r540 = getelementptr [32 x i32 ], [32 x i32 ]* %r468, i32 0, i32 %r1021
  %r1023 = load i32, i32* %r540
  %r1024 = add i32 %r1023, 0
  call void @putint(i32 %r1024)
  %r1025 = add i32 %r1021, 1
  %r1026 = add i32 %r1025, 0
  br label %bb100

bb102:
  %r1027 = call i32 @arrCopy(i32* %r467, i32* %r468)
  %r1028 = add i32 %r1027, 0
  %r1029 = add i32 0, 0
  %r1030 = add i32 31, 0
  %r1031 = call i32 @QuickSort(i32* %r468, i32 %r1029, i32 %r1030)
  %r1032 = add i32 %r1031, 0
  br label %bb103

bb103:
  %r1033 = phi i32 [ %r1029, %bb102 ], [ %r1060, %bb104 ]
  %r1034 = icmp slt i32 %r1033, 32
  br i1 %r1034, label %bb104, label %bb105

bb104:
  %r552 = getelementptr [32 x i32 ], [32 x i32 ]* %r468, i32 0, i32 %r1033
  %r1057 = load i32, i32* %r552
  %r1058 = add i32 %r1057, 0
  call void @putint(i32 %r1058)
  %r1059 = add i32 %r1033, 1
  %r1060 = add i32 %r1059, 0
  br label %bb103

bb105:
  %r1035 = call i32 @arrCopy(i32* %r467, i32* %r468)
  %r1036 = add i32 %r1035, 0
  %r1037 = call i32 @calSum(i32* %r468, i32 4)
  %r1038 = add i32 %r1037, 0
  %r1039 = add i32 0, 0
  br label %bb106

bb106:
  %r1040 = phi i32 [ %r1039, %bb105 ], [ %r1056, %bb107 ]
  %r1041 = icmp slt i32 %r1040, 32
  br i1 %r1041, label %bb107, label %bb108

bb107:
  %r562 = getelementptr [32 x i32 ], [32 x i32 ]* %r468, i32 0, i32 %r1040
  %r1053 = load i32, i32* %r562
  %r1054 = add i32 %r1053, 0
  call void @putint(i32 %r1054)
  %r1055 = add i32 %r1040, 1
  %r1056 = add i32 %r1055, 0
  br label %bb106

bb108:
  %r1042 = call i32 @arrCopy(i32* %r467, i32* %r468)
  %r1043 = add i32 %r1042, 0
  %r1044 = call i32 @avgPooling(i32* %r468, i32 3)
  %r1045 = add i32 %r1044, 0
  %r1046 = add i32 0, 0
  br label %bb109

bb109:
  %r1047 = phi i32 [ %r1046, %bb108 ], [ %r1052, %bb110 ]
  %r1048 = icmp slt i32 %r1047, 32
  br i1 %r1048, label %bb110, label %bb111

bb110:
  %r572 = getelementptr [32 x i32 ], [32 x i32 ]* %r468, i32 0, i32 %r1047
  %r1049 = load i32, i32* %r572
  %r1050 = add i32 %r1049, 0
  call void @putint(i32 %r1050)
  %r1051 = add i32 %r1047, 1
  %r1052 = add i32 %r1051, 0
  br label %bb109

bb111:
  call void @_sysy_stoptime(i32 312)
  ret i32 0
}

