; ModuleID = 'llvm-link'
source_filename = "llvm-link"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-macosx15.0.0"

%struct.timeval = type { i64, i32 }

@base = global i32 16
@a = global [30000010 x i32] zeroinitializer
@ans = global i32 0
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

define i32 @getMaxNum(i32 %r100, ptr %r102) {
getMaxNum:
  %r393 = add i32 0, 0
  %r394 = add i32 %r100, 0
  %r395 = add i32 0, 0
  %r396 = add i32 0, 0
  %r397 = add i32 0, 0
  %r398 = add i32 0, 0
  br label %bb1

bb1:                                              ; preds = %bb6, %getMaxNum
  %r399 = phi i32 [ %r396, %getMaxNum ], [ %r406, %bb6 ]
  %r400 = phi i32 [ %r398, %getMaxNum ], [ %r408, %bb6 ]
  %r401 = icmp slt i32 %r400, %r394
  br i1 %r401, label %bb2, label %bb3

bb2:                                              ; preds = %bb1
  %r110 = getelementptr i32, ptr %r102, i32 %r400
  %r402 = load i32, ptr %r110, align 4
  %r403 = icmp sgt i32 %r402, %r399
  br i1 %r403, label %bb4, label %bb5

bb4:                                              ; preds = %bb2
  %r114 = getelementptr i32, ptr %r102, i32 %r400
  %r404 = load i32, ptr %r114, align 4
  %r405 = add i32 %r404, 0
  br label %bb6

bb5:                                              ; preds = %bb2
  br label %bb6

bb6:                                              ; preds = %bb5, %bb4
  %r406 = phi i32 [ %r405, %bb4 ], [ %r399, %bb5 ]
  %r407 = add i32 %r400, 1
  %r408 = add i32 %r407, 0
  br label %bb1

bb3:                                              ; preds = %bb1
  ret i32 %r399
}

define i32 @getNumPos(i32 %r120, i32 %r122) {
getNumPos:
  %r421 = add i32 0, 0
  %r422 = add i32 %r120, 0
  %r423 = add i32 0, 0
  %r424 = add i32 %r122, 0
  %r425 = add i32 0, 0
  %r426 = add i32 1, 0
  %r427 = add i32 0, 0
  %r428 = add i32 0, 0
  br label %bb7

bb7:                                              ; preds = %bb8, %getNumPos
  %r429 = phi i32 [ %r422, %getNumPos ], [ %r434, %bb8 ]
  %r430 = phi i32 [ %r428, %getNumPos ], [ %r436, %bb8 ]
  %r431 = icmp slt i32 %r430, %r424
  br i1 %r431, label %bb8, label %bb9

bb8:                                              ; preds = %bb7
  %r432 = load i32, ptr @base, align 4
  %r433 = sdiv i32 %r429, %r432
  %r434 = add i32 %r433, 0
  %r435 = add i32 %r430, 1
  %r436 = add i32 %r435, 0
  br label %bb7

bb9:                                              ; preds = %bb7
  %r437 = load i32, ptr @base, align 4
  %r438 = sdiv i32 %r429, %r437
  %r439 = load i32, ptr @base, align 4
  %r440 = mul i32 %r438, %r439
  %r441 = sub i32 %r429, %r440
  ret i32 %r441
}

define void @radixSort(i32 %r141, ptr %r143, i32 %r144, i32 %r146) {
radixSort:
  %r493 = add i32 0, 0
  %r494 = add i32 0, 0
  %r495 = add i32 0, 0
  %r496 = add i32 0, 0
  %r497 = add i32 0, 0
  %r498 = add i32 0, 0
  %r499 = add i32 0, 0
  %r500 = add i32 0, 0
  %r501 = add i32 0, 0
  %r502 = add i32 0, 0
  %r503 = add i32 0, 0
  %r504 = add i32 0, 0
  %r505 = add i32 0, 0
  %r506 = add i32 0, 0
  %r507 = add i32 %r141, 0
  %r508 = add i32 0, 0
  %r509 = add i32 %r144, 0
  %r510 = add i32 0, 0
  %r511 = add i32 %r146, 0
  %r148 = alloca [16 x i32], align 4
  %r149 = alloca [16 x i32], align 4
  %r150 = alloca [16 x i32], align 4
  %r512 = add i32 0, 0
  %r513 = add i32 0, 0
  br label %bb10

bb10:                                             ; preds = %bb11, %radixSort
  %r514 = phi i32 [ %r513, %radixSort ], [ %r518, %bb11 ]
  %r515 = load i32, ptr @base, align 4
  %r516 = icmp slt i32 %r514, %r515
  br i1 %r516, label %bb11, label %bb12

bb11:                                             ; preds = %bb10
  %r155 = getelementptr [16 x i32], ptr %r148, i32 0, i32 %r514
  store i32 0, ptr %r155, align 4
  %r157 = getelementptr [16 x i32], ptr %r149, i32 0, i32 %r514
  store i32 0, ptr %r157, align 4
  %r159 = getelementptr [16 x i32], ptr %r150, i32 0, i32 %r514
  store i32 0, ptr %r159, align 4
  %r517 = add i32 %r514, 1
  %r518 = add i32 %r517, 0
  br label %bb10

bb12:                                             ; preds = %bb10
  %r519 = icmp eq i32 %r507, -1
  br i1 %r519, label %bb17, label %bb18

bb17:                                             ; preds = %bb12
  %r612 = add i32 1, 0
  br label %bb19

bb18:                                             ; preds = %bb12
  %r520 = add i32 0, 0
  br label %bb19

bb19:                                             ; preds = %bb18, %bb17
  %r521 = phi i32 [ %r612, %bb17 ], [ %r520, %bb18 ]
  %r522 = icmp ne i32 %r521, 0
  br i1 %r522, label %bb13, label %bb16

bb16:                                             ; preds = %bb19
  %r523 = add i32 %r509, 1
  %r524 = icmp sge i32 %r523, %r511
  br i1 %r524, label %bb20, label %bb21

bb20:                                             ; preds = %bb16
  %r610 = add i32 1, 0
  br label %bb22

bb21:                                             ; preds = %bb16
  %r611 = add i32 0, 0
  br label %bb22

bb22:                                             ; preds = %bb21, %bb20
  %r525 = phi i32 [ %r610, %bb20 ], [ %r611, %bb21 ]
  %r526 = icmp ne i32 %r525, 0
  br i1 %r526, label %bb13, label %bb14

bb13:                                             ; preds = %bb22, %bb19
  ret void

bb14:                                             ; preds = %bb22
  br label %bb15

bb15:                                             ; preds = %bb14
  %r527 = add i32 %r509, 0
  br label %bb23

bb23:                                             ; preds = %bb24, %bb15
  %r528 = phi i32 [ %r527, %bb15 ], [ %r539, %bb24 ]
  %r529 = icmp slt i32 %r528, %r511
  br i1 %r529, label %bb24, label %bb25

bb24:                                             ; preds = %bb23
  %r182 = getelementptr i32, ptr %r143, i32 %r528
  %r530 = load i32, ptr %r182, align 4
  %r531 = call i32 @getNumPos(i32 %r530, i32 %r507)
  %r532 = add i32 %r531, 0
  %r188 = getelementptr i32, ptr %r143, i32 %r528
  %r533 = load i32, ptr %r188, align 4
  %r534 = call i32 @getNumPos(i32 %r533, i32 %r507)
  %r535 = add i32 %r534, 0
  %r193 = getelementptr [16 x i32], ptr %r150, i32 0, i32 %r535
  %r195 = getelementptr [16 x i32], ptr %r150, i32 0, i32 %r532
  %r536 = load i32, ptr %r195, align 4
  %r537 = add i32 %r536, 1
  store i32 %r537, ptr %r193, align 4
  %r538 = add i32 %r528, 1
  %r539 = add i32 %r538, 0
  br label %bb23

bb25:                                             ; preds = %bb23
  %r201 = getelementptr [16 x i32], ptr %r148, i32 0, i32 0
  store i32 %r509, ptr %r201, align 4
  %r203 = getelementptr [16 x i32], ptr %r149, i32 0, i32 0
  %r205 = getelementptr [16 x i32], ptr %r150, i32 0, i32 0
  %r540 = load i32, ptr %r205, align 4
  %r541 = add i32 %r509, %r540
  store i32 %r541, ptr %r203, align 4
  %r542 = add i32 1, 0
  br label %bb26

bb26:                                             ; preds = %bb27, %bb25
  %r543 = phi i32 [ %r542, %bb25 ], [ %r609, %bb27 ]
  %r544 = load i32, ptr @base, align 4
  %r545 = icmp slt i32 %r543, %r544
  br i1 %r545, label %bb27, label %bb28

bb27:                                             ; preds = %bb26
  %r602 = sub i32 %r543, 1
  %r603 = add i32 %r602, 0
  %r214 = getelementptr [16 x i32], ptr %r148, i32 0, i32 %r543
  %r216 = getelementptr [16 x i32], ptr %r149, i32 0, i32 %r603
  %r604 = load i32, ptr %r216, align 4
  store i32 %r604, ptr %r214, align 4
  %r219 = getelementptr [16 x i32], ptr %r149, i32 0, i32 %r543
  %r221 = getelementptr [16 x i32], ptr %r148, i32 0, i32 %r543
  %r605 = load i32, ptr %r221, align 4
  %r224 = getelementptr [16 x i32], ptr %r150, i32 0, i32 %r543
  %r606 = load i32, ptr %r224, align 4
  %r607 = add i32 %r605, %r606
  store i32 %r607, ptr %r219, align 4
  %r608 = add i32 %r543, 1
  %r609 = add i32 %r608, 0
  br label %bb26

bb28:                                             ; preds = %bb26
  %r546 = add i32 0, 0
  br label %bb29

bb29:                                             ; preds = %bb34, %bb28
  %r547 = phi i32 [ %r546, %bb28 ], [ %r601, %bb34 ]
  %r548 = load i32, ptr @base, align 4
  %r549 = icmp slt i32 %r547, %r548
  br i1 %r549, label %bb30, label %bb31

bb30:                                             ; preds = %bb29
  br label %bb32

bb32:                                             ; preds = %bb37, %bb30
  %r234 = getelementptr [16 x i32], ptr %r148, i32 0, i32 %r547
  %r569 = load i32, ptr %r234, align 4
  %r237 = getelementptr [16 x i32], ptr %r149, i32 0, i32 %r547
  %r570 = load i32, ptr %r237, align 4
  %r571 = icmp slt i32 %r569, %r570
  br i1 %r571, label %bb33, label %bb34

bb33:                                             ; preds = %bb32
  %r240 = getelementptr [16 x i32], ptr %r148, i32 0, i32 %r547
  %r572 = load i32, ptr %r240, align 4
  %r573 = add i32 %r572, 0
  %r244 = getelementptr i32, ptr %r143, i32 %r573
  %r574 = load i32, ptr %r244, align 4
  %r575 = add i32 %r574, 0
  br label %bb35

bb35:                                             ; preds = %bb36, %bb33
  %r576 = phi i32 [ %r575, %bb33 ], [ %r585, %bb36 ]
  %r577 = call i32 @getNumPos(i32 %r576, i32 %r507)
  %r578 = icmp ne i32 %r577, %r547
  br i1 %r578, label %bb36, label %bb37

bb36:                                             ; preds = %bb35
  %r579 = add i32 %r576, 0
  %r580 = call i32 @getNumPos(i32 %r579, i32 %r507)
  %r581 = add i32 %r580, 0
  %r259 = getelementptr [16 x i32], ptr %r148, i32 0, i32 %r581
  %r582 = load i32, ptr %r259, align 4
  %r583 = add i32 %r582, 0
  %r262 = getelementptr i32, ptr %r143, i32 %r583
  %r584 = load i32, ptr %r262, align 4
  %r585 = add i32 %r584, 0
  %r586 = call i32 @getNumPos(i32 %r579, i32 %r507)
  %r587 = add i32 %r586, 0
  %r268 = getelementptr [16 x i32], ptr %r148, i32 0, i32 %r587
  %r588 = load i32, ptr %r268, align 4
  %r589 = add i32 %r588, 0
  %r271 = getelementptr i32, ptr %r143, i32 %r589
  store i32 %r579, ptr %r271, align 4
  %r590 = call i32 @getNumPos(i32 %r579, i32 %r507)
  %r591 = add i32 %r590, 0
  %r592 = call i32 @getNumPos(i32 %r579, i32 %r507)
  %r593 = add i32 %r592, 0
  %r281 = getelementptr [16 x i32], ptr %r148, i32 0, i32 %r593
  %r283 = getelementptr [16 x i32], ptr %r148, i32 0, i32 %r591
  %r594 = load i32, ptr %r283, align 4
  %r595 = add i32 %r594, 1
  store i32 %r595, ptr %r281, align 4
  br label %bb35

bb37:                                             ; preds = %bb35
  %r287 = getelementptr [16 x i32], ptr %r148, i32 0, i32 %r547
  %r596 = load i32, ptr %r287, align 4
  %r597 = add i32 %r596, 0
  %r291 = getelementptr i32, ptr %r143, i32 %r597
  store i32 %r576, ptr %r291, align 4
  %r294 = getelementptr [16 x i32], ptr %r148, i32 0, i32 %r547
  %r296 = getelementptr [16 x i32], ptr %r148, i32 0, i32 %r547
  %r598 = load i32, ptr %r296, align 4
  %r599 = add i32 %r598, 1
  store i32 %r599, ptr %r294, align 4
  br label %bb32

bb34:                                             ; preds = %bb32
  %r600 = add i32 %r547, 1
  %r601 = add i32 %r600, 0
  br label %bb29

bb31:                                             ; preds = %bb29
  %r550 = add i32 %r509, 0
  %r303 = getelementptr [16 x i32], ptr %r148, i32 0, i32 0
  store i32 %r509, ptr %r303, align 4
  %r305 = getelementptr [16 x i32], ptr %r149, i32 0, i32 0
  %r307 = getelementptr [16 x i32], ptr %r150, i32 0, i32 0
  %r551 = load i32, ptr %r307, align 4
  %r552 = add i32 %r509, %r551
  store i32 %r552, ptr %r305, align 4
  %r553 = add i32 0, 0
  br label %bb38

bb38:                                             ; preds = %bb43, %bb31
  %r554 = phi i32 [ %r553, %bb31 ], [ %r568, %bb43 ]
  %r555 = load i32, ptr @base, align 4
  %r556 = icmp slt i32 %r554, %r555
  br i1 %r556, label %bb39, label %bb40

bb39:                                             ; preds = %bb38
  %r557 = icmp sgt i32 %r554, 0
  br i1 %r557, label %bb41, label %bb42

bb41:                                             ; preds = %bb39
  %r558 = sub i32 %r554, 1
  %r559 = add i32 %r558, 0
  %r319 = getelementptr [16 x i32], ptr %r148, i32 0, i32 %r554
  %r321 = getelementptr [16 x i32], ptr %r149, i32 0, i32 %r559
  %r560 = load i32, ptr %r321, align 4
  store i32 %r560, ptr %r319, align 4
  %r324 = getelementptr [16 x i32], ptr %r149, i32 0, i32 %r554
  %r326 = getelementptr [16 x i32], ptr %r148, i32 0, i32 %r554
  %r561 = load i32, ptr %r326, align 4
  %r329 = getelementptr [16 x i32], ptr %r150, i32 0, i32 %r554
  %r562 = load i32, ptr %r329, align 4
  %r563 = add i32 %r561, %r562
  store i32 %r563, ptr %r324, align 4
  br label %bb43

bb42:                                             ; preds = %bb39
  br label %bb43

bb43:                                             ; preds = %bb42, %bb41
  %r564 = sub i32 %r507, 1
  %r335 = getelementptr [16 x i32], ptr %r148, i32 0, i32 %r554
  %r565 = load i32, ptr %r335, align 4
  %r338 = getelementptr [16 x i32], ptr %r149, i32 0, i32 %r554
  %r566 = load i32, ptr %r338, align 4
  call void @radixSort(i32 %r564, ptr %r143, i32 %r565, i32 %r566)
  %r567 = add i32 %r554, 1
  %r568 = add i32 %r567, 0
  br label %bb38

bb40:                                             ; preds = %bb38
  ret void
}

define i32 @main() {
main:
  %r622 = add i32 0, 0
  %r623 = call i32 @getint()
  %r624 = add i32 0, 0
  %r625 = add i32 %r623, 0
  %r626 = add i32 0, 0
  %r627 = add i32 0, 0
  br label %bb44

bb44:                                             ; preds = %bb45, %main
  %r628 = phi i32 [ %r627, %main ], [ %r632, %bb45 ]
  %r629 = icmp slt i32 %r628, %r625
  br i1 %r629, label %bb45, label %bb46

bb45:                                             ; preds = %bb44
  %r349 = getelementptr [30000010 x i32], ptr @a, i32 0, i32 %r628
  %r630 = call i32 @getint()
  store i32 %r630, ptr %r349, align 4
  %r631 = add i32 %r628, 1
  %r632 = add i32 %r631, 0
  br label %bb44

bb46:                                             ; preds = %bb44
  call void @_sysy_starttime(i32 97)
  call void @radixSort(i32 8, ptr @a, i32 0, i32 %r625)
  %r633 = add i32 0, 0
  br label %bb47

bb47:                                             ; preds = %bb48, %bb46
  %r634 = phi i32 [ %r633, %bb46 ], [ %r647, %bb48 ]
  %r635 = icmp slt i32 %r634, %r625
  br i1 %r635, label %bb48, label %bb49

bb48:                                             ; preds = %bb47
  %r636 = load i32, ptr @ans, align 4
  %r361 = getelementptr [30000010 x i32], ptr @a, i32 0, i32 %r634
  %r637 = load i32, ptr %r361, align 4
  %r364 = getelementptr [30000010 x i32], ptr @a, i32 0, i32 %r634
  %r638 = load i32, ptr %r364, align 4
  %r639 = add i32 2, %r634
  %r640 = sdiv i32 %r638, %r639
  %r641 = add i32 2, %r634
  %r642 = mul i32 %r640, %r641
  %r643 = sub i32 %r637, %r642
  %r644 = mul i32 %r634, %r643
  %r645 = add i32 %r636, %r644
  store i32 %r645, ptr @ans, align 4
  %r646 = add i32 %r634, 1
  %r647 = add i32 %r646, 0
  br label %bb47

bb49:                                             ; preds = %bb47
  %r648 = load i32, ptr @ans, align 4
  %r649 = icmp slt i32 %r648, 0
  br i1 %r649, label %bb50, label %bb51

bb50:                                             ; preds = %bb49
  %r651 = load i32, ptr @ans, align 4
  %r652 = sub i32 0, %r651
  store i32 %r652, ptr @ans, align 4
  br label %bb52

bb51:                                             ; preds = %bb49
  br label %bb52

bb52:                                             ; preds = %bb51, %bb50
  call void @_sysy_stoptime(i32 117)
  %r650 = load i32, ptr @ans, align 4
  call void @putint(i32 %r650)
  call void @putch(i32 10)
  ret i32 0
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
define void @putint(i32 noundef %0) #0 {
  %2 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef %0)
  ret void
}

; Function Attrs: nofree nounwind
declare noundef i32 @printf(ptr nocapture noundef readonly, ...) local_unnamed_addr #2

; Function Attrs: nofree nounwind ssp uwtable(sync)
define void @putch(i32 noundef %0) #0 {
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
