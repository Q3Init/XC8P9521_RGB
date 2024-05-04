;--------------------------------------------------------
; File Created by SLCC : free open source ANSI-C Compiler
; Version 3.6.0 #Jan 29 2024 (MSVC)
;--------------------------------------------------------
; SL port for the RISC core
;--------------------------------------------------------
;	.file	"C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C"
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
	global	_beep_delay
	global	_sys_delay
	global	_beep_mode
	global	_beep_cnt
	global	_led_mode
	global	_led_switch
	global	_mode_switch
	global	_color_pwm_duty
	global	_once_pwm_duty
	global	_cir_mode
	global	_led_cnt
	global	_fun_dty
	global	_cold_dty
	global	_pwrkey_delay
	global	_ledkey_delay
	global	_r_delay

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
UD_abs_XC8P9521_PWM_3_10	udata_ovr	0x0010
_A_BUFF
	res	1
UD_abs_XC8P9521_PWM_3_11	udata_ovr	0x0011
_R3_BUFF
	res	1
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
UDL_XC8P9521_PWM_3_0	udata
r0x1013	res	1
r0x1014	res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

ID_XC8P9521_PWM_3_0	idata
_beep_delay
	add 0x02,a
	db	0x00


ID_XC8P9521_PWM_3_1	idata
_sys_delay
	add 0x02,a
	db	0x00


ID_XC8P9521_PWM_3_2	idata
_beep_mode
	add 0x02,a
	db	0x00


ID_XC8P9521_PWM_3_3	idata
_beep_cnt
	add 0x02,a
	db	0x00


ID_XC8P9521_PWM_3_4	idata
_led_mode
	add 0x02,a
	db	0x01


ID_XC8P9521_PWM_3_5	idata
_led_switch
	add 0x02,a
	db	0x01


ID_XC8P9521_PWM_3_6	idata
_mode_switch
	add 0x02,a
	db	0x00


ID_XC8P9521_PWM_3_7	idata
_color_pwm_duty
	add 0x02,a
	db	0x00


ID_XC8P9521_PWM_3_8	idata
_once_pwm_duty
	add 0x02,a
	db	0x00


ID_XC8P9521_PWM_3_9	idata
_cir_mode
	add 0x02,a
	db	0x00


ID_XC8P9521_PWM_3_10	idata
_led_cnt
	add 0x02,a
	db	0x00


ID_XC8P9521_PWM_3_11	idata
_fun_dty
	add 0x02,a
	db	0x00


ID_XC8P9521_PWM_3_12	idata
_cold_dty
	add 0x02,a
	db	0x00


ID_XC8P9521_PWM_3_13	idata
_pwrkey_delay
	add 0x02,a
	db	0x00, 0x00


ID_XC8P9521_PWM_3_14	idata
_ledkey_delay
	add 0x02,a
	db	0x00, 0x00


ID_XC8P9521_PWM_3_15	idata
_r_delay
	add 0x02,a
	db	0x00, 0x00


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
;@file_clrRam beep_delay                Allocated to registers ;size:1
;@file_clrRam sys_delay                 Allocated to registers ;size:1
;@file_clrRam beep_mode                 Allocated to registers ;size:1
;@file_clrRam beep_cnt                  Allocated to registers ;size:1
;@file_clrRam led_mode                  Allocated to registers ;size:1
;@file_clrRam led_switch                Allocated to registers ;size:1
;@file_clrRam mode_switch               Allocated to registers ;size:1
;@file_clrRam color_pwm_duty            Allocated to registers ;size:1
;@file_clrRam once_pwm_duty             Allocated to registers ;size:1
;@file_clrRam cir_mode                  Allocated to registers ;size:1
;@file_clrRam led_cnt                   Allocated to registers ;size:1
;@file_clrRam fun_dty                   Allocated to registers ;size:1
;@file_clrRam cold_dty                  Allocated to registers ;size:1
;@file_clrRam pwrkey_delay              Allocated to registers ;size:2
;@file_clrRam ledkey_delay              Allocated to registers ;size:2
;@file_clrRam r_delay                   Allocated to registers ;size:2
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
;	.line	125; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	__asm__("org 0x08");			//中断入口地址			
	org	0x08
;	.line	126; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	PUSH(_A_BUFF,_R3_BUFF);			//中断入栈保护
	mov	_A_BUFF,a
	swap	_A_BUFF
	swapa	STATUS
	mov	_R3_BUFF,a
;	.line	128; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	if(TCIF)					//判断TCIF是否为1
	JBTS	_ISRbits,0
	JMP	_00121_DS_
;	.line	130; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	fun_dty++;
	INC	_fun_dty
;	.line	131; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	cold_dty++;
	INC	_cold_dty
;	.line	132; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	sys_delay++;
	INC	_sys_delay
;	.line	133; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	TCC	  += 6;			//1/2 * 8 * (256-6) = 1000us	公式：1/IRC频率 * 预分频 * （256-初值）
	MOV	A,@0x06
	ADD	_TCC,A
;	.line	134; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	ISR    = 0xfe;				//清TC0中断标志位
	MOV	A,@0xfe
	MOV	_ISR,A
_00121_DS_:
;	.line	137; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	if(T1IF)					//判断T1IF是否为1,pwm周期中断
	JBTS	_ISRbits,3
	JMP	_00123_DS_
;	.line	139; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	ISR    = 0xf7;				//ISR的bit3:T1IF清零
	MOV	A,@0xf7
	MOV	_ISR,A
_00123_DS_:
;	.line	142; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	POP(_A_BUFF,_R3_BUFF);			//中断出栈保护恢复
	swapa	_R3_BUFF
	mov	STATUS,a
	swapa	_A_BUFF
;	.line	143; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	}
END_OF_INTERRUPT:
	RETI	

;--------------------------------------------------------
; code
;--------------------------------------------------------
code_XC8P9521_PWM_3	code
;***
;  pBlock Stats: dbName = M
;***
;has an exit
;functions called:
;   _file_clrRam
;   _file_init
;   _file_project_init
;   _key_process
;   _rgb_process
;   _shake_process
;   _beep_process
;   _output_process
;   _file_clrRam
;   _file_init
;   _file_project_init
;   _key_process
;   _rgb_process
;   _shake_process
;   _beep_process
;   _output_process
;2 compiler assigned registers:
;   r0x1014
;   r0x1015
;; Starting pCode block
S_XC8P9521_PWM_3__main	code
_main:	;Function start
; 2 exit points
;	.line	427; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	file_clrRam();					//清RAM
	CALL	_file_clrRam
;	.line	428; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	file_init();					//io寄存器初始化
	CALL	_file_init
;	.line	429; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	file_project_init();			//程序所需功能设置
	CALL	_file_project_init
;	.line	430; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	EI();							//打开总中断
	ei	
_00323_DS_:
;	.line	434; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	if( sys_delay >= 2 )
	MOV	A,@0x02
	SUB	A,_sys_delay
	JBTS	STATUS,0
	JMP	_00323_DS_
;	.line	436; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	sys_delay = 0;
	CLR	_sys_delay
;	.line	438; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	key_process( );
	CALL	_key_process
;	.line	441; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	if( ( 0 == LIMIT_PORT( ) )&& ( mode_switch != NONE_GEARS ) )
	JBTC	_PORT5bits,3
	JMP	_00310_DS_
	MOV	A,@0x00
	OR	A,_mode_switch
	JBTC	STATUS,2
	JMP	_00310_DS_
;	.line	443; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	FUN_PORT() = 0;
	BTC	_PORT6bits,6
;	.line	444; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	COLD_PORT() = 0;
	BTC	_PORT6bits,7
;	.line	445; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	G_PWMDTY = 0;
	CLR	_PDC1
;	.line	446; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	B_PWMDTY = 0;
	CLR	_PDC3
;	.line	447; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	if( ++r_delay < 500 )
	INC	_r_delay
	JBTC	STATUS,2
	INC	(_r_delay + 1)
	MOV	A,@0x01
	SUB	A,(_r_delay + 1)
	JBTS	STATUS,2
	JMP	_00361_DS_
	MOV	A,@0xf4
	SUB	A,_r_delay
_00361_DS_:
	JBTC	STATUS,0
	JMP	_00307_DS_
;	.line	450; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	R_PWMDTY = 100;
	MOV	A,@0x64
	MOV	_PDC2,A
	JMP	_00310_DS_
;;swapping arguments (AOP_TYPEs 1/3)
_00307_DS_:
;	.line	452; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	else if(  r_delay > 500 )
	MOV	A,@0x01
	SUB	A,(_r_delay + 1)
	JBTS	STATUS,2
	JMP	_00362_DS_
	MOV	A,@0xf5
	SUB	A,_r_delay
_00362_DS_:
	JBTS	STATUS,0
	JMP	_00310_DS_
;	.line	455; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	R_PWMDTY = 0;
	CLR	_PDC2
;	.line	456; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	if( r_delay >= 1000 )
	MOV	A,@0x03
	SUB	A,(_r_delay + 1)
	JBTS	STATUS,2
	JMP	_00363_DS_
	MOV	A,@0xe8
	SUB	A,_r_delay
_00363_DS_:
	JBTS	STATUS,0
	JMP	_00310_DS_
;	.line	458; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	r_delay = 0;
	CLR	_r_delay
	CLR	(_r_delay + 1)
_00310_DS_:
;	.line	462; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	if( ( 1 == LIMIT_PORT( ) )&& ( mode_switch != NONE_GEARS ) )
	CLR	r0x1014
	JBTC	_PORT5bits,3
	INC	r0x1014
;;101	MOV	A,r0x1014
;;99	MOV	r0x1015,A
;;100	MOV	A,r0x1015
	MOV	A,r0x1014
	XOR	A,@0x01
	JBTS	STATUS,2
	JMP	_00323_DS_
	MOV	A,@0x00
	OR	A,_mode_switch
	JBTC	STATUS,2
	JMP	_00323_DS_
;	.line	466; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	if( 0 == led_switch )
	MOV	A,@0x00
	OR	A,_led_switch
	JBTS	STATUS,2
	JMP	_00315_DS_
;	.line	469; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	R_PWMDTY = 0;
	CLR	_PDC2
;	.line	470; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	G_PWMDTY = 0;
	CLR	_PDC1
;	.line	471; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	B_PWMDTY = 0;
	CLR	_PDC3
	JMP	_00316_DS_
_00315_DS_:
;	.line	473; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	else if( 1 == led_switch )
	MOV	A,_led_switch
	XOR	A,@0x01
	JBTS	STATUS,2
	JMP	_00316_DS_
;	.line	476; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	rgb_process( );
	CALL	_rgb_process
_00316_DS_:
;	.line	479; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	shake_process( );
	CALL	_shake_process
;	.line	481; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	beep_process( );
	CALL	_beep_process
;	.line	483; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	output_process( );
	CALL	_output_process
	JMP	_00323_DS_
;	.line	487; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	}
	RET	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
S_XC8P9521_PWM_3__output_process	code
_output_process:	;Function start
; 2 exit points
;;swapping arguments (AOP_TYPEs 1/3)
;	.line	365; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	switch( mode_switch )
	MOV	A,@0x03
	SUB	A,_mode_switch
	JBTC	STATUS,0
	JMP	_00297_DS_
	MOV	A,_mode_switch
	BANKSEL	PCL
	ADD	PCL,A
	JMP	_00270_DS_
	JMP	_00271_DS_
	JMP	_00286_DS_
_00270_DS_:
;	.line	369; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	FUN_PORT( ) = 0;
	BTC	_PORT6bits,6
;	.line	370; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	COLD_PORT( ) = 0;
	BTC	_PORT6bits,7
;	.line	371; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	break;
	JMP	_00297_DS_
_00271_DS_:
;	.line	373; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	if( fun_dty < 6 )
	MOV	A,@0x06
	SUB	A,_fun_dty
	JBTC	STATUS,0
	JMP	_00277_DS_
;	.line	375; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	FUN_PORT( ) = 1;	
	BTS	_PORT6bits,6
	JMP	_00278_DS_
_00277_DS_:
;	.line	377; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	else if( fun_dty >= 6 )
	MOV	A,@0x06
	SUB	A,_fun_dty
	JBTS	STATUS,0
	JMP	_00278_DS_
;	.line	379; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	FUN_PORT( ) = 0;	
	BTC	_PORT6bits,6
;	.line	380; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	if( fun_dty >= 10 )
	MOV	A,@0x0a
	SUB	A,_fun_dty
	JBTS	STATUS,0
	JMP	_00278_DS_
;	.line	382; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	fun_dty = 0;
	CLR	_fun_dty
_00278_DS_:
;	.line	385; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	if( cold_dty < 9 )
	MOV	A,@0x09
	SUB	A,_cold_dty
	JBTC	STATUS,0
	JMP	_00284_DS_
;	.line	387; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	COLD_PORT( ) = 1;	
	BTS	_PORT6bits,7
	JMP	_00297_DS_
_00284_DS_:
;	.line	389; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	else if( cold_dty >= 9 )
	MOV	A,@0x09
	SUB	A,_cold_dty
	JBTS	STATUS,0
	JMP	_00297_DS_
;	.line	391; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	COLD_PORT( ) = 0;	
	BTC	_PORT6bits,7
;	.line	392; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	if( cold_dty >= 10 )
	MOV	A,@0x0a
	SUB	A,_cold_dty
	JBTS	STATUS,0
	JMP	_00297_DS_
;	.line	394; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	cold_dty = 0;
	CLR	_cold_dty
;	.line	398; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	break;
	JMP	_00297_DS_
_00286_DS_:
;	.line	402; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	if( fun_dty < 8 )
	MOV	A,@0x08
	SUB	A,_fun_dty
	JBTC	STATUS,0
	JMP	_00292_DS_
;	.line	404; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	FUN_PORT() = 1;	
	BTS	_PORT6bits,6
	JMP	_00293_DS_
_00292_DS_:
;	.line	406; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	else if( fun_dty >= 8 )
	MOV	A,@0x08
	SUB	A,_fun_dty
	JBTS	STATUS,0
	JMP	_00293_DS_
;	.line	408; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	FUN_PORT() = 0;	
	BTC	_PORT6bits,6
;	.line	409; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	if( fun_dty >= 10 )
	MOV	A,@0x0a
	SUB	A,_fun_dty
	JBTS	STATUS,0
	JMP	_00293_DS_
;	.line	411; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	fun_dty = 0;
	CLR	_fun_dty
_00293_DS_:
;	.line	414; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	COLD_PORT( ) = 1;
	BTS	_PORT6bits,7
;	.line	415; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	if( cold_dty >= 10 )
	MOV	A,@0x0a
	SUB	A,_cold_dty
	JBTS	STATUS,0
	JMP	_00297_DS_
;	.line	417; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	cold_dty = 0;
	CLR	_cold_dty
;	.line	421; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	}
_00297_DS_:
;	.line	420; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	}
	RET	
; exit point of _output_process

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1013
;; Starting pCode block
S_XC8P9521_PWM_3__rgb_process	code
_rgb_process:	;Function start
; 2 exit points
;	.line	287; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	if( led_cnt == 20 )
	MOV	A,_led_cnt
	XOR	A,@0x14
	JBTS	STATUS,2
	JMP	_00242_DS_
;	.line	289; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	led_cnt = 0;
	CLR	_led_cnt
;	.line	290; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	cir_mode = !cir_mode;
	MOV	A,_cir_mode
	MOV	A,@0x00
	JBTC	STATUS,2
	MOV	A,@0x01
	MOV	r0x1013,A
	MOV	A,r0x1013
	MOV	_cir_mode,A
_00242_DS_:
;	.line	292; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	switch( led_switch )
	MOV	A,@0x01
	SUB	A,_led_switch
	JBTS	STATUS,0
	JMP	_00265_DS_
;;swapping arguments (AOP_TYPEs 1/3)
	MOV	A,@0x04
	SUB	A,_led_switch
	JBTC	STATUS,0
	JMP	_00265_DS_
	DECA	_led_switch
	MOV	r0x1013,A
	MOV	A,r0x1013
	BANKSEL	PCL
	ADD	PCL,A
	JMP	_00243_DS_
	JMP	_00249_DS_
	JMP	_00259_DS_
_00243_DS_:
;	.line	296; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	if( CIR_FADEIN == cir_mode )
	MOV	A,_cir_mode
	XOR	A,@0x01
	JBTS	STATUS,2
	JMP	_00247_DS_
;	.line	298; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	color_pwm_duty += 5;
	MOV	A,@0x05
	ADD	_color_pwm_duty,A
	JMP	_00248_DS_
_00247_DS_:
;	.line	300; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	else if( CIR_DIEOUT == cir_mode )
	MOV	A,@0x00
	OR	A,_cir_mode
	JBTS	STATUS,2
	JMP	_00248_DS_
;	.line	302; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	color_pwm_duty -= 5;
	MOV	A,@0xfb
	ADD	_color_pwm_duty,A
_00248_DS_:
;	.line	304; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	led_cnt++;
	INC	_led_cnt
;	.line	305; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	R_PWMDTY = color_pwm_duty;
	MOV	A,_color_pwm_duty
	MOV	_PDC2,A
;	.line	306; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	G_PWMDTY = color_pwm_duty;			
	MOV	A,_color_pwm_duty
	MOV	_PDC1,A
;	.line	307; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	B_PWMDTY = color_pwm_duty;
	MOV	A,_color_pwm_duty
	MOV	_PDC3,A
;	.line	308; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	break;
	JMP	_00265_DS_
_00249_DS_:
;	.line	312; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	if( 1 == cir_mode )
	MOV	A,_cir_mode
	XOR	A,@0x01
	JBTS	STATUS,2
	JMP	_00253_DS_
;	.line	314; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	once_pwm_duty += 5;
	MOV	A,@0x05
	ADD	_once_pwm_duty,A
	JMP	_00254_DS_
_00253_DS_:
;	.line	316; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	else if( 0 == cir_mode )
	MOV	A,@0x00
	OR	A,_cir_mode
	JBTS	STATUS,2
	JMP	_00254_DS_
;	.line	318; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	once_pwm_duty -= 5;
	MOV	A,@0xfb
	ADD	_once_pwm_duty,A
_00254_DS_:
;	.line	320; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	led_cnt++;
	INC	_led_cnt
;;swapping arguments (AOP_TYPEs 1/3)
;	.line	321; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	switch( led_mode )
	MOV	A,@0x03
	SUB	A,_led_mode
	JBTC	STATUS,0
	JMP	_00265_DS_
	MOV	A,_led_mode
	BANKSEL	PCL
	ADD	PCL,A
	JMP	_00255_DS_
	JMP	_00256_DS_
	JMP	_00257_DS_
_00255_DS_:
;	.line	324; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	R_PWMDTY = once_pwm_duty;
	MOV	A,_once_pwm_duty
	MOV	_PDC2,A
;	.line	325; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	G_PWMDTY = 0;
	CLR	_PDC1
;	.line	326; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	B_PWMDTY = 0;
	CLR	_PDC3
;	.line	327; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	break;
	JMP	_00265_DS_
_00256_DS_:
;	.line	329; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	R_PWMDTY = 0;
	CLR	_PDC2
;	.line	330; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	G_PWMDTY = once_pwm_duty;
	MOV	A,_once_pwm_duty
	MOV	_PDC1,A
;	.line	331; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	B_PWMDTY = 0;
	CLR	_PDC3
;	.line	332; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	break;
	JMP	_00265_DS_
_00257_DS_:
;	.line	334; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	R_PWMDTY = 0;
	CLR	_PDC2
;	.line	335; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	G_PWMDTY = 0;
	CLR	_PDC1
;	.line	336; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	B_PWMDTY = once_pwm_duty;
	MOV	A,_once_pwm_duty
	MOV	_PDC3,A
;	.line	339; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	break;
	JMP	_00265_DS_
_00259_DS_:
;	.line	342; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	R_PWMDTY = 0;
	CLR	_PDC2
;	.line	343; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	G_PWMDTY = 0;			
	CLR	_PDC1
;	.line	344; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	B_PWMDTY = 0;
	CLR	_PDC3
;	.line	345; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	once_pwm_duty = 100;
	MOV	A,@0x64
	MOV	_once_pwm_duty,A
;;swapping arguments (AOP_TYPEs 1/3)
;	.line	346; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	switch( led_mode )
	MOV	A,@0x03
	SUB	A,_led_mode
	JBTC	STATUS,0
	JMP	_00265_DS_
	MOV	A,_led_mode
	BANKSEL	PCL
	ADD	PCL,A
	JMP	_00260_DS_
	JMP	_00261_DS_
	JMP	_00262_DS_
_00260_DS_:
;	.line	349; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	R_PWMDTY = once_pwm_duty;
	MOV	A,@0x64
	MOV	_PDC2,A
;	.line	350; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	break;
	JMP	_00265_DS_
_00261_DS_:
;	.line	352; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	G_PWMDTY = once_pwm_duty;
	MOV	A,@0x64
	MOV	_PDC1,A
;	.line	353; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	break;
	JMP	_00265_DS_
_00262_DS_:
;	.line	355; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	B_PWMDTY = once_pwm_duty;
	MOV	A,@0x64
	MOV	_PDC3,A
;	.line	360; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	}
_00265_DS_:
;	.line	359; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	}	
	RET	
; exit point of _rgb_process

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1013
;; Starting pCode block
S_XC8P9521_PWM_3__key_process	code
_key_process:	;Function start
; 2 exit points
;	.line	196; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	if( 0 == PWRKY_PORT( ) )
	JBTC	_PORT5bits,2
	JMP	_00168_DS_
;	.line	198; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	pwrkey_delay++;
	INC	_pwrkey_delay
	JBTC	STATUS,2
	INC	(_pwrkey_delay + 1)
	JMP	_00169_DS_
_00168_DS_:
;	.line	203; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	if( pwrkey_delay >= 2 )
	MOV	A,@0x00
	SUB	A,(_pwrkey_delay + 1)
	JBTS	STATUS,2
	JMP	_00226_DS_
	MOV	A,@0x02
	SUB	A,_pwrkey_delay
_00226_DS_:
	JBTS	STATUS,0
	JMP	_00166_DS_
;	.line	206; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	if( pwrkey_delay < 800 )
	MOV	A,@0x03
	SUB	A,(_pwrkey_delay + 1)
	JBTS	STATUS,2
	JMP	_00227_DS_
	MOV	A,@0x20
	SUB	A,_pwrkey_delay
_00227_DS_:
	JBTC	STATUS,0
	JMP	_00163_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;	.line	208; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	switch( mode_switch )
	MOV	A,@0x03
	SUB	A,_mode_switch
	JBTC	STATUS,0
	JMP	_00166_DS_
	MOV	A,_mode_switch
	BANKSEL	PCL
	ADD	PCL,A
	JMP	_00155_DS_
	JMP	_00156_DS_
	JMP	_00157_DS_
_00155_DS_:
;	.line	212; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	mode_switch = TWO_GEARS;
	MOV	A,@0x02
	MOV	_mode_switch,A
;	.line	213; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	beep_mode = BEEP_ONE;
	MOV	A,@0x01
	MOV	_beep_mode,A
;	.line	214; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	beep_delay = 0;
	CLR	_beep_delay
;	.line	215; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	beep_cnt = 1;
	MOV	A,@0x01
	MOV	_beep_cnt,A
;	.line	216; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	break;
	JMP	_00166_DS_
_00156_DS_:
;	.line	219; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	beep_mode = BEEP_ONE;
	MOV	A,@0x01
	MOV	_beep_mode,A
;	.line	220; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	beep_delay = 0;
	CLR	_beep_delay
;	.line	221; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	beep_cnt = 1;
	MOV	A,@0x01
	MOV	_beep_cnt,A
;	.line	222; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	mode_switch = TWO_GEARS;
	MOV	A,@0x02
	MOV	_mode_switch,A
;	.line	223; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	break; 
	JMP	_00166_DS_
_00157_DS_:
;	.line	226; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	beep_mode = BEEP_TWO; 
	MOV	A,@0x02
	MOV	_beep_mode,A
;	.line	227; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	beep_delay = 0;
	CLR	_beep_delay
;	.line	228; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	beep_cnt = 2;
	MOV	A,@0x02
	MOV	_beep_cnt,A
;	.line	229; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	mode_switch = ONE_GEARS;
	MOV	A,@0x01
	MOV	_mode_switch,A
;	.line	231; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	}
	JMP	_00166_DS_
_00163_DS_:
;	.line	234; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	else if( ( pwrkey_delay >= 800 ) && ( mode_switch != NONE_GEARS ) )
	MOV	A,@0x03
	SUB	A,(_pwrkey_delay + 1)
	JBTS	STATUS,2
	JMP	_00230_DS_
	MOV	A,@0x20
	SUB	A,_pwrkey_delay
_00230_DS_:
	JBTS	STATUS,0
	JMP	_00166_DS_
	MOV	A,@0x00
	OR	A,_mode_switch
	JBTC	STATUS,2
	JMP	_00166_DS_
;	.line	237; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	mode_switch = NONE_GEARS;
	CLR	_mode_switch
;	.line	238; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	beep_mode = BEEP_ONE;
	MOV	A,@0x01
	MOV	_beep_mode,A
;	.line	239; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	beep_delay = 0;
	CLR	_beep_delay
;	.line	240; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	beep_cnt = 1;
	MOV	A,@0x01
	MOV	_beep_cnt,A
_00166_DS_:
;	.line	243; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	pwrkey_delay = 0;
	CLR	_pwrkey_delay
	CLR	(_pwrkey_delay + 1)
_00169_DS_:
;	.line	247; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	if( 0 == LEDKEY_PORT( ) && ( mode_switch != NONE_GEARS )  )
	JBTC	_PORT5bits,1
	JMP	_00182_DS_
	MOV	A,@0x00
	OR	A,_mode_switch
	JBTC	STATUS,2
	JMP	_00182_DS_
;	.line	249; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	ledkey_delay++;
	INC	_ledkey_delay
	JBTC	STATUS,2
	INC	(_ledkey_delay + 1)
	JMP	_00185_DS_
_00182_DS_:
;	.line	254; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	if( ledkey_delay >= 2 )
	MOV	A,@0x00
	SUB	A,(_ledkey_delay + 1)
	JBTS	STATUS,2
	JMP	_00231_DS_
	MOV	A,@0x02
	SUB	A,_ledkey_delay
_00231_DS_:
	JBTS	STATUS,0
	JMP	_00180_DS_
;	.line	257; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	if( ledkey_delay < 800 )
	MOV	A,@0x03
	SUB	A,(_ledkey_delay + 1)
	JBTS	STATUS,2
	JMP	_00232_DS_
	MOV	A,@0x20
	SUB	A,_ledkey_delay
_00232_DS_:
	JBTC	STATUS,0
	JMP	_00177_DS_
;	.line	259; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	led_switch = 1;
	MOV	A,@0x01
	MOV	_led_switch,A
;	.line	260; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	switch( led_mode )
	MOV	A,@0x01
	SUB	A,_led_mode
	JBTS	STATUS,0
	JMP	_00180_DS_
;;swapping arguments (AOP_TYPEs 1/3)
	MOV	A,@0x04
	SUB	A,_led_mode
	JBTC	STATUS,0
	JMP	_00180_DS_
	DECA	_led_mode
	MOV	r0x1013,A
	MOV	A,r0x1013
	BANKSEL	PCL
	ADD	PCL,A
	JMP	_00170_DS_
	JMP	_00171_DS_
	JMP	_00172_DS_
_00170_DS_:
;	.line	263; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	led_mode = RGB_ONE_CIR;
	MOV	A,@0x02
	MOV	_led_mode,A
;	.line	264; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	break;
	JMP	_00180_DS_
_00171_DS_:
;	.line	266; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	led_mode = RGB_ONE_ONCE;
	MOV	A,@0x03
	MOV	_led_mode,A
;	.line	267; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	break;
	JMP	_00180_DS_
_00172_DS_:
;	.line	269; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	led_mode = RGB_COLOR_CIR;
	MOV	A,@0x01
	MOV	_led_mode,A
;	.line	271; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	}
	JMP	_00180_DS_
_00177_DS_:
;	.line	274; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	else if( ledkey_delay >= 800 )
	MOV	A,@0x03
	SUB	A,(_ledkey_delay + 1)
	JBTS	STATUS,2
	JMP	_00236_DS_
	MOV	A,@0x20
	SUB	A,_ledkey_delay
_00236_DS_:
	JBTS	STATUS,0
	JMP	_00180_DS_
;	.line	276; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	led_mode = RGB_ONE_NONE;
	CLR	_led_mode
_00180_DS_:
;	.line	279; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	ledkey_delay = 0;
	CLR	_ledkey_delay
	CLR	(_ledkey_delay + 1)
;	.line	281; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	}
_00185_DS_:
	RET	
; exit point of _key_process

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1013
;; Starting pCode block
S_XC8P9521_PWM_3__shake_process	code
_shake_process:	;Function start
; 2 exit points
;	.line	187; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	if( 0 ==  SHAKE_PORT( ) )
	JBTC	_PORT5bits,0
	JMP	_00150_DS_
;	.line	189; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	led_switch = !led_switch;
	MOV	A,_led_switch
	MOV	A,@0x00
	JBTC	STATUS,2
	MOV	A,@0x01
	MOV	r0x1013,A
	MOV	A,r0x1013
	MOV	_led_switch,A
;	.line	191; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	}
_00150_DS_:
	RET	
; exit point of _shake_process

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1013
;; Starting pCode block
S_XC8P9521_PWM_3__beep_process	code
_beep_process:	;Function start
; 2 exit points
;;swapping arguments (AOP_TYPEs 1/3)
;	.line	148; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	switch( beep_mode )
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
;	.line	151; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	BEEP_PORT( ) = 0;
	BTC	_PORT6bits,5
;	.line	152; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	break;	
	JMP	_00143_DS_
_00129_DS_:
;	.line	154; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	BEEP_PORT( ) = 1;
	BTS	_PORT6bits,5
;	.line	155; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	beep_cnt--;
	DEC	_beep_cnt
;	.line	156; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	if( beep_delay++ >= 30 )
	MOV	A,_beep_delay
	MOV	r0x1013,A
	INC	_beep_delay
	MOV	A,@0x1e
	SUB	A,r0x1013
	JBTS	STATUS,0
	JMP	_00143_DS_
;	.line	158; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	if( beep_cnt == 0 )
	MOV	A,@0x00
	OR	A,_beep_cnt
	JBTS	STATUS,2
	JMP	_00143_DS_
;	.line	160; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	beep_mode = BEEP_NONE;
	CLR	_beep_mode
;	.line	161; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	beep_delay = 0;
	CLR	_beep_delay
;	.line	164; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	break;	
	JMP	_00143_DS_
_00134_DS_:
;	.line	166; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	BEEP_PORT( ) = 1;
	BTS	_PORT6bits,5
;	.line	167; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	if( beep_delay++ >= 10 )
	MOV	A,_beep_delay
	MOV	r0x1013,A
	INC	_beep_delay
	MOV	A,@0x0a
	SUB	A,r0x1013
	JBTS	STATUS,0
	JMP	_00143_DS_
;	.line	169; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	beep_cnt--;
	DEC	_beep_cnt
;	.line	170; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	if( beep_cnt == 0 )
	MOV	A,@0x00
	OR	A,_beep_cnt
	JBTS	STATUS,2
	JMP	_00138_DS_
;	.line	172; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	beep_delay = 0;
	CLR	_beep_delay
;	.line	173; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	beep_mode = BEEP_NONE;
	CLR	_beep_mode
	JMP	_00143_DS_
_00138_DS_:
;	.line	175; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	else if( beep_cnt == 1 )
	MOV	A,_beep_cnt
	XOR	A,@0x01
	JBTS	STATUS,2
	JMP	_00143_DS_
;	.line	177; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	beep_delay = 0;
	CLR	_beep_delay
;	.line	178; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	BEEP_PORT( ) = 0;
	BTC	_PORT6bits,5
;	.line	183; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	}
_00143_DS_:
;	.line	182; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	}
	RET	
; exit point of _beep_process

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
S_XC8P9521_PWM_3__file_project_init	code
_file_project_init:	;Function start
; 2 exit points
;	.line	116; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	IOCP_W(IMR,0x09);		//TCC+PWM周期中断,根据需要调用	
	mov	a,@0x09
	iw	IMR
;	.line	117; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	PWMCON = 0xf8;			//使能3路pwm输出，pwm=1/8*2(分频)*4clock*100=100us
	MOV	A,@0xf8
	MOV	_PWMCON,A
;	.line	118; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	PRD = 100;				//PWM周期寄存器
	MOV	A,@0x64
	MOV	_PRD,A
;	.line	119; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	}
	RET	
; exit point of _file_project_init

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
S_XC8P9521_PWM_3__file_init	code
_file_init:	;Function start
; 2 exit points
;	.line	95; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	CONTW(0x02);			//TCC 8分频
	mov	a,@0x02
	ctw
;	.line	96; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	TCC = 6;				//1/2 * 8 * (256-6) = 1000us	公式：1/IRC频率 * 预分频 * （256-初值）
	MOV	A,@0x06
	MOV	_TCC,A
;	.line	97; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	PORT5 = 0;				//
	CLR	_PORT5
;	.line	98; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	PORT6 = 0;				//
	CLR	_PORT6
;	.line	99; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	IOCP_W(P5CR,0x0F);		// 50 51 52 53 均为输入
	mov	a,@0x0F
	iw	P5CR
;	.line	100; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	IOCP_W(P6CR,0x00);		// 65 66 67 输出
	mov	a,@0x00
	iw	P6CR
;	.line	101; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	IOCP_W(PHDCR,0xf0);		//端口上下拉控制寄存器，bit7-bit4对应P67-P64下拉;bit3-bit0对应P53-P50上拉 
	mov	a,@0xf0
	iw	PHDCR
;	.line	102; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	IOCP_W(PDCR,0xff);		//端口下拉控制寄存器，  bit6-bit4对应P62-P60,bit3-bit0对应P53-P50
	mov	a,@0xff
	iw	PDCR
;	.line	103; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	IOCP_W(PHCR,0xff);		//P6端口上拉控制寄存器  bit7-bit0对应P67-P60
	mov	a,@0xff
	iw	PHCR
;	.line	104; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	IOCP_W(WDTCR,0x00);		//WDT 使能控制寄存器	IOCP_W(IMR,0x01);		//中断使能控制寄存器 
	mov	a,@0x00
	iw	WDTCR
;	.line	105; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	ISR = 0x0;				//清TC0中断标志位 
	CLR	_ISR
;	.line	106; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	}
	RET	
; exit point of _file_init

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
S_XC8P9521_PWM_3__file_clrRam	code
_file_clrRam:	;Function start
; 2 exit points
;	.line	85; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	for(RSR=0xD0;RSR<0xFF;RSR++)	//清零 BANK0 RAM  IAR-R0,RSR-R4
	MOV	A,@0xd0
	MOV	_RSR,A
_00107_DS_:
	MOV	A,@0xff
	SUB	A,_RSR
	JBTC	STATUS,0
	JMP	_00105_DS_
;	.line	87; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	{IAR = 0;}
	CLR	_IAR
;	.line	85; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	for(RSR=0xD0;RSR<0xFF;RSR++)	//清零 BANK0 RAM  IAR-R0,RSR-R4
	INC	_RSR
	JMP	_00107_DS_
_00105_DS_:
;	.line	88; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	IAR = 0;
	CLR	_IAR
;	.line	89; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	}
	RET	
; exit point of _file_clrRam


;	code size estimation:
;	  493+    7 =   500 instructions ( 1014 byte)

	end
