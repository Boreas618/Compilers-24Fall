@a = global i32 0
@b = global i32 0
@d = global i32 0
define i32 @set_a( i32 %r100 ) {
set_a:
  %r101 = alloca i32
  store i32 %r100, i32* %r101
  %r102 = load i32, i32* %r101
  store i32 %r102, i32* @a
  %r103 = load i32, i32* @a
  ret i32 %r103
}

define i32 @set_b( i32 %r104 ) {
set_b:
  %r105 = alloca i32
  store i32 %r104, i32* %r105
  %r106 = load i32, i32* %r105
  store i32 %r106, i32* @b
  %r107 = load i32, i32* @b
  ret i32 %r107
}

define i32 @set_d( i32 %r108 ) {
set_d:
  %r109 = alloca i32
  store i32 %r108, i32* %r109
  %r110 = load i32, i32* %r109
  store i32 %r110, i32* @d
  %r111 = load i32, i32* @d
  ret i32 %r111
}

define i32 @main( ) {
main:
  %r249 = alloca i32
  %r243 = alloca i32
  %r242 = alloca i32
  %r237 = alloca i32
  %r230 = alloca i32
  %r222 = alloca i32
  %r217 = alloca i32
  %r216 = alloca i32
  %r209 = alloca i32
  %r203 = alloca i32
  %r196 = alloca i32
  %r190 = alloca i32
  %r184 = alloca i32
  %r179 = alloca i32
  %r173 = alloca i32
  %r168 = alloca i32
  %r167 = alloca i32
  %r166 = alloca i32
  %r165 = alloca i32
  %r164 = alloca i32
  %r163 = alloca i32
  %r157 = alloca i32
  %r152 = alloca i32
  %r145 = alloca i32
  %r140 = alloca i32
  %r138 = alloca i32
  %r131 = alloca i32
  %r126 = alloca i32
  %r118 = alloca i32
  call void @_sysy_starttime(i32 97)
  store i32 2, i32* @a
  store i32 3, i32* @b
  %r113 = alloca i32
  %r115 = call i32 @set_a(i32 0)
  %r114 = icmp ne i32 %r115, 0
  br i1 %r114, label %bb5, label %bb6

bb5:
  store i32 1, i32* %r113
  br label %bb7

bb6:
  store i32 0, i32* %r113
  br label %bb7

bb7:
  %r117 = load i32, i32* %r113
  %r116 = icmp ne i32 %r117, 0
  br i1 %r116, label %bb4, label %bb2

bb4:
  %r120 = call i32 @set_b(i32 1)
  %r119 = icmp ne i32 %r120, 0
  br i1 %r119, label %bb8, label %bb9

bb8:
  store i32 1, i32* %r118
  br label %bb10

bb9:
  store i32 0, i32* %r118
  br label %bb10

bb10:
  %r122 = load i32, i32* %r118
  %r121 = icmp ne i32 %r122, 0
  br i1 %r121, label %bb1, label %bb2

bb1:
  br label %bb3

bb2:
  br label %bb3

bb3:
  %r123 = load i32, i32* @a
  call void @putint(i32 %r123)
  call void @putch(i32 32)
  %r124 = load i32, i32* @b
  call void @putint(i32 %r124)
  call void @putch(i32 32)
  store i32 2, i32* @a
  store i32 3, i32* @b
  %r128 = call i32 @set_a(i32 0)
  %r127 = icmp ne i32 %r128, 0
  br i1 %r127, label %bb15, label %bb16

bb15:
  store i32 1, i32* %r126
  br label %bb17

bb16:
  store i32 0, i32* %r126
  br label %bb17

bb17:
  %r130 = load i32, i32* %r126
  %r129 = icmp ne i32 %r130, 0
  br i1 %r129, label %bb14, label %bb12

bb14:
  %r133 = call i32 @set_b(i32 1)
  %r132 = icmp ne i32 %r133, 0
  br i1 %r132, label %bb18, label %bb19

bb18:
  store i32 1, i32* %r131
  br label %bb20

bb19:
  store i32 0, i32* %r131
  br label %bb20

bb20:
  %r135 = load i32, i32* %r131
  %r134 = icmp ne i32 %r135, 0
  br i1 %r134, label %bb11, label %bb12

bb11:
  br label %bb13

bb12:
  br label %bb13

bb13:
  %r136 = load i32, i32* @a
  call void @putint(i32 %r136)
  call void @putch(i32 32)
  %r137 = load i32, i32* @b
  call void @putint(i32 %r137)
  call void @putch(i32 10)
  store i32 1, i32* %r138
  store i32 2, i32* @d
  %r142 = load i32, i32* %r138
  %r141 = icmp sge i32 %r142, 1
  br i1 %r141, label %bb25, label %bb26

bb25:
  store i32 1, i32* %r140
  br label %bb27

bb26:
  store i32 0, i32* %r140
  br label %bb27

bb27:
  %r144 = load i32, i32* %r140
  %r143 = icmp ne i32 %r144, 0
  br i1 %r143, label %bb24, label %bb22

bb24:
  %r147 = call i32 @set_d(i32 3)
  %r146 = icmp ne i32 %r147, 0
  br i1 %r146, label %bb28, label %bb29

bb28:
  store i32 1, i32* %r145
  br label %bb30

bb29:
  store i32 0, i32* %r145
  br label %bb30

bb30:
  %r149 = load i32, i32* %r145
  %r148 = icmp ne i32 %r149, 0
  br i1 %r148, label %bb21, label %bb22

bb21:
  br label %bb23

bb22:
  br label %bb23

bb23:
  %r150 = load i32, i32* @d
  call void @putint(i32 %r150)
  call void @putch(i32 32)
  %r154 = load i32, i32* %r138
  %r153 = icmp sle i32 %r154, 1
  br i1 %r153, label %bb35, label %bb36

bb35:
  store i32 1, i32* %r152
  br label %bb37

bb36:
  store i32 0, i32* %r152
  br label %bb37

bb37:
  %r156 = load i32, i32* %r152
  %r155 = icmp ne i32 %r156, 0
  br i1 %r155, label %bb31, label %bb34

bb34:
  %r159 = call i32 @set_d(i32 4)
  %r158 = icmp ne i32 %r159, 0
  br i1 %r158, label %bb38, label %bb39

bb38:
  store i32 1, i32* %r157
  br label %bb40

bb39:
  store i32 0, i32* %r157
  br label %bb40

bb40:
  %r161 = load i32, i32* %r157
  %r160 = icmp ne i32 %r161, 0
  br i1 %r160, label %bb31, label %bb32

bb31:
  br label %bb33

bb32:
  br label %bb33

bb33:
  %r162 = load i32, i32* @d
  call void @putint(i32 %r162)
  call void @putch(i32 10)
  call void @putch(i32 10)
  store i32 0, i32* %r163
  store i32 1, i32* %r164
  store i32 2, i32* %r165
  store i32 3, i32* %r166
  store i32 4, i32* %r167
  br label %bb41

bb41:
  %r170 = load i32, i32* %r163
  %r169 = icmp ne i32 %r170, 0
  br i1 %r169, label %bb45, label %bb46

bb45:
  store i32 1, i32* %r168
  br label %bb47

bb46:
  store i32 0, i32* %r168
  br label %bb47

bb47:
  %r172 = load i32, i32* %r168
  %r171 = icmp ne i32 %r172, 0
  br i1 %r171, label %bb44, label %bb43

bb44:
  %r175 = load i32, i32* %r164
  %r174 = icmp ne i32 %r175, 0
  br i1 %r174, label %bb48, label %bb49

bb48:
  store i32 1, i32* %r173
  br label %bb50

bb49:
  store i32 0, i32* %r173
  br label %bb50

bb50:
  %r177 = load i32, i32* %r173
  %r176 = icmp ne i32 %r177, 0
  br i1 %r176, label %bb42, label %bb43

bb42:
  call void @putch(i32 32)
  br label %bb41

bb43:
  %r181 = load i32, i32* %r163
  %r180 = icmp ne i32 %r181, 0
  br i1 %r180, label %bb55, label %bb56

bb55:
  store i32 1, i32* %r179
  br label %bb57

bb56:
  store i32 0, i32* %r179
  br label %bb57

bb57:
  %r183 = load i32, i32* %r179
  %r182 = icmp ne i32 %r183, 0
  br i1 %r182, label %bb51, label %bb54

bb54:
  %r186 = load i32, i32* %r164
  %r185 = icmp ne i32 %r186, 0
  br i1 %r185, label %bb58, label %bb59

bb58:
  store i32 1, i32* %r184
  br label %bb60

bb59:
  store i32 0, i32* %r184
  br label %bb60

bb60:
  %r188 = load i32, i32* %r184
  %r187 = icmp ne i32 %r188, 0
  br i1 %r187, label %bb51, label %bb52

bb51:
  call void @putch(i32 67)
  br label %bb53

bb52:
  br label %bb53

bb53:
  %r192 = load i32, i32* %r163
  %r193 = load i32, i32* %r164
  %r191 = icmp sge i32 %r192, %r193
  br i1 %r191, label %bb65, label %bb66

bb65:
  store i32 1, i32* %r190
  br label %bb67

bb66:
  store i32 0, i32* %r190
  br label %bb67

bb67:
  %r195 = load i32, i32* %r190
  %r194 = icmp ne i32 %r195, 0
  br i1 %r194, label %bb61, label %bb64

bb64:
  %r198 = load i32, i32* %r164
  %r199 = load i32, i32* %r163
  %r197 = icmp sle i32 %r198, %r199
  br i1 %r197, label %bb68, label %bb69

bb68:
  store i32 1, i32* %r196
  br label %bb70

bb69:
  store i32 0, i32* %r196
  br label %bb70

bb70:
  %r201 = load i32, i32* %r196
  %r200 = icmp ne i32 %r201, 0
  br i1 %r200, label %bb61, label %bb62

bb61:
  call void @putch(i32 72)
  br label %bb63

bb62:
  br label %bb63

bb63:
  %r205 = load i32, i32* %r165
  %r206 = load i32, i32* %r164
  %r204 = icmp sge i32 %r205, %r206
  br i1 %r204, label %bb75, label %bb76

bb75:
  store i32 1, i32* %r203
  br label %bb77

bb76:
  store i32 0, i32* %r203
  br label %bb77

bb77:
  %r208 = load i32, i32* %r203
  %r207 = icmp ne i32 %r208, 0
  br i1 %r207, label %bb74, label %bb72

bb74:
  %r211 = load i32, i32* %r167
  %r212 = load i32, i32* %r166
  %r210 = icmp ne i32 %r211, %r212
  br i1 %r210, label %bb78, label %bb79

bb78:
  store i32 1, i32* %r209
  br label %bb80

bb79:
  store i32 0, i32* %r209
  br label %bb80

bb80:
  %r214 = load i32, i32* %r209
  %r213 = icmp ne i32 %r214, 0
  br i1 %r213, label %bb71, label %bb72

bb71:
  call void @putch(i32 73)
  br label %bb73

bb72:
  br label %bb73

bb73:
  %r219 = load i32, i32* %r164
  %r218 = icmp ne i32 %r219, 0
  br i1 %r218, label %bb90, label %bb89

bb89:
  store i32 1, i32* %r217
  br label %bb91

bb90:
  store i32 0, i32* %r217
  br label %bb91

bb91:
  %r221 = load i32, i32* %r217
  %r220 = icmp ne i32 %r221, 0
  br i1 %r220, label %bb88, label %bb86

bb88:
  %r224 