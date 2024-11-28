; ModuleID = 'llvm-link'
source_filename = "llvm-link"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-macosx15.0.0"

%struct.timeval = type { i64, i32 }

@a0 = global i32 0
@a1 = global i32 0
@a2 = global i32 0
@a3 = global i32 0
@a4 = global i32 0
@a5 = global i32 0
@a6 = global i32 0
@a7 = global i32 0
@a8 = global i32 0
@a9 = global i32 0
@a10 = global i32 0
@a11 = global i32 0
@a12 = global i32 0
@a13 = global i32 0
@a14 = global i32 0
@a15 = global i32 0
@a16 = global i32 0
@a17 = global i32 0
@a18 = global i32 0
@a19 = global i32 0
@a20 = global i32 0
@a21 = global i32 0
@a22 = global i32 0
@a23 = global i32 0
@a24 = global i32 0
@a25 = global i32 0
@a26 = global i32 0
@a27 = global i32 0
@a28 = global i32 0
@a29 = global i32 0
@a30 = global i32 0
@a31 = global i32 0
@a32 = global i32 0
@a33 = global i32 0
@a34 = global i32 0
@a35 = global i32 0
@a36 = global i32 0
@a37 = global i32 0
@a38 = global i32 0
@a39 = global i32 0
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

define i32 @testParam8(i32 %r100, i32 %r102, i32 %r104, i32 %r106, i32 %r108, i32 %r110, i32 %r112, i32 %r114) {
testParam8:
  %r407 = add i32 0, 0
  %r408 = add i32 %r100, 0
  %r409 = add i32 0, 0
  %r410 = add i32 %r102, 0
  %r411 = add i32 0, 0
  %r412 = add i32 %r104, 0
  %r413 = add i32 0, 0
  %r414 = add i32 %r106, 0
  %r415 = add i32 0, 0
  %r416 = add i32 %r108, 0
  %r417 = add i32 0, 0
  %r418 = add i32 %r110, 0
  %r419 = add i32 0, 0
  %r420 = add i32 %r112, 0
  %r421 = add i32 0, 0
  %r422 = add i32 %r114, 0
  %r423 = add i32 %r408, %r410
  %r424 = add i32 %r423, %r412
  %r425 = add i32 %r424, %r414
  %r426 = add i32 %r425, %r416
  %r427 = add i32 %r426, %r418
  %r428 = add i32 %r427, %r420
  %r429 = add i32 %r428, %r422
  ret i32 %r429
}

define i32 @testParam16(i32 %r131, i32 %r133, i32 %r135, i32 %r137, i32 %r139, i32 %r141, i32 %r143, i32 %r145, i32 %r147, i32 %r149, i32 %r151, i32 %r153, i32 %r155, i32 %r157, i32 %r159, i32 %r161) {
testParam16:
  %r478 = add i32 0, 0
  %r479 = add i32 %r131, 0
  %r480 = add i32 0, 0
  %r481 = add i32 %r133, 0
  %r482 = add i32 0, 0
  %r483 = add i32 %r135, 0
  %r484 = add i32 0, 0
  %r485 = add i32 %r137, 0
  %r486 = add i32 0, 0
  %r487 = add i32 %r139, 0
  %r488 = add i32 0, 0
  %r489 = add i32 %r141, 0
  %r490 = add i32 0, 0
  %r491 = add i32 %r143, 0
  %r492 = add i32 0, 0
  %r493 = add i32 %r145, 0
  %r494 = add i32 0, 0
  %r495 = add i32 %r147, 0
  %r496 = add i32 0, 0
  %r497 = add i32 %r149, 0
  %r498 = add i32 0, 0
  %r499 = add i32 %r151, 0
  %r500 = add i32 0, 0
  %r501 = add i32 %r153, 0
  %r502 = add i32 0, 0
  %r503 = add i32 %r155, 0
  %r504 = add i32 0, 0
  %r505 = add i32 %r157, 0
  %r506 = add i32 0, 0
  %r507 = add i32 %r159, 0
  %r508 = add i32 0, 0
  %r509 = add i32 %r161, 0
  %r510 = add i32 %r479, %r481
  %r511 = add i32 %r510, %r483
  %r512 = sub i32 %r511, %r485
  %r513 = sub i32 %r512, %r487
  %r514 = sub i32 %r513, %r489
  %r515 = sub i32 %r514, %r491
  %r516 = sub i32 %r515, %r493
  %r517 = add i32 %r516, %r495
  %r518 = add i32 %r517, %r497
  %r519 = add i32 %r518, %r499
  %r520 = add i32 %r519, %r501
  %r521 = add i32 %r520, %r503
  %r522 = add i32 %r521, %r505
  %r523 = add i32 %r522, %r507
  %r524 = add i32 %r523, %r509
  ret i32 %r524
}

define i32 @testParam32(i32 %r194, i32 %r196, i32 %r198, i32 %r200, i32 %r202, i32 %r204, i32 %r206, i32 %r208, i32 %r210, i32 %r212, i32 %r214, i32 %r216, i32 %r218, i32 %r220, i32 %r222, i32 %r224, i32 %r226, i32 %r228, i32 %r230, i32 %r232, i32 %r234, i32 %r236, i32 %r238, i32 %r240, i32 %r242, i32 %r244, i32 %r246, i32 %r248, i32 %r250, i32 %r252, i32 %r254, i32 %r256) {
testParam32:
  %r621 = add i32 0, 0
  %r622 = add i32 %r194, 0
  %r623 = add i32 0, 0
  %r624 = add i32 %r196, 0
  %r625 = add i32 0, 0
  %r626 = add i32 %r198, 0
  %r627 = add i32 0, 0
  %r628 = add i32 %r200, 0
  %r629 = add i32 0, 0
  %r630 = add i32 %r202, 0
  %r631 = add i32 0, 0
  %r632 = add i32 %r204, 0
  %r633 = add i32 0, 0
  %r634 = add i32 %r206, 0
  %r635 = add i32 0, 0
  %r636 = add i32 %r208, 0
  %r637 = add i32 0, 0
  %r638 = add i32 %r210, 0
  %r639 = add i32 0, 0
  %r640 = add i32 %r212, 0
  %r641 = add i32 0, 0
  %r642 = add i32 %r214, 0
  %r643 = add i32 0, 0
  %r644 = add i32 %r216, 0
  %r645 = add i32 0, 0
  %r646 = add i32 %r218, 0
  %r647 = add i32 0, 0
  %r648 = add i32 %r220, 0
  %r649 = add i32 0, 0
  %r650 = add i32 %r222, 0
  %r651 = add i32 0, 0
  %r652 = add i32 %r224, 0
  %r653 = add i32 0, 0
  %r654 = add i32 %r226, 0
  %r655 = add i32 0, 0
  %r656 = add i32 %r228, 0
  %r657 = add i32 0, 0
  %r658 = add i32 %r230, 0
  %r659 = add i32 0, 0
  %r660 = add i32 %r232, 0
  %r661 = add i32 0, 0
  %r662 = add i32 %r234, 0
  %r663 = add i32 0, 0
  %r664 = add i32 %r236, 0
  %r665 = add i32 0, 0
  %r666 = add i32 %r238, 0
  %r667 = add i32 0, 0
  %r668 = add i32 %r240, 0
  %r669 = add i32 0, 0
  %r670 = add i32 %r242, 0
  %r671 = add i32 0, 0
  %r672 = add i32 %r244, 0
  %r673 = add i32 0, 0
  %r674 = add i32 %r246, 0
  %r675 = add i32 0, 0
  %r676 = add i32 %r248, 0
  %r677 = add i32 0, 0
  %r678 = add i32 %r250, 0
  %r679 = add i32 0, 0
  %r680 = add i32 %r252, 0
  %r681 = add i32 0, 0
  %r682 = add i32 %r254, 0
  %r683 = add i32 0, 0
  %r684 = add i32 %r256, 0
  %r685 = add i32 %r622, %r624
  %r686 = add i32 %r685, %r626
  %r687 = add i32 %r686, %r628
  %r688 = add i32 %r687, %r630
  %r689 = add i32 %r688, %r632
  %r690 = add i32 %r689, %r634
  %r691 = add i32 %r690, %r636
  %r692 = add i32 %r691, %r638
  %r693 = add i32 %r692, %r640
  %r694 = add i32 %r693, %r642
  %r695 = add i32 %r694, %r644
  %r696 = add i32 %r695, %r646
  %r697 = add i32 %r696, %r648
  %r698 = add i32 %r697, %r650
  %r699 = add i32 %r698, %r652
  %r700 = add i32 %r699, %r654
  %r701 = add i32 %r700, %r656
  %r702 = sub i32 %r701, %r658
  %r703 = sub i32 %r702, %r660
  %r704 = sub i32 %r703, %r662
  %r705 = sub i32 %r704, %r664
  %r706 = sub i32 %r705, %r666
  %r707 = add i32 %r706, %r668
  %r708 = add i32 %r707, %r670
  %r709 = add i32 %r708, %r672
  %r710 = add i32 %r709, %r674
  %r711 = add i32 %r710, %r676
  %r712 = add i32 %r711, %r678
  %r713 = add i32 %r712, %r680
  %r714 = add i32 %r713, %r682
  %r715 = add i32 %r714, %r684
  ret i32 %r715
}

define i32 @main() {
main:
  call void @_sysy_starttime(i32 97)
  store i32 0, ptr @a0, align 4
  store i32 1, ptr @a1, align 4
  store i32 2, ptr @a2, align 4
  store i32 3, ptr @a3, align 4
  store i32 4, ptr @a4, align 4
  store i32 5, ptr @a5, align 4
  store i32 6, ptr @a6, align 4
  store i32 7, ptr @a7, align 4
  store i32 8, ptr @a8, align 4
  store i32 9, ptr @a9, align 4
  store i32 0, ptr @a10, align 4
  store i32 1, ptr @a11, align 4
  store i32 2, ptr @a12, align 4
  store i32 3, ptr @a13, align 4
  store i32 4, ptr @a14, align 4
  store i32 5, ptr @a15, align 4
  store i32 6, ptr @a16, align 4
  store i32 7, ptr @a17, align 4
  store i32 8, ptr @a18, align 4
  store i32 9, ptr @a19, align 4
  store i32 0, ptr @a20, align 4
  store i32 1, ptr @a21, align 4
  store i32 2, ptr @a22, align 4
  store i32 3, ptr @a23, align 4
  store i32 4, ptr @a24, align 4
  store i32 5, ptr @a25, align 4
  store i32 6, ptr @a26, align 4
  store i32 7, ptr @a27, align 4
  store i32 8, ptr @a28, align 4
  store i32 9, ptr @a29, align 4
  store i32 0, ptr @a30, align 4
  store i32 1, ptr @a31, align 4
  store i32 4, ptr @a32, align 4
  store i32 5, ptr @a33, align 4
  store i32 6, ptr @a34, align 4
  store i32 7, ptr @a35, align 4
  store i32 8, ptr @a36, align 4
  store i32 9, ptr @a37, align 4
  store i32 0, ptr @a38, align 4
  store i32 1, ptr @a39, align 4
  %r716 = load i32, ptr @a0, align 4
  %r717 = load i32, ptr @a1, align 4
  %r718 = load i32, ptr @a2, align 4
  %r719 = load i32, ptr @a3, align 4
  %r720 = load i32, ptr @a4, align 4
  %r721 = load i32, ptr @a5, align 4
  %r722 = load i32, ptr @a6, align 4
  %r723 = load i32, ptr @a7, align 4
  %r724 = call i32 @testParam8(i32 %r716, i32 %r717, i32 %r718, i32 %r719, i32 %r720, i32 %r721, i32 %r722, i32 %r723)
  store i32 %r724, ptr @a0, align 4
  %r725 = load i32, ptr @a0, align 4
  call void @putint(i32 %r725)
  %r726 = load i32, ptr @a32, align 4
  %r727 = load i32, ptr @a33, align 4
  %r728 = load i32, ptr @a34, align 4
  %r729 = load i32, ptr @a35, align 4
  %r730 = load i32, ptr @a36, align 4
  %r731 = load i32, ptr @a37, align 4
  %r732 = load i32, ptr @a38, align 4
  %r733 = load i32, ptr @a39, align 4
  %r734 = load i32, ptr @a8, align 4
  %r735 = load i32, ptr @a9, align 4
  %r736 = load i32, ptr @a10, align 4
  %r737 = load i32, ptr @a11, align 4
  %r738 = load i32, ptr @a12, align 4
  %r739 = load i32, ptr @a13, align 4
  %r740 = load i32, ptr @a14, align 4
  %r741 = load i32, ptr @a15, align 4
  %r742 = call i32 @testParam16(i32 %r726, i32 %r727, i32 %r728, i32 %r729, i32 %r730, i32 %r731, i32 %r732, i32 %r733, i32 %r734, i32 %r735, i32 %r736, i32 %r737, i32 %r738, i32 %r739, i32 %r740, i32 %r741)
  store i32 %r742, ptr @a0, align 4
  %r743 = load i32, ptr @a0, align 4
  call void @putint(i32 %r743)
  %r744 = load i32, ptr @a0, align 4
  %r745 = load i32, ptr @a1, align 4
  %r746 = load i32, ptr @a2, align 4
  %r747 = load i32, ptr @a3, align 4
  %r748 = load i32, ptr @a4, align 4
  %r749 = load i32, ptr @a5, align 4
  %r750 = load i32, ptr @a6, align 4
  %r751 = load i32, ptr @a7, align 4
  %r752 = load i32, ptr @a8, align 4
  %r753 = load i32, ptr @a9, align 4
  %r754 = load i32, ptr @a10, align 4
  %r755 = load i32, ptr @a11, align 4
  %r756 = load i32, ptr @a12, align 4
  %r757 = load i32, ptr @a13, align 4
  %r758 = load i32, ptr @a14, align 4
  %r759 = load i32, ptr @a15, align 4
  %r760 = load i32, ptr @a16, align 4
  %r761 = load i32, ptr @a17, align 4
  %r762 = load i32, ptr @a18, align 4
  %r763 = load i32, ptr @a19, align 4
  %r764 = load i32, ptr @a20, align 4
  %r765 = load i32, ptr @a21, align 4
  %r766 = load i32, ptr @a22, align 4
  %r767 = load i32, ptr @a23, align 4
  %r768 = load i32, ptr @a24, align 4
  %r769 = load i32, ptr @a25, align 4
  %r770 = load i32, ptr @a26, align 4
  %r771 = load i32, ptr @a27, align 4
  %r772 = load i32, ptr @a28, align 4
  %r773 = load i32, ptr @a29, align 4
  %r774 = load i32, ptr @a30, align 4
  %r775 = load i32, ptr @a31, align 4
  %r776 = call i32 @testParam32(i32 %r744, i32 %r745, i32 %r746, i32 %r747, i32 %r748, i32 %r749, i32 %r750, i32 %r751, i32 %r752, i32 %r753, i32 %r754, i32 %r755, i32 %r756, i32 %r757, i32 %r758, i32 %r759, i32 %r760, i32 %r761, i32 %r762, i32 %r763, i32 %r764, i32 %r765, i32 %r766, i32 %r767, i32 %r768, i32 %r769, i32 %r770, i32 %r771, i32 %r772, i32 %r773, i32 %r774, i32 %r775)
  store i32 %r776, ptr @a0, align 4
  %r777 = load i32, ptr @a0, align 4
  call void @putint(i32 %r777)
  call void @_sysy_stoptime(i32 117)
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
define i32 @getint() local_unnamed_addr #0 {
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
