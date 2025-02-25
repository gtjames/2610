main:
	ADRP	X12,		fizz
	ADD	X12,	X12,	:lo12:fizz
	LDUR	X12,	[X12, 0]		//	get the value of fizz

	ADRP	X13,		fizzBuzz
	ADD	X13,	X13,	:lo12:fizzBuzz
	LDUR	X13,	[X13, 	0]	//	get the value of fizz

	ADDI	X14, 	XZR, 	90 	// 	initialize j = 90

	//	Divide by 15 and check if result is 0
	ADD	X1,	XZR,	#15	//	save test value of 15 in X1
	DIV	X1,	X14,	X1
	SUBIS	X1,	#0		//	if X1 != 0 then skip
	B.NE	tryThree			//	Branch to tryThree
	ADDI	X12,	X12, 	#1	//	inc the fizz register
	BR	Done

tryThree:
	//	Divide by 3 and check if result is 0
	ADD	X1,	XZR,	#3	//	save test value of 3 in X1
	DIV	X1,	X14,	X1
	SUBIS	X1,	#0		//	if X1 != 0 then skip
	B.NE	Done			//	Branch to tryThree
	ADDI	X13,	X13, 	#1	//	inc the fizz register

Done:
	NOP
