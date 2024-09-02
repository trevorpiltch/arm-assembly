//
// Assembler program to convert a string to 
// all upper case.
//
// X1 - address of output string
// X0 - address of input string
// X2 - original output string for length calc.
// W3 - current character being processed
//
// label 1 = loop
// label 2 = cont
.MACRO	toupper	instr, outstr
	LDR	X0, =\instr
	LDR	X1, =\outstr
	MOV	X2, X1
// The loop is until byte pointed to by X1 is non-zero
1: 	LDRB W3, [X0], #1 // load char and incr pointer
// If W3 > 'z' then goto cont
	CMP W3, #'z'
	B.GT 	2f
// Else if W3 < 'a' then goto end if
	CMP W3, #'a'
	B.LT 	2f
// if we got here then the letter is lower case,
// so convert it
	SUB	W3, W3, #('a'-'A')
2: 	// end if
	STRB 	W3, [X1], #1	// store char to output str
	CMP	W3, #0		// stop on hitting a null char
	B.NE	1b		// loop if character isn't null
	SUB 	X0, X1, X2	// get the len by subing the ptrs
.ENDM
	

