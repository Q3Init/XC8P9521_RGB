;--------------------------------------------------------
; File Created by SLCC : free open source ANSI-C Compiler
; Version 3.6.0 #Jan 29 2024 (MSVC)
;--------------------------------------------------------
; SL port for the RISC core
;--------------------------------------------------------
;	.file	"C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C"
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
	global	_shake_process
	global	_beep_process
	global	_file_clrRam
	global	_file_init
	global	_file_project_init
	global	_int_isr
	global	_main
	global	_A_BUFF
	global	_R3_BUFF
	global	_pwrkey_delay
	global	_ledkey_delay
	global	_beep_delay
	global	_shake_flag
	global	_beep_mode
	global	_beep_cnt
	global	_led_mode
	global	_led_switch
	global	_mode_switch
	global	_color_pwm_duty
	global	_once_pwm_duty
	global	_cir_mode
	global	_led_cnt

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
UD_abs_XC8P9521_PWM_2_10	udata_ovr	0x0010
_A_BUFF
	res	1
UD_abs_XC8P9521_PWM_2_11	udata_ovr	0x0011
_R3_BUFF
	res	1
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
UDL_XC8P9521_PWM_2_0	udata
r0x1015	res	1
r0x1016	res	1
r0x1013	res	1
r0x100F	res	1
r0x1012	res	1
r0x1010	res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

ID_XC8P9521_PWM_2_0	idata
_pwrkey_delay
	add 0x02,a
	db	0x00, 0x00


ID_XC8P9521_PWM_2_1	idata
_ledkey_delay
	add 0x02,a
	db	0x00, 0x00


ID_XC8P9521_PWM_2_2	idata
_beep_delay
	add 0x02,a
	db	0x00, 0x00


ID_XC8P9521_PWM_2_3	idata
_shake_flag
	add 0x02,a
	db	0x00


ID_XC8P9521_PWM_2_4	idata
_beep_mode
	add 0x02,a
	db	0x00


ID_XC8P9521_PWM_2_5	idata
_beep_cnt
	add 0x02,a
	db	0x00


ID_XC8P9521_PWM_2_6	idata
_led_mode
	add 0x02,a
	db	0x01


ID_XC8P9521_PWM_2_7	idata
_led_switch
	add 0x02,a
	db	0x01


ID_XC8P9521_PWM_2_8	idata
_mode_switch
	add 0x02,a
	db	0x00


ID_XC8P9521_PWM_2_9	idata
_color_pwm_duty
	add 0x02,a
	db	0x00


ID_XC8P9521_PWM_2_10	idata
_once_pwm_duty
	add 0x02,a
	db	0x00


ID_XC8P9521_PWM_2_11	idata
_cir_mode
	add 0x02,a
	db	0x00


ID_XC8P9521_PWM_2_12	idata
_led_cnt
	add 0x02,a
	db	0x00


;@Allocation info for local variables in function 'file_clrRam'
;@file_clrRam delayUs                   Allocated to registers ;size:2
;@file_clrRam delayMs                   Allocated to registers ;size:2
;@file_clrRam key_process               Allocated to registers ;size:2
;@file_clrRam rgb_process               Allocated to registers ;size:2
;@file_clrRam output_process            Allocated to registers ;size:2
;@file_clrRam beep_process              Allocated to registers ;size:2
;@file_clrRam shake_process             Allocated to registers ;size:2
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
;@file_clrRam pwrkey_delay              Allocated to registers ;size:2
;@file_clrRam ledkey_delay              Allocated to registers ;size:2
;@file_clrRam beep_delay                Allocated to registers ;size:2
;@file_clrRam shake_flag                Allocated to registers ;size:1
;@file_clrRam beep_mode                 Allocated to registers ;size:1
;@file_clrRam beep_cnt                  Allocated to registers ;size:1
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
;	.line	138; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	__asm__("org 0x08");			//中断入口地址			
	org	0x08
;	.line	139; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	PUSH(_A_BUFF,_R3_BUFF);			//中断入栈保护
	mov	_A_BUFF,a
	swap	_A_BUFF
	swapa	STATUS
	mov	_R3_BUFF,a
;	.line	141; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	if(TCIF)					//判断TCIF是否为1
	JBTS	_ISRbits,0
	JMP	_00121_DS_
;	.line	143; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	TCC	  += 6;			//1/2 * 8 * (256-6) = 1000us	公式：1/IRC频率 * 预分频 * （256-初值）
	MOV	A,@0x06
	ADD	_TCC,A
;	.line	144; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	ISR    = 0xfe;				//清TC0中断标志位
	MOV	A,@0xfe
	MOV	_ISR,A
_00121_DS_:
;	.line	147; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	if(T1IF)					//判断T1IF是否为1,pwm周期中断
	JBTS	_ISRbits,3
	JMP	_00123_DS_
;	.line	149; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	ISR    = 0xf7;				//ISR的bit3:T1IF清零
	MOV	A,@0xf7
	MOV	_ISR,A
_00123_DS_:
;	.line	152; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	POP(_A_BUFF,_R3_BUFF);			//中断出栈保护恢复
	swapa	_R3_BUFF
	mov	STATUS,a
	swapa	_A_BUFF
;	.line	153; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	}
END_OF_INTERRUPT:
	RETI	

;--------------------------------------------------------
; code
;--------------------------------------------------------
code_XC8P9521_PWM_2	code
;***
;  pBlock Stats: dbName = M
;***
;has an exit
;functions called:
;   _file_clrRam
;   _file_init
;   _file_project_init
;   _key_process
;   _file_clrRam
;   _file_init
;   _file_project_init
;   _key_process
;2 compiler assigned registers:
;   r0x1010
;   r0x1011
;; Starting pCode block
S_XC8P9521_PWM_2__main	code
_main:	;Function start
; 2 exit points
;	.line	381; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	file_clrRam();					//清RAM
	CALL	_file_clrRam
;	.line	382; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	file_init();					//io寄存器初始化
	CALL	_file_init
;	.line	383; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	file_project_init();			//程序所需功能设置
	CALL	_file_project_init
;	.line	384; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	EI();							//打开总中断
	ei	
_00315_DS_:
;	.line	389; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	if( 1 == LIMIT_PORT() )
	CLR	r0x1010
	JBTC	_PORT5bits,3
	INC	r0x1010
;;104	MOV	A,r0x1010
;;102	MOV	r0x1011,A
;;103	MOV	A,r0x1011
	MOV	A,r0x1010
	XOR	A,@0x01
	JBTS	STATUS,2
	JMP	_00312_DS_
;	.line	391; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	FUN_PORT() = 0;
	BTC	_PORT6bits,6
;	.line	392; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	COLD_PORT() = 0;
	BTC	_PORT6bits,7
;	.line	393; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	R_PWMDTY = 100;
	MOV	A,@0x64
	MOV	_PDC1,A
;	.line	394; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	G_PWMDTY = 0;
	CLR	_PDC2
;	.line	395; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	B_PWMDTY = 100;
	MOV	A,@0x64
	MOV	_PDC3,A
;	.line	397; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	R_PWMDTY = 0;
	CLR	_PDC1
	JMP	_00315_DS_
_00312_DS_:
;	.line	400; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	else if( 0 == LIMIT_PORT( ) )
	JBTC	_PORT5bits,3
	JMP	_00315_DS_
;	.line	404; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	if( 0 == led_switch )
	MOV	A,@0x00
	OR	A,_led_switch
	JBTS	STATUS,2
	JMP	_00307_DS_
;	.line	407; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	R_PWMDTY = 0;
	CLR	_PDC1
;	.line	408; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	G_PWMDTY = 0;
	CLR	_PDC2
;	.line	409; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	B_PWMDTY = 100;
	MOV	A,@0x64
	MOV	_PDC3,A
	JMP	_00315_DS_
_00307_DS_:
;	.line	411; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	else if( 1 == led_switch )
	MOV	A,_led_switch
	XOR	A,@0x01
	JBTS	STATUS,2
	JMP	_00315_DS_
;	.line	413; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	key_process( );
	CALL	_key_process
	JMP	_00315_DS_
;	.line	418; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	}
	RET	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
S_XC8P9521_PWM_2__output_process	code
_output_process:	;Function start
; 2 exit points
;	.line	363; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	switch( mode_switch )
	MOV	A,_mode_switch
	JBTS	STATUS,2
	JMP	_00298_DS_
	JMP	_00287_DS_
_00298_DS_:
	MOV	A,_mode_switch
	XOR	A,@0x01
	JBTS	STATUS,2
	JMP	_00299_DS_
	JMP	_00288_DS_
_00299_DS_:
	JMP	_00290_DS_
_00287_DS_:
;	.line	367; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	NOP();
	nop	
;	.line	368; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	break;
	JMP	_00290_DS_
_00288_DS_:
;	.line	372; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	NOP();
	nop	
;	.line	375; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	}
_00290_DS_:
;	.line	374; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	}
	RET	
; exit point of _output_process

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1012
;; Starting pCode block
S_XC8P9521_PWM_2__rgb_process	code
_rgb_process:	;Function start
; 2 exit points
;	.line	285; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	if( led_cnt == 20 )
	MOV	A,_led_cnt
	XOR	A,@0x14
	JBTS	STATUS,2
	JMP	_00259_DS_
;	.line	287; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	led_cnt = 0;
	CLR	_led_cnt
;	.line	288; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	cir_mode = !cir_mode;
	MOV	A,_cir_mode
	MOV	A,@0x00
	JBTC	STATUS,2
	MOV	A,@0x01
	MOV	r0x1012,A
	MOV	A,r0x1012
	MOV	_cir_mode,A
_00259_DS_:
;	.line	290; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	switch( led_switch )
	MOV	A,@0x01
	SUB	A,_led_switch
	JBTS	STATUS,0
	JMP	_00282_DS_
;;swapping arguments (AOP_TYPEs 1/3)
	MOV	A,@0x04
	SUB	A,_led_switch
	JBTC	STATUS,0
	JMP	_00282_DS_
	DECA	_led_switch
	MOV	r0x1012,A
	MOV	A,r0x1012
	BANKSEL	PCL
	ADD	PCL,A
	JMP	_00260_DS_
	JMP	_00266_DS_
	JMP	_00276_DS_
_00260_DS_:
;	.line	294; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	if( CIR_FADEIN == cir_mode )
	MOV	A,_cir_mode
	XOR	A,@0x01
	JBTS	STATUS,2
	JMP	_00264_DS_
;	.line	296; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	color_pwm_duty += 5;
	MOV	A,@0x05
	ADD	_color_pwm_duty,A
	JMP	_00265_DS_
_00264_DS_:
;	.line	298; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	else if( CIR_DIEOUT == cir_mode )
	MOV	A,@0x00
	OR	A,_cir_mode
	JBTS	STATUS,2
	JMP	_00265_DS_
;	.line	300; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	color_pwm_duty -= 5;
	MOV	A,@0xfb
	ADD	_color_pwm_duty,A
_00265_DS_:
;	.line	302; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	led_cnt++;
	INC	_led_cnt
;	.line	303; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	R_PWMDTY = color_pwm_duty;
	MOV	A,_color_pwm_duty
	MOV	_PDC1,A
;	.line	304; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	G_PWMDTY = color_pwm_duty;			
	MOV	A,_color_pwm_duty
	MOV	_PDC2,A
;	.line	305; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	B_PWMDTY = color_pwm_duty;
	MOV	A,_color_pwm_duty
	MOV	_PDC3,A
;	.line	306; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	break;
	JMP	_00282_DS_
_00266_DS_:
;	.line	310; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	if( 1 == cir_mode )
	MOV	A,_cir_mode
	XOR	A,@0x01
	JBTS	STATUS,2
	JMP	_00270_DS_
;	.line	312; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	once_pwm_duty += 5;
	MOV	A,@0x05
	ADD	_once_pwm_duty,A
	JMP	_00271_DS_
_00270_DS_:
;	.line	314; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	else if( 0 == cir_mode )
	MOV	A,@0x00
	OR	A,_cir_mode
	JBTS	STATUS,2
	JMP	_00271_DS_
;	.line	316; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	once_pwm_duty -= 5;
	MOV	A,@0xfb
	ADD	_once_pwm_duty,A
_00271_DS_:
;	.line	318; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	led_cnt++;
	INC	_led_cnt
;;swapping arguments (AOP_TYPEs 1/3)
;	.line	319; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	switch( led_mode )
	MOV	A,@0x03
	SUB	A,_led_mode
	JBTC	STATUS,0
	JMP	_00282_DS_
	MOV	A,_led_mode
	BANKSEL	PCL
	ADD	PCL,A
	JMP	_00272_DS_
	JMP	_00273_DS_
	JMP	_00274_DS_
_00272_DS_:
;	.line	322; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	R_PWMDTY = once_pwm_duty;
	MOV	A,_once_pwm_duty
	MOV	_PDC1,A
;	.line	323; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	G_PWMDTY = 0;
	CLR	_PDC2
;	.line	324; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	B_PWMDTY = 0;
	CLR	_PDC3
;	.line	325; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	break;
	JMP	_00282_DS_
_00273_DS_:
;	.line	327; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	R_PWMDTY = 0;
	CLR	_PDC1
;	.line	328; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	G_PWMDTY = once_pwm_duty;
	MOV	A,_once_pwm_duty
	MOV	_PDC2,A
;	.line	329; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	B_PWMDTY = 0;
	CLR	_PDC3
;	.line	330; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	break;
	JMP	_00282_DS_
_00274_DS_:
;	.line	332; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	R_PWMDTY = 0;
	CLR	_PDC1
;	.line	333; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	G_PWMDTY = 0;
	CLR	_PDC2
;	.line	334; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	B_PWMDTY = once_pwm_duty;
	MOV	A,_once_pwm_duty
	MOV	_PDC3,A
;	.line	337; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	break;
	JMP	_00282_DS_
_00276_DS_:
;	.line	340; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	R_PWMDTY = 0;
	CLR	_PDC1
;	.line	341; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	G_PWMDTY = 0;			
	CLR	_PDC2
;	.line	342; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	B_PWMDTY = 0;
	CLR	_PDC3
;	.line	343; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	once_pwm_duty = 100;
	MOV	A,@0x64
	MOV	_once_pwm_duty,A
;;swapping arguments (AOP_TYPEs 1/3)
;	.line	344; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	switch( led_mode )
	MOV	A,@0x03
	SUB	A,_led_mode
	JBTC	STATUS,0
	JMP	_00282_DS_
	MOV	A,_led_mode
	BANKSEL	PCL
	ADD	PCL,A
	JMP	_00277_DS_
	JMP	_00278_DS_
	JMP	_00279_DS_
_00277_DS_:
;	.line	347; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	R_PWMDTY = once_pwm_duty;
	MOV	A,@0x64
	MOV	_PDC1,A
;	.line	348; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	break;
	JMP	_00282_DS_
_00278_DS_:
;	.line	350; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	G_PWMDTY = once_pwm_duty;
	MOV	A,@0x64
	MOV	_PDC2,A
;	.line	351; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	break;
	JMP	_00282_DS_
_00279_DS_:
;	.line	353; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	B_PWMDTY = once_pwm_duty;
	MOV	A,@0x64
	MOV	_PDC3,A
;	.line	358; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	}
_00282_DS_:
;	.line	357; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	}	
	RET	
; exit point of _rgb_process

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x100F
;; Starting pCode block
S_XC8P9521_PWM_2__key_process	code
_key_process:	;Function start
; 2 exit points
;	.line	205; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	if( 0 == PWRKY_PORT() )
	JBTC	_PORT5bits,2
	JMP	_00189_DS_
;	.line	207; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	pwrkey_delay++;
	INC	_pwrkey_delay
	JBTC	STATUS,2
	INC	(_pwrkey_delay + 1)
	JMP	_00190_DS_
_00189_DS_:
;	.line	212; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	if( pwrkey_delay >= 20 )
	MOV	A,@0x00
	SUB	A,(_pwrkey_delay + 1)
	JBTS	STATUS,2
	JMP	_00243_DS_
	MOV	A,@0x14
	SUB	A,_pwrkey_delay
_00243_DS_:
	JBTS	STATUS,0
	JMP	_00187_DS_
;	.line	215; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	if( pwrkey_delay < 3000 )
	MOV	A,@0x0b
	SUB	A,(_pwrkey_delay + 1)
	JBTS	STATUS,2
	JMP	_00244_DS_
	MOV	A,@0xb8
	SUB	A,_pwrkey_delay
_00244_DS_:
	JBTC	STATUS,0
	JMP	_00184_DS_
;	.line	217; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	switch( mode_switch )
	MOV	A,_mode_switch
	JBTS	STATUS,2
	JMP	_00245_DS_
	JMP	_00178_DS_
_00245_DS_:
	MOV	A,_mode_switch
	XOR	A,@0x01
	JBTS	STATUS,2
	JMP	_00246_DS_
	JMP	_00179_DS_
_00246_DS_:
	JMP	_00187_DS_
_00178_DS_:
;	.line	220; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	beep_mode = BEEP_ONE;
	MOV	A,@0x01
	MOV	_beep_mode,A
;	.line	221; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	beep_delay = 0;
	CLR	_beep_delay
	CLR	(_beep_delay + 1)
;	.line	222; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	beep_cnt = 1;
	MOV	A,@0x01
	MOV	_beep_cnt,A
;	.line	223; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	mode_switch = TWO_GEARS;
	MOV	A,@0x01
	MOV	_mode_switch,A
;	.line	224; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	break; 
	JMP	_00187_DS_
_00179_DS_:
;	.line	227; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	beep_mode = BEEP_TWO; 
	MOV	A,@0x02
	MOV	_beep_mode,A
;	.line	228; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	beep_delay = 0;
	CLR	_beep_delay
	CLR	(_beep_delay + 1)
;	.line	229; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	beep_cnt = 2;
	MOV	A,@0x02
	MOV	_beep_cnt,A
;	.line	230; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	mode_switch = ONE_GEARS;
	CLR	_mode_switch
;	.line	232; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	}
	JMP	_00187_DS_
_00184_DS_:
;	.line	235; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	else if( pwrkey_delay >= 3000 )
	MOV	A,@0x0b
	SUB	A,(_pwrkey_delay + 1)
	JBTS	STATUS,2
	JMP	_00247_DS_
	MOV	A,@0xb8
	SUB	A,_pwrkey_delay
_00247_DS_:
	JBTS	STATUS,0
	JMP	_00187_DS_
;	.line	238; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	NOP( );
	nop	
_00187_DS_:
;	.line	241; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	pwrkey_delay = 0;
	CLR	_pwrkey_delay
	CLR	(_pwrkey_delay + 1)
_00190_DS_:
;	.line	245; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	if( 0 == LEDKEY_PORT( ) )
	JBTC	_PORT5bits,1
	JMP	_00203_DS_
;	.line	247; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	ledkey_delay++;
	INC	_ledkey_delay
	JBTC	STATUS,2
	INC	(_ledkey_delay + 1)
	JMP	_00205_DS_
_00203_DS_:
;	.line	252; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	if( ledkey_delay >= 20 )
	MOV	A,@0x00
	SUB	A,(_ledkey_delay + 1)
	JBTS	STATUS,2
	JMP	_00248_DS_
	MOV	A,@0x14
	SUB	A,_ledkey_delay
_00248_DS_:
	JBTS	STATUS,0
	JMP	_00201_DS_
;	.line	255; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	if( ledkey_delay < 3000 )
	MOV	A,@0x0b
	SUB	A,(_ledkey_delay + 1)
	JBTS	STATUS,2
	JMP	_00249_DS_
	MOV	A,@0xb8
	SUB	A,_ledkey_delay
_00249_DS_:
	JBTC	STATUS,0
	JMP	_00198_DS_
;	.line	257; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	led_switch = 1;
	MOV	A,@0x01
	MOV	_led_switch,A
;	.line	258; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	switch( led_mode )
	MOV	A,@0x01
	SUB	A,_led_mode
	JBTS	STATUS,0
	JMP	_00201_DS_
;;swapping arguments (AOP_TYPEs 1/3)
	MOV	A,@0x04
	SUB	A,_led_mode
	JBTC	STATUS,0
	JMP	_00201_DS_
	DECA	_led_mode
	MOV	r0x100F,A
	MOV	A,r0x100F
	BANKSEL	PCL
	ADD	PCL,A
	JMP	_00191_DS_
	JMP	_00192_DS_
	JMP	_00193_DS_
_00191_DS_:
;	.line	261; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	led_mode = RGB_ONE_CIR;
	MOV	A,@0x02
	MOV	_led_mode,A
;	.line	262; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	break;
	JMP	_00201_DS_
_00192_DS_:
;	.line	264; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	led_mode = RGB_ONE_ONCE;
	MOV	A,@0x03
	MOV	_led_mode,A
;	.line	265; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	break;
	JMP	_00201_DS_
_00193_DS_:
;	.line	267; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	led_mode = RGB_COLOR_CIR;
	MOV	A,@0x01
	MOV	_led_mode,A
;	.line	269; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	}
	JMP	_00201_DS_
_00198_DS_:
;	.line	272; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	else if( ledkey_delay >= 3000 )
	MOV	A,@0x0b
	SUB	A,(_ledkey_delay + 1)
	JBTS	STATUS,2
	JMP	_00253_DS_
	MOV	A,@0xb8
	SUB	A,_ledkey_delay
_00253_DS_:
	JBTS	STATUS,0
	JMP	_00201_DS_
;	.line	274; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	led_mode = RGB_ONE_NONE;
	CLR	_led_mode
_00201_DS_:
;	.line	277; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	ledkey_delay = 0;
	CLR	_ledkey_delay
	CLR	(_ledkey_delay + 1)
;	.line	279; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	}
_00205_DS_:
	RET	
; exit point of _key_process

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;2 compiler assigned registers:
;   r0x1013
;   r0x1014
;; Starting pCode block
S_XC8P9521_PWM_2__shake_process	code
_shake_process:	;Function start
; 2 exit points
;	.line	196; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	if( 1 ==  SHAKE_PORT( ) )
	CLR	r0x1013
	JBTC	_PORT5bits,0
	INC	r0x1013
;;101	MOV	A,r0x1013
;;99	MOV	r0x1014,A
;;100	MOV	A,r0x1014
	MOV	A,r0x1013
	XOR	A,@0x01
	JBTS	STATUS,2
	JMP	_00173_DS_
;	.line	198; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	led_switch = !led_switch;
	MOV	A,_led_switch
	MOV	A,@0x00
	JBTC	STATUS,2
	MOV	A,@0x01
	MOV	r0x1013,A
	MOV	A,r0x1013
	MOV	_led_switch,A
;	.line	200; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	}
_00173_DS_:
	RET	
; exit point of _shake_process

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;2 compiler assigned registers:
;   r0x1015
;   r0x1016
;; Starting pCode block
S_XC8P9521_PWM_2__beep_process	code
_beep_process:	;Function start
; 2 exit points
;;swapping arguments (AOP_TYPEs 1/3)
;	.line	158; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	switch( beep_mode )
	MOV	A,@0x03
	SUB	A,_beep_mode
	JBTC	STATUS,0
	JMP	_00143_DS_
	MOV	A,_beep_mode
	BANKSEL	PCL
	ADD	PCL,A
	JMP	_00128_DS_
	JMP	_00129_DS_
	JMP	_00134_DS_
_00128_DS_:
;	.line	161; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	BEEP_PORT( ) = 0;
	BTC	_PORT6bits,5
;	.line	162; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	break;	
	JMP	_00143_DS_
_00129_DS_:
;	.line	164; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	BEEP_PORT( ) = 1;
	BTS	_PORT6bits,5
;	.line	165; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	beep_cnt--;
	DEC	_beep_cnt
;	.line	166; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	if( beep_delay++ >= 2000 )
	MOV	A,_beep_delay
	MOV	r0x1015,A
	MOV	A,(_beep_delay + 1)
	MOV	r0x1016,A
	INC	_beep_delay
	JBTC	STATUS,2
	INC	(_beep_delay + 1)
	MOV	A,@0x07
	SUB	A,r0x1016
	JBTS	STATUS,2
	JMP	_00165_DS_
	MOV	A,@0xd0
	SUB	A,r0x1015
_00165_DS_:
	JBTS	STATUS,0
	JMP	_00143_DS_
;	.line	168; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	if( beep_cnt == 0 )
	MOV	A,@0x00
	OR	A,_beep_cnt
	JBTS	STATUS,2
	JMP	_00143_DS_
;	.line	170; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	beep_mode = BEEP_NONE;
	CLR	_beep_mode
;	.line	171; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	beep_delay = 0;
	CLR	_beep_delay
	CLR	(_beep_delay + 1)
;	.line	174; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	break;	
	JMP	_00143_DS_
_00134_DS_:
;	.line	176; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	BEEP_PORT( ) = 1;
	BTS	_PORT6bits,5
;	.line	177; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	if( beep_delay++ >= 20)
	MOV	A,_beep_delay
	MOV	r0x1015,A
	MOV	A,(_beep_delay + 1)
	MOV	r0x1016,A
	INC	_beep_delay
	JBTC	STATUS,2
	INC	(_beep_delay + 1)
	MOV	A,@0x00
	SUB	A,r0x1016
	JBTS	STATUS,2
	JMP	_00166_DS_
	MOV	A,@0x14
	SUB	A,r0x1015
_00166_DS_:
	JBTS	STATUS,0
	JMP	_00143_DS_
;	.line	179; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	beep_cnt--;
	DEC	_beep_cnt
;	.line	180; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	if( beep_cnt == 0 )
	MOV	A,@0x00
	OR	A,_beep_cnt
	JBTS	STATUS,2
	JMP	_00138_DS_
;	.line	182; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	beep_delay = 0;
	CLR	_beep_delay
	CLR	(_beep_delay + 1)
;	.line	183; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	beep_mode = BEEP_NONE;
	CLR	_beep_mode
	JMP	_00143_DS_
_00138_DS_:
;	.line	185; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	else if( beep_cnt == 1 )
	MOV	A,_beep_cnt
	XOR	A,@0x01
	JBTS	STATUS,2
	JMP	_00143_DS_
;	.line	187; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	beep_delay = 0;
	CLR	_beep_delay
	CLR	(_beep_delay + 1)
;	.line	188; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	BEEP_PORT( ) = 0;
	BTC	_PORT6bits,5
;	.line	193; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	}
_00143_DS_:
;	.line	192; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	}
	RET	
; exit point of _beep_process

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
S_XC8P9521_PWM_2__file_project_init	code
_file_project_init:	;Function start
; 2 exit points
;	.line	129; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	IOCP_W(IMR,0x09);		//TCC+PWM周期中断,根据需要调用	
	mov	a,@0x09
	iw	IMR
;	.line	130; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	PWMCON = 0xf8;			//使能3路pwm输出，pwm=1/8*2(分频)*4clock*100=100us
	MOV	A,@0xf8
	MOV	_PWMCON,A
;	.line	131; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	PRD = 100;				//PWM周期寄存器
	MOV	A,@0x64
	MOV	_PRD,A
;	.line	132; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	}
	RET	
; exit point of _file_project_init

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
S_XC8P9521_PWM_2__file_init	code
_file_init:	;Function start
; 2 exit points
;	.line	108; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	CONTW(0x02);			//TCC 8分频
	mov	a,@0x02
	ctw
;	.line	109; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	TCC = 6;				//1/2 * 8 * (256-6) = 1000us	公式：1/IRC频率 * 预分频 * （256-初值）
	MOV	A,@0x06
	MOV	_TCC,A
;	.line	110; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	PORT5 = 0;				//
	CLR	_PORT5
;	.line	111; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	PORT6 = 0;				//
	CLR	_PORT6
;	.line	112; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	IOCP_W(P5CR,0x0F);		// 50 51 52 53 均为输入
	mov	a,@0x0F
	iw	P5CR
;	.line	113; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	IOCP_W(P6CR,0x00);		// 65 66 67 输出
	mov	a,@0x00
	iw	P6CR
;	.line	114; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	IOCP_W(PHDCR,0xff);		//端口上下拉控制寄存器，bit7-bit4对应P67-P64下拉;bit3-bit0对应P53-P50上拉 
	mov	a,@0xff
	iw	PHDCR
;	.line	115; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	IOCP_W(PDCR,0xff);		//端口下拉控制寄存器，  bit6-bit4对应P62-P60,bit3-bit0对应P53-P50
	mov	a,@0xff
	iw	PDCR
;	.line	116; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	IOCP_W(PHCR,0xff);		//P6端口上拉控制寄存器  bit7-bit0对应P67-P60
	mov	a,@0xff
	iw	PHCR
;	.line	117; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	IOCP_W(WDTCR,0x00);		//WDT 使能控制寄存器	IOCP_W(IMR,0x01);		//中断使能控制寄存器 
	mov	a,@0x00
	iw	WDTCR
;	.line	118; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	ISR = 0x0;				//清TC0中断标志位 
	CLR	_ISR
;	.line	119; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	}
	RET	
; exit point of _file_init

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
S_XC8P9521_PWM_2__file_clrRam	code
_file_clrRam:	;Function start
; 2 exit points
;	.line	98; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	for(RSR=0xD0;RSR<0xFF;RSR++)	//清零 BANK0 RAM  IAR-R0,RSR-R4
	MOV	A,@0xd0
	MOV	_RSR,A
_00107_DS_:
	MOV	A,@0xff
	SUB	A,_RSR
	JBTC	STATUS,0
	JMP	_00105_DS_
;	.line	100; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	{IAR = 0;}
	CLR	_IAR
;	.line	98; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	for(RSR=0xD0;RSR<0xFF;RSR++)	//清零 BANK0 RAM  IAR-R0,RSR-R4
	INC	_RSR
	JMP	_00107_DS_
_00105_DS_:
;	.line	101; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	IAR = 0;
	CLR	_IAR
;	.line	102; C:\USERS\15247\DESKTOP\XJ\FUN\XC8P9521-PWM-2.C	}
	RET	
; exit point of _file_clrRam


;	code size estimation:
;	  394+    5 =   399 instructions (  808 byte)

	end
