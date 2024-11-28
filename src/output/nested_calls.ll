; ModuleID = 'llvm-link'
source_filename = "llvm-link"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-macosx15.0.0"

%struct.timeval = type { i64, i32 }

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

define i32 @func1(i32 %r100, i32 %r102, i32 %r104) {
func1:
  %r292 = add i32 0, 0
  %r293 = add i32 %r100, 0
  %r294 = add i32 0, 0
  %r295 = add i32 %r102, 0
  %r296 = add i32 0, 0
  %r297 = add i32 %r104, 0
  %r298 = icmp eq i32 %r297, 0
  br i1 %r298, label %bb1, label %bb2

bb1:                                              ; preds = %func1
  %r299 = mul i32 %r293, %r295
  ret i32 %r299

bb2:                                              ; preds = %func1
  %r300 = sub i32 %r295, %r297
  %r301 = call i32 @func1(i32 %r293, i32 %r300, i32 0)
  ret i32 %r301
}

define i32 @func2(i32 %r117, i32 %r119) {
func2:
  %r308 = add i32 0, 0
  %r309 = add i32 %r117, 0
  %r310 = add i32 0, 0
  %r311 = add i32 %r119, 0
  %r312 = icmp ne i32 %r311, 0
  br i1 %r312, label %bb4, label %bb5

bb4:                                              ; preds = %func2
  %r313 = sdiv i32 %r309, %r311
  %r314 = mul i32 %r313, %r311
  %r315 = sub i32 %r309, %r314
  %r316 = call i32 @func2(i32 %r315, i32 0)
  ret i32 %r316

bb5:                                              ; preds = %func2
  ret i32 %r309
}

define i32 @func3(i32 %r133, i32 %r135) {
func3:
  %r323 = add i32 0, 0
  %r324 = add i32 %r133, 0
  %r325 = add i32 0, 0
  %r326 = add i32 %r135, 0
  %r327 = icmp eq i32 %r326, 0
  br i1 %r327, label %bb7, label %bb8

bb7:                                              ; preds = %func3
  %r328 = add i32 %r324, 1
  ret i32 %r328

bb8:                                              ; preds = %func3
  %r329 = add i32 %r324, %r326
  %r330 = call i32 @func3(i32 %r329, i32 0)
  ret i32 %r330
}

define i32 @func4(i32 %r146, i32 %r148, i32 %r150) {
func4:
  %r340 = add i32 0, 0
  %r341 = add i32 %r146, 0
  %r342 = add i32 0, 0
  %r343 = add i32 %r148, 0
  %r344 = add i32 0, 0
  %r345 = add i32 %r150, 0
  %r346 = icmp ne i32 %r341, 0
  br i1 %r346, label %bb10, label %bb11

bb10:                                             ; preds = %func4
  ret i32 %r343

bb11:                                             ; preds = %func4
  ret i32 %r345
}

define i32 @func5(i32 %r157) {
func5:
  %r350 = add i32 0, 0
  %r351 = add i32 %r157, 0
  %r352 = sub i32 0, %r351
  ret i32 %r352
}

define i32 @func6(i32 %r161, i32 %r163) {
func6:
  %r365 = add i32 0, 0
  %r366 = add i32 0, 0
  %r367 = add i32 %r161, 0
  %r368 = add i32 0, 0
  %r369 = add i32 %r163, 0
  %r370 = add i32 0, 0
  %r371 = icmp ne i32 %r367, 0
  br i1 %r371, label %bb17, label %bb18

bb17:                                             ; preds = %func6
  %r380 = add i32 1, 0
  br label %bb19

bb18:                                             ; preds = %func6
  %r372 = add i32 0, 0
  br label %bb19

bb19:                                             ; preds = %bb18, %bb17
  %r373 = phi i32 [ %r380, %bb17 ], [ %r372, %bb18 ]
  %r374 = icmp ne i32 %r373, 0
  br i1 %r374, label %bb16, label %bb14

bb16:                                             ; preds = %bb19
  %r375 = icmp ne i32 %r369, 0
  br i1 %r375, label %bb20, label %bb21

bb20:                                             ; preds = %bb16
  %r379 = add i32 1, 0
  br label %bb22

bb21:                                             ; preds = %bb16
  %r376 = add i32 0, 0
  br label %bb22

bb22:                                             ; preds = %bb21, %bb20
  %r377 = phi i32 [ %r379, %bb20 ], [ %r376, %bb21 ]
  %r378 = icmp ne i32 %r377, 0
  br i1 %r378, label %bb13, label %bb14

bb13:                                             ; preds = %bb22
  ret i32 1

bb14:                                             ; preds = %bb22, %bb19
  ret i32 0
}

define i32 @func7(i32 %r176) {
func7:
  %r384 = add i32 0, 0
  %r385 = add i32 %r176, 0
  %r386 = icmp ne i32 %r385, 0
  br i1 %r386, label %bb24, label %bb23

bb23:                                             ; preds = %func7
  ret i32 1

bb24:                                             ; preds = %func7
  ret i32 0
}

define i32 @main() {
main:
  %r405 = add i32 0, 0
  call void @_sysy_starttime(i32 97)
  %r406 = call i32 @getint()
  %r407 = add i32 0, 0
  %r408 = add i32 %r406, 0
  %r409 = call i32 @getint()
  %r410 = add i32 0, 0
  %r411 = add i32 %r409, 0
  %r412 = call i32 @getint()
  %r413 = add i32 0, 0
  %r414 = add i32 %r412, 0
  %r415 = call i32 @getint()
  %r416 = add i32 0, 0
  %r417 = add i32 %r415, 0
  %r189 = alloca [10 x i32], align 4
  %r418 = add i32 0, 0
  %r419 = add i32 0, 0
  br label %bb26

bb26:                                             ; preds = %bb27, %main
  %r420 = phi i32 [ %r419, %main ], [ %r424, %bb27 ]
  %r421 = icmp slt i32 %r420, 10
  br i1 %r421, label %bb27, label %bb28

bb27:                                             ; preds = %bb26
  %r193 = getelementptr [10 x i32], ptr %r189, i32 0, i32 %r420
  %r422 = call i32 @getint()
  store i32 %r422, ptr %r193, align 4
  %r423 = add i32 %r420, 1
  %r424 = add i32 %r423, 0
  br label %bb26

bb28:                                             ; preds = %bb26
  %r425 = call i32 @func7(i32 %r408)
  %r426 = call i32 @func5(i32 %r411)
  %r427 = call i32 @func6(i32 %r425, i32 %r426)
  %r428 = call i32 @func2(i32 %r427, i32 %r414)
  %r429 = call i32 @func3(i32 %r428, i32 %r417)
  %r430 = call i32 @func5(i32 %r429)
  %r213 = getelementptr [10 x i32], ptr %r189, i32 0, i32 0
  %r431 = load i32, ptr %r213, align 4
  %r220 = getelementptr [10 x i32], ptr %r189, i32 0, i32 1
  %r432 = load i32, ptr %r220, align 4
  %r433 = call i32 @func5(i32 %r432)
  %r223 = getelementptr [10 x i32], ptr %r189, i32 0, i32 2
  %r434 = load i32, ptr %r223, align 4
  %r226 = getelementptr [10 x i32], ptr %r189, i32 0, i32 3
  %r435 = load i32, ptr %r226, align 4
  %r436 = call i32 @func7(i32 %r435)
  %r437 = call i32 @func6(i32 %r434, i32 %r436)
  %r229 = getelementptr [10 x i32], ptr %r189, i32 0, i32 4
  %r438 = load i32, ptr %r229, align 4
  %r232 = getelementptr [10 x i32], ptr %r189, i32 0, i32 5
  %r439 = load i32, ptr %r232, align 4
  %r440 = call i32 @func7(i32 %r439)
  %r441 = call i32 @func2(i32 %r438, i32 %r440)
  %r442 = call i32 @func4(i32 %r433, i32 %r437, i32 %r441)
  %r234 = getelementptr [10 x i32], ptr %r189, i32 0, i32 6
  %r443 = load i32, ptr %r234, align 4
  %r444 = call i32 @func3(i32 %r442, i32 %r443)
  %r236 = getelementptr [10 x i32], ptr %r189, i32 0, i32 7
  %r445 = load i32, ptr %r236, align 4
  %r446 = call i32 @func2(i32 %r444, i32 %r445)
  %r239 = getelementptr [10 x i32], ptr %r189, i32 0, i32 8
  %r447 = load i32, ptr %r239, align 4
  %r242 = getelementptr [10 x i32], ptr %r189, i32 0, i32 9
  %r448 = load i32, ptr %r242, align 4
  %r449 = call i32 @func7(i32 %r448)
  %r450 = call i32 @func3(i32 %r447, i32 %r449)
  %r451 = call i32 @func1(i32 %r446, i32 %r450, i32 %r408)
  %r452 = call i32 @func4(i32 %r430, i32 %r431, i32 %r451)
  %r453 = call i32 @func7(i32 %r414)
  %r454 = call i32 @func3(i32 %r453, i32 %r417)
  %r455 = call i32 @func2(i32 %r411, i32 %r454)
  %r456 = call i32 @func3(i32 %r452, i32 %r455)
  %r251 = getelementptr [10 x i32], ptr %r189, i32 0, i32 0
  %r457 = load i32, ptr %r251, align 4
  %r253 = getelementptr [10 x i32], ptr %r189, i32 0, i32 1
  %r458 = load i32, ptr %r253, align 4
  %r459 = call i32 @func1(i32 %r456, i32 %r457, i32 %r458)
  %r255 = getelementptr [10 x i32], ptr %r189, i32 0, i32 2
  %r460 = load i32, ptr %r255, align 4
  %r461 = call i32 @func2(i32 %r459, i32 %r460)
  %r257 = getelementptr [10 x i32], ptr %r189, i32 0, i32 3
  %r462 = load i32, ptr %r257, align 4
  %r264 = getelementptr [10 x i32], ptr %r189, i32 0, i32 4
  %r463 = load i32, ptr %r264, align 4
  %r267 = getelementptr [10 x i32], ptr %r189, i32 0, i32 5
  %r464 = load i32, ptr %r267, align 4
  %r465 = call i32 @func5(i32 %r464)
  %r466 = call i32 @func3(i32 %r463, i32 %r465)
  %r270 = getelementptr [10 x i32], ptr %r189, i32 0, i32 6
  %r467 = load i32, ptr %r270, align 4
  %r468 = call i32 @func5(i32 %r467)
  %r469 = call i32 @func2(i32 %r466, i32 %r468)
  %r272 = getelementptr [10 x i32], ptr %r189, i32 0, i32 7
  %r470 = load i32, ptr %r272, align 4
  %r275 = getelementptr [10 x i32], ptr %r189, i32 0, i32 8
  %r471 = load i32, ptr %r275, align 4
  %r472 = call i32 @func7(i32 %r471)
  %r473 = call i32 @func1(i32 %r469, i32 %r470, i32 %r472)
  %r278 = getelementptr [10 x i32], ptr %r189, i32 0, i32 9
  %r474 = load i32, ptr %r278, align 4
  %r475 = call i32 @func5(i32 %r474)
  %r476 = call i32 @func2(i32 %r473, i32 %r475)
  %r477 = call i32 @func3(i32 %r476, i32 %r408)
  %r478 = call i32 @func1(i32 %r461, i32 %r462, i32 %r477)
  %r479 = add i32 %r478, 0
  call void @_sysy_stoptime(i32 117)
  ret i32 %r479
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
