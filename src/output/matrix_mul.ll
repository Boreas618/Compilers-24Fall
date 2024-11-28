; ModuleID = 'llvm-link'
source_filename = "llvm-link"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-macosx15.0.0"

%struct.timeval = type { i64, i32 }

@M = global i32 0
@L = global i32 0
@N = global i32 0
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

define i32 @mul(ptr %r100, ptr %r101, ptr %r102, ptr %r103, ptr %r104, ptr %r105, ptr %r106, ptr %r107, ptr %r108) {
mul:
  %r340 = add i32 0, 0
  %r341 = add i32 0, 0
  %r110 = getelementptr i32, ptr %r106, i32 0
  %r111 = getelementptr i32, ptr %r100, i32 0
  %r342 = load i32, ptr %r111, align 4
  %r113 = getelementptr i32, ptr %r103, i32 0
  %r343 = load i32, ptr %r113, align 4
  %r344 = mul i32 %r342, %r343
  %r116 = getelementptr i32, ptr %r100, i32 1
  %r345 = load i32, ptr %r116, align 4
  %r118 = getelementptr i32, ptr %r104, i32 0
  %r346 = load i32, ptr %r118, align 4
  %r347 = mul i32 %r345, %r346
  %r348 = add i32 %r344, %r347
  %r122 = getelementptr i32, ptr %r100, i32 2
  %r349 = load i32, ptr %r122, align 4
  %r124 = getelementptr i32, ptr %r105, i32 0
  %r350 = load i32, ptr %r124, align 4
  %r351 = mul i32 %r349, %r350
  %r352 = add i32 %r348, %r351
  store i32 %r352, ptr %r110, align 4
  %r128 = getelementptr i32, ptr %r106, i32 1
  %r129 = getelementptr i32, ptr %r100, i32 0
  %r353 = load i32, ptr %r129, align 4
  %r131 = getelementptr i32, ptr %r103, i32 1
  %r354 = load i32, ptr %r131, align 4
  %r355 = mul i32 %r353, %r354
  %r134 = getelementptr i32, ptr %r100, i32 1
  %r356 = load i32, ptr %r134, align 4
  %r136 = getelementptr i32, ptr %r104, i32 1
  %r357 = load i32, ptr %r136, align 4
  %r358 = mul i32 %r356, %r357
  %r359 = add i32 %r355, %r358
  %r140 = getelementptr i32, ptr %r100, i32 2
  %r360 = load i32, ptr %r140, align 4
  %r142 = getelementptr i32, ptr %r105, i32 1
  %r361 = load i32, ptr %r142, align 4
  %r362 = mul i32 %r360, %r361
  %r363 = add i32 %r359, %r362
  store i32 %r363, ptr %r128, align 4
  %r146 = getelementptr i32, ptr %r106, i32 2
  %r147 = getelementptr i32, ptr %r100, i32 0
  %r364 = load i32, ptr %r147, align 4
  %r149 = getelementptr i32, ptr %r103, i32 2
  %r365 = load i32, ptr %r149, align 4
  %r366 = mul i32 %r364, %r365
  %r152 = getelementptr i32, ptr %r100, i32 1
  %r367 = load i32, ptr %r152, align 4
  %r154 = getelementptr i32, ptr %r104, i32 2
  %r368 = load i32, ptr %r154, align 4
  %r369 = mul i32 %r367, %r368
  %r370 = add i32 %r366, %r369
  %r158 = getelementptr i32, ptr %r100, i32 2
  %r371 = load i32, ptr %r158, align 4
  %r160 = getelementptr i32, ptr %r105, i32 2
  %r372 = load i32, ptr %r160, align 4
  %r373 = mul i32 %r371, %r372
  %r374 = add i32 %r370, %r373
  store i32 %r374, ptr %r146, align 4
  %r164 = getelementptr i32, ptr %r107, i32 0
  %r165 = getelementptr i32, ptr %r101, i32 0
  %r375 = load i32, ptr %r165, align 4
  %r167 = getelementptr i32, ptr %r103, i32 0
  %r376 = load i32, ptr %r167, align 4
  %r377 = mul i32 %r375, %r376
  %r170 = getelementptr i32, ptr %r101, i32 1
  %r378 = load i32, ptr %r170, align 4
  %r172 = getelementptr i32, ptr %r104, i32 0
  %r379 = load i32, ptr %r172, align 4
  %r380 = mul i32 %r378, %r379
  %r381 = add i32 %r377, %r380
  %r176 = getelementptr i32, ptr %r101, i32 2
  %r382 = load i32, ptr %r176, align 4
  %r178 = getelementptr i32, ptr %r105, i32 0
  %r383 = load i32, ptr %r178, align 4
  %r384 = mul i32 %r382, %r383
  %r385 = add i32 %r381, %r384
  store i32 %r385, ptr %r164, align 4
  %r182 = getelementptr i32, ptr %r107, i32 1
  %r183 = getelementptr i32, ptr %r101, i32 0
  %r386 = load i32, ptr %r183, align 4
  %r185 = getelementptr i32, ptr %r103, i32 1
  %r387 = load i32, ptr %r185, align 4
  %r388 = mul i32 %r386, %r387
  %r188 = getelementptr i32, ptr %r101, i32 1
  %r389 = load i32, ptr %r188, align 4
  %r190 = getelementptr i32, ptr %r104, i32 1
  %r390 = load i32, ptr %r190, align 4
  %r391 = mul i32 %r389, %r390
  %r392 = add i32 %r388, %r391
  %r194 = getelementptr i32, ptr %r101, i32 2
  %r393 = load i32, ptr %r194, align 4
  %r196 = getelementptr i32, ptr %r105, i32 1
  %r394 = load i32, ptr %r196, align 4
  %r395 = mul i32 %r393, %r394
  %r396 = add i32 %r392, %r395
  store i32 %r396, ptr %r182, align 4
  %r200 = getelementptr i32, ptr %r107, i32 2
  %r201 = getelementptr i32, ptr %r101, i32 0
  %r397 = load i32, ptr %r201, align 4
  %r203 = getelementptr i32, ptr %r103, i32 2
  %r398 = load i32, ptr %r203, align 4
  %r399 = mul i32 %r397, %r398
  %r206 = getelementptr i32, ptr %r101, i32 1
  %r400 = load i32, ptr %r206, align 4
  %r208 = getelementptr i32, ptr %r104, i32 2
  %r401 = load i32, ptr %r208, align 4
  %r402 = mul i32 %r400, %r401
  %r403 = add i32 %r399, %r402
  %r212 = getelementptr i32, ptr %r101, i32 2
  %r404 = load i32, ptr %r212, align 4
  %r214 = getelementptr i32, ptr %r105, i32 2
  %r405 = load i32, ptr %r214, align 4
  %r406 = mul i32 %r404, %r405
  %r407 = add i32 %r403, %r406
  store i32 %r407, ptr %r200, align 4
  %r218 = getelementptr i32, ptr %r108, i32 0
  %r219 = getelementptr i32, ptr %r102, i32 0
  %r408 = load i32, ptr %r219, align 4
  %r221 = getelementptr i32, ptr %r103, i32 0
  %r409 = load i32, ptr %r221, align 4
  %r410 = mul i32 %r408, %r409
  %r224 = getelementptr i32, ptr %r102, i32 1
  %r411 = load i32, ptr %r224, align 4
  %r226 = getelementptr i32, ptr %r104, i32 0
  %r412 = load i32, ptr %r226, align 4
  %r413 = mul i32 %r411, %r412
  %r414 = add i32 %r410, %r413
  %r230 = getelementptr i32, ptr %r102, i32 2
  %r415 = load i32, ptr %r230, align 4
  %r232 = getelementptr i32, ptr %r105, i32 0
  %r416 = load i32, ptr %r232, align 4
  %r417 = mul i32 %r415, %r416
  %r418 = add i32 %r414, %r417
  store i32 %r418, ptr %r218, align 4
  %r236 = getelementptr i32, ptr %r108, i32 1
  %r237 = getelementptr i32, ptr %r102, i32 0
  %r419 = load i32, ptr %r237, align 4
  %r239 = getelementptr i32, ptr %r103, i32 1
  %r420 = load i32, ptr %r239, align 4
  %r421 = mul i32 %r419, %r420
  %r242 = getelementptr i32, ptr %r102, i32 1
  %r422 = load i32, ptr %r242, align 4
  %r244 = getelementptr i32, ptr %r104, i32 1
  %r423 = load i32, ptr %r244, align 4
  %r424 = mul i32 %r422, %r423
  %r425 = add i32 %r421, %r424
  %r248 = getelementptr i32, ptr %r102, i32 2
  %r426 = load i32, ptr %r248, align 4
  %r250 = getelementptr i32, ptr %r105, i32 1
  %r427 = load i32, ptr %r250, align 4
  %r428 = mul i32 %r426, %r427
  %r429 = add i32 %r425, %r428
  store i32 %r429, ptr %r236, align 4
  %r254 = getelementptr i32, ptr %r108, i32 2
  %r255 = getelementptr i32, ptr %r102, i32 0
  %r430 = load i32, ptr %r255, align 4
  %r257 = getelementptr i32, ptr %r103, i32 2
  %r431 = load i32, ptr %r257, align 4
  %r432 = mul i32 %r430, %r431
  %r260 = getelementptr i32, ptr %r102, i32 1
  %r433 = load i32, ptr %r260, align 4
  %r262 = getelementptr i32, ptr %r104, i32 2
  %r434 = load i32, ptr %r262, align 4
  %r435 = mul i32 %r433, %r434
  %r436 = add i32 %r432, %r435
  %r266 = getelementptr i32, ptr %r102, i32 2
  %r437 = load i32, ptr %r266, align 4
  %r268 = getelementptr i32, ptr %r105, i32 2
  %r438 = load i32, ptr %r268, align 4
  %r439 = mul i32 %r437, %r438
  %r440 = add i32 %r436, %r439
  store i32 %r440, ptr %r254, align 4
  ret i32 0
}

define i32 @main() {
main:
  %r447 = add i32 0, 0
  call void @_sysy_starttime(i32 97)
  store i32 3, ptr @N, align 4
  store i32 3, ptr @M, align 4
  store i32 3, ptr @L, align 4
  %r272 = alloca [3 x i32], align 4
  %r273 = alloca [3 x i32], align 4
  %r274 = alloca [3 x i32], align 4
  %r275 = alloca [3 x i32], align 4
  %r276 = alloca [3 x i32], align 4
  %r277 = alloca [3 x i32], align 4
  %r278 = alloca [6 x i32], align 4
  %r279 = alloca [3 x i32], align 4
  %r280 = alloca [3 x i32], align 4
  %r448 = add i32 0, 0
  %r449 = add i32 0, 0
  br label %bb1

bb1:                                              ; preds = %bb2, %main
  %r450 = phi i32 [ %r449, %main ], [ %r482, %bb2 ]
  %r451 = load i32, ptr @M, align 4
  %r452 = icmp slt i32 %r450, %r451
  br i1 %r452, label %bb2, label %bb3

bb2:                                              ; preds = %bb1
  %r285 = getelementptr [3 x i32], ptr %r272, i32 0, i32 %r450
  store i32 %r450, ptr %r285, align 4
  %r288 = getelementptr [3 x i32], ptr %r273, i32 0, i32 %r450
  store i32 %r450, ptr %r288, align 4
  %r291 = getelementptr [3 x i32], ptr %r274, i32 0, i32 %r450
  store i32 %r450, ptr %r291, align 4
  %r294 = getelementptr [3 x i32], ptr %r275, i32 0, i32 %r450
  store i32 %r450, ptr %r294, align 4
  %r297 = getelementptr [3 x i32], ptr %r276, i32 0, i32 %r450
  store i32 %r450, ptr %r297, align 4
  %r300 = getelementptr [3 x i32], ptr %r277, i32 0, i32 %r450
  store i32 %r450, ptr %r300, align 4
  %r481 = add i32 %r450, 1
  %r482 = add i32 %r481, 0
  br label %bb1

bb3:                                              ; preds = %bb1
  %r453 = call i32 @mul(ptr %r272, ptr %r273, ptr %r274, ptr %r275, ptr %r276, ptr %r277, ptr %r278, ptr %r279, ptr %r280)
  %r454 = add i32 %r453, 0
  br label %bb4

bb4:                                              ; preds = %bb5, %bb3
  %r455 = phi i32 [ %r454, %bb3 ], [ %r461, %bb5 ]
  %r456 = load i32, ptr @N, align 4
  %r457 = icmp slt i32 %r455, %r456
  br i1 %r457, label %bb5, label %bb6

bb5:                                              ; preds = %bb4
  %r310 = getelementptr [6 x i32], ptr %r278, i32 0, i32 %r455
  %r458 = load i32, ptr %r310, align 4
  %r459 = add i32 %r458, 0
  call void @putint(i32 %r459)
  %r460 = add i32 %r455, 1
  %r461 = add i32 %r460, 0
  br label %bb4

bb6:                                              ; preds = %bb4
  %r462 = add i32 10, 0
  %r463 = add i32 0, 0
  call void @putch(i32 %r462)
  br label %bb7

bb7:                                              ; preds = %bb8, %bb6
  %r464 = phi i32 [ %r463, %bb6 ], [ %r480, %bb8 ]
  %r465 = load i32, ptr @N, align 4
  %r466 = icmp slt i32 %r464, %r465
  br i1 %r466, label %bb8, label %bb9

bb8:                                              ; preds = %bb7
  %r320 = getelementptr [3 x i32], ptr %r279, i32 0, i32 %r464
  %r477 = load i32, ptr %r320, align 4
  %r478 = add i32 %r477, 0
  call void @putint(i32 %r478)
  %r479 = add i32 %r464, 1
  %r480 = add i32 %r479, 0
  br label %bb7

bb9:                                              ; preds = %bb7
  %r467 = add i32 10, 0
  %r468 = add i32 0, 0
  call void @putch(i32 %r467)
  br label %bb10

bb10:                                             ; preds = %bb11, %bb9
  %r469 = phi i32 [ %r468, %bb9 ], [ %r476, %bb11 ]
  %r470 = load i32, ptr @N, align 4
  %r471 = icmp slt i32 %r469, %r470
  br i1 %r471, label %bb11, label %bb12

bb11:                                             ; preds = %bb10
  %r330 = getelementptr [3 x i32], ptr %r280, i32 0, i32 %r469
  %r473 = load i32, ptr %r330, align 4
  %r474 = add i32 %r473, 0
  call void @putint(i32 %r474)
  %r475 = add i32 %r469, 1
  %r476 = add i32 %r475, 0
  br label %bb10

bb12:                                             ; preds = %bb10
  %r472 = add i32 10, 0
  call void @putch(i32 %r472)
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
