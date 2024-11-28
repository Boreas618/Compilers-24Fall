; ModuleID = 'llvm-link'
source_filename = "llvm-link"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-macosx15.0.0"

%my_struct_6 = type { [2 x %my_struct_5] }
%my_struct_5 = type { [3 x %my_struct_4] }
%my_struct_4 = type { [4 x %my_struct_3] }
%my_struct_3 = type { [5 x %my_struct_2] }
%my_struct_2 = type { [8 x %my_struct_1] }
%my_struct_1 = type { [7 x i32] }
%struct.timeval = type { i64, i32 }

@arr1 = global [10 x %my_struct_6] zeroinitializer
@arr2 = global [10 x %my_struct_6] zeroinitializer
@llvm.global_ctors = appending global [1 x { i32, ptr, ptr }] [{ i32, ptr, ptr } { i32 65535, ptr @__GLOBAL_init_65535, ptr null }]
@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"%c\00", align 1
@.str.2 = private unnamed_addr constant [4 x i8] c"%d:\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c" %d\00", align 1
@_sysy_us = local_unnamed_addr global [1024 x i32] zeroinitializer, align 4
@_sysy_s = local_unnamed_addr global [1024 x i32] zeroinitializer, align 4
@_sysy_m = local_unnamed_addr global [1024 x i32] zeroinitializer, align 4
@_sysy_h = local_unnamed_addr global [1024 x i32] zeroinitializer, align 4
@_sysy_idx = local_unnamed_addr global i32 1, align 4
@__stderrp = external local_unnamed_addr global ptr, align 8
@.str.5 = private unnamed_addr constant [35 x i8] c"Timer@%04d-%04d: %dH-%dM-%dS-%dus\0A\00", align 1
@_sysy_l1 = local_unnamed_addr global [1024 x i32] zeroinitializer, align 4
@_sysy_l2 = local_unnamed_addr global [1024 x i32] zeroinitializer, align 4
@.str.6 = private unnamed_addr constant [25 x i8] c"TOTAL: %dH-%dM-%dS-%dus\0A\00", align 1
@_sysy_start = global %struct.timeval zeroinitializer, align 8
@_sysy_end = global %struct.timeval zeroinitializer, align 8
@__dso_handle = external hidden global i8

define i32 @loop1(i32 %r100, i32 %r102) {
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

bb1:                                              ; preds = %bb13, %loop1
  %r454 = phi i32 [ %r453, %loop1 ], [ %r504, %bb13 ]
  %r455 = icmp slt i32 %r454, %r443
  br i1 %r455, label %bb5, label %bb6

bb5:                                              ; preds = %bb1
  %r457 = add i32 1, 0
  br label %bb7

bb6:                                              ; preds = %bb1
  %r456 = add i32 0, 0
  br label %bb7

bb7:                                              ; preds = %bb6, %bb5
  %r458 = phi i32 [ %r457, %bb5 ], [ %r456, %bb6 ]
  %r459 = icmp ne i32 %r458, 0
  br i1 %r459, label %bb4, label %bb3

bb4:                                              ; preds = %bb7
  %r460 = icmp slt i32 %r454, %r445
  br i1 %r460, label %bb8, label %bb9

bb8:                                              ; preds = %bb4
  %r461 = add i32 1, 0
  br label %bb10

bb9:                                              ; preds = %bb4
  %r462 = add i32 0, 0
  br label %bb10

bb10:                                             ; preds = %bb9, %bb8
  %r463 = phi i32 [ %r461, %bb8 ], [ %r462, %bb9 ]
  %r464 = icmp ne i32 %r463, 0
  br i1 %r464, label %bb2, label %bb3

bb2:                                              ; preds = %bb10
  %r465 = add i32 0, 0
  br label %bb11

bb11:                                             ; preds = %bb16, %bb2
  %r466 = phi i32 [ %r465, %bb2 ], [ %r502, %bb16 ]
  %r467 = icmp slt i32 %r466, 2
  br i1 %r467, label %bb12, label %bb13

bb12:                                             ; preds = %bb11
  %r468 = add i32 0, 0
  br label %bb14

bb14:                                             ; preds = %bb19, %bb12
  %r469 = phi i32 [ %r468, %bb12 ], [ %r500, %bb19 ]
  %r470 = icmp slt i32 %r469, 3
  br i1 %r470, label %bb15, label %bb16

bb15:                                             ; preds = %bb14
  %r471 = add i32 0, 0
  br label %bb17

bb17:                                             ; preds = %bb22, %bb15
  %r472 = phi i32 [ %r471, %bb15 ], [ %r478, %bb22 ]
  %r473 = icmp slt i32 %r472, 4
  br i1 %r473, label %bb18, label %bb19

bb18:                                             ; preds = %bb17
  %r474 = add i32 0, 0
  br label %bb20

bb20:                                             ; preds = %bb25, %bb18
  %r475 = phi i32 [ %r474, %bb18 ], [ %r498, %bb25 ]
  %r476 = icmp slt i32 %r475, 5
  br i1 %r476, label %bb21, label %bb22

bb21:                                             ; preds = %bb20
  %r479 = add i32 0, 0
  br label %bb23

bb23:                                             ; preds = %bb28, %bb21
  %r480 = phi i32 [ %r479, %bb21 ], [ %r496, %bb28 ]
  %r481 = icmp slt i32 %r480, 6
  br i1 %r481, label %bb24, label %bb25

bb24:                                             ; preds = %bb23
  %r482 = add i32 0, 0
  br label %bb26

bb26:                                             ; preds = %bb27, %bb24
  %r483 = phi i32 [ %r482, %bb24 ], [ %r494, %bb27 ]
  %r484 = icmp slt i32 %r483, 2
  br i1 %r484, label %bb27, label %bb28

bb27:                                             ; preds = %bb26
  %r135 = getelementptr [10 x %my_struct_6], ptr @arr1, i32 0, i32 %r454
  %r137 = getelementptr %my_struct_6, ptr %r135, i32 0, i32 0
  %r138 = getelementptr [2 x %my_struct_5], ptr %r137, i32 0, i32 %r466
  %r140 = getelementptr %my_struct_5, ptr %r138, i32 0, i32 0
  %r141 = getelementptr [3 x %my_struct_4], ptr %r140, i32 0, i32 %r469
  %r143 = getelementptr %my_struct_4, ptr %r141, i32 0, i32 0
  %r144 = getelementptr [4 x %my_struct_3], ptr %r143, i32 0, i32 %r472
  %r146 = getelementptr %my_struct_3, ptr %r144, i32 0, i32 0
  %r147 = getelementptr [5 x %my_struct_2], ptr %r146, i32 0, i32 %r475
  %r149 = getelementptr %my_struct_2, ptr %r147, i32 0, i32 0
  %r150 = getelementptr [8 x %my_struct_1], ptr %r149, i32 0, i32 %r480
  %r152 = getelementptr %my_struct_1, ptr %r150, i32 0, i32 0
  %r153 = getelementptr [7 x i32], ptr %r152, i32 0, i32 %r483
  %r485 = add i32 %r454, %r466
  %r486 = add i32 %r485, %r469
  %r487 = add i32 %r486, %r472
  %r488 = add i32 %r487, %r475
  %r489 = add i32 %r488, %r480
  %r490 = add i32 %r489, %r483
  %r491 = add i32 %r490, %r443
  %r492 = add i32 %r491, %r445
  store i32 %r492, ptr %r153, align 4
  %r493 = add i32 %r483, 1
  %r494 = add i32 %r493, 0
  br label %bb26

bb28:                                             ; preds = %bb26
  %r495 = add i32 %r480, 1
  %r496 = add i32 %r495, 0
  br label %bb23

bb25:                                             ; preds = %bb23
  %r497 = add i32 %r475, 1
  %r498 = add i32 %r497, 0
  br label %bb20

bb22:                                             ; preds = %bb20
  %r477 = add i32 %r472, 1
  %r478 = add i32 %r477, 0
  br label %bb17

bb19:                                             ; preds = %bb17
  %r499 = add i32 %r469, 1
  %r500 = add i32 %r499, 0
  br label %bb14

bb16:                                             ; preds = %bb14
  %r501 = add i32 %r466, 1
  %r502 = add i32 %r501, 0
  br label %bb11

bb13:                                             ; preds = %bb11
  %r503 = add i32 %r454, 1
  %r504 = add i32 %r503, 0
  br label %bb1

bb3:                                              ; preds = %bb10, %bb7
  ret i32 0
}

define i32 @loop2() {
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

bb29:                                             ; preds = %bb34, %loop2
  %r534 = phi i32 [ %r533, %loop2 ], [ %r540, %bb34 ]
  %r535 = icmp slt i32 %r534, 10
  br i1 %r535, label %bb30, label %bb31

bb30:                                             ; preds = %bb29
  %r536 = add i32 0, 0
  br label %bb32

bb32:                                             ; preds = %bb37, %bb30
  %r537 = phi i32 [ %r536, %bb30 ], [ %r570, %bb37 ]
  %r538 = icmp slt i32 %r537, 2
  br i1 %r538, label %bb33, label %bb34

bb33:                                             ; preds = %bb32
  %r541 = add i32 0, 0
  br label %bb35

bb35:                                             ; preds = %bb40, %bb33
  %r542 = phi i32 [ %r541, %bb33 ], [ %r568, %bb40 ]
  %r543 = icmp slt i32 %r542, 3
  br i1 %r543, label %bb36, label %bb37

bb36:                                             ; preds = %bb35
  %r544 = add i32 0, 0
  br label %bb38

bb38:                                             ; preds = %bb43, %bb36
  %r545 = phi i32 [ %r544, %bb36 ], [ %r566, %bb43 ]
  %r546 = icmp slt i32 %r545, 2
  br i1 %r546, label %bb39, label %bb40

bb39:                                             ; preds = %bb38
  %r547 = add i32 0, 0
  br label %bb41

bb41:                                             ; preds = %bb46, %bb39
  %r548 = phi i32 [ %r547, %bb39 ], [ %r554, %bb46 ]
  %r549 = icmp slt i32 %r548, 4
  br i1 %r549, label %bb42, label %bb43

bb42:                                             ; preds = %bb41
  %r550 = add i32 0, 0
  br label %bb44

bb44:                                             ; preds = %bb49, %bb42
  %r551 = phi i32 [ %r550, %bb42 ], [ %r559, %bb49 ]
  %r552 = icmp slt i32 %r551, 8
  br i1 %r552, label %bb45, label %bb46

bb45:                                             ; preds = %bb44
  %r555 = add i32 0, 0
  br label %bb47

bb47:                                             ; preds = %bb48, %bb45
  %r556 = phi i32 [ %r555, %bb45 ], [ %r564, %bb48 ]
  %r557 = icmp slt i32 %r556, 7
  br i1 %r557, label %bb48, label %bb49

bb48:                                             ; preds = %bb47
  %r207 = getelementptr [10 x %my_struct_6], ptr @arr2, i32 0, i32 %r534
  %r209 = getelementptr %my_struct_6, ptr %r207, i32 0, i32 0
  %r210 = getelementptr [2 x %my_struct_5], ptr %r209, i32 0, i32 %r537
  %r212 = getelementptr %my_struct_5, ptr %r210, i32 0, i32 0
  %r213 = getelementptr [3 x %my_struct_4], ptr %r212, i32 0, i32 %r542
  %r215 = getelementptr %my_struct_4, ptr %r213, i32 0, i32 0
  %r216 = getelementptr [4 x %my_struct_3], ptr %r215, i32 0, i32 %r545
  %r218 = getelementptr %my_struct_3, ptr %r216, i32 0, i32 0
  %r219 = getelementptr [5 x %my_struct_2], ptr %r218, i32 0, i32 %r548
  %r221 = getelementptr %my_struct_2, ptr %r219, i32 0, i32 0
  %r222 = getelementptr [8 x %my_struct_1], ptr %r221, i32 0, i32 %r551
  %r224 = getelementptr %my_struct_1, ptr %r222, i32 0, i32 0
  %r225 = getelementptr [7 x i32], ptr %r224, i32 0, i32 %r556
  %r560 = add i32 %r534, %r537
  %r561 = add i32 %r560, %r545
  %r562 = add i32 %r561, %r556
  store i32 %r562, ptr %r225, align 4
  %r563 = add i32 %r556, 1
  %r564 = add i32 %r563, 0
  br label %bb47

bb49:                                             ; preds = %bb47
  %r558 = add i32 %r551, 1
  %r559 = add i32 %r558, 0
  br label %bb44

bb46:                                             ; preds = %bb44
  %r553 = add i32 %r548, 1
  %r554 = add i32 %r553, 0
  br label %bb41

bb43:                                             ; preds = %bb41
  %r565 = add i32 %r545, 1
  %r566 = add i32 %r565, 0
  br label %bb38

bb40:                                             ; preds = %bb38
  %r567 = add i32 %r542, 1
  %r568 = add i32 %r567, 0
  br label %bb35

bb37:                                             ; preds = %bb35
  %r569 = add i32 %r537, 1
  %r570 = add i32 %r569, 0
  br label %bb32

bb34:                                             ; preds = %bb32
  %r539 = add i32 %r534, 1
  %r540 = add i32 %r539, 0
  br label %bb29

bb31:                                             ; preds = %bb29
  ret i32 0
}

define i32 @loop3(i32 %r248, i32 %r250, i32 %r252, i32 %r254, i32 %r256, i32 %r258, i32 %r260) {
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

bb50:                                             ; preds = %bb91, %loop3
  %r640 = phi i32 [ %r638, %loop3 ], [ %r648, %bb91 ]
  %r641 = phi i32 [ %r639, %loop3 ], [ %r650, %bb91 ]
  %r642 = icmp slt i32 %r641, 10
  br i1 %r642, label %bb51, label %bb52

bb51:                                             ; preds = %bb50
  %r644 = add i32 0, 0
  br label %bb53

bb53:                                             ; preds = %bb88, %bb51
  %r645 = phi i32 [ %r640, %bb51 ], [ %r656, %bb88 ]
  %r646 = phi i32 [ %r644, %bb51 ], [ %r658, %bb88 ]
  %r647 = icmp slt i32 %r646, 100
  br i1 %r647, label %bb54, label %bb55

bb54:                                             ; preds = %bb53
  %r652 = add i32 0, 0
  br label %bb56

bb56:                                             ; preds = %bb85, %bb54
  %r653 = phi i32 [ %r645, %bb54 ], [ %r699, %bb85 ]
  %r654 = phi i32 [ %r652, %bb54 ], [ %r701, %bb85 ]
  %r655 = icmp slt i32 %r654, 1000
  br i1 %r655, label %bb57, label %bb58

bb57:                                             ; preds = %bb56
  %r660 = add i32 0, 0
  br label %bb59

bb59:                                             ; preds = %bb82, %bb57
  %r661 = phi i32 [ %r653, %bb57 ], [ %r668, %bb82 ]
  %r662 = phi i32 [ %r660, %bb57 ], [ %r670, %bb82 ]
  %r663 = icmp slt i32 %r662, 10000
  br i1 %r663, label %bb60, label %bb61

bb60:                                             ; preds = %bb59
  %r664 = add i32 0, 0
  br label %bb62

bb62:                                             ; preds = %bb79, %bb60
  %r665 = phi i32 [ %r661, %bb60 ], [ %r676, %bb79 ]
  %r666 = phi i32 [ %r664, %bb60 ], [ %r678, %bb79 ]
  %r667 = icmp slt i32 %r666, 100000
  br i1 %r667, label %bb63, label %bb64

bb63:                                             ; preds = %bb62
  %r672 = add i32 0, 0
  br label %bb65

bb65:                                             ; preds = %bb76, %bb63
  %r673 = phi i32 [ %r672, %bb63 ], [ %r686, %bb76 ]
  %r674 = phi i32 [ %r665, %bb63 ], [ %r684, %bb76 ]
  %r675 = icmp slt i32 %r673, 1000000
  br i1 %r675, label %bb66, label %bb67

bb66:                                             ; preds = %bb65
  %r680 = add i32 0, 0
  br label %bb68

bb68:                                             ; preds = %bb73, %bb66
  %r681 = phi i32 [ %r674, %bb66 ], [ %r695, %bb73 ]
  %r682 = phi i32 [ %r680, %bb66 ], [ %r697, %bb73 ]
  %r683 = icmp slt i32 %r682, 10000000
  br i1 %r683, label %bb69, label %bb70

bb69:                                             ; preds = %bb68
  %r688 = sdiv i32 %r681, 817
  %r689 = mul i32 %r688, 817
  %r690 = sub i32 %r681, %r689
  %r289 = getelementptr [10 x %my_struct_6], ptr @arr1, i32 0, i32 %r641
  %r291 = getelementptr %my_struct_6, ptr %r289, i32 0, i32 0
  %r292 = getelementptr [2 x %my_struct_5], ptr %r291, i32 0, i32 %r646
  %r294 = getelementptr %my_struct_5, ptr %r292, i32 0, i32 0
  %r295 = getelementptr [3 x %my_struct_4], ptr %r294, i32 0, i32 %r654
  %r297 = getelementptr %my_struct_4, ptr %r295, i32 0, i32 0
  %r298 = getelementptr [4 x %my_struct_3], ptr %r297, i32 0, i32 %r662
  %r300 = getelementptr %my_struct_3, ptr %r298, i32 0, i32 0
  %r301 = getelementptr [5 x %my_struct_2], ptr %r300, i32 0, i32 %r666
  %r303 = getelementptr %my_struct_2, ptr %r301, i32 0, i32 0
  %r304 = getelementptr [8 x %my_struct_1], ptr %r303, i32 0, i32 %r673
  %r306 = getelementptr %my_struct_1, ptr %r304, i32 0, i32 0
  %r307 = getelementptr [7 x i32], ptr %r306, i32 0, i32 %r682
  %r691 = load i32, ptr %r307, align 4
  %r692 = add i32 %r690, %r691
  %r311 = getelementptr [10 x %my_struct_6], ptr @arr2, i32 0, i32 %r641
  %r313 = getelementptr %my_struct_6, ptr %r311, i32 0, i32 0
  %r314 = getelementptr [2 x %my_struct_5], ptr %r313, i32 0, i32 %r646
  %r316 = getelementptr %my_struct_5, ptr %r314, i32 0, i32 0
  %r317 = getelementptr [3 x %my_struct_4], ptr %r316, i32 0, i32 %r654
  %r319 = getelementptr %my_struct_4, ptr %r317, i32 0, i32 0
  %r320 = getelementptr [4 x %my_struct_3], ptr %r319, i32 0, i32 %r662
  %r322 = getelementptr %my_struct_3, ptr %r320, i32 0, i32 0
  %r323 = getelementptr [5 x %my_struct_2], ptr %r322, i32 0, i32 %r666
  %r325 = getelementptr %my_struct_2, ptr %r323, i32 0, i32 0
  %r326 = getelementptr [8 x %my_struct_1], ptr %r325, i32 0, i32 %r673
  %r328 = getelementptr %my_struct_1, ptr %r326, i32 0, i32 0
  %r329 = getelementptr [7 x i32], ptr %r328, i32 0, i32 %r682
  %r693 = load i32, ptr %r329, align 4
  %r694 = add i32 %r692, %r693
  %r695 = add i32 %r694, 0
  %r696 = add i32 %r682, 1
  %r697 = add i32 %r696, 0
  %r698 = icmp sge i32 %r697, %r629
  br i1 %r698, label %bb71, label %bb72

bb71:                                             ; preds = %bb69
  br label %bb70

bb72:                                             ; preds = %bb69
  br label %bb73

bb73:                                             ; preds = %bb72
  br label %bb68

bb70:                                             ; preds = %bb71, %bb68
  %r684 = phi i32 [ %r681, %bb68 ], [ %r695, %bb71 ]
  %r685 = add i32 %r673, 1
  %r686 = add i32 %r685, 0
  %r687 = icmp sge i32 %r686, %r627
  br i1 %r687, label %bb74, label %bb75

bb74:                                             ; preds = %bb70
  br label %bb67

bb75:                                             ; preds = %bb70
  br label %bb76

bb76:                                             ; preds = %bb75
  br label %bb65

bb67:                                             ; preds = %bb74, %bb65
  %r676 = phi i32 [ %r674, %bb65 ], [ %r684, %bb74 ]
  %r677 = add i32 %r666, 1
  %r678 = add i32 %r677, 0
  %r679 = icmp sge i32 %r678, %r625
  br i1 %r679, label %bb77, label %bb78

bb77:                                             ; preds = %bb67
  br label %bb64

bb78:                                             ; preds = %bb67
  br label %bb79

bb79:                                             ; preds = %bb78
  br label %bb62

bb64:                                             ; preds = %bb77, %bb62
  %r668 = phi i32 [ %r665, %bb62 ], [ %r676, %bb77 ]
  %r669 = add i32 %r662, 1
  %r670 = add i32 %r669, 0
  %r671 = icmp sge i32 %r670, %r623
  br i1 %r671, label %bb80, label %bb81

bb80:                                             ; preds = %bb64
  br label %bb61

bb81:                                             ; preds = %bb64
  br label %bb82

bb82:                                             ; preds = %bb81
  br label %bb59

bb61:                                             ; preds = %bb80, %bb59
  %r699 = phi i32 [ %r661, %bb59 ], [ %r668, %bb80 ]
  %r700 = add i32 %r654, 1
  %r701 = add i32 %r700, 0
  %r702 = icmp sge i32 %r701, %r621
  br i1 %r702, label %bb83, label %bb84

bb83:                                             ; preds = %bb61
  br label %bb58

bb84:                                             ; preds = %bb61
  br label %bb85

bb85:                                             ; preds = %bb84
  br label %bb56

bb58:                                             ; preds = %bb83, %bb56
  %r656 = phi i32 [ %r653, %bb56 ], [ %r699, %bb83 ]
  %r657 = add i32 %r646, 1
  %r658 = add i32 %r657, 0
  %r659 = icmp sge i32 %r658, %r619
  br i1 %r659, label %bb86, label %bb87

bb86:                                             ; preds = %bb58
  br label %bb55

bb87:                                             ; preds = %bb58
  br label %bb88

bb88:                                             ; preds = %bb87
  br label %bb53

bb55:                                             ; preds = %bb86, %bb53
  %r648 = phi i32 [ %r645, %bb53 ], [ %r656, %bb86 ]
  %r649 = add i32 %r641, 1
  %r650 = add i32 %r649, 0
  %r651 = icmp sge i32 %r650, %r617
  br i1 %r651, label %bb89, label %bb90

bb89:                                             ; preds = %bb55
  br label %bb52

bb90:                                             ; preds = %bb55
  br label %bb91

bb91:                                             ; preds = %bb90
  br label %bb50

bb52:                                             ; preds = %bb89, %bb50
  %r643 = phi i32 [ %r640, %bb50 ], [ %r648, %bb89 ]
  ret i32 %r643
}

define i32 @main() {
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

; Function Attrs: nofree nounwind ssp uwtable(sync)
define internal void @__GLOBAL_init_65535() #0 section "__TEXT,__StaticInit,regular,pure_instructions" {
  %1 = tail call i32 @__cxa_atexit(ptr nonnull @after_main, ptr null, ptr nonnull @__dso_handle) #6
  ret void
}

; Function Attrs: nofree nounwind ssp uwtable(sync)
define void @after_main() #0 {
  %1 = load i32, ptr @_sysy_idx, align 4, !tbaa !5
  %2 = icmp sgt i32 %1, 1
  br i1 %2, label %15, label %3

3:                                                ; preds = %0
  %4 = load i32, ptr @_sysy_h, align 4, !tbaa !5
  %5 = load i32, ptr @_sysy_m, align 4, !tbaa !5
  %6 = load i32, ptr @_sysy_s, align 4, !tbaa !5
  %7 = load i32, ptr @_sysy_us, align 4, !tbaa !5
  br label %8

8:                                                ; preds = %15, %3
  %9 = phi i32 [ %7, %3 ], [ %37, %15 ]
  %10 = phi i32 [ %6, %3 ], [ %41, %15 ]
  %11 = phi i32 [ %5, %3 ], [ %45, %15 ]
  %12 = phi i32 [ %4, %3 ], [ %44, %15 ]
  %13 = load ptr, ptr @__stderrp, align 8, !tbaa !9
  %14 = tail call i32 (ptr, ptr, ...) @fprintf(ptr noundef %13, ptr noundef nonnull @.str.6, i32 noundef %12, i32 noundef %11, i32 noundef %10, i32 noundef %9) #6
  ret void

15:                                               ; preds = %15, %0
  %16 = phi i64 [ %46, %15 ], [ 1, %0 ]
  %17 = load ptr, ptr @__stderrp, align 8, !tbaa !9
  %18 = getelementptr inbounds [1024 x i32], ptr @_sysy_l1, i64 0, i64 %16
  %19 = load i32, ptr %18, align 4, !tbaa !5
  %20 = getelementptr inbounds [1024 x i32], ptr @_sysy_l2, i64 0, i64 %16
  %21 = load i32, ptr %20, align 4, !tbaa !5
  %22 = getelementptr inbounds [1024 x i32], ptr @_sysy_h, i64 0, i64 %16
  %23 = load i32, ptr %22, align 4, !tbaa !5
  %24 = getelementptr inbounds [1024 x i32], ptr @_sysy_m, i64 0, i64 %16
  %25 = load i32, ptr %24, align 4, !tbaa !5
  %26 = getelementptr inbounds [1024 x i32], ptr @_sysy_s, i64 0, i64 %16
  %27 = load i32, ptr %26, align 4, !tbaa !5
  %28 = getelementptr inbounds [1024 x i32], ptr @_sysy_us, i64 0, i64 %16
  %29 = load i32, ptr %28, align 4, !tbaa !5
  %30 = tail call i32 (ptr, ptr, ...) @fprintf(ptr noundef %17, ptr noundef nonnull @.str.5, i32 noundef %19, i32 noundef %21, i32 noundef %23, i32 noundef %25, i32 noundef %27, i32 noundef %29) #6
  %31 = load i32, ptr %28, align 4, !tbaa !5
  %32 = load i32, ptr @_sysy_us, align 4, !tbaa !5
  %33 = add nsw i32 %32, %31
  %34 = load i32, ptr %26, align 4, !tbaa !5
  %35 = load i32, ptr @_sysy_s, align 4, !tbaa !5
  %36 = add nsw i32 %35, %34
  %37 = srem i32 %33, 1000000
  store i32 %37, ptr @_sysy_us, align 4, !tbaa !5
  %38 = load i32, ptr %24, align 4, !tbaa !5
  %39 = load i32, ptr @_sysy_m, align 4, !tbaa !5
  %40 = add nsw i32 %39, %38
  %41 = srem i32 %36, 60
  store i32 %41, ptr @_sysy_s, align 4, !tbaa !5
  %42 = load i32, ptr %22, align 4, !tbaa !5
  %43 = load i32, ptr @_sysy_h, align 4, !tbaa !5
  %44 = add nsw i32 %43, %42
  store i32 %44, ptr @_sysy_h, align 4, !tbaa !5
  %45 = srem i32 %40, 60
  store i32 %45, ptr @_sysy_m, align 4, !tbaa !5
  %46 = add nuw nsw i64 %16, 1
  %47 = load i32, ptr @_sysy_idx, align 4, !tbaa !5
  %48 = sext i32 %47 to i64
  %49 = icmp slt i64 %46, %48
  br i1 %49, label %15, label %8, !llvm.loop !11
}

; Function Attrs: nofree nounwind
declare i32 @__cxa_atexit(ptr, ptr, ptr) local_unnamed_addr #1

; Function Attrs: nofree nounwind
declare noundef i32 @fprintf(ptr nocapture noundef, ptr nocapture noundef readonly, ...) local_unnamed_addr #2

; Function Attrs: nofree nounwind ssp uwtable(sync)
define i32 @getint() #0 {
  %1 = alloca i32, align 4
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %1) #6
  %2 = call i32 (ptr, ...) @scanf(ptr noundef nonnull @.str, ptr noundef nonnull %1)
  %3 = load i32, ptr %1, align 4, !tbaa !5
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %1) #6
  ret i32 %3
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #3

; Function Attrs: nofree nounwind
declare noundef i32 @scanf(ptr nocapture noundef readonly, ...) local_unnamed_addr #2

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #3

; Function Attrs: nofree nounwind ssp uwtable(sync)
define range(i32 -128, 128) i32 @getch() local_unnamed_addr #0 {
  %1 = alloca i8, align 1
  call void @llvm.lifetime.start.p0(i64 1, ptr nonnull %1) #6
  %2 = call i32 (ptr, ...) @scanf(ptr noundef nonnull @.str.1, ptr noundef nonnull %1)
  %3 = load i8, ptr %1, align 1, !tbaa !13
  %4 = sext i8 %3 to i32
  call void @llvm.lifetime.end.p0(i64 1, ptr nonnull %1) #6
  ret i32 %4
}

; Function Attrs: nofree nounwind ssp uwtable(sync)
define void @putint(i32 noundef %0) local_unnamed_addr #0 {
  %2 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef %0)
  ret void
}

; Function Attrs: nofree nounwind
declare noundef i32 @printf(ptr nocapture noundef readonly, ...) local_unnamed_addr #2

; Function Attrs: nofree nounwind ssp uwtable(sync)
define void @putch(i32 noundef %0) local_unnamed_addr #0 {
  %2 = tail call i32 @putchar(i32 %0)
  ret void
}

; Function Attrs: nofree nounwind
declare noundef i32 @putchar(i32 noundef) local_unnamed_addr #1

; Function Attrs: nofree nounwind ssp uwtable(sync)
define void @putarray(i32 noundef %0, ptr nocapture noundef readonly %1) local_unnamed_addr #0 {
  %3 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.2, i32 noundef %0)
  %4 = icmp sgt i32 %0, 0
  br i1 %4, label %5, label %7

5:                                                ; preds = %2
  %6 = zext nneg i32 %0 to i64
  br label %9

7:                                                ; preds = %9, %2
  %8 = tail call i32 @putchar(i32 10)
  ret void

9:                                                ; preds = %9, %5
  %10 = phi i64 [ 0, %5 ], [ %14, %9 ]
  %11 = getelementptr inbounds i32, ptr %1, i64 %10
  %12 = load i32, ptr %11, align 4, !tbaa !5
  %13 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.3, i32 noundef %12)
  %14 = add nuw nsw i64 %10, 1
  %15 = icmp eq i64 %14, %6
  br i1 %15, label %7, label %9, !llvm.loop !14
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind ssp willreturn memory(write, argmem: none, inaccessiblemem: none) uwtable(sync)
define void @before_main() local_unnamed_addr #4 {
  tail call void @llvm.memset.p0.i64(ptr noundef nonnull align 4 dereferenceable(4096) @_sysy_us, i8 0, i64 4096, i1 false), !tbaa !5
  tail call void @llvm.memset.p0.i64(ptr noundef nonnull align 4 dereferenceable(4096) @_sysy_s, i8 0, i64 4096, i1 false), !tbaa !5
  tail call void @llvm.memset.p0.i64(ptr noundef nonnull align 4 dereferenceable(4096) @_sysy_m, i8 0, i64 4096, i1 false), !tbaa !5
  tail call void @llvm.memset.p0.i64(ptr noundef nonnull align 4 dereferenceable(4096) @_sysy_h, i8 0, i64 4096, i1 false), !tbaa !5
  store i32 1, ptr @_sysy_idx, align 4, !tbaa !5
  ret void
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #5

; Function Attrs: nofree nounwind ssp uwtable(sync)
define void @_sysy_starttime(i32 noundef %0) #0 {
  %2 = load i32, ptr @_sysy_idx, align 4, !tbaa !5
  %3 = sext i32 %2 to i64
  %4 = getelementptr inbounds [1024 x i32], ptr @_sysy_l1, i64 0, i64 %3
  store i32 %0, ptr %4, align 4, !tbaa !5
  %5 = tail call i32 @gettimeofday(ptr noundef nonnull @_sysy_start, ptr noundef null)
  ret void
}

; Function Attrs: nofree nounwind
declare noundef i32 @gettimeofday(ptr nocapture noundef, ptr nocapture noundef) local_unnamed_addr #2

; Function Attrs: nofree nounwind ssp uwtable(sync)
define void @_sysy_stoptime(i32 noundef %0) #0 {
  %2 = tail call i32 @gettimeofday(ptr noundef nonnull @_sysy_end, ptr noundef null)
  %3 = load i32, ptr @_sysy_idx, align 4, !tbaa !5
  %4 = sext i32 %3 to i64
  %5 = getelementptr inbounds [1024 x i32], ptr @_sysy_l2, i64 0, i64 %4
  store i32 %0, ptr %5, align 4, !tbaa !5
  %6 = load i64, ptr @_sysy_end, align 8, !tbaa !15
  %7 = load i64, ptr @_sysy_start, align 8, !tbaa !15
  %8 = sub nsw i64 %6, %7
  %9 = load i32, ptr getelementptr inbounds (i8, ptr @_sysy_end, i64 8), align 8, !tbaa !18
  %10 = load i32, ptr getelementptr inbounds (i8, ptr @_sysy_start, i64 8), align 8, !tbaa !18
  %11 = getelementptr inbounds [1024 x i32], ptr @_sysy_us, i64 0, i64 %4
  %12 = load i32, ptr %11, align 4, !tbaa !5
  %13 = trunc i64 %8 to i32
  %14 = mul i32 %13, 1000000
  %15 = sub i32 %9, %10
  %16 = add i32 %15, %14
  %17 = add i32 %16, %12
  %18 = freeze i32 %17
  %19 = sdiv i32 %18, 1000000
  %20 = getelementptr inbounds [1024 x i32], ptr @_sysy_s, i64 0, i64 %4
  %21 = load i32, ptr %20, align 4, !tbaa !5
  %22 = add nsw i32 %19, %21
  %23 = mul i32 %19, 1000000
  %24 = sub i32 %18, %23
  store i32 %24, ptr %11, align 4, !tbaa !5
  %25 = freeze i32 %22
  %26 = sdiv i32 %25, 60
  %27 = getelementptr inbounds [1024 x i32], ptr @_sysy_m, i64 0, i64 %4
  %28 = load i32, ptr %27, align 4, !tbaa !5
  %29 = add nsw i32 %26, %28
  %30 = mul i32 %26, 60
  %31 = sub i32 %25, %30
  store i32 %31, ptr %20, align 4, !tbaa !5
  %32 = freeze i32 %29
  %33 = sdiv i32 %32, 60
  %34 = getelementptr inbounds [1024 x i32], ptr @_sysy_h, i64 0, i64 %4
  %35 = load i32, ptr %34, align 4, !tbaa !5
  %36 = add nsw i32 %35, %33
  store i32 %36, ptr %34, align 4, !tbaa !5
  %37 = mul i32 %33, 60
  %38 = sub i32 %32, %37
  store i32 %38, ptr %27, align 4, !tbaa !5
  %39 = add nsw i32 %3, 1
  store i32 %39, ptr @_sysy_idx, align 4, !tbaa !5
  ret void
}

attributes #0 = { nofree nounwind ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #1 = { nofree nounwind }
attributes #2 = { nofree nounwind "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #3 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #4 = { mustprogress nofree norecurse nosync nounwind ssp willreturn memory(write, argmem: none, inaccessiblemem: none) uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #5 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #6 = { nounwind }

!llvm.ident = !{!0}
!llvm.module.flags = !{!1, !2, !3, !4}

!0 = !{!"Homebrew clang version 19.1.0"}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{i32 7, !"frame-pointer", i32 1}
!5 = !{!6, !6, i64 0}
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!10, !10, i64 0}
!10 = !{!"any pointer", !7, i64 0}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = !{!7, !7, i64 0}
!14 = distinct !{!14, !12}
!15 = !{!16, !17, i64 0}
!16 = !{!"timeval", !17, i64 0, !6, i64 8}
!17 = !{!"long", !7, i64 0}
!18 = !{!16, !6, i64 8}
