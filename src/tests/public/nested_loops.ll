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
  %r418 = add i32 0, 0
  %r419 = add i32 0, 0
  %r420 = add i32 0, 0
  %r421 = add i32 %r100, 0
  %r422 = add i32 0, 0
  %r423 = add i32 %r102, 0
  %r424 = add i32 0, 0
  %r425 = add i32 0, 0
  %r426 = add i32 0, 0
  %r427 = add i32 0, 0
  %r428 = add i32 0, 0
  %r429 = add i32 0, 0
  %r430 = add i32 0, 0
  %r431 = add i32 0, 0
  br label %bb1

bb1:
  %r432 = phi i32 [ %r431, %loop1 ], [ %r480, %bb13 ]
  %r433 = icmp slt i32 %r432, %r421
  br i1 %r433, label %bb5, label %bb6

bb5:
  %r435 = add i32 1, 0
  br label %bb7

bb6:
  %r434 = add i32 0, 0
  br label %bb7

bb7:
  %r436 = phi i32 [ %r435, %bb5 ], [ %r434, %bb6 ]
  %r437 = icmp ne i32 %r436, 0
  br i1 %r437, label %bb4, label %bb3

bb4:
  %r438 = icmp slt i32 %r432, %r423
  br i1 %r438, label %bb8, label %bb9

bb8:
  %r482 = add i32 1, 0
  br label %bb10

bb9:
  %r481 = add i32 0, 0
  br label %bb10

bb10:
  %r439 = phi i32 [ %r482, %bb8 ], [ %r481, %bb9 ]
  %r440 = icmp ne i32 %r439, 0
  br i1 %r440, label %bb2, label %bb3

bb2:
  %r441 = add i32 0, 0
  br label %bb11

bb11:
  %r442 = phi i32 [ %r441, %bb2 ], [ %r478, %bb16 ]
  %r443 = icmp slt i32 %r442, 2
  br i1 %r443, label %bb12, label %bb13

bb12:
  %r444 = add i32 0, 0
  br label %bb14

bb14:
  %r445 = phi i32 [ %r444, %bb12 ], [ %r476, %bb19 ]
  %r446 = icmp slt i32 %r445, 3
  br i1 %r446, label %bb15, label %bb16

bb15:
  %r447 = add i32 0, 0
  br label %bb17

bb17:
  %r448 = phi i32 [ %r447, %bb15 ], [ %r474, %bb22 ]
  %r449 = icmp slt i32 %r448, 4
  br i1 %r449, label %bb18, label %bb19

bb18:
  %r450 = add i32 0, 0
  br label %bb20

bb20:
  %r451 = phi i32 [ %r450, %bb18 ], [ %r472, %bb25 ]
  %r452 = icmp slt i32 %r451, 5
  br i1 %r452, label %bb21, label %bb22

bb21:
  %r453 = add i32 0, 0
  br label %bb23

bb23:
  %r454 = phi i32 [ %r453, %bb21 ], [ %r460, %bb28 ]
  %r455 = icmp slt i32 %r454, 6
  br i1 %r455, label %bb24, label %bb25

bb24:
  %r456 = add i32 0, 0
  br label %bb26

bb26:
  %r457 = phi i32 [ %r456, %bb24 ], [ %r470, %bb27 ]
  %r458 = icmp slt i32 %r457, 2
  br i1 %r458, label %bb27, label %bb28

bb27:
  %r135 = getelementptr [10 x %my_struct_6 ], [10 x %my_struct_6 ]* @arr1, i32 0, i32 %r432
  %r137 = getelementptr %my_struct_6, %my_struct_6* %r135, i32 0, i32 0
  %r138 = getelementptr [2 x %my_struct_5 ], [2 x %my_struct_5 ]* %r137, i32 0, i32 %r442
  %r140 = getelementptr %my_struct_5, %my_struct_5* %r138, i32 0, i32 0
  %r141 = getelementptr [3 x %my_struct_4 ], [3 x %my_struct_4 ]* %r140, i32 0, i32 %r445
  %r143 = getelementptr %my_struct_4, %my_struct_4* %r141, i32 0, i32 0
  %r144 = getelementptr [4 x %my_struct_3 ], [4 x %my_struct_3 ]* %r143, i32 0, i32 %r448
  %r146 = getelementptr %my_struct_3, %my_struct_3* %r144, i32 0, i32 0
  %r147 = getelementptr [5 x %my_struct_2 ], [5 x %my_struct_2 ]* %r146, i32 0, i32 %r451
  %r149 = getelementptr %my_struct_2, %my_struct_2* %r147, i32 0, i32 0
  %r150 = getelementptr [8 x %my_struct_1 ], [8 x %my_struct_1 ]* %r149, i32 0, i32 %r454
  %r152 = getelementptr %my_struct_1, %my_struct_1* %r150, i32 0, i32 0
  %r153 = getelementptr [7 x i32 ], [7 x i32 ]* %r152, i32 0, i32 %r457
  %r461 = add i32 %r432, %r442
  %r462 = add i32 %r461, %r445
  %r463 = add i32 %r462, %r448
  %r464 = add i32 %r463, %r451
  %r465 = add i32 %r464, %r454
  %r466 = add i32 %r465, %r457
  %r467 = add i32 %r466, %r421
  %r468 = add i32 %r467, %r423
  store i32 %r468, i32* %r153
  %r469 = add i32 %r457, 1
  %r470 = add i32 %r469, 0
  br label %bb26

bb28:
  %r459 = add i32 %r454, 1
  %r460 = add i32 %r459, 0
  br label %bb23

bb25:
  %r471 = add i32 %r451, 1
  %r472 = add i32 %r471, 0
  br label %bb20

bb22:
  %r473 = add i32 %r448, 1
  %r474 = add i32 %r473, 0
  br label %bb17

bb19:
  %r475 = add i32 %r445, 1
  %r476 = add i32 %r475, 0
  br label %bb14

bb16:
  %r477 = add i32 %r442, 1
  %r478 = add i32 %r477, 0
  br label %bb11

bb13:
  %r479 = add i32 %r432, 1
  %r480 = add i32 %r479, 0
  br label %bb1

bb3:
  ret i32 0
}

define i32 @loop2( ) {
loop2:
  %r490 = add i32 0, 0
  %r491 = add i32 0, 0
  %r492 = add i32 0, 0
  %r493 = add i32 0, 0
  %r494 = add i32 0, 0
  %r495 = add i32 0, 0
  %r496 = add i32 0, 0
  %r497 = add i32 0, 0
  br label %bb29

bb29:
  %r498 = phi i32 [ %r497, %loop2 ], [ %r534, %bb34 ]
  %r499 = icmp slt i32 %r498, 10
  br i1 %r499, label %bb30, label %bb31

bb30:
  %r500 = add i32 0, 0
  br label %bb32

bb32:
  %r501 = phi i32 [ %r500, %bb30 ], [ %r507, %bb37 ]
  %r502 = icmp slt i32 %r501, 2
  br i1 %r502, label %bb33, label %bb34

bb33:
  %r503 = add i32 0, 0
  br label %bb35

bb35:
  %r504 = phi i32 [ %r503, %bb33 ], [ %r532, %bb40 ]
  %r505 = icmp slt i32 %r504, 3
  br i1 %r505, label %bb36, label %bb37

bb36:
  %r508 = add i32 0, 0
  br label %bb38

bb38:
  %r509 = phi i32 [ %r508, %bb36 ], [ %r530, %bb43 ]
  %r510 = icmp slt i32 %r509, 2
  br i1 %r510, label %bb39, label %bb40

bb39:
  %r511 = add i32 0, 0
  br label %bb41

bb41:
  %r512 = phi i32 [ %r511, %bb39 ], [ %r518, %bb46 ]
  %r513 = icmp slt i32 %r512, 4
  br i1 %r513, label %bb42, label %bb43

bb42:
  %r514 = add i32 0, 0
  br label %bb44

bb44:
  %r515 = phi i32 [ %r514, %bb42 ], [ %r528, %bb49 ]
  %r516 = icmp slt i32 %r515, 8
  br i1 %r516, label %bb45, label %bb46

bb45:
  %r519 = add i32 0, 0
  br label %bb47

bb47:
  %r520 = phi i32 [ %r519, %bb45 ], [ %r526, %bb48 ]
  %r521 = icmp slt i32 %r520, 7
  br i1 %r521, label %bb48, label %bb49

bb48:
  %r207 = getelementptr [10 x %my_struct_6 ], [10 x %my_struct_6 ]* @arr2, i32 0, i32 %r498
  %r209 = getelementptr %my_struct_6, %my_struct_6* %r207, i32 0, i32 0
  %r210 = getelementptr [2 x %my_struct_5 ], [2 x %my_struct_5 ]* %r209, i32 0, i32 %r501
  %r212 = getelementptr %my_struct_5, %my_struct_5* %r210, i32 0, i32 0
  %r213 = getelementptr [3 x %my_struct_4 ], [3 x %my_struct_4 ]* %r212, i32 0, i32 %r504
  %r215 = getelementptr %my_struct_4, %my_struct_4* %r213, i32 0, i32 0
  %r216 = getelementptr [4 x %my_struct_3 ], [4 x %my_struct_3 ]* %r215, i32 0, i32 %r509
  %r218 = getelementptr %my_struct_3, %my_struct_3* %r216, i32 0, i32 0
  %r219 = getelementptr [5 x %my_struct_2 ], [5 x %my_struct_2 ]* %r218, i32 0, i32 %r512
  %r221 = getelementptr %my_struct_2, %my_struct_2* %r219, i32 0, i32 0
  %r222 = getelementptr [8 x %my_struct_1 ], [8 x %my_struct_1 ]* %r221, i32 0, i32 %r515
  %r224 = getelementptr %my_struct_1, %my_struct_1* %r222, i32 0, i32 0
  %r225 = getelementptr [7 x i32 ], [7 x i32 ]* %r224, i32 0, i32 %r520
  %r522 = add i32 %r498, %r501
  %r523 = add i32 %r522, %r509
  %r524 = add i32 %r523, %r520
  store i32 %r524, i32* %r225
  %r525 = add i32 %r520, 1
  %r526 = add i32 %r525, 0
  br label %bb47

bb49:
  %r527 = add i32 %r515, 1
  %r528 = add i32 %r527, 0
  br label %bb44

bb46:
  %r517 = add i32 %r512, 1
  %r518 = add i32 %r517, 0
  br label %bb41

bb43:
  %r529 = add i32 %r509, 1
  %r530 = add i32 %r529, 0
  br label %bb38

bb40:
  %r531 = add i32 %r504, 1
  %r532 = add i32 %r531, 0
  br label %bb35

bb37:
  %r506 = add i32 %r501, 1
  %r507 = add i32 %r506, 0
  br label %bb32

bb34:
  %r533 = add i32 %r498, 1
  %r534 = add i32 %r533, 0
  br label %bb29

bb31:
  ret i32 0
}

define i32 @loop3( i32 %r248, i32 %r250, i32 %r252, i32 %r254, i32 %r256, i32 %r258, i32 %r260 ) {
loop3:
  %r550 = add i32 0, 0
  %r551 = add i32 %r248, 0
  %r552 = add i32 0, 0
  %r553 = add i32 %r250, 0
  %r554 = add i32 0, 0
  %r555 = add i32 %r252, 0
  %r556 = add i32 0, 0
  %r557 = add i32 %r254, 0
  %r558 = add i32 0, 0
  %r559 = add i32 %r256, 0
  %r560 = add i32 0, 0
  %r561 = add i32 %r258, 0
  %r562 = add i32 0, 0
  %r563 = add i32 %r260, 0
  %r564 = add i32 0, 0
  %r565 = add i32 0, 0
  %r566 = add i32 0, 0
  %r567 = add i32 0, 0
  %r568 = add i32 0, 0
  %r569 = add i32 0, 0
  %r570 = add i32 0, 0
  %r571 = add i32 0, 0
  %r572 = add i32 0, 0
  %r573 = add i32 0, 0
  br label %bb50

bb50:
  %r574 = phi i32 [ %r572, %loop3 ], [ %r581, %bb91 ]
  %r575 = phi i32 [ %r573, %loop3 ], [ %r583, %bb91 ]
  %r576 = icmp slt i32 %r575, 10
  br i1 %r576, label %bb51, label %bb52

bb51:
  %r577 = add i32 0, 0
  br label %bb53

bb53:
  %r578 = phi i32 [ %r574, %bb51 ], [ %r589, %bb88 ]
  %r579 = phi i32 [ %r577, %bb51 ], [ %r591, %bb88 ]
  %r580 = icmp slt i32 %r579, 100
  br i1 %r580, label %bb54, label %bb55

bb54:
  %r585 = add i32 0, 0
  br label %bb56

bb56:
  %r586 = phi i32 [ %r578, %bb54 ], [ %r597, %bb85 ]
  %r587 = phi i32 [ %r585, %bb54 ], [ %r599, %bb85 ]
  %r588 = icmp slt i32 %r587, 1000
  br i1 %r588, label %bb57, label %bb58

bb57:
  %r593 = add i32 0, 0
  br label %bb59

bb59:
  %r594 = phi i32 [ %r586, %bb57 ], [ %r605, %bb82 ]
  %r595 = phi i32 [ %r593, %bb57 ], [ %r607, %bb82 ]
  %r596 = icmp slt i32 %r595, 10000
  br i1 %r596, label %bb60, label %bb61

bb60:
  %r601 = add i32 0, 0
  br label %bb62

bb62:
  %r602 = phi i32 [ %r594, %bb60 ], [ %r632, %bb79 ]
  %r603 = phi i32 [ %r601, %bb60 ], [ %r634, %bb79 ]
  %r604 = icmp slt i32 %r603, 100000
  br i1 %r604, label %bb63, label %bb64

bb63:
  %r609 = add i32 0, 0
  br label %bb65

bb65:
  %r610 = phi i32 [ %r602, %bb63 ], [ %r617, %bb76 ]
  %r611 = phi i32 [ %r609, %bb63 ], [ %r619, %bb76 ]
  %r612 = icmp slt i32 %r611, 1000000
  br i1 %r612, label %bb66, label %bb67

bb66:
  %r613 = add i32 0, 0
  br label %bb68

bb68:
  %r614 = phi i32 [ %r613, %bb66 ], [ %r630, %bb73 ]
  %r615 = phi i32 [ %r610, %bb66 ], [ %r628, %bb73 ]
  %r616 = icmp slt i32 %r614, 10000000
  br i1 %r616, label %bb69, label %bb70

bb69:
  %r621 = sdiv i32 %r615, 817
  %r622 = mul i32 %r621, 817
  %r623 = sub i32 %r615, %r622
  %r289 = getelementptr [10 x %my_struct_6 ], [10 x %my_struct_6 ]* @arr1, i32 0, i32 %r575
  %r291 = getelementptr %my_struct_6, %my_struct_6* %r289, i32 0, i32 0
  %r292 = getelementptr [2 x %my_struct_5 ], [2 x %my_struct_5 ]* %r291, i32 0, i32 %r579
  %r294 = getelementptr %my_struct_5, %my_struct_5* %r292, i32 0, i32 0
  %r295 = getelementptr [3 x %my_struct_4 ], [3 x %my_struct_4 ]* %r294, i32 0, i32 %r587
  %r297 = getelementptr %my_struct_4, %my_struct_4* %r295, i32 0, i32 0
  %r298 = getelementptr [4 x %my_struct_3 ], [4 x %my_struct_3 ]* %r297, i32 0, i32 %r595
  %r300 = getelementptr %my_struct_3, %my_struct_3* %r298, i32 0, i32 0
  %r301 = getelementptr [5 x %my_struct_2 ], [5 x %my_struct_2 ]* %r300, i32 0, i32 %r603
  %r303 = getelementptr %my_struct_2, %my_struct_2* %r301, i32 0, i32 0
  %r304 = getelementptr [8 x %my_struct_1 ], [8 x %my_struct_1 ]* %r303, i32 0, i32 %r611
  %r306 = getelementptr %my_struct_1, %my_struct_1* %r304, i32 0, i32 0
  %r307 = getelementptr [7 x i32 ], [7 x i32 ]* %r306, i32 0, i32 %r614
  %r624 = load i32, i32* %r307
  %r625 = add i32 %r623, %r624
  %r311 = getelementptr [10 x %my_struct_6 ], [10 x %my_struct_6 ]* @arr2, i32 0, i32 %r575
  %r313 = getelementptr %my_struct_6, %my_struct_6* %r311, i32 0, i32 0
  %r314 = getelementptr [2 x %my_struct_5 ], [2 x %my_struct_5 ]* %r313, i32 0, i32 %r579
  %r316 = getelementptr %my_struct_5, %my_struct_5* %r314, i32 0, i32 0
  %r317 = getelementptr [3 x %my_struct_4 ], [3 x %my_struct_4 ]* %r316, i32 0, i32 %r587
  %r319 = getelementptr %my_struct_4, %my_struct_4* %r317, i32 0, i32 0
  %r320 = getelementptr [4 x %my_struct_3 ], [4 x %my_struct_3 ]* %r319, i32 0, i32 %r595
  %r322 = getelementptr %my_struct_3, %my_struct_3* %r320, i32 0, i32 0
  %r323 = getelementptr [5 x %my_struct_2 ], [5 x %my_struct_2 ]* %r322, i32 0, i32 %r603
  %r325 = getelementptr %my_struct_2, %my_struct_2* %r323, i32 0, i32 0
  %r326 = getelementptr [8 x %my_struct_1 ], [8 x %my_struct_1 ]* %r325, i32 0, i32 %r611
  %r328 = getelementptr %my_struct_1, %my_struct_1* %r326, i32 0, i32 0
  %r329 = getelementptr [7 x i32 ], [7 x i32 ]* %r328, i32 0, i32 %r614
  %r626 = load i32, i32* %r329
  %r627 = add i32 %r625, %r626
  %r628 = add i32 %r627, 0
  %r629 = add i32 %r614, 1
  %r630 = add i32 %r629, 0
  %r631 = icmp sge i32 %r630, %r563
  br i1 %r631, label %bb71, label %bb72

bb71:
  br label %bb70

bb72:
  br label %bb73

bb73:
  br label %bb68

bb70:
  %r617 = phi i32 [ %r615, %bb68 ], [ %r628, %bb71 ]
  %r618 = add i32 %r611, 1
  %r619 = add i32 %r618, 0
  %r620 = icmp sge i32 %r619, %r561
  br i1 %r620, label %bb74, label %bb75

bb74:
  br label %bb67

bb75:
  br label %bb76

bb76:
  br label %bb65

bb67:
  %r632 = phi i32 [ %r610, %bb65 ], [ %r617, %bb74 ]
  %r633 = add i32 %r603, 1
  %r634 = add i32 %r633, 0
  %r635 = icmp sge i32 %r634, %r559
  br i1 %r635, label %bb77, label %bb78

bb77:
  br label %bb64

bb78:
  br label %bb79

bb79:
  br label %bb62

bb64:
  %r605 = phi i32 [ %r602, %bb62 ], [ %r632, %bb77 ]
  %r606 = add i32 %r595, 1
  %r607 = add i32 %r606, 0
  %r608 = icmp sge i32 %r607, %r557
  br i1 %r608, label %bb80, label %bb81

bb80:
  br label %bb61

bb81:
  br label %bb82

bb82:
  br label %bb59

bb61:
  %r597 = phi i32 [ %r594, %bb59 ], [ %r605, %bb80 ]
  %r598 = add i32 %r587, 1
  %r599 = add i32 %r598, 0
  %r600 = icmp sge i32 %r599, %r555
  br i1 %r600, label %bb83, label %bb84

bb83:
  br label %bb58

bb84:
  br label %bb85

bb85:
  br label %bb56

bb58:
  %r589 = phi i32 [ %r586, %bb56 ], [ %r597, %bb83 ]
  %r590 = add i32 %r579, 1
  %r591 = add i32 %r590, 0
  %r592 = icmp sge i32 %r591, %r553
  br i1 %r592, label %bb86, label %bb87

bb86:
  br label %bb55

bb87:
  br label %bb88

bb88:
  br label %bb53

bb55:
  %r581 = phi i32 [ %r578, %bb53 ], [ %r589, %bb86 ]
  %r582 = add i32 %r575, 1
  %r583 = add i32 %r582, 0
  %r584 = icmp sge i32 %r583, %r551
  br i1 %r584, label %bb89, label %bb90

bb89:
  br label %bb52

bb90:
  br label %bb91

bb91:
  br label %bb50

bb52:
  %r636 = phi i32 [ %r574, %bb50 ], [ %r581, %bb89 ]
  ret i32 %r636
}

define i32 @main( ) {
main:
  call void @_sysy_starttime(i32 97)
  %r646 = call i32 @getint()
  %r647 = add i32 0, 0
  %r648 = add i32 %r646, 0
  %r649 = call i32 @getint()
  %r650 = add i32 0, 0
  %r651 = add i32 %r649, 0
  %r652 = call i32 @getint()
  %r653 = add i32 0, 0
  %r654 = add i32 %r652, 0
  %r655 = call i32 @getint()
  %r656 = add i32 0, 0
  %r657 = add i32 %r655, 0
  %r658 = call i32 @getint()
  %r659 = add i32 0, 0
  %r660 = add i32 %r658, 0
  %r661 = call i32 @getint()
  %r662 = add i32 0, 0
  %r663 = add i32 %r661, 0
  %r664 = call i32 @getint()
  %r665 = add i32 0, 0
  %r666 = add i32 %r664, 0
  %r667 = call i32 @getint()
  %r668 = add i32 0, 0
  %r669 = add i32 %r667, 0
  %r670 = call i32 @getint()
  %r671 = add i32 0, 0
  %r672 = add i32 %r670, 0
  %r673 = call i32 @loop1(i32 %r648, i32 %r651)
  %r674 = call i32 @loop2()
  %r675 = call i32 @loop3(i32 %r654, i32 %r657, i32 %r660, i32 %r663, i32 %r666, i32 %r669, i32 %r672)
  %r676 = add i32 %r675, 0
  call void @_sysy_stoptime(i32 117)
  ret i32 %r676
}

