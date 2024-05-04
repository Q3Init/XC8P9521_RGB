;--------------------------------------------------------
; File Created by SLCC : free open source ANSI-C Compiler
; Version 3.6.0 #Jan 29 2024 (MSVC)
;--------------------------------------------------------
; SL port for the RISC core
;--------------------------------------------------------
;	.file	"C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C"
	list	p=XC8P9521
	radix dec
	include "XC8P9521.inc"
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	_delayUs
	extern	_delayMs
	extern	_IARbits
	extern	_TCCbits
	extern	_PCLbits
	extern	_STATUSbits
	extern	_RSRbits
	extern	_PORT5bits
	extern	_PORT6bits
	extern	_LVDCONbits
	extern	_PWMCONbits
	extern	_PRDbits
	extern	_PDC1bits
	extern	_PDC2bits
	extern	_PDC3bits
	extern	_ICIECRbits
	extern	_CPUCONbits
	extern	_ISRbits
	extern	_IAR
	extern	_TCC
	extern	_PCL
	extern	_STATUS
	extern	_RSR
	extern	_PORT5
	extern	_PORT6
	extern	_LVDCON
	extern	_PWMCON
	extern	_PRD
	extern	_PDC1
	extern	_PDC2
	extern	_PDC3
	extern	_ICIECR
	extern	_CPUCON
	extern	_ISR
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	global	_output_process
	global	_rgb_process
	global	_key_process
	global	_file_clrRam
	global	_file_init
	global	_file_project_init
	global	_int_isr
	global	_main
	global	_A_BUFF
	global	_R3_BUFF
	global	_fun_delay
	global	_cold_delay

	global STK06
	global STK05
	global STK04
	global STK03
	global STK02
	global STK01
	global STK00

sharebank udata_ovr 0x0020
STK06	res 1
STK05	res 1
STK04	res 1
STK03	res 1
STK02	res 1
STK01	res 1
STK00	res 1

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
UD_abs_XC8P9521_PWM_10	udata_ovr	0x0010
_A_BUFF
	res	1
UD_abs_XC8P9521_PWM_11	udata_ovr	0x0011
_R3_BUFF
	res	1
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
UDL_XC8P9521_PWM_0	udata
r0x1010	res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

ID_XC8P9521_PWM_0	idata
_led_mode
	add 0x02,a
	db	0x00


ID_XC8P9521_PWM_1	idata
_led_switch
	add 0x02,a
	db	0x00


ID_XC8P9521_PWM_2	idata
_mode_switch
	add 0x02,a
	db	0x00


ID_XC8P9521_PWM_3	idata
_color_pwm_duty
	add 0x02,a
	db	0x00


ID_XC8P9521_PWM_4	idata
_once_pwm_duty
	add 0x02,a
	db	0x00


ID_XC8P9521_PWM_5	idata
_cir_mode
	add 0x02,a
	db	0x00


ID_XC8P9521_PWM_6	idata
_led_cnt
	add 0x02,a
	db	0x00


ID_XC8P9521_PWM_7	idata
_pwrkey_cnt
	add 0x02,a
	db	0x00, 0x00


ID_XC8P9521_PWM_8	idata
_ledkey_cnt
	add 0x02,a
	db	0x00, 0x00


ID_XC8P9521_PWM_9	idata
_fun_delay
	add 0x02,a
	db	0x00, 0x00


ID_XC8P9521_PWM_10	idata
_cold_delay
	add 0x02,a
	db	0x00, 0x00


;@Allocation info for local variables in function 'file_clrRam'
;@file_clrRam delayUs                   Allocated to registers ;size:2
;@file_clrRam delayMs                   Allocated to registers ;size:2
;@file_clrRam key_process               Allocated to registers ;size:2
;@file_clrRam rgb_process               Allocated to registers ;size:2
;@file_clrRam output_process            Allocated to registers ;size:2
;@file_clrRam file_clrRam               Allocated to registers ;size:2
;@file_clrRam IARbits                   Allocated to registers ;size:1
;@file_clrRam TCCbits                   Allocated to registers ;size:1
;@file_clrRam PCLbits                   Allocated to registers ;size:1
;@file_clrRam STATUSbits                Allocated to registers ;size:1
;@file_clrRam RSRbits                   Allocated to registers ;size:1
;@file_clrRam PORT5bits                 Allocated to registers ;size:1
;@file_clrRam PORT6bits                 Allocated to registers ;size:1
;@file_clrRam LVDCONbits                Allocated to registers ;size:1
;@file_clrRam PWMCONbits                Allocated to registers ;size:1
;@file_clrRam PRDbits                   Allocated to registers ;size:1
;@file_clrRam PDC1bits                  Allocated to registers ;size:1
;@file_clrRam PDC2bits                  Allocated to registers ;size:1
;@file_clrRam PDC3bits                  Allocated to registers ;size:1
;@file_clrRam ICIECRbits                Allocated to registers ;size:1
;@file_clrRam CPUCONbits                Allocated to registers ;size:1
;@file_clrRam ISRbits                   Allocated to registers ;size:1
;@file_clrRam A_BUFF                    Allocated to registers ;size:1
;@file_clrRam R3_BUFF                   Allocated to registers ;size:1
;@file_clrRam led_mode                  Allocated to registers ;size:1
;@file_clrRam led_switch                Allocated to registers ;size:1
;@file_clrRam mode_switch               Allocated to registers ;size:1
;@file_clrRam color_pwm_duty            Allocated to registers ;size:1
;@file_clrRam once_pwm_duty             Allocated to registers ;size:1
;@file_clrRam cir_mode                  Allocated to registers ;size:1
;@file_clrRam led_cnt                   Allocated to registers ;size:1
;@file_clrRam IAR                       Allocated to registers ;size:1
;@file_clrRam TCC                       Allocated to registers ;size:1
;@file_clrRam PCL                       Allocated to registers ;size:1
;@file_clrRam STATUS                    Allocated to registers ;size:1
;@file_clrRam RSR                       Allocated to registers ;size:1
;@file_clrRam PORT5                     Allocated to registers ;size:1
;@file_clrRam PORT6                     Allocated to registers ;size:1
;@file_clrRam LVDCON                    Allocated to registers ;size:1
;@file_clrRam PWMCON                    Allocated to registers ;size:1
;@file_clrRam PRD                       Allocated to registers ;size:1
;@file_clrRam PDC1                      Allocated to registers ;size:1
;@file_clrRam PDC2                      Allocated to registers ;size:1
;@file_clrRam PDC3                      Allocated to registers ;size:1
;@file_clrRam ICIECR                    Allocated to registers ;size:1
;@file_clrRam CPUCON                    Allocated to registers ;size:1
;@file_clrRam ISR                       Allocated to registers ;size:1
;@end Allocation info for local variables in function 'file_clrRam';

;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
;	udata_ovr
;--------------------------------------------------------
; reset vector 
;--------------------------------------------------------
STARTUP	code 0x0000
	jmp	_main
;--------------------------------------------------------
; interrupt and initialization code
;--------------------------------------------------------
c_interrupt	code	0x0003
__sdcc_interrupt:
;***
;  pBlock Stats: dbName = I
;***
;; Starting pCode block
_int_isr:	;Function start
; 0 exit points
;	.line	122; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	__asm__("org 0x08");			//中断入口地址			
	org	0x08
;	.line	123; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	PUSH(_A_BUFF,_R3_BUFF);			//中断入栈保护
	mov	_A_BUFF,a
	swap	_A_BUFF
	swapa	STATUS
	mov	_R3_BUFF,a
;	.line	125; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	if(TCIF)					//判断TCIF是否为1
	JBTS	_ISRbits,0
	JMP	_00121_DS_
;	.line	127; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	TCC	  += 6;			//1/2 * 8 * (256-6) = 1000us	公式：1/IRC频率 * 预分频 * （256-初值）
	MOV	A,@0x06
	ADD	_TCC,A
;	.line	128; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	ISR    = 0xfe;				//清TC0中断标志位
	MOV	A,@0xfe
	MOV	_ISR,A
_00121_DS_:
;	.line	131; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	if(T1IF)					//判断T1IF是否为1,pwm周期中断
	JBTS	_ISRbits,3
	JMP	_00123_DS_
;	.line	133; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	ISR    = 0xf7;				//ISR的bit3:T1IF清零
	MOV	A,@0xf7
	MOV	_ISR,A
_00123_DS_:
;	.line	136; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	POP(_A_BUFF,_R3_BUFF);			//中断出栈保护恢复
	swapa	_R3_BUFF
	mov	STATUS,a
	swapa	_A_BUFF
;	.line	137; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	}
END_OF_INTERRUPT:
	RETI	

;--------------------------------------------------------
; code
;--------------------------------------------------------
code_XC8P9521_PWM	code
;***
;  pBlock Stats: dbName = M
;***
;has an exit
;functions called:
;   _file_clrRam
;   _file_init
;   _file_project_init
;   _key_process
;   _output_process
;   _rgb_process
;   _file_clrRam
;   _file_init
;   _file_project_init
;   _key_process
;   _output_process
;   _rgb_process
;2 compiler assigned registers:
;   r0x1010
;   r0x1011
;; Starting pCode block
S_XC8P9521_PWM__main	code
_main:	;Function start
; 2 exit points
;	.line	358; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	file_clrRam();					//清RAM
	CALL	_file_clrRam
;	.line	359; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	file_init();					//io寄存器初始化
	CALL	_file_init
;	.line	360; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	file_project_init();			//程序所需功能设置
	CALL	_file_project_init
;	.line	361; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	EI();							//打开总中断
	ei	
_00313_DS_:
;	.line	366; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	if( 0 == LIMIT_PORT() )
	JBTC	_PORT5bits,3
	JMP	_00310_DS_
;	.line	368; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	FUN_PORT() = 0;
	BTC	_PORT6bits,6
;	.line	369; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	COLD_PORT() = 0;
	BTC	_PORT6bits,7
;	.line	370; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	R_PWMDTY = 100;
	MOV	A,@0x64
	MOV	_PDC1,A
;	.line	371; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	G_PWMDTY = 0;
	CLR	_PDC2
;	.line	372; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	B_PWMDTY = 0;
	CLR	_PDC3
;	.line	374; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	R_PWMDTY = 0;
	CLR	_PDC1
	JMP	_00313_DS_
_00310_DS_:
;	.line	377; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	else if( 1 == LIMIT_PORT( ) )
	CLR	r0x1010
	JBTC	_PORT5bits,3
	INC	r0x1010
;;102	MOV	A,r0x1010
;;100	MOV	r0x1011,A
;;101	MOV	A,r0x1011
	MOV	A,r0x1010
	XOR	A,@0x01
	JBTS	STATUS,2
	JMP	_00313_DS_
;	.line	381; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	if( 0 == led_switch )
	MOV	A,@0x00
	OR	A,_led_switch
	JBTS	STATUS,2
	JMP	_00305_DS_
;	.line	384; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	R_PWMDTY = 0;
	CLR	_PDC1
;	.line	385; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	G_PWMDTY = 0;
	CLR	_PDC2
;	.line	386; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	B_PWMDTY = 0;
	CLR	_PDC3
	JMP	_00306_DS_
_00305_DS_:
;	.line	388; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	else if( 1 == led_switch )
	MOV	A,_led_switch
	XOR	A,@0x01
	JBTS	STATUS,2
	JMP	_00306_DS_
;	.line	390; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	key_process( );
	CALL	_key_process
_00306_DS_:
;	.line	393; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	output_process( );
	CALL	_output_process
;	.line	395; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	rgb_process( );
	CALL	_rgb_process
	JMP	_00313_DS_
;	.line	398; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	}
	RET	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
S_XC8P9521_PWM__output_process	code
_output_process:	;Function start
; 2 exit points
;	.line	302; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	fun_delay++;
	INC	_fun_delay
	JBTC	STATUS,2
	INC	(_fun_delay + 1)
;	.line	303; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	cold_delay++;
	INC	_cold_delay
	JBTC	STATUS,2
	INC	(_cold_delay + 1)
;	.line	304; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	switch( mode_switch )
	MOV	A,_mode_switch
	JBTS	STATUS,2
	JMP	_00288_DS_
	JMP	_00233_DS_
_00288_DS_:
	MOV	A,_mode_switch
	XOR	A,@0x01
	JBTS	STATUS,2
	JMP	_00289_DS_
	JMP	_00244_DS_
_00289_DS_:
	JMP	_00256_DS_
;;swapping arguments (AOP_TYPEs 1/3)
_00233_DS_:
;	.line	308; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	if( fun_delay <= 800 )
	MOV	A,@0x03
	SUB	A,(_fun_delay + 1)
	JBTS	STATUS,2
	JMP	_00290_DS_
	MOV	A,@0x21
	SUB	A,_fun_delay
_00290_DS_:
	JBTC	STATUS,0
	JMP	_00237_DS_
;	.line	310; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	FUN_PORT() = 0;	
	BTC	_PORT6bits,6
	JMP	_00238_DS_
_00237_DS_:
;	.line	312; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	else if( fun_delay >= 2000 )
	MOV	A,@0x07
	SUB	A,(_fun_delay + 1)
	JBTS	STATUS,2
	JMP	_00291_DS_
	MOV	A,@0xd0
	SUB	A,_fun_delay
_00291_DS_:
	JBTS	STATUS,0
	JMP	_00238_DS_
;	.line	314; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	fun_delay = 0;
	CLR	_fun_delay
	CLR	(_fun_delay + 1)
;	.line	315; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	FUN_PORT() = 1;	
	BTS	_PORT6bits,6
;;swapping arguments (AOP_TYPEs 1/3)
_00238_DS_:
;	.line	318; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	if( cold_delay <= 200 )
	MOV	A,@0x00
	SUB	A,(_cold_delay + 1)
	JBTS	STATUS,2
	JMP	_00292_DS_
	MOV	A,@0xc9
	SUB	A,_cold_delay
_00292_DS_:
	JBTC	STATUS,0
	JMP	_00242_DS_
;	.line	320; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	COLD_PORT() = 0;	
	BTC	_PORT6bits,7
	JMP	_00256_DS_
_00242_DS_:
;	.line	322; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	else if( cold_delay >= 2000 ) 
	MOV	A,@0x07
	SUB	A,(_cold_delay + 1)
	JBTS	STATUS,2
	JMP	_00293_DS_
	MOV	A,@0xd0
	SUB	A,_cold_delay
_00293_DS_:
	JBTS	STATUS,0
	JMP	_00256_DS_
;	.line	324; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	cold_delay = 0;
	CLR	_cold_delay
	CLR	(_cold_delay + 1)
;	.line	325; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	COLD_PORT() = 1;	
	BTS	_PORT6bits,7
;	.line	327; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	break;
	JMP	_00256_DS_
;;swapping arguments (AOP_TYPEs 1/3)
_00244_DS_:
;	.line	331; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	if( fun_delay <= 1200 )
	MOV	A,@0x04
	SUB	A,(_fun_delay + 1)
	JBTS	STATUS,2
	JMP	_00294_DS_
	MOV	A,@0xb1
	SUB	A,_fun_delay
_00294_DS_:
	JBTC	STATUS,0
	JMP	_00248_DS_
;	.line	333; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	FUN_PORT() = 0;	
	BTC	_PORT6bits,6
	JMP	_00249_DS_
_00248_DS_:
;	.line	335; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	else if( fun_delay >= 1200 )
	MOV	A,@0x04
	SUB	A,(_fun_delay + 1)
	JBTS	STATUS,2
	JMP	_00295_DS_
	MOV	A,@0xb0
	SUB	A,_fun_delay
_00295_DS_:
	JBTS	STATUS,0
	JMP	_00249_DS_
;	.line	337; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	fun_delay = 0;
	CLR	_fun_delay
	CLR	(_fun_delay + 1)
;	.line	338; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	FUN_PORT() = 1;	
	BTS	_PORT6bits,6
;;swapping arguments (AOP_TYPEs 1/3)
_00249_DS_:
;	.line	341; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	if( cold_delay <= 2000 )
	MOV	A,@0x07
	SUB	A,(_cold_delay + 1)
	JBTS	STATUS,2
	JMP	_00296_DS_
	MOV	A,@0xd1
	SUB	A,_cold_delay
_00296_DS_:
	JBTC	STATUS,0
	JMP	_00253_DS_
;	.line	343; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	COLD_PORT() = 1;	
	BTS	_PORT6bits,7
	JMP	_00256_DS_
_00253_DS_:
;	.line	345; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	else if( cold_delay >= 2000 )
	MOV	A,@0x07
	SUB	A,(_cold_delay + 1)
	JBTS	STATUS,2
	JMP	_00297_DS_
	MOV	A,@0xd0
	SUB	A,_cold_delay
_00297_DS_:
	JBTS	STATUS,0
	JMP	_00256_DS_
;	.line	347; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	cold_delay = 0;
	CLR	_cold_delay
	CLR	(_cold_delay + 1)
;	.line	348; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	COLD_PORT() = 1;	
	BTS	_PORT6bits,7
;	.line	352; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	}
_00256_DS_:
;	.line	351; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	}
	RET	
; exit point of _output_process

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x100F
;; Starting pCode block
S_XC8P9521_PWM__rgb_process	code
_rgb_process:	;Function start
; 2 exit points
;	.line	220; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	if( led_cnt == 20 )
	MOV	A,_led_cnt
	XOR	A,@0x14
	JBTS	STATUS,2
	JMP	_00205_DS_
;	.line	222; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	led_cnt = 0;
	CLR	_led_cnt
;	.line	223; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	cir_mode = !cir_mode;
	MOV	A,_cir_mode
	MOV	A,@0x00
	JBTC	STATUS,2
	MOV	A,@0x01
	MOV	_cir_mode,A
;;1	MOV	r0x100F,A
;;99	MOV	A,r0x100F
;;swapping arguments (AOP_TYPEs 1/3)
_00205_DS_:
;	.line	225; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	switch( led_switch )
	MOV	A,@0x03
	SUB	A,_led_switch
	JBTC	STATUS,0
	JMP	_00228_DS_
	MOV	A,_led_switch
	BANKSEL	PCL
	ADD	PCL,A
	JMP	_00206_DS_
	JMP	_00212_DS_
	JMP	_00222_DS_
_00206_DS_:
;	.line	229; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	if( CIR_FADEIN == cir_mode )
	MOV	A,_cir_mode
	XOR	A,@0x01
	JBTS	STATUS,2
	JMP	_00210_DS_
;	.line	231; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	color_pwm_duty += 5;
	MOV	A,@0x05
	ADD	_color_pwm_duty,A
	JMP	_00211_DS_
_00210_DS_:
;	.line	233; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	else if( CIR_DIEOUT == cir_mode )
	MOV	A,@0x00
	OR	A,_cir_mode
	JBTS	STATUS,2
	JMP	_00211_DS_
;	.line	235; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	color_pwm_duty -= 5;
	MOV	A,@0xfb
	ADD	_color_pwm_duty,A
_00211_DS_:
;	.line	237; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	led_cnt++;
	INC	_led_cnt
;	.line	238; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	R_PWMDTY = color_pwm_duty;
	MOV	A,_color_pwm_duty
	MOV	_PDC1,A
;	.line	239; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	G_PWMDTY = color_pwm_duty;			
	MOV	A,_color_pwm_duty
	MOV	_PDC2,A
;	.line	240; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	B_PWMDTY = color_pwm_duty;
	MOV	A,_color_pwm_duty
	MOV	_PDC3,A
;	.line	241; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	break;
	JMP	_00228_DS_
_00212_DS_:
;	.line	245; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	if( 1 == cir_mode )
	MOV	A,_cir_mode
	XOR	A,@0x01
	JBTS	STATUS,2
	JMP	_00216_DS_
;	.line	247; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	once_pwm_duty += 5;
	MOV	A,@0x05
	ADD	_once_pwm_duty,A
	JMP	_00217_DS_
_00216_DS_:
;	.line	249; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	else if( 0 == cir_mode )
	MOV	A,@0x00
	OR	A,_cir_mode
	JBTS	STATUS,2
	JMP	_00217_DS_
;	.line	251; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	once_pwm_duty -= 5;
	MOV	A,@0xfb
	ADD	_once_pwm_duty,A
_00217_DS_:
;	.line	253; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	led_cnt++;
	INC	_led_cnt
;;swapping arguments (AOP_TYPEs 1/3)
;	.line	254; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	switch( led_mode )
	MOV	A,@0x03
	SUB	A,_led_mode
	JBTC	STATUS,0
	JMP	_00228_DS_
	MOV	A,_led_mode
	BANKSEL	PCL
	ADD	PCL,A
	JMP	_00218_DS_
	JMP	_00219_DS_
	JMP	_00220_DS_
_00218_DS_:
;	.line	257; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	R_PWMDTY = once_pwm_duty;
	MOV	A,_once_pwm_duty
	MOV	_PDC1,A
;	.line	258; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	G_PWMDTY = 0;
	CLR	_PDC2
;	.line	259; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	B_PWMDTY = 0;
	CLR	_PDC3
;	.line	260; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	break;
	JMP	_00228_DS_
_00219_DS_:
;	.line	262; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	R_PWMDTY = 0;
	CLR	_PDC1
;	.line	263; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	G_PWMDTY = once_pwm_duty;
	MOV	A,_once_pwm_duty
	MOV	_PDC2,A
;	.line	264; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	B_PWMDTY = 0;
	CLR	_PDC3
;	.line	265; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	break;
	JMP	_00228_DS_
_00220_DS_:
;	.line	267; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	R_PWMDTY = 0;
	CLR	_PDC1
;	.line	268; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	G_PWMDTY = 0;
	CLR	_PDC2
;	.line	269; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	B_PWMDTY = once_pwm_duty;
	MOV	A,_once_pwm_duty
	MOV	_PDC3,A
;	.line	272; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	break;
	JMP	_00228_DS_
_00222_DS_:
;	.line	275; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	R_PWMDTY = 0;
	CLR	_PDC1
;	.line	276; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	G_PWMDTY = 0;			
	CLR	_PDC2
;	.line	277; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	B_PWMDTY = 0;
	CLR	_PDC3
;	.line	278; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	once_pwm_duty = 100;
	MOV	A,@0x64
	MOV	_once_pwm_duty,A
;;swapping arguments (AOP_TYPEs 1/3)
;	.line	279; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	switch( led_mode )
	MOV	A,@0x03
	SUB	A,_led_mode
	JBTC	STATUS,0
	JMP	_00228_DS_
	MOV	A,_led_mode
	BANKSEL	PCL
	ADD	PCL,A
	JMP	_00223_DS_
	JMP	_00224_DS_
	JMP	_00225_DS_
_00223_DS_:
;	.line	282; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	R_PWMDTY = once_pwm_duty;
	MOV	A,@0x64
	MOV	_PDC1,A
;	.line	283; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	break;
	JMP	_00228_DS_
_00224_DS_:
;	.line	285; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	G_PWMDTY = once_pwm_duty;
	MOV	A,@0x64
	MOV	_PDC2,A
;	.line	286; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	break;
	JMP	_00228_DS_
_00225_DS_:
;	.line	288; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	B_PWMDTY = once_pwm_duty;
	MOV	A,@0x64
	MOV	_PDC3,A
;	.line	293; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	}
_00228_DS_:
;	.line	292; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	}	
	RET	
; exit point of _rgb_process

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
S_XC8P9521_PWM__key_process	code
_key_process:	;Function start
; 2 exit points
;	.line	146; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	if( 0 == PWRKY_PORT() )
	JBTC	_PORT5bits,0
	JMP	_00139_DS_
;	.line	148; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	pwrkey_cnt++;
	INC	_pwrkey_cnt
	JBTC	STATUS,2
	INC	(_pwrkey_cnt + 1)
	JMP	_00140_DS_
_00139_DS_:
;	.line	153; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	if( pwrkey_cnt >= 20 )
	MOV	A,@0x00
	SUB	A,(_pwrkey_cnt + 1)
	JBTS	STATUS,2
	JMP	_00190_DS_
	MOV	A,@0x14
	SUB	A,_pwrkey_cnt
_00190_DS_:
	JBTS	STATUS,0
	JMP	_00137_DS_
;	.line	156; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	if( pwrkey_cnt < 3000 )
	MOV	A,@0x0b
	SUB	A,(_pwrkey_cnt + 1)
	JBTS	STATUS,2
	JMP	_00191_DS_
	MOV	A,@0xb8
	SUB	A,_pwrkey_cnt
_00191_DS_:
	JBTC	STATUS,0
	JMP	_00134_DS_
;	.line	158; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	switch( mode_switch )
	MOV	A,_mode_switch
	JBTS	STATUS,2
	JMP	_00192_DS_
	JMP	_00128_DS_
_00192_DS_:
	MOV	A,_mode_switch
	XOR	A,@0x01
	JBTS	STATUS,2
	JMP	_00193_DS_
	JMP	_00129_DS_
_00193_DS_:
	JMP	_00137_DS_
_00128_DS_:
;	.line	161; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	mode_switch = TWO_GEARS;
	MOV	A,@0x01
	MOV	_mode_switch,A
;	.line	162; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	break;
	JMP	_00137_DS_
_00129_DS_:
;	.line	165; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	mode_switch = ONE_GEARS;
	CLR	_mode_switch
;	.line	167; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	}
	JMP	_00137_DS_
_00134_DS_:
;	.line	170; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	else if( pwrkey_cnt >= 3000 )
	MOV	A,@0x0b
	SUB	A,(_pwrkey_cnt + 1)
	JBTS	STATUS,2
	JMP	_00194_DS_
	MOV	A,@0xb8
	SUB	A,_pwrkey_cnt
_00194_DS_:
	JBTS	STATUS,0
	JMP	_00137_DS_
;	.line	173; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	NOP( );
	nop	
_00137_DS_:
;	.line	176; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	pwrkey_cnt = 0;
	CLR	_pwrkey_cnt
	CLR	(_pwrkey_cnt + 1)
_00140_DS_:
;	.line	180; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	if( 0 == LEDKEY_PORT( ) )
	JBTC	_PORT5bits,1
	JMP	_00153_DS_
;	.line	182; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	ledkey_cnt++;
	INC	_ledkey_cnt
	JBTC	STATUS,2
	INC	(_ledkey_cnt + 1)
	JMP	_00155_DS_
_00153_DS_:
;	.line	187; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	if( ledkey_cnt >= 20 )
	MOV	A,@0x00
	SUB	A,(_ledkey_cnt + 1)
	JBTS	STATUS,2
	JMP	_00195_DS_
	MOV	A,@0x14
	SUB	A,_ledkey_cnt
_00195_DS_:
	JBTS	STATUS,0
	JMP	_00151_DS_
;	.line	190; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	if( ledkey_cnt < 3000 )
	MOV	A,@0x0b
	SUB	A,(_ledkey_cnt + 1)
	JBTS	STATUS,2
	JMP	_00196_DS_
	MOV	A,@0xb8
	SUB	A,_ledkey_cnt
_00196_DS_:
	JBTC	STATUS,0
	JMP	_00148_DS_
;	.line	192; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	led_switch = 1;
	MOV	A,@0x01
	MOV	_led_switch,A
;;swapping arguments (AOP_TYPEs 1/3)
;	.line	193; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	switch( led_mode )
	MOV	A,@0x03
	SUB	A,_led_mode
	JBTC	STATUS,0
	JMP	_00151_DS_
	MOV	A,_led_mode
	BANKSEL	PCL
	ADD	PCL,A
	JMP	_00141_DS_
	JMP	_00142_DS_
	JMP	_00143_DS_
_00141_DS_:
;	.line	196; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	led_mode = RGB_ONE_CIR;
	MOV	A,@0x01
	MOV	_led_mode,A
;	.line	197; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	break;
	JMP	_00151_DS_
_00142_DS_:
;	.line	199; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	led_mode = RGB_ONE_ONCE;
	MOV	A,@0x02
	MOV	_led_mode,A
;	.line	200; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	break;
	JMP	_00151_DS_
_00143_DS_:
;	.line	202; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	led_mode = RGB_COLOR_CIR;
	CLR	_led_mode
;	.line	204; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	}
	JMP	_00151_DS_
_00148_DS_:
;	.line	207; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	else if( ledkey_cnt >= 3000 )
	MOV	A,@0x0b
	SUB	A,(_ledkey_cnt + 1)
	JBTS	STATUS,2
	JMP	_00199_DS_
	MOV	A,@0xb8
	SUB	A,_ledkey_cnt
_00199_DS_:
	JBTS	STATUS,0
	JMP	_00151_DS_
;	.line	209; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	led_switch = 0;
	CLR	_led_switch
_00151_DS_:
;	.line	212; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	ledkey_cnt = 0;
	CLR	_ledkey_cnt
	CLR	(_ledkey_cnt + 1)
;	.line	214; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	}
_00155_DS_:
	RET	
; exit point of _key_process

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
S_XC8P9521_PWM__file_project_init	code
_file_project_init:	;Function start
; 2 exit points
;	.line	113; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	IOCP_W(IMR,0x09);		//TCC+PWM周期中断,根据需要调用	
	mov	a,@0x09
	iw	IMR
;	.line	114; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	PWMCON = 0xf8;			//使能3路pwm输出，pwm=1/8*2(分频)*4clock*100=100us
	MOV	A,@0xf8
	MOV	_PWMCON,A
;	.line	115; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	PRD = 100;				//PWM周期寄存器
	MOV	A,@0x64
	MOV	_PRD,A
;	.line	116; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	}
	RET	
; exit point of _file_project_init

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
S_XC8P9521_PWM__file_init	code
_file_init:	;Function start
; 2 exit points
;	.line	92; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	CONTW(0x02);			//TCC 8分频
	mov	a,@0x02
	ctw
;	.line	93; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	TCC = 6;				//1/2 * 8 * (256-6) = 1000us	公式：1/IRC频率 * 预分频 * （256-初值）
	MOV	A,@0x06
	MOV	_TCC,A
;	.line	94; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	PORT5 = 0;				//
	CLR	_PORT5
;	.line	95; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	PORT6 = 0;				//
	CLR	_PORT6
;	.line	96; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	IOCP_W(P5CR,0x0F);		// 50 51 52 53 均为输入
	mov	a,@0x0F
	iw	P5CR
;	.line	97; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	IOCP_W(P6CR,0x00);		// 65 66 67 输出
	mov	a,@0x00
	iw	P6CR
;	.line	98; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	IOCP_W(PHDCR,0xff);		//端口上下拉控制寄存器，bit7-bit4对应P67-P64下拉;bit3-bit0对应P53-P50上拉 
	mov	a,@0xff
	iw	PHDCR
;	.line	99; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	IOCP_W(PDCR,0xff);		//端口下拉控制寄存器，  bit6-bit4对应P62-P60,bit3-bit0对应P53-P50
	mov	a,@0xff
	iw	PDCR
;	.line	100; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	IOCP_W(PHCR,0xff);		//P6端口上拉控制寄存器  bit7-bit0对应P67-P60
	mov	a,@0xff
	iw	PHCR
;	.line	101; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	IOCP_W(WDTCR,0x00);		//WDT 使能控制寄存器	IOCP_W(IMR,0x01);		//中断使能控制寄存器 
	mov	a,@0x00
	iw	WDTCR
;	.line	102; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	ISR = 0x0;				//清TC0中断标志位 
	CLR	_ISR
;	.line	103; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	}
	RET	
; exit point of _file_init

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
S_XC8P9521_PWM__file_clrRam	code
_file_clrRam:	;Function start
; 2 exit points
;	.line	82; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	for(RSR=0xD0;RSR<0xFF;RSR++)	//清零 BANK0 RAM  IAR-R0,RSR-R4
	MOV	A,@0xd0
	MOV	_RSR,A
_00107_DS_:
	MOV	A,@0xff
	SUB	A,_RSR
	JBTC	STATUS,0
	JMP	_00105_DS_
;	.line	84; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	{IAR = 0;}
	CLR	_IAR
;	.line	82; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	for(RSR=0xD0;RSR<0xFF;RSR++)	//清零 BANK0 RAM  IAR-R0,RSR-R4
	INC	_RSR
	JMP	_00107_DS_
_00105_DS_:
;	.line	85; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	IAR = 0;
	CLR	_IAR
;	.line	86; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM.C	}
	RET	
; exit point of _file_clrRam


;	code size estimation:
;	  373+    4 =   377 instructions (  762 byte)

	end
