// 
// Examples of the MOV instruction.
//
.global _start	// Provide program starting address
// Load X2 with 0x1234FEDC4F5D6E3A first using MOV and MOVK
_start: MOV	X2, #0x6E3A
	MOVK X2, 0x4F5D, LSL #16
	MOVK X2, 0xFEDC, LSL #32
	MOVK X2, 0x1234, LSL #48
// Just move W2 into W1
	MOV W1, W2
// Now lets see all the shift versions of MOV
	MOV X1, X2, LSL #1 	// Logical shift left
	MOV X1, X2, LSR #1 	// Logical shift right
	MOV X1, X2, ASR #1	// Arithmetic shift right
	MOV X1, X2, ROR #1 	// Rotate right
// Repeat the above using mnemonics
	LSL X1, X2, #1		// Logical shift left
	LSR X1, X2, #1		// Logical shift right
	ASR X1, X2, #1		// Arithmetic shift right
	ROR X1, X2, #1		// Rotate right
// Example that works with 8 bit immediate and shift
	MOV X1, #0xAB000000 // Too bit for #imm16
// Example that can't be represented and result in an error
// Uncomment the instruction if you want to see the error
// 	MOV X1, #0xABCDEF11 // Too big for #imm16 and can't be represented
// Example of MOVN
	MOVN W1, #45
// Example of a MOV that the Assembler will change to MOVN
	MOV W1, #0xFFFFFFFE // (-2)
// Setup the parameters to exit the program
// and then call Linux to do it.
	MOV X0, #0 	// Use the 0 return code
	MOV X8, #93 	// Serve command code 93 terms
	SVC 0		// Call linux to terminate
