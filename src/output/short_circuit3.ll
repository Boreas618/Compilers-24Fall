; ModuleID = 'llvm-link'
source_filename = "llvm-link"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-macosx15.0.0"

%struct.timeval = type { i64, i32 }

@a = global i32 0
@b = global i32 0
@d = global i32 0
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

define i32 @set_a(i32 %r100) {
set_a:
  %r260 = add i32 0, 0
  %r261 = add i32 %r100, 0
  store i32 %r261, ptr @a, align 4
  %r262 = load i32, ptr @a, align 4
  ret i32 %r262
}

define i32 @set_b(i32 %r104) {
set_b:
  %r266 = add i32 0, 0
  %r267 = add i32 %r104, 0
  store i32 %r267, ptr @b, align 4
  %r268 = load i32, ptr @b, align 4
  ret i32 %r268
}

define i32 @set_d(i32 %r108) {
set_d:
  %r272 = add i32 0, 0
  %r273 = add i32 %r108, 0
  store i32 %r273, ptr @d, align 4
  %r274 = load i32, ptr @d, align 4
  ret i32 %r274
}

define i32 @main() {
main:
  %r365 = add i32 0, 0
  %r366 = add i32 0, 0
  %r367 = add i32 0, 0
  %r368 = add i32 0, 0
  %r369 = add i32 0, 0
  %r370 = add i32 0, 0
  %r371 = add i32 0, 0
  %r372 = add i32 0, 0
  %r373 = add i32 0, 0
  %r374 = add i32 0, 0
  %r375 = add i32 0, 0
  %r376 = add i32 0, 0
  %r377 = add i32 0, 0
  %r378 = add i32 0, 0
  %r379 = add i32 0, 0
  %r380 = add i32 0, 0
  %r381 = add i32 0, 0
  %r382 = add i32 0, 0
  %r383 = add i32 0, 0
  %r384 = add i32 0, 0
  %r385 = add i32 0, 0
  %r386 = add i32 0, 0
  %r387 = add i32 0, 0
  %r388 = add i32 0, 0
  %r389 = add i32 0, 0
  %r390 = add i32 0, 0
  %r391 = add i32 0, 0
  %r392 = add i32 0, 0
  %r393 = add i32 0, 0
  call void @_sysy_starttime(i32 97)
  store i32 2, ptr @a, align 4
  store i32 3, ptr @b, align 4
  %r394 = add i32 0, 0
  %r395 = call i32 @set_a(i32 0)
  %r396 = icmp ne i32 %r395, 0
  br i1 %r396, label %bb5, label %bb6

bb5:                                              ; preds = %main
  %r397 = add i32 1, 0
  br label %bb7

bb6:                                              ; preds = %main
  %r530 = add i32 0, 0
  br label %bb7

bb7:                                              ; preds = %bb6, %bb5
  %r398 = phi i32 [ %r397, %bb5 ], [ %r530, %bb6 ]
  %r399 = icmp ne i32 %r398, 0
  br i1 %r399, label %bb4, label %bb2

bb4:                                              ; preds = %bb7
  %r524 = call i32 @set_b(i32 1)
  %r525 = icmp ne i32 %r524, 0
  br i1 %r525, label %bb8, label %bb9

bb8:                                              ; preds = %bb4
  %r526 = add i32 1, 0
  br label %bb10

bb9:                                              ; preds = %bb4
  %r527 = add i32 0, 0
  br label %bb10

bb10:                                             ; preds = %bb9, %bb8
  %r528 = phi i32 [ %r526, %bb8 ], [ %r527, %bb9 ]
  %r529 = icmp ne i32 %r528, 0
  br i1 %r529, label %bb1, label %bb2

bb1:                                              ; preds = %bb10
  br label %bb3

bb2:                                              ; preds = %bb10, %bb7
  br label %bb3

bb3:                                              ; preds = %bb2, %bb1
  %r400 = load i32, ptr @a, align 4
  call void @putint(i32 %r400)
  call void @putch(i32 32)
  %r401 = load i32, ptr @b, align 4
  call void @putint(i32 %r401)
  call void @putch(i32 32)
  store i32 2, ptr @a, align 4
  store i32 3, ptr @b, align 4
  %r402 = call i32 @set_a(i32 0)
  %r403 = icmp ne i32 %r402, 0
  br i1 %r403, label %bb15, label %bb16

bb15:                                             ; preds = %bb3
  %r523 = add i32 1, 0
  br label %bb17

bb16:                                             ; preds = %bb3
  %r522 = add i32 0, 0
  br label %bb17

bb17:                                             ; preds = %bb16, %bb15
  %r404 = phi i32 [ %r523, %bb15 ], [ %r522, %bb16 ]
  %r405 = icmp ne i32 %r404, 0
  br i1 %r405, label %bb14, label %bb12

bb14:                                             ; preds = %bb17
  %r516 = call i32 @set_b(i32 1)
  %r517 = icmp ne i32 %r516, 0
  br i1 %r517, label %bb18, label %bb19

bb18:                                             ; preds = %bb14
  %r518 = add i32 1, 0
  br label %bb20

bb19:                                             ; preds = %bb14
  %r521 = add i32 0, 0
  br label %bb20

bb20:                                             ; preds = %bb19, %bb18
  %r519 = phi i32 [ %r518, %bb18 ], [ %r521, %bb19 ]
  %r520 = icmp ne i32 %r519, 0
  br i1 %r520, label %bb11, label %bb12

bb11:                                             ; preds = %bb20
  br label %bb13

bb12:                                             ; preds = %bb20, %bb17
  br label %bb13

bb13:                                             ; preds = %bb12, %bb11
  %r406 = load i32, ptr @a, align 4
  call void @putint(i32 %r406)
  call void @putch(i32 32)
  %r407 = load i32, ptr @b, align 4
  call void @putint(i32 %r407)
  call void @putch(i32 10)
  %r408 = add i32 1, 0
  store i32 2, ptr @d, align 4
  %r409 = icmp sge i32 %r408, 1
  br i1 %r409, label %bb25, label %bb26

bb25:                                             ; preds = %bb13
  %r411 = add i32 1, 0
  br label %bb27

bb26:                                             ; preds = %bb13
  %r410 = add i32 0, 0
  br label %bb27

bb27:                                             ; preds = %bb26, %bb25
  %r412 = phi i32 [ %r411, %bb25 ], [ %r410, %bb26 ]
  %r413 = icmp ne i32 %r412, 0
  br i1 %r413, label %bb24, label %bb22

bb24:                                             ; preds = %bb27
  %r510 = call i32 @set_d(i32 3)
  %r511 = icmp ne i32 %r510, 0
  br i1 %r511, label %bb28, label %bb29

bb28:                                             ; preds = %bb24
  %r512 = add i32 1, 0
  br label %bb30

bb29:                                             ; preds = %bb24
  %r515 = add i32 0, 0
  br label %bb30

bb30:                                             ; preds = %bb29, %bb28
  %r513 = phi i32 [ %r512, %bb28 ], [ %r515, %bb29 ]
  %r514 = icmp ne i32 %r513, 0
  br i1 %r514, label %bb21, label %bb22

bb21:                                             ; preds = %bb30
  br label %bb23

bb22:                                             ; preds = %bb30, %bb27
  br label %bb23

bb23:                                             ; preds = %bb22, %bb21
  %r414 = load i32, ptr @d, align 4
  call void @putint(i32 %r414)
  call void @putch(i32 32)
  %r415 = icmp sle i32 %r408, 1
  br i1 %r415, label %bb35, label %bb36

bb35:                                             ; preds = %bb23
  %r509 = add i32 1, 0
  br label %bb37

bb36:                                             ; preds = %bb23
  %r508 = add i32 0, 0
  br label %bb37

bb37:                                             ; preds = %bb36, %bb35
  %r416 = phi i32 [ %r509, %bb35 ], [ %r508, %bb36 ]
  %r417 = icmp ne i32 %r416, 0
  br i1 %r417, label %bb31, label %bb34

bb34:                                             ; preds = %bb37
  %r418 = call i32 @set_d(i32 4)
  %r419 = icmp ne i32 %r418, 0
  br i1 %r419, label %bb38, label %bb39

bb38:                                             ; preds = %bb34
  %r422 = add i32 1, 0
  br label %bb40

bb39:                                             ; preds = %bb34
  %r423 = add i32 0, 0
  br label %bb40

bb40:                                             ; preds = %bb39, %bb38
  %r420 = phi i32 [ %r422, %bb38 ], [ %r423, %bb39 ]
  %r421 = icmp ne i32 %r420, 0
  br i1 %r421, label %bb31, label %bb32

bb31:                                             ; preds = %bb40, %bb37
  br label %bb33

bb32:                                             ; preds = %bb40
  br label %bb33

bb33:                                             ; preds = %bb32, %bb31
  %r424 = load i32, ptr @d, align 4
  call void @putint(i32 %r424)
  call void @putch(i32 10)
  call void @putch(i32 10)
  %r425 = add i32 0, 0
  %r426 = add i32 1, 0
  %r427 = add i32 2, 0
  %r428 = add i32 3, 0
  %r429 = add i32 4, 0
  br label %bb41

bb41:                                             ; preds = %bb42, %bb33
  %r430 = icmp ne i32 %r425, 0
  br i1 %r430, label %bb45, label %bb46

bb45:                                             ; preds = %bb41
  %r431 = add i32 1, 0
  br label %bb47

bb46:                                             ; preds = %bb41
  %r432 = add i32 0, 0
  br label %bb47

bb47:                                             ; preds = %bb46, %bb45
  %r433 = phi i32 [ %r431, %bb45 ], [ %r432, %bb46 ]
  %r434 = icmp ne i32 %r433, 0
  br i1 %r434, label %bb44, label %bb43

bb44:                                             ; preds = %bb47
  %r435 = icmp ne i32 %r426, 0
  br i1 %r435, label %bb48, label %bb49

bb48:                                             ; preds = %bb44
  %r436 = add i32 1, 0
  br label %bb50

bb49:                                             ; preds = %bb44
  %r437 = add i32 0, 0
  br label %bb50

bb50:                                             ; preds = %bb49, %bb48
  %r438 = phi i32 [ %r436, %bb48 ], [ %r437, %bb49 ]
  %r439 = icmp ne i32 %r438, 0
  br i1 %r439, label %bb42, label %bb43

bb42:                                             ; preds = %bb50
  call void @putch(i32 32)
  br label %bb41

bb43:                                             ; preds = %bb50, %bb47
  %r440 = icmp ne i32 %r425, 0
  br i1 %r440, label %bb55, label %bb56

bb55:                                             ; preds = %bb43
  %r442 = add i32 1, 0
  br label %bb57

bb56:                                             ; preds = %bb43
  %r441 = add i32 0, 0
  br label %bb57

bb57:                                             ; preds = %bb56, %bb55
  %r443 = phi i32 [ %r442, %bb55 ], [ %r441, %bb56 ]
  %r444 = icmp ne i32 %r443, 0
  br i1 %r444, label %bb51, label %bb54

bb54:                                             ; preds = %bb57
  %r503 = icmp ne i32 %r426, 0
  br i1 %r503, label %bb58, label %bb59

bb58:                                             ; preds = %bb54
  %r504 = add i32 1, 0
  br label %bb60

bb59:                                             ; preds = %bb54
  %r505 = add i32 0, 0
  br label %bb60

bb60:                                             ; preds = %bb59, %bb58
  %r506 = phi i32 [ %r504, %bb58 ], [ %r505, %bb59 ]
  %r507 = icmp ne i32 %r506, 0
  br i1 %r507, label %bb51, label %bb52

bb51:                                             ; preds = %bb60, %bb57
  call void @putch(i32 67)
  br label %bb53

bb52:                                             ; preds = %bb60
  br label %bb53

bb53:                                             ; preds = %bb52, %bb51
  %r445 = icmp sge i32 %r425, %r426
  br i1 %r445, label %bb65, label %bb66

bb65:                                             ; preds = %bb53
  %r446 = add i32 1, 0
  br label %bb67

bb66:                                             ; preds = %bb53
  %r447 = add i32 0, 0
  br label %bb67

bb67:                                             ; preds = %bb66, %bb65
  %r448 = phi i32 [ %r446, %bb65 ], [ %r447, %bb66 ]
  %r449 = icmp ne i32 %r448, 0
  br i1 %r449, label %bb61, label %bb64

bb64:                                             ; preds = %bb67
  %r450 = icmp sle i32 %r426, %r425
  br i1 %r450, label %bb68, label %bb69

bb68:                                             ; preds = %bb64
  %r454 = add i32 1, 0
  br label %bb70

bb69:                                             ; preds = %bb64
  %r451 = add i32 0, 0
  br label %bb70

bb70:                                             ; preds = %bb69, %bb68
  %r452 = phi i32 [ %r454, %bb68 ], [ %r451, %bb69 ]
  %r453 = icmp ne i32 %r452, 0
  br i1 %r453, label %bb61, label %bb62

bb61:                                             ; preds = %bb70, %bb67
  call void @putch(i32 72)
  br label %bb63

bb62:                                             ; preds = %bb70
  br label %bb63

bb63:                                             ; preds = %bb62, %bb61
  %r455 = icmp sge i32 %r427, %r426
  br i1 %r455, label %bb75, label %bb76

bb75:                                             ; preds = %bb63
  %r501 = add i32 1, 0
  br label %bb77

bb76:                                             ; preds = %bb63
  %r502 = add i32 0, 0
  br label %bb77

bb77:                                             ; preds = %bb76, %bb75
  %r456 = phi i32 [ %r501, %bb75 ], [ %r502, %bb76 ]
  %r457 = icmp ne i32 %r456, 0
  br i1 %r457, label %bb74, label %bb72

bb74:                                             ; preds = %bb77
  %r458 = icmp ne i32 %r429, %r428
  br i1 %r458, label %bb78, label %bb79

bb78:                                             ; preds = %bb74
  %r461 = add i32 1, 0
  br label %bb80

bb79:                                             ; preds = %bb74
  %r462 = add i32 0, 0
  br label %bb80

bb80:                                             ; preds = %bb79, %bb78
  %r459 = phi i32 [ %r461, %bb78 ], [ %r462, %bb79 ]
  %r460 = icmp ne i32 %r459, 0
  br i1 %r460, label %bb71, label %bb72

bb71:                                             ; preds = %bb80
  call void @putch(i32 73)
  br label %bb73

bb72:                                             ; preds = %bb80, %bb77
  br label %bb73

bb73:                                             ; preds = %bb72, %bb71
  %r463 = icmp ne i32 %r426, 0
  br i1 %r463, label %bb90, label %bb89

bb89:                                             ; preds = %bb73
  %r499 = add i32 1, 0
  br label %bb91

bb90:                                             ; preds = %bb73
  %r500 = add i32 0, 0
  br label %bb91

bb91:                                             ; preds = %bb90, %bb89
  %r464 = phi i32 [ %r499, %bb89 ], [ %r500, %bb90 ]
  %r465 = icmp ne i32 %r464, 0
  br i1 %r465, label %bb88, label %bb86

bb88:                                             ; preds = %bb91
  %r493 = icmp slt i32 %r428, %r428
  br i1 %r493, label %bb92, label %bb93

bb92:                                             ; preds = %bb88
  %r497 = add i32 1, 0
  br label %bb94

bb93:                                             ; preds = %bb88
  %r498 = add i32 0, 0
  br label %bb94

bb94:                                             ; preds = %bb93, %bb92
  %r494 = phi i32 [ %r497, %bb92 ], [ %r498, %bb93 ]
  %r495 = icmp ne i32 %r494, 0
  br i1 %r495, label %bb85, label %bb86

bb85:                                             ; preds = %bb94
  %r496 = add i32 1, 0
  br label %bb87

bb86:                                             ; preds = %bb94, %bb91
  %r492 = add i32 0, 0
  br label %bb87

bb87:                                             ; preds = %bb86, %bb85
  %r466 = phi i32 [ %r496, %bb85 ], [ %r492, %bb86 ]
  %r467 = icmp ne i32 %r466, 0
  br i1 %r467, label %bb81, label %bb84

bb84:                                             ; preds = %bb87
  %r487 = icmp sge i32 %r429, %r429
  br i1 %r487, label %bb95, label %bb96

bb95:                                             ; preds = %bb84
  %r489 = add i32 1, 0
  br label %bb97

bb96:                                             ; preds = %bb84
  %r488 = add i32 0, 0
  br label %bb97

bb97:                                             ; preds = %bb96, %bb95
  %r490 = phi i32 [ %r489, %bb95 ], [ %r488, %bb96 ]
  %r491 = icmp ne i32 %r490, 0
  br i1 %r491, label %bb81, label %bb82

bb81:                                             ; preds = %bb97, %bb87
  call void @putch(i32 74)
  br label %bb83

bb82:                                             ; preds = %bb97
  br label %bb83

bb83:                                             ; preds = %bb82, %bb81
  %r468 = icmp ne i32 %r426, 0
  br i1 %r468, label %bb103, label %bb102

bb102:                                            ; preds = %bb83
  %r470 = add i32 1, 0
  br label %bb104

bb103:                                            ; preds = %bb83
  %r469 = add i32 0, 0
  br label %bb104

bb104:                                            ; preds = %bb103, %bb102
  %r471 = phi i32 [ %r470, %bb102 ], [ %r469, %bb103 ]
  %r472 = icmp ne i32 %r471, 0
  br i1 %r472, label %bb98, label %bb101

bb101:                                            ; preds = %bb104
  %r473 = icmp slt i32 %r428, %r428
  br i1 %r473, label %bb109, label %bb110

bb109:                                            ; preds = %bb101
  %r486 = add i32 1, 0
  br label %bb111

bb110:                                            ; preds = %bb101
  %r485 = add i32 0, 0
  br label %bb111

bb111:                                            ; preds = %bb110, %bb109
  %r474 = phi i32 [ %r486, %bb109 ], [ %r485, %bb110 ]
  %r475 = icmp ne i32 %r474, 0
  br i1 %r475, label %bb108, label %bb106

bb108:                                            ; preds = %bb111
  %r479 = icmp sge i32 %r429, %r429
  br i1 %r479, label %bb112, label %bb113

bb112:                                            ; preds = %bb108
  %r480 = add i32 1, 0
  br label %bb114

bb113:                                            ; preds = %bb108
  %r484 = add i32 0, 0
  br label %bb114

bb114:                                            ; preds = %bb113, %bb112
  %r481 = phi i32 [ %r480, %bb112 ], [ %r484, %bb113 ]
  %r482 = icmp ne i32 %r481, 0
  br i1 %r482, label %bb105, label %bb106

bb105:                                            ; preds = %bb114
  %r483 = add i32 1, 0
  br label %bb107

bb106:                                            ; preds = %bb114, %bb111
  %r476 = add i32 0, 0
  br label %bb107

bb107:                                            ; preds = %bb106, %bb105
  %r477 = phi i32 [ %r483, %bb105 ], [ %r476, %bb106 ]
  %r478 = icmp ne i32 %r477, 0
  br i1 %r478, label %bb98, label %bb99

bb98:                                             ; preds = %bb107, %bb104
  call void @putch(i32 75)
  br label %bb100

bb99:                                             ; preds = %bb107
  br label %bb100

bb100:                                            ; preds = %bb99, %bb98
  call void @putch(i32 10)
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
