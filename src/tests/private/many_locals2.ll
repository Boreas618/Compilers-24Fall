declare i32 @getch( )
declare i32 @getint( )
declare void @putch( i32 )
declare void @putint( i32 )
declare void @putarray( i32, i32* )
declare void @_sysy_starttime( i32 )
declare void @_sysy_stoptime( i32 )
@n = global i32 0
define i32 @main( ) {
main:
  %r329 = add i32 0, 0
  %r330 = add i32 0, 0
  call void @_sysy_starttime(i32 4)
  %r331 = add i32 0, 0
  %r332 = add i32 0, 0
  %r333 = add i32 0, 0
  %r334 = add i32 0, 0
  %r335 = add i32 0, 0
  %r336 = add i32 0, 0
  %r337 = add i32 0, 0
  %r338 = add i32 0, 0
  %r339 = add i32 0, 0
  %r340 = add i32 0, 0
  %r341 = add i32 0, 0
  %r342 = add i32 0, 0
  %r343 = add i32 0, 0
  %r344 = add i32 0, 0
  %r345 = add i32 0, 0
  %r346 = add i32 0, 0
  %r347 = add i32 0, 0
  %r348 = add i32 0, 0
  %r349 = add i32 0, 0
  %r350 = add i32 0, 0
  %r351 = add i32 0, 0
  %r352 = add i32 0, 0
  %r353 = add i32 0, 0
  %r354 = add i32 0, 0
  %r355 = add i32 0, 0
  %r356 = add i32 0, 0
  %r357 = add i32 0, 0
  %r358 = add i32 0, 0
  %r359 = add i32 0, 0
  %r360 = add i32 0, 0
  %r361 = add i32 0, 0
  %r362 = call i32 @getint()
  %r363 = add i32 %r362, 0
  br label %bb1

bb1:
  %r364 = phi i32 [ %r363, %main ], [ %r367, %bb2 ]
  %r365 = icmp eq i32 %r364, 5
  br i1 %r365, label %bb2, label %bb3

bb2:
  %r366 = add i32 %r364, 1
  %r367 = add i32 %r366, 0
  br label %bb1

bb3:
  %r368 = add i32 0, 0
  %r369 = add i32 %r368, 1
  %r370 = add i32 %r369, 0
  %r371 = add i32 %r370, 1
  %r372 = add i32 %r371, 0
  %r373 = add i32 %r372, 1
  %r374 = add i32 %r373, 0
  %r375 = add i32 %r374, 1
  %r376 = add i32 %r375, 0
  %r377 = add i32 %r376, 1
  %r378 = add i32 %r377, 0
  %r379 = add i32 %r378, 1
  %r380 = add i32 %r379, 0
  %r381 = add i32 %r380, 1
  %r382 = add i32 %r381, 0
  %r383 = add i32 %r382, 1
  %r384 = add i32 %r383, 0
  %r385 = add i32 %r384, 1
  %r386 = add i32 %r385, 0
  %r387 = add i32 %r386, 1
  %r388 = add i32 %r387, 0
  %r389 = add i32 %r388, 1
  %r390 = add i32 %r389, 0
  %r391 = add i32 %r390, 1
  %r392 = add i32 %r391, 0
  %r393 = add i32 %r392, 1
  %r394 = add i32 %r393, 0
  %r395 = add i32 %r394, 1
  %r396 = add i32 %r395, 0
  %r397 = add i32 %r396, 1
  %r398 = add i32 %r397, 0
  %r399 = add i32 %r398, 1
  %r400 = add i32 %r399, 0
  %r401 = add i32 %r400, 1
  %r402 = add i32 %r401, 0
  %r403 = add i32 %r402, 1
  %r404 = add i32 %r403, 0
  %r405 = add i32 %r404, 1
  %r406 = add i32 %r405, 0
  %r407 = add i32 %r406, 1
  %r408 = add i32 %r407, 0
  %r409 = add i32 %r408, 1
  %r410 = add i32 %r409, 0
  %r411 = add i32 %r410, 1
  %r412 = add i32 %r411, 0
  %r413 = add i32 %r412, 1
  %r414 = add i32 %r413, 0
  %r415 = add i32 %r414, 1
  %r416 = add i32 %r415, 0
  %r417 = add i32 %r416, 1
  %r418 = add i32 %r417, 0
  %r419 = add i32 %r418, 1
  %r420 = add i32 %r419, 0
  %r421 = add i32 %r420, 1
  %r422 = add i32 %r421, 0
  %r423 = add i32 %r422, 1
  %r424 = add i32 %r423, 0
  %r425 = add i32 %r424, 1
  %r426 = add i32 %r425, 0
  call void @putint(i32 %r368)
  call void @putint(i32 %r370)
  call void @putint(i32 %r372)
  call void @putint(i32 %r374)
  call void @putint(i32 %r376)
  call void @putint(i32 %r378)
  call void @putint(i32 %r380)
  call void @putint(i32 %r382)
  call void @putint(i32 %r384)
  call void @putint(i32 %r386)
  call void @putint(i32 %r388)
  call void @putint(i32 %r390)
  call void @putint(i32 %r392)
  call void @putint(i32 %r394)
  call void @putint(i32 %r396)
  call void @putint(i32 %r398)
  call void @putint(i32 %r400)
  call void @putint(i32 %r402)
  call void @putint(i32 %r404)
  call void @putint(i32 %r406)
  call void @putint(i32 %r408)
  call void @putint(i32 %r410)
  call void @putint(i32 %r412)
  call void @putint(i32 %r414)
  call void @putint(i32 %r416)
  call void @putint(i32 %r418)
  call void @putint(i32 %r420)
  call void @putint(i32 %r422)
  call void @putint(i32 %r424)
  call void @putint(i32 %r426)
  %r427 = add i32 10, 0
  call void @putch(i32 %r427)
  call void @putint(i32 %r364)
  call void @putch(i32 %r427)
  call void @_sysy_stoptime(i32 312)
  ret i32 %r418
}

