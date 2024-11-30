declare i32 @getch( )
declare i32 @getint( )
declare void @putch( i32 )
declare void @putint( i32 )
declare void @putarray( i32, i32* )
declare void @_sysy_starttime( i32 )
declare void @_sysy_stoptime( i32 )
@TOKEN_NUM = global i32 0
@TOKEN_OTHER = global i32 1
@last_char = global i32 32
@num = global i32 0
@other = global i32 0
@cur_token = global i32 0
define i32 @next_char( ) {
next_char:
  %r348 = call i32 @getch()
  store i32 %r348, i32* @last_char
  %r349 = load i32, i32* @last_char
  ret i32 %r349
}

define i32 @is_space( i32 %r102 ) {
is_space:
  %r353 = add i32 0, 0
  %r354 = add i32 0, 0
  %r355 = add i32 %r102, 0
  %r356 = add i32 0, 0
  %r357 = icmp eq i32 %r355, 32
  br i1 %r357, label %bb5, label %bb6

bb5:
  %r366 = add i32 1, 0
  br label %bb7

bb6:
  %r358 = add i32 0, 0
  br label %bb7

bb7:
  %r359 = phi i32 [ %r366, %bb5 ], [ %r358, %bb6 ]
  %r360 = icmp ne i32 %r359, 0
  br i1 %r360, label %bb1, label %bb4

bb4:
  %r361 = icmp eq i32 %r355, 10
  br i1 %r361, label %bb8, label %bb9

bb8:
  %r365 = add i32 1, 0
  br label %bb10

bb9:
  %r362 = add i32 0, 0
  br label %bb10

bb10:
  %r363 = phi i32 [ %r365, %bb8 ], [ %r362, %bb9 ]
  %r364 = icmp ne i32 %r363, 0
  br i1 %r364, label %bb1, label %bb2

bb1:
  ret i32 1
bb2:
  ret i32 0
}

define i32 @is_num( i32 %r115 ) {
is_num:
  %r370 = add i32 0, 0
  %r371 = add i32 0, 0
  %r372 = add i32 %r115, 0
  %r373 = add i32 0, 0
  %r374 = icmp sge i32 %r372, 48
  br i1 %r374, label %bb15, label %bb16

bb15:
  %r382 = add i32 1, 0
  br label %bb17

bb16:
  %r383 = add i32 0, 0
  br label %bb17

bb17:
  %r375 = phi i32 [ %r382, %bb15 ], [ %r383, %bb16 ]
  %r376 = icmp ne i32 %r375, 0
  br i1 %r376, label %bb14, label %bb12

bb14:
  %r377 = icmp sle i32 %r372, 57
  br i1 %r377, label %bb18, label %bb19

bb18:
  %r380 = add i32 1, 0
  br label %bb20

bb19:
  %r381 = add i32 0, 0
  br label %bb20

bb20:
  %r378 = phi i32 [ %r380, %bb18 ], [ %r381, %bb19 ]
  %r379 = icmp ne i32 %r378, 0
  br i1 %r379, label %bb11, label %bb12

bb11:
  ret i32 1
bb12:
  ret i32 0
}

define i32 @next_token( ) {
next_token:
  br label %bb21

bb21:
  %r384 = load i32, i32* @last_char
  %r385 = call i32 @is_space(i32 %r384)
  %r386 = icmp ne i32 %r385, 0
  br i1 %r386, label %bb22, label %bb23

bb22:
  %r387 = call i32 @next_char()
  br label %bb21

bb23:
  %r388 = load i32, i32* @last_char
  %r389 = call i32 @is_num(i32 %r388)
  %r390 = icmp ne i32 %r389, 0
  br i1 %r390, label %bb24, label %bb25

bb24:
  %r392 = load i32, i32* @last_char
  %r393 = sub i32 %r392, 48
  store i32 %r393, i32* @num
  br label %bb27

bb27:
  %r394 = call i32 @next_char()
  %r395 = call i32 @is_num(i32 %r394)
  %r396 = icmp ne i32 %r395, 0
  br i1 %r396, label %bb28, label %bb29

bb28:
  %r397 = load i32, i32* @num
  %r398 = mul i32 %r397, 10
  %r399 = load i32, i32* @last_char
  %r400 = add i32 %r398, %r399
  %r401 = sub i32 %r400, 48
  store i32 %r401, i32* @num
  br label %bb27

bb29:
  %r402 = load i32, i32* @TOKEN_NUM
  store i32 %r402, i32* @cur_token
  br label %bb26

bb25:
  %r403 = load i32, i32* @last_char
  store i32 %r403, i32* @other
  %r404 = call i32 @next_char()
  %r405 = load i32, i32* @TOKEN_OTHER
  store i32 %r405, i32* @cur_token
  br label %bb26

bb26:
  %r391 = load i32, i32* @cur_token
  ret i32 %r391
}

define i32 @panic( ) {
panic:
  call void @putch(i32 112)
  call void @putch(i32 97)
  call void @putch(i32 110)
  call void @putch(i32 105)
  call void @putch(i32 99)
  call void @putch(i32 33)
  call void @putch(i32 10)
  ret i32 -1
}

define i32 @get_op_prec( i32 %r151 ) {
get_op_prec:
  %r413 = add i32 0, 0
  %r414 = add i32 0, 0
  %r415 = add i32 0, 0
  %r416 = add i32 0, 0
  %r417 = add i32 0, 0
  %r418 = add i32 0, 0
  %r419 = add i32 %r151, 0
  %r420 = add i32 0, 0
  %r421 = icmp eq i32 %r419, 43
  br i1 %r421, label %bb34, label %bb35

bb34:
  %r448 = add i32 1, 0
  br label %bb36

bb35:
  %r449 = add i32 0, 0
  br label %bb36

bb36:
  %r422 = phi i32 [ %r448, %bb34 ], [ %r449, %bb35 ]
  %r423 = icmp ne i32 %r422, 0
  br i1 %r423, label %bb30, label %bb33

bb33:
  %r424 = icmp eq i32 %r419, 45
  br i1 %r424, label %bb37, label %bb38

bb37:
  %r446 = add i32 1, 0
  br label %bb39

bb38:
  %r447 = add i32 0, 0
  br label %bb39

bb39:
  %r425 = phi i32 [ %r446, %bb37 ], [ %r447, %bb38 ]
  %r426 = icmp ne i32 %r425, 0
  br i1 %r426, label %bb30, label %bb31

bb30:
  ret i32 10
bb31:
  br label %bb32

bb32:
  %r427 = icmp eq i32 %r419, 42
  br i1 %r427, label %bb48, label %bb49

bb48:
  %r428 = add i32 1, 0
  br label %bb50

bb49:
  %r429 = add i32 0, 0
  br label %bb50

bb50:
  %r430 = phi i32 [ %r428, %bb48 ], [ %r429, %bb49 ]
  %r431 = icmp ne i32 %r430, 0
  br i1 %r431, label %bb44, label %bb47

bb47:
  %r433 = icmp eq i32 %r419, 47
  br i1 %r433, label %bb51, label %bb52

bb51:
  %r438 = add i32 1, 0
  br label %bb53

bb52:
  %r434 = add i32 0, 0
  br label %bb53

bb53:
  %r435 = phi i32 [ %r438, %bb51 ], [ %r434, %bb52 ]
  %r436 = icmp ne i32 %r435, 0
  br i1 %r436, label %bb44, label %bb45

bb44:
  %r432 = add i32 1, 0
  br label %bb46

bb45:
  %r437 = add i32 0, 0
  br label %bb46

bb46:
  %r439 = phi i32 [ %r432, %bb44 ], [ %r437, %bb45 ]
  %r440 = icmp ne i32 %r439, 0
  br i1 %r440, label %bb40, label %bb43

bb43:
  %r441 = icmp eq i32 %r419, 37
  br i1 %r441, label %bb54, label %bb55

bb54:
  %r442 = add i32 1, 0
  br label %bb56

bb55:
  %r443 = add i32 0, 0
  br label %bb56

bb56:
  %r444 = phi i32 [ %r442, %bb54 ], [ %r443, %bb55 ]
  %r445 = icmp ne i32 %r444, 0
  br i1 %r445, label %bb40, label %bb41

bb40:
  ret i32 20
bb41:
  br label %bb42

bb42:
  ret i32 0
}

define void @stack_push( i32* %r183, i32 %r184 ) {
stack_push:
  %r452 = add i32 0, 0
  %r453 = add i32 %r184, 0
  %r186 = getelementptr i32, i32* %r183, i32 0
  %r187 = getelementptr i32, i32* %r183, i32 0
  %r454 = load i32, i32* %r187
  %r455 = add i32 %r454, 1
  store i32 %r455, i32* %r186
  %r190 = getelementptr i32, i32* %r183, i32 0
  %r456 = load i32, i32* %r190
  %r457 = add i32 0, 0
  %r458 = add i32 %r456, 0
  %r193 = getelementptr i32, i32* %r183, i32 %r458
  store i32 %r453, i32* %r193
  ret void
}

define i32 @stack_pop( i32* %r196 ) {
stack_pop:
  %r197 = getelementptr i32, i32* %r196, i32 0
  %r461 = load i32, i32* %r197
  %r462 = add i32 0, 0
  %r463 = add i32 %r461, 0
  %r200 = getelementptr i32, i32* %r196, i32 %r463
  %r464 = load i32, i32* %r200
  %r465 = add i32 0, 0
  %r466 = add i32 %r464, 0
  %r204 = getelementptr i32, i32* %r196, i32 0
  %r205 = getelementptr i32, i32* %r196, i32 0
  %r467 = load i32, i32* %r205
  %r468 = sub i32 %r467, 1
  store i32 %r468, i32* %r204
  ret i32 %r466
}

define i32 @stack_peek( i32* %r209 ) {
stack_peek:
  %r210 = getelementptr i32, i32* %r209, i32 0
  %r470 = load i32, i32* %r210
  %r471 = add i32 0, 0
  %r472 = add i32 %r470, 0
  %r213 = getelementptr i32, i32* %r209, i32 %r472
  %r473 = load i32, i32* %r213
  ret i32 %r473
}

define i32 @stack_size( i32* %r216 ) {
stack_size:
  %r217 = getelementptr i32, i32* %r216, i32 0
  %r474 = load i32, i32* %r217
  ret i32 %r474
}

define i32 @mod( i32 %r219, i32 %r221 ) {
mod:
  %r477 = add i32 0, 0
  %r478 = add i32 %r219, 0
  %r479 = add i32 0, 0
  %r480 = add i32 %r221, 0
  %r481 = sdiv i32 %r478, %r480
  %r482 = mul i32 %r481, %r480
  %r483 = sub i32 %r478, %r482
  ret i32 %r483
}

define i32 @eval_op( i32 %r230, i32 %r232, i32 %r234 ) {
eval_op:
  %r487 = add i32 0, 0
  %r488 = add i32 %r230, 0
  %r489 = add i32 0, 0
  %r490 = add i32 %r232, 0
  %r491 = add i32 0, 0
  %r492 = add i32 %r234, 0
  %r493 = icmp eq i32 %r488, 43
  br i1 %r493, label %bb57, label %bb58

bb57:
  %r494 = add i32 %r490, %r492
  ret i32 %r494
bb58:
  br label %bb59

bb59:
  %r495 = icmp eq i32 %r488, 45
  br i1 %r495, label %bb60, label %bb61

bb60:
  %r496 = sub i32 %r490, %r492
  ret i32 %r496
bb61:
  br label %bb62

bb62:
  %r497 = icmp eq i32 %r488, 42
  br i1 %r497, label %bb63, label %bb64

bb63:
  %r502 = mul i32 %r490, %r492
  ret i32 %r502
bb64:
  br label %bb65

bb65:
  %r498 = icmp eq i32 %r488, 47
  br i1 %r498, label %bb66, label %bb67

bb66:
  %r499 = sdiv i32 %r490, %r492
  ret i32 %r499
bb67:
  br label %bb68

bb68:
  %r500 = icmp eq i32 %r488, 37
  br i1 %r500, label %bb69, label %bb70

bb69:
  %r501 = call i32 @mod(i32 %r490, i32 %r492)
  ret i32 %r501
bb70:
  br label %bb71

bb71:
  ret i32 0
}

define i32 @eval( ) {
eval:
  %r513 = add i32 0, 0
  %r514 = add i32 0, 0
  %r515 = add i32 0, 0
  %r516 = add i32 0, 0
  %r517 = add i32 0, 0
  %r518 = add i32 0, 0
  %r519 = add i32 0, 0
  %r520 = add i32 0, 0
  %r521 = add i32 0, 0
  %r266 = alloca [ 256 x i32 ]
  %r267 = alloca [ 256 x i32 ]
  %r522 = add i32 0, 0
  %r523 = add i32 0, 0
  br label %bb72

bb72:
  %r524 = phi i32 [ %r523, %eval ], [ %r527, %bb73 ]
  %r525 = icmp slt i32 %r524, 256
  br i1 %r525, label %bb73, label %bb74

bb73:
  %r271 = getelementptr [256 x i32 ], [256 x i32 ]* %r266, i32 0, i32 %r524
  store i32 0, i32* %r271
  %r273 = getelementptr [256 x i32 ], [256 x i32 ]* %r267, i32 0, i32 %r524
  store i32 0, i32* %r273
  %r526 = add i32 %r524, 1
  %r527 = add i32 %r526, 0
  br label %bb72

bb74:
  %r528 = load i32, i32* @cur_token
  %r529 = load i32, i32* @TOKEN_NUM
  %r530 = icmp ne i32 %r528, %r529
  br i1 %r530, label %bb75, label %bb76

bb75:
  %r531 = call i32 @panic()
  ret i32 %r531
bb76:
  br label %bb77

bb77:
  %r532 = load i32, i32* @num
  call void @stack_push(i32* %r266, i32 %r532)
  %r533 = call i32 @next_token()
  br label %bb78

bb78:
  %r534 = load i32, i32* @cur_token
  %r535 = load i32, i32* @TOKEN_OTHER
  %r536 = icmp eq i32 %r534, %r535
  br i1 %r536, label %bb79, label %bb80

bb79:
  %r548 = load i32, i32* @other
  %r549 = add i32 %r548, 0
  %r550 = call i32 @get_op_prec(i32 %r549)
  %r551 = icmp eq i32 %r550, 0
  br i1 %r551, label %bb81, label %bb82

bb81:
  br label %bb80

bb82:
  br label %bb83

bb83:
  %r552 = call i32 @next_token()
  br label %bb84

bb84:
  %r553 = call i32 @stack_size(i32* %r267)
  %r554 = icmp ne i32 %r553, 0
  br i1 %r554, label %bb88, label %bb89

bb88:
  %r579 = add i32 1, 0
  br label %bb90

bb89:
  %r555 = add i32 0, 0
  br label %bb90

bb90:
  %r556 = phi i32 [ %r579, %bb88 ], [ %r555, %bb89 ]
  %r557 = icmp ne i32 %r556, 0
  br i1 %r557, label %bb87, label %bb86

bb87:
  %r564 = call i32 @stack_peek(i32* %r267)
  %r565 = call i32 @get_op_prec(i32 %r564)
  %r566 = call i32 @get_op_prec(i32 %r549)
  %r567 = icmp sge i32 %r565, %r566
  br i1 %r567, label %bb91, label %bb92

bb91:
  %r578 = add i32 1, 0
  br label %bb93

bb92:
  %r577 = add i32 0, 0
  br label %bb93

bb93:
  %r568 = phi i32 [ %r578, %bb91 ], [ %r577, %bb92 ]
  %r569 = icmp ne i32 %r568, 0
  br i1 %r569, label %bb85, label %bb86

bb85:
  %r570 = call i32 @stack_pop(i32* %r267)
  %r571 = add i32 %r570, 0
  %r572 = call i32 @stack_pop(i32* %r266)
  %r573 = add i32 %r572, 0
  %r574 = call i32 @stack_pop(i32* %r266)
  %r575 = add i32 %r574, 0
  %r576 = call i32 @eval_op(i32 %r571, i32 %r575, i32 %r573)
  call void @stack_push(i32* %r266, i32 %r576)
  br label %bb84

bb86:
  call void @stack_push(i32* %r267, i32 %r549)
  %r558 = load i32, i32* @cur_token
  %r559 = load i32, i32* @TOKEN_NUM
  %r560 = icmp ne i32 %r558, %r559
  br i1 %r560, label %bb94, label %bb95

bb94:
  %r563 = call i32 @panic()
  ret i32 %r563
bb95:
  br label %bb96

bb96:
  %r561 = load i32, i32* @num
  call void @stack_push(i32* %r266, i32 %r561)
  %r562 = call i32 @next_token()
  br label %bb78

bb80:
  %r537 = call i32 @next_token()
  br label %bb97

bb97:
  %r538 = call i32 @stack_size(i32* %r267)
  %r539 = icmp ne i32 %r538, 0
  br i1 %r539, label %bb98, label %bb99

bb98:
  %r541 = call i32 @stack_pop(i32* %r267)
  %r542 = add i32 %r541, 0
  %r543 = call i32 @stack_pop(i32* %r266)
  %r544 = add i32 %r543, 0
  %r545 = call i32 @stack_pop(i32* %r266)
  %r546 = add i32 %r545, 0
  %r547 = call i32 @eval_op(i32 %r542, i32 %r546, i32 %r544)
  call void @stack_push(i32* %r266, i32 %r547)
  br label %bb97

bb99:
  %r540 = call i32 @stack_peek(i32* %r266)
  ret i32 %r540
}

define i32 @main( ) {
main:
  call void @_sysy_starttime(i32 205)
  %r581 = call i32 @getint()
  %r582 = add i32 0, 0
  %r583 = add i32 %r581, 0
  %r584 = call i32 @getch()
  %r585 = call i32 @next_token()
  br label %bb100

bb100:
  %r586 = phi i32 [ %r583, %main ], [ %r590, %bb101 ]
  %r587 = icmp ne i32 %r586, 0
  br i1 %r587, label %bb101, label %bb102

bb101:
  %r588 = call i32 @eval()
  call void @putint(i32 %r588)
  call void @putch(i32 10)
  %r589 = sub i32 %r586, 1
  %r590 = add i32 %r589, 0
  br label %bb100

bb102:
  call void @_sysy_stoptime(i32 214)
  ret i32 0
}

