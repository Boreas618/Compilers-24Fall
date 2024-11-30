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
  %r359 = add i32 0, 0
  %r360 = add i32 0, 0
  %r361 = add i32 %r102, 0
  %r362 = add i32 0, 0
  %r363 = icmp eq i32 %r361, 32
  br i1 %r363, label %bb5, label %bb6

bb5:
  %r371 = add i32 1, 0
  br label %bb7

bb6:
  %r372 = add i32 0, 0
  br label %bb7

bb7:
  %r364 = phi i32 [ %r371, %bb5 ], [ %r372, %bb6 ]
  %r365 = icmp ne i32 %r364, 0
  br i1 %r365, label %bb1, label %bb4

bb4:
  %r366 = icmp eq i32 %r361, 10
  br i1 %r366, label %bb8, label %bb9

bb8:
  %r370 = add i32 1, 0
  br label %bb10

bb9:
  %r367 = add i32 0, 0
  br label %bb10

bb10:
  %r368 = phi i32 [ %r370, %bb8 ], [ %r367, %bb9 ]
  %r369 = icmp ne i32 %r368, 0
  br i1 %r369, label %bb1, label %bb2

bb1:
  ret i32 1
bb2:
  ret i32 0
}

define i32 @is_num( i32 %r115 ) {
is_num:
  %r382 = add i32 0, 0
  %r383 = add i32 0, 0
  %r384 = add i32 %r115, 0
  %r385 = add i32 0, 0
  %r386 = icmp sge i32 %r384, 48
  br i1 %r386, label %bb15, label %bb16

bb15:
  %r394 = add i32 1, 0
  br label %bb17

bb16:
  %r395 = add i32 0, 0
  br label %bb17

bb17:
  %r387 = phi i32 [ %r394, %bb15 ], [ %r395, %bb16 ]
  %r388 = icmp ne i32 %r387, 0
  br i1 %r388, label %bb14, label %bb12

bb14:
  %r389 = icmp sle i32 %r384, 57
  br i1 %r389, label %bb18, label %bb19

bb18:
  %r392 = add i32 1, 0
  br label %bb20

bb19:
  %r393 = add i32 0, 0
  br label %bb20

bb20:
  %r390 = phi i32 [ %r392, %bb18 ], [ %r393, %bb19 ]
  %r391 = icmp ne i32 %r390, 0
  br i1 %r391, label %bb11, label %bb12

bb11:
  ret i32 1
bb12:
  ret i32 0
}

define i32 @next_token( ) {
next_token:
  br label %bb21

bb21:
  %r396 = load i32, i32* @last_char
  %r397 = call i32 @is_space(i32 %r396)
  %r398 = icmp ne i32 %r397, 0
  br i1 %r398, label %bb22, label %bb23

bb22:
  %r399 = call i32 @next_char()
  br label %bb21

bb23:
  %r400 = load i32, i32* @last_char
  %r401 = call i32 @is_num(i32 %r400)
  %r402 = icmp ne i32 %r401, 0
  br i1 %r402, label %bb24, label %bb25

bb24:
  %r404 = load i32, i32* @last_char
  %r405 = sub i32 %r404, 48
  store i32 %r405, i32* @num
  br label %bb27

bb27:
  %r406 = call i32 @next_char()
  %r407 = call i32 @is_num(i32 %r406)
  %r408 = icmp ne i32 %r407, 0
  br i1 %r408, label %bb28, label %bb29

bb28:
  %r409 = load i32, i32* @num
  %r410 = mul i32 %r409, 10
  %r411 = load i32, i32* @last_char
  %r412 = add i32 %r410, %r411
  %r413 = sub i32 %r412, 48
  store i32 %r413, i32* @num
  br label %bb27

bb29:
  %r414 = load i32, i32* @TOKEN_NUM
  store i32 %r414, i32* @cur_token
  br label %bb26

bb25:
  %r415 = load i32, i32* @last_char
  store i32 %r415, i32* @other
  %r416 = call i32 @next_char()
  %r417 = load i32, i32* @TOKEN_OTHER
  store i32 %r417, i32* @cur_token
  br label %bb26

bb26:
  %r403 = load i32, i32* @cur_token
  ret i32 %r403
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
  %r439 = add i32 0, 0
  %r440 = add i32 0, 0
  %r441 = add i32 0, 0
  %r442 = add i32 0, 0
  %r443 = add i32 0, 0
  %r444 = add i32 0, 0
  %r445 = add i32 %r151, 0
  %r446 = add i32 0, 0
  %r447 = icmp eq i32 %r445, 43
  br i1 %r447, label %bb34, label %bb35

bb34:
  %r449 = add i32 1, 0
  br label %bb36

bb35:
  %r448 = add i32 0, 0
  br label %bb36

bb36:
  %r450 = phi i32 [ %r449, %bb34 ], [ %r448, %bb35 ]
  %r451 = icmp ne i32 %r450, 0
  br i1 %r451, label %bb30, label %bb33

bb33:
  %r452 = icmp eq i32 %r445, 45
  br i1 %r452, label %bb37, label %bb38

bb37:
  %r453 = add i32 1, 0
  br label %bb39

bb38:
  %r454 = add i32 0, 0
  br label %bb39

bb39:
  %r455 = phi i32 [ %r453, %bb37 ], [ %r454, %bb38 ]
  %r456 = icmp ne i32 %r455, 0
  br i1 %r456, label %bb30, label %bb31

bb30:
  ret i32 10
bb31:
  br label %bb32

bb32:
  %r457 = icmp eq i32 %r445, 42
  br i1 %r457, label %bb48, label %bb49

bb48:
  %r474 = add i32 1, 0
  br label %bb50

bb49:
  %r475 = add i32 0, 0
  br label %bb50

bb50:
  %r458 = phi i32 [ %r474, %bb48 ], [ %r475, %bb49 ]
  %r459 = icmp ne i32 %r458, 0
  br i1 %r459, label %bb44, label %bb47

bb47:
  %r467 = icmp eq i32 %r445, 47
  br i1 %r467, label %bb51, label %bb52

bb51:
  %r472 = add i32 1, 0
  br label %bb53

bb52:
  %r468 = add i32 0, 0
  br label %bb53

bb53:
  %r469 = phi i32 [ %r472, %bb51 ], [ %r468, %bb52 ]
  %r470 = icmp ne i32 %r469, 0
  br i1 %r470, label %bb44, label %bb45

bb44:
  %r473 = add i32 1, 0
  br label %bb46

bb45:
  %r471 = add i32 0, 0
  br label %bb46

bb46:
  %r460 = phi i32 [ %r473, %bb44 ], [ %r471, %bb45 ]
  %r461 = icmp ne i32 %r460, 0
  br i1 %r461, label %bb40, label %bb43

bb43:
  %r462 = icmp eq i32 %r445, 37
  br i1 %r462, label %bb54, label %bb55

bb54:
  %r466 = add i32 1, 0
  br label %bb56

bb55:
  %r463 = add i32 0, 0
  br label %bb56

bb56:
  %r464 = phi i32 [ %r466, %bb54 ], [ %r463, %bb55 ]
  %r465 = icmp ne i32 %r464, 0
  br i1 %r465, label %bb40, label %bb41

bb40:
  ret i32 20
bb41:
  br label %bb42

bb42:
  ret i32 0
}

define void @stack_push( i32* %r183, i32 %r184 ) {
stack_push:
  %r482 = add i32 0, 0
  %r483 = add i32 %r184, 0
  %r186 = getelementptr i32, i32* %r183, i32 0
  %r187 = getelementptr i32, i32* %r183, i32 0
  %r484 = load i32, i32* %r187
  %r485 = add i32 %r484, 1
  store i32 %r485, i32* %r186
  %r190 = getelementptr i32, i32* %r183, i32 0
  %r486 = load i32, i32* %r190
  %r487 = add i32 0, 0
  %r488 = add i32 %r486, 0
  %r193 = getelementptr i32, i32* %r183, i32 %r488
  store i32 %r483, i32* %r193
  ret void
}

define i32 @stack_pop( i32* %r196 ) {
stack_pop:
  %r197 = getelementptr i32, i32* %r196, i32 0
  %r495 = load i32, i32* %r197
  %r496 = add i32 0, 0
  %r497 = add i32 %r495, 0
  %r200 = getelementptr i32, i32* %r196, i32 %r497
  %r498 = load i32, i32* %r200
  %r499 = add i32 0, 0
  %r500 = add i32 %r498, 0
  %r204 = getelementptr i32, i32* %r196, i32 0
  %r205 = getelementptr i32, i32* %r196, i32 0
  %r501 = load i32, i32* %r205
  %r502 = sub i32 %r501, 1
  store i32 %r502, i32* %r204
  ret i32 %r500
}

define i32 @stack_peek( i32* %r209 ) {
stack_peek:
  %r210 = getelementptr i32, i32* %r209, i32 0
  %r506 = load i32, i32* %r210
  %r507 = add i32 0, 0
  %r508 = add i32 %r506, 0
  %r213 = getelementptr i32, i32* %r209, i32 %r508
  %r509 = load i32, i32* %r213
  ret i32 %r509
}

define i32 @stack_size( i32* %r216 ) {
stack_size:
  %r217 = getelementptr i32, i32* %r216, i32 0
  %r510 = load i32, i32* %r217
  ret i32 %r510
}

define i32 @mod( i32 %r219, i32 %r221 ) {
mod:
  %r517 = add i32 0, 0
  %r518 = add i32 %r219, 0
  %r519 = add i32 0, 0
  %r520 = add i32 %r221, 0
  %r521 = sdiv i32 %r518, %r520
  %r522 = mul i32 %r521, %r520
  %r523 = sub i32 %r518, %r522
  ret i32 %r523
}

define i32 @eval_op( i32 %r230, i32 %r232, i32 %r234 ) {
eval_op:
  %r533 = add i32 0, 0
  %r534 = add i32 %r230, 0
  %r535 = add i32 0, 0
  %r536 = add i32 %r232, 0
  %r537 = add i32 0, 0
  %r538 = add i32 %r234, 0
  %r539 = icmp eq i32 %r534, 43
  br i1 %r539, label %bb57, label %bb58

bb57:
  %r548 = add i32 %r536, %r538
  ret i32 %r548
bb58:
  br label %bb59

bb59:
  %r540 = icmp eq i32 %r534, 45
  br i1 %r540, label %bb60, label %bb61

bb60:
  %r541 = sub i32 %r536, %r538
  ret i32 %r541
bb61:
  br label %bb62

bb62:
  %r542 = icmp eq i32 %r534, 42
  br i1 %r542, label %bb63, label %bb64

bb63:
  %r547 = mul i32 %r536, %r538
  ret i32 %r547
bb64:
  br label %bb65

bb65:
  %r543 = icmp eq i32 %r534, 47
  br i1 %r543, label %bb66, label %bb67

bb66:
  %r544 = sdiv i32 %r536, %r538
  ret i32 %r544
bb67:
  br label %bb68

bb68:
  %r545 = icmp eq i32 %r534, 37
  br i1 %r545, label %bb69, label %bb70

bb69:
  %r546 = call i32 @mod(i32 %r536, i32 %r538)
  ret i32 %r546
bb70:
  br label %bb71

bb71:
  ret i32 0
}

define i32 @eval( ) {
eval:
  %r579 = add i32 0, 0
  %r580 = add i32 0, 0
  %r581 = add i32 0, 0
  %r582 = add i32 0, 0
  %r583 = add i32 0, 0
  %r584 = add i32 0, 0
  %r585 = add i32 0, 0
  %r586 = add i32 0, 0
  %r587 = add i32 0, 0
  %r266 = alloca [ 256 x i32 ]
  %r267 = alloca [ 256 x i32 ]
  %r588 = add i32 0, 0
  %r589 = add i32 0, 0
  br label %bb72

bb72:
  %r590 = phi i32 [ %r589, %eval ], [ %r593, %bb73 ]
  %r591 = icmp slt i32 %r590, 256
  br i1 %r591, label %bb73, label %bb74

bb73:
  %r271 = getelementptr [256 x i32 ], [256 x i32 ]* %r266, i32 0, i32 %r590
  store i32 0, i32* %r271
  %r273 = getelementptr [256 x i32 ], [256 x i32 ]* %r267, i32 0, i32 %r590
  store i32 0, i32* %r273
  %r592 = add i32 %r590, 1
  %r593 = add i32 %r592, 0
  br label %bb72

bb74:
  %r594 = load i32, i32* @cur_token
  %r595 = load i32, i32* @TOKEN_NUM
  %r596 = icmp ne i32 %r594, %r595
  br i1 %r596, label %bb75, label %bb76

bb75:
  %r597 = call i32 @panic()
  ret i32 %r597
bb76:
  br label %bb77

bb77:
  %r598 = load i32, i32* @num
  call void @stack_push(i32* %r266, i32 %r598)
  %r599 = call i32 @next_token()
  br label %bb78

bb78:
  %r600 = load i32, i32* @cur_token
  %r601 = load i32, i32* @TOKEN_OTHER
  %r602 = icmp eq i32 %r600, %r601
  br i1 %r602, label %bb79, label %bb80

bb79:
  %r614 = load i32, i32* @other
  %r615 = add i32 %r614, 0
  %r616 = call i32 @get_op_prec(i32 %r615)
  %r617 = icmp eq i32 %r616, 0
  br i1 %r617, label %bb81, label %bb82

bb81:
  br label %bb80

bb82:
  br label %bb83

bb83:
  %r618 = call i32 @next_token()
  br label %bb84

bb84:
  %r619 = call i32 @stack_size(i32* %r267)
  %r620 = icmp ne i32 %r619, 0
  br i1 %r620, label %bb88, label %bb89

bb88:
  %r621 = add i32 1, 0
  br label %bb90

bb89:
  %r645 = add i32 0, 0
  br label %bb90

bb90:
  %r622 = phi i32 [ %r621, %bb88 ], [ %r645, %bb89 ]
  %r623 = icmp ne i32 %r622, 0
  br i1 %r623, label %bb87, label %bb86

bb87:
  %r630 = call i32 @stack_peek(i32* %r267)
  %r631 = call i32 @get_op_prec(i32 %r630)
  %r632 = call i32 @get_op_prec(i32 %r615)
  %r633 = icmp sge i32 %r631, %r632
  br i1 %r633, label %bb91, label %bb92

bb91:
  %r634 = add i32 1, 0
  br label %bb93

bb92:
  %r644 = add i32 0, 0
  br label %bb93

bb93:
  %r635 = phi i32 [ %r634, %bb91 ], [ %r644, %bb92 ]
  %r636 = icmp ne i32 %r635, 0
  br i1 %r636, label %bb85, label %bb86

bb85:
  %r637 = call i32 @stack_pop(i32* %r267)
  %r638 = add i32 %r637, 0
  %r639 = call i32 @stack_pop(i32* %r266)
  %r640 = add i32 %r639, 0
  %r641 = call i32 @stack_pop(i32* %r266)
  %r642 = add i32 %r641, 0
  %r643 = call i32 @eval_op(i32 %r638, i32 %r642, i32 %r640)
  call void @stack_push(i32* %r266, i32 %r643)
  br label %bb84

bb86:
  call void @stack_push(i32* %r267, i32 %r615)
  %r624 = load i32, i32* @cur_token
  %r625 = load i32, i32* @TOKEN_NUM
  %r626 = icmp ne i32 %r624, %r625
  br i1 %r626, label %bb94, label %bb95

bb94:
  %r627 = call i32 @panic()
  ret i32 %r627
bb95:
  br label %bb96

bb96:
  %r628 = load i32, i32* @num
  call void @stack_push(i32* %r266, i32 %r628)
  %r629 = call i32 @next_token()
  br label %bb78

bb80:
  %r603 = call i32 @next_token()
  br label %bb97

bb97:
  %r604 = call i32 @stack_size(i32* %r267)
  %r605 = icmp ne i32 %r604, 0
  br i1 %r605, label %bb98, label %bb99

bb98:
  %r606 = call i32 @stack_pop(i32* %r267)
  %r607 = add i32 %r606, 0
  %r608 = call i32 @stack_pop(i32* %r266)
  %r609 = add i32 %r608, 0
  %r610 = call i32 @stack_pop(i32* %r266)
  %r611 = add i32 %r610, 0
  %r612 = call i32 @eval_op(i32 %r607, i32 %r611, i32 %r609)
  call void @stack_push(i32* %r266, i32 %r612)
  br label %bb97

bb99:
  %r613 = call i32 @stack_peek(i32* %r266)
  ret i32 %r613
}

define i32 @main( ) {
main:
  call void @_sysy_starttime(i32 205)
  %r649 = call i32 @getint()
  %r650 = add i32 0, 0
  %r651 = add i32 %r649, 0
  %r652 = call i32 @getch()
  %r653 = call i32 @next_token()
  br label %bb100

bb100:
  %r654 = phi i32 [ %r651, %main ], [ %r658, %bb101 ]
  %r655 = icmp ne i32 %r654, 0
  br i1 %r655, label %bb101, label %bb102

bb101:
  %r656 = call i32 @eval()
  call void @putint(i32 %r656)
  call void @putch(i32 10)
  %r657 = sub i32 %r654, 1
  %r658 = add i32 %r657, 0
  br label %bb100

bb102:
  call void @_sysy_stoptime(i32 214)
  ret i32 0
}

