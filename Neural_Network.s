     AREA     factorial, CODE, READONLY
     EXPORT __main
     IMPORT printMsg4p
     ENTRY 
__main  FUNCTION	

       MOV R4,#5;
       MOV R5,#1;
       MOV R6,#2;  
	   MOV R7,#3;
	   MOV R8,#4;
	   MOV R9,#5;
	   	   
	   CMP R4,R5;
	   BEQ OR;
       CMP R4,R6;
	   BEQ AND;
	   CMP R4,R7
	   BEQ NOR;
	   CMP R4,R8;;
	   BEQ NAND;
	   CMP R4,R9;
	   BEQ XNOR;
	  
	   
OR	   VLDR.F32 s14,=1; x1 = 1
       VLDR.F32 s15,=0; x2 = 0
       VLDR.F32 s16,=1; x3 = 1
       VLDR.F32 s17,=-0.1; w1 = -0.1
	   VLDR.F32 s18,=0.7; w2 = 0.7
	   VLDR.F32 s19,=0.7; w3 = 0.7
	   VLDR.F32 s20,=-0.1; bias = -0.1
	   VMUL.F32 s21,s14,s17; x1*w1
       VMUL.F32 s22,s15,s18; x2*w2
	   VMUL.F32 s23,s16,s19; x3*w3
	   VADD.F32 s24,s21,s22; x1*w1 + x2*w2
	   VADD.F32 s24,s24,s23; x1*w1 + x2*w2 + x3*w3
	   VADD.F32 s24,s24,s20; x1*w1 + x2*w2 + x3*w3 + bias
	   B SIGM;
	   
AND	   VLDR.F32 s14,=1; x1 = 1
       VLDR.F32 s15,=0; x2 = 0
       VLDR.F32 s16,=1; x3 = 1
       VLDR.F32 s17,=-0.1; w1 = -0.1
	   VLDR.F32 s18,=0.2; w2 = 0.2
	   VLDR.F32 s19,=0.2; w3 = 0.2
	   VLDR.F32 s20,=-0.2; bias = -0.2
	   VMUL.F32 s21,s14,s17; x1*w1
       VMUL.F32 s22,s15,s18; x2*w2
	   VMUL.F32 s23,s16,s19; x3*w3
	   VADD.F32 s24,s21,s22; x1*w1 + x2*w2
	   VADD.F32 s24,s24,s23; x1*w1 + x2*w2 + x3*w3
	   VADD.F32 s24,s24,s20; x1*w1 + x2*w2 + x3*w3 + bias
	   B SIGM;
	   
NOR	   VLDR.F32 s14,=1; x1 = 1
       VLDR.F32 s15,=0; x2 = 0
       VLDR.F32 s16,=1; x3 = 1
       VLDR.F32 s17,=0.5; w1 = 0.5
	   VLDR.F32 s18,=-0.7; w2 = -0.7
	   VLDR.F32 s19,=-0.7; w3 = -0.7
	   VLDR.F32 s20,=0.1; bias = 0.1
	   VMUL.F32 s21,s14,s17; x1*w1
       VMUL.F32 s22,s15,s18; x2*w2
	   VMUL.F32 s23,s16,s19; x3*w3
	   VADD.F32 s24,s21,s22; x1*w1 + x2*w2
	   VADD.F32 s24,s24,s23; x1*w1 + x2*w2 + x3*w3
	   VADD.F32 s24,s24,s20; x1*w1 + x2*w2 + x3*w3 + bias
	   B SIGM;
	   
NAND   VLDR.F32 s14,=1; x1 = 1
       VLDR.F32 s15,=0; x2 = 0
       VLDR.F32 s16,=1; x3 = 1
       VLDR.F32 s17,=0.6; w1 = 0.6
	   VLDR.F32 s18,=-0.8; w2 = -0.8
	   VLDR.F32 s19,=-0.8; w3 = -0.8
	   VLDR.F32 s20,=0.3; bias = 0.3
	   VMUL.F32 s21,s14,s17; x1*w1
       VMUL.F32 s22,s15,s18; x2*w2
	   VMUL.F32 s23,s16,s19; x3*w3
	   VADD.F32 s24,s21,s22; x1*w1 + x2*w2
	   VADD.F32 s24,s24,s23; x1*w1 + x2*w2 + x3*w3
	   VADD.F32 s24,s24,s20; x1*w1 + x2*w2 + x3*w3 + bias
	   B SIGM;

XNOR   VLDR.F32 s14,=1; x1 = 1
       VLDR.F32 s15,=0; x2 = 0
       VLDR.F32 s16,=1; x3 = 1
       VLDR.F32 s17,=-5; w1 = -5
	   VLDR.F32 s18,=20; w2 = 20
	   VLDR.F32 s19,=10; w3 = 10
	   VLDR.F32 s20,=1; bias = 1
	   VMUL.F32 s21,s14,s17; x1*w1
       VMUL.F32 s22,s15,s18; x2*w2
	   VMUL.F32 s23,s16,s19; x3*w3
	   VADD.F32 s24,s21,s22; x1*w1 + x2*w2
	   VADD.F32 s24,s24,s23; x1*w1 + x2*w2 + x3*w3
	   VADD.F32 s24,s24,s20; x1*w1 + x2*w2 + x3*w3 + bias
	   B SIGM;
	   
 
	   
SIGM   VMOV.F32 s1,s24; 
	   VLDR.F32 s2,=1; // n=1 :- used to increment the power of x for each term :- eg: x,x^2,x^3......
	   VLDR.F32 s3,=0; // counter = 0
	   VLDR.F32 s4,=1; // used for incrementing the counter by 1
	   VLDR.F32 s5,=1; // sum = 1
	   VLDR.F32 s6,=0; // term = 0
	   VLDR.F32 s7,=0; // c1 = 0
	   VLDR.F32 s8,=1; // c2 = 1
	   VLDR.F32 s9,=24; // max no. of terms
	   VLDR.F32 s10,=1; // to perform 1 + exp(-x)
	   VLDR.F32 s11,=1; // to perform 1/(1 + exp(-x))
	   VLDR.F32 s12,=0; // ouput of the sigmoid function

LOOPO  VMOV.F32 s7,s8;    // c1 = c2
       VADD.F32 s3,s3,s4; // count = count + 1
	   VMUL.F32 s8,s3,s7; // c2 = count*c1 :- to find factorial 
       VMUL.F32 s2,s2,s1; // increment power of x :- n= x,x^3,x^5,etc
	   VDIV.F32 s6,s2,s8; // term = n/c2 = x/1!,x^3/3!,x^5/5!,etc
	   VSUB.F32 s5,s5,s6; // sum = sum - term = 1 - x/1!
	   VCMP.F32 s3,s9;     // 
	   VMRS APSR_nzcv,FPSCR;
	   BGE P;
	   B LOOPE

LOOPE  VMOV.F32 s7,s8;    // c1 = c2
       VADD.F32 s3,s3,s4; // count = count + 1
	   VMUL.F32 s8,s3,s7; // c2 = count*c1 :- to find factorial 
       VMUL.F32 s2,s2,s1; // increment power of x :- n= x^2,x^4,x^6,etc
	   VDIV.F32 s6,s2,s8; // term = n/c2 = x^2/2!,x^4/4!,x^6/6!,etc
	   VADD.F32 s5,s5,s6; // sum = sum + term = 1 - x/1! + x^2/2!
	   VCMP.F32 s3,s9;
	   VMRS APSR_nzcv,FPSCR;
	   BGE P
	   B LOOPO

P      VADD.F32 s10,s10,s5; // 1 + exp(-x)
       VDIV.F32 s12,s11,s10; // 1/(1 + exp(-x))
	   
	   VMOV.F32 R0,s14;
       VMOV.F32 R1,s15; 
 	   VMOV.F32 R2,s16;
	   VMOV.F32 R3,s12;
	   BL printMsg4p
	   
	   
stop   B stop ; stop program
     ENDFUNC
     END 