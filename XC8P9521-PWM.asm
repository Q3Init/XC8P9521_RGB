add	0x2, a              		; 	add 0x02,a                         	00001d ff82		
add	0x2, a              		; 	add 0x02,a                         	000027 ff82		
add	0x2, a              		; 	add 0x02,a                         	000029 ff82		
add	0x2, a              		; 	add 0x02,a                         	00002b ff82		
add	0x2, a              		; 	add 0x02,a                         	00002d ff82		
add	0x2, a              		; 	add 0x02,a                         	00002f ff82		
add	0x2, a              		; 	add 0x02,a                         	000031 ff82		
add	0x2, a              		; 	add 0x02,a                         	000033 ff82		
add	0x2, a              		; 	add 0x02,a                         	000035 ff82		
add	0x2, a              		; 	add 0x02,a                         	000037 ff82		
add	0x2, a              		; 	add 0x02,a                         	000039 ff82		
add	0x2, a              		; 	add 0x02,a                         	00003b ff82		
add	0x2, a              		; 	add 0x02,a                         	00003d ff82		
add	0x2, a              		; 	add 0x02,a                         	000012 ff82		
add	0x2, a              		; 	add 0x02,a                         	000015 ff82		
add	0x2, a              		; 	add 0x02,a                         	000018 ff82		
jmp	0x177               		; 	jmp	_main                          	000000 1177		
;	.line	125; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	__asm__("org 0x08");			//中断入口地址			
;	.line	126; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	PUSH(_A_BUFF,_R3_BUFF);			//中断入栈保护
mov	0x10, a             		; 	mov	_A_BUFF,a                      	000008 3890		
swap	0x10               		; 	swap	_A_BUFF                       	000009 3690		
swapa	0x3               		; 	swapa	STATUS                       	00000a 3603		
mov	0x11, a             		; 	mov	_R3_BUFF,a                     	00000b 3891		
;	.line	128; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	if(TCIF)					//判断TCIF是否为1
jbts	0xf, 0             		; 	JBTS	_ISRbits,0                    	00000c 240f		
jmp	0x15                		; 	JMP	_00121_DS_                     	00000d 1015		
;	.line	130; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	fun_dty++;
inc	0x3b                		; 	INC	_fun_dty                       	00000e 32bb		
;	.line	131; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	cold_dty++;
inc	0x3d                		; 	INC	_cold_dty                      	00000f 32bd		
;	.line	132; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	sys_delay++;
inc	0x27                		; 	INC	_sys_delay                     	000010 32a7		
;	.line	133; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	TCC	  += 6;			//1/2 * 8 * (256-6) = 1000us	公式：1/IRC频率 * 预分频 * （256-初值）
mov	a, @0x6             		; 	MOV	A,@0x06                        	000011 0806		
add	0x1, a              		; 	ADD	_TCC,A                         	000012 3f81		
;	.line	134; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	ISR    = 0xfe;				//清TC0中断标志位
dw	0x8fe  ;unknown opcode		; 	MOV	A,@0xfe                        	000013 08fe		
mov	0xf, a              		; 	MOV	_ISR,A                         	000014 388f		
;	.line	137; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	if(T1IF)					//判断T1IF是否为1,pwm周期中断
jbts	0xf, 0x3           		; 	JBTS	_ISRbits,3                    	000015 258f		
jmp	0x19                		; 	JMP	_00123_DS_                     	000016 1019		
;	.line	139; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	ISR    = 0xf7;				//ISR的bit3:T1IF清零
dw	0x8f7  ;unknown opcode		; 	MOV	A,@0xf7                        	000017 08f7		
mov	0xf, a              		; 	MOV	_ISR,A                         	000018 388f		
;	.line	142; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	POP(_A_BUFF,_R3_BUFF);			//中断出栈保护恢复
swapa	0x11              		; 	swapa	_R3_BUFF                     	000019 3611		
mov	0x3, a              		; 	mov	STATUS,a                       	00001a 3883		
swapa	0x10              		; 	swapa	_A_BUFF                      	00001b 3610		
;	.line	143; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	}
reti                    		; 	RETI	                              	00001c 3823		
;	.line	427; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	file_clrRam();					//清RAM
call	0x253              		; 	CALL	_file_clrRam                  	000177 1a53		
;	.line	428; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	file_init();					//io寄存器初始化
call	0x23f              		; 	CALL	_file_init                    	000178 1a3f		
;	.line	429; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	file_project_init();			//程序所需功能设置
call	0x1                		; 	CALL	_file_project_init            	000179 1801		
;	.line	430; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	EI();							//打开总中断
ei                      		; 	ei	                                	00017a 3820		
;	.line	434; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	if( sys_delay >= 2 )
mov	a, @0x2             		; 	MOV	A,@0x02                        	00017b 0802		
sub	a, 0x27             		; 	SUB	A,_sys_delay                   	00017c 3a27		
jbts	0x3, 0             		; 	JBTS	STATUS,0                      	00017d 2403		
jmp	0x17b               		; 	JMP	_00323_DS_                     	00017e 117b		
;	.line	436; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	sys_delay = 0;
clr	0x27                		; 	CLR	_sys_delay                     	00017f 39a7		
;	.line	438; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	key_process( );
call	0x1d               		; 	CALL	_key_process                  	000180 181d		
;	.line	441; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	if( ( 0 == LIMIT_PORT( ) )&& ( mode_switch != NONE_GEARS ) )
jbtc	0x5, 0x3           		; 	JBTC	_PORT5bits,3                  	000181 2185		
jmp	0x1ac               		; 	JMP	_00310_DS_                     	000182 11ac		
mov	a, @0               		; 	MOV	A,@0x00                        	000183 0800		
or	a, 0x31              		; 	OR	A,_mode_switch                  	000184 3c31		
jbtc	0x3, 0x2           		; 	JBTC	STATUS,2                      	000185 2103		
jmp	0x1ac               		; 	JMP	_00310_DS_                     	000186 11ac		
;	.line	443; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	FUN_PORT() = 0;
btc	0x6, 0x6            		; 	BTC	_PORT6bits,6                   	000187 2b06		
;	.line	444; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	COLD_PORT() = 0;
btc	0x6, 0x7            		; 	BTC	_PORT6bits,7                   	000188 2b86		
;	.line	445; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	G_PWMDTY = 0;
clr	0xa                 		; 	CLR	_PDC1                          	000189 398a		
;	.line	446; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	B_PWMDTY = 0;
clr	0xc                 		; 	CLR	_PDC3                          	00018a 398c		
;	.line	447; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	if( ++r_delay < 500 )
inc	0x18                		; 	INC	_r_delay                       	00018b 3298		
jbtc	0x3, 0x2           		; 	JBTC	STATUS,2                      	00018c 2103		
inc	0x19                		; 	INC	(_r_delay + 1)                 	00018d 3299		
mov	a, @0x1             		; 	MOV	A,@0x01                        	00018e 0801		
sub	a, 0x19             		; 	SUB	A,(_r_delay + 1)               	00018f 3a19		
jbts	0x3, 0x2           		; 	JBTS	STATUS,2                      	000190 2503		
jmp	0x194               		; 	JMP	_00361_DS_                     	000191 1194		
dw	0x8f4  ;unknown opcode		; 	MOV	A,@0xf4                        	000192 08f4		
sub	a, 0x18             		; 	SUB	A,_r_delay                     	000193 3a18		
jbtc	0x3, 0             		; 	JBTC	STATUS,0                      	000194 2003		
jmp	0x199               		; 	JMP	_00307_DS_                     	000195 1199		
;	.line	450; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	R_PWMDTY = 100;
mov	a, @0x64            		; 	MOV	A,@0x64                        	000196 0864		
mov	0xb, a              		; 	MOV	_PDC2,A                        	000197 388b		
jmp	0x1ac               		; 	JMP	_00310_DS_                     	000198 11ac		
;	.line	452; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	else if(  r_delay > 500 )
mov	a, @0x1             		; 	MOV	A,@0x01                        	000199 0801		
sub	a, 0x19             		; 	SUB	A,(_r_delay + 1)               	00019a 3a19		
jbts	0x3, 0x2           		; 	JBTS	STATUS,2                      	00019b 2503		
jmp	0x19f               		; 	JMP	_00362_DS_                     	00019c 119f		
dw	0x8f5  ;unknown opcode		; 	MOV	A,@0xf5                        	00019d 08f5		
sub	a, 0x18             		; 	SUB	A,_r_delay                     	00019e 3a18		
jbts	0x3, 0             		; 	JBTS	STATUS,0                      	00019f 2403		
jmp	0x1ac               		; 	JMP	_00310_DS_                     	0001a0 11ac		
;	.line	455; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	R_PWMDTY = 0;
clr	0xb                 		; 	CLR	_PDC2                          	0001a1 398b		
;	.line	456; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	if( r_delay >= 1000 )
mov	a, @0x3             		; 	MOV	A,@0x03                        	0001a2 0803		
sub	a, 0x19             		; 	SUB	A,(_r_delay + 1)               	0001a3 3a19		
jbts	0x3, 0x2           		; 	JBTS	STATUS,2                      	0001a4 2503		
jmp	0x1a8               		; 	JMP	_00363_DS_                     	0001a5 11a8		
dw	0x8e8  ;unknown opcode		; 	MOV	A,@0xe8                        	0001a6 08e8		
sub	a, 0x18             		; 	SUB	A,_r_delay                     	0001a7 3a18		
jbts	0x3, 0             		; 	JBTS	STATUS,0                      	0001a8 2403		
jmp	0x1ac               		; 	JMP	_00310_DS_                     	0001a9 11ac		
;	.line	458; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	r_delay = 0;
clr	0x18                		; 	CLR	_r_delay                       	0001aa 3998		
clr	0x19                		; 	CLR	(_r_delay + 1)                 	0001ab 3999		
;	.line	462; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	if( ( 1 == LIMIT_PORT( ) )&& ( mode_switch != NONE_GEARS ) )
clr	0x1c                		; 	CLR	r0x1014                        	0001ac 399c		
jbtc	0x5, 0x3           		; 	JBTC	_PORT5bits,3                  	0001ad 2185		
inc	0x1c                		; 	INC	r0x1014                        	0001ae 329c		
mov	a, 0x1c             		; 	MOV	A,r0x1014                      	0001af 301c		
xor	a, @0x1             		; 	XOR	A,@0x01                        	0001b0 0e01		
jbts	0x3, 0x2           		; 	JBTS	STATUS,2                      	0001b1 2503		
jmp	0x17b               		; 	JMP	_00323_DS_                     	0001b2 117b		
mov	a, @0               		; 	MOV	A,@0x00                        	0001b3 0800		
or	a, 0x31              		; 	OR	A,_mode_switch                  	0001b4 3c31		
jbtc	0x3, 0x2           		; 	JBTC	STATUS,2                      	0001b5 2103		
jmp	0x17b               		; 	JMP	_00323_DS_                     	0001b6 117b		
;	.line	466; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	if( 0 == led_switch )
mov	a, @0               		; 	MOV	A,@0x00                        	0001b7 0800		
or	a, 0x2f              		; 	OR	A,_led_switch                   	0001b8 3c2f		
jbts	0x3, 0x2           		; 	JBTS	STATUS,2                      	0001b9 2503		
jmp	0x1bf               		; 	JMP	_00315_DS_                     	0001ba 11bf		
;	.line	469; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	R_PWMDTY = 0;
clr	0xb                 		; 	CLR	_PDC2                          	0001bb 398b		
;	.line	470; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	G_PWMDTY = 0;
clr	0xa                 		; 	CLR	_PDC1                          	0001bc 398a		
;	.line	471; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	B_PWMDTY = 0;
clr	0xc                 		; 	CLR	_PDC3                          	0001bd 398c		
jmp	0x1c4               		; 	JMP	_00316_DS_                     	0001be 11c4		
;	.line	473; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	else if( 1 == led_switch )
mov	a, 0x2f             		; 	MOV	A,_led_switch                  	0001bf 302f		
xor	a, @0x1             		; 	XOR	A,@0x01                        	0001c0 0e01		
jbts	0x3, 0x2           		; 	JBTS	STATUS,2                      	0001c1 2503		
jmp	0x1c4               		; 	JMP	_00316_DS_                     	0001c2 11c4		
;	.line	476; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	rgb_process( );
call	0xa8               		; 	CALL	_rgb_process                  	0001c3 18a8		
;	.line	479; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	shake_process( );
call	0x25e              		; 	CALL	_shake_process                	0001c4 1a5e		
;	.line	481; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	beep_process( );
call	0x20d              		; 	CALL	_beep_process                 	0001c5 1a0d		
;	.line	483; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	output_process( );
call	0x1c9              		; 	CALL	_output_process               	0001c6 19c9		
jmp	0x17b               		; 	JMP	_00323_DS_                     	0001c7 117b		
;	.line	487; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	}
ret                     		; 	RET	                               	0001c8 3822		
;	.line	365; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	switch( mode_switch )
mov	a, @0x3             		; 	MOV	A,@0x03                        	0001c9 0803		
sub	a, 0x31             		; 	SUB	A,_mode_switch                 	0001ca 3a31		
jbtc	0x3, 0             		; 	JBTC	STATUS,0                      	0001cb 2003		
jmp	0x20c               		; 	JMP	_00297_DS_                     	0001cc 120c		
mov	a, 0x31             		; 	MOV	A,_mode_switch                 	0001cd 3031		
add	0x2, a              		; 	ADD	PCL,A                          	0001ce 3f82		
jmp	0x1d2               		; 	JMP	_00270_DS_                     	0001cf 11d2		
jmp	0x1d5               		; 	JMP	_00271_DS_                     	0001d0 11d5		
jmp	0x1f6               		; 	JMP	_00286_DS_                     	0001d1 11f6		
;	.line	369; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	FUN_PORT( ) = 0;
btc	0x6, 0x6            		; 	BTC	_PORT6bits,6                   	0001d2 2b06		
;	.line	370; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	COLD_PORT( ) = 0;
btc	0x6, 0x7            		; 	BTC	_PORT6bits,7                   	0001d3 2b86		
;	.line	371; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	break;
jmp	0x20c               		; 	JMP	_00297_DS_                     	0001d4 120c		
;	.line	373; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	if( fun_dty < 6 )
mov	a, @0x6             		; 	MOV	A,@0x06                        	0001d5 0806		
sub	a, 0x3b             		; 	SUB	A,_fun_dty                     	0001d6 3a3b		
jbtc	0x3, 0             		; 	JBTC	STATUS,0                      	0001d7 2003		
jmp	0x1db               		; 	JMP	_00277_DS_                     	0001d8 11db		
;	.line	375; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	FUN_PORT( ) = 1;	
bts	0x6, 0x6            		; 	BTS	_PORT6bits,6                   	0001d9 2f06		
jmp	0x1e5               		; 	JMP	_00278_DS_                     	0001da 11e5		
;	.line	377; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	else if( fun_dty >= 6 )
mov	a, @0x6             		; 	MOV	A,@0x06                        	0001db 0806		
sub	a, 0x3b             		; 	SUB	A,_fun_dty                     	0001dc 3a3b		
jbts	0x3, 0             		; 	JBTS	STATUS,0                      	0001dd 2403		
jmp	0x1e5               		; 	JMP	_00278_DS_                     	0001de 11e5		
;	.line	379; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	FUN_PORT( ) = 0;	
btc	0x6, 0x6            		; 	BTC	_PORT6bits,6                   	0001df 2b06		
;	.line	380; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	if( fun_dty >= 10 )
mov	a, @0xa             		; 	MOV	A,@0x0a                        	0001e0 080a		
sub	a, 0x3b             		; 	SUB	A,_fun_dty                     	0001e1 3a3b		
jbts	0x3, 0             		; 	JBTS	STATUS,0                      	0001e2 2403		
jmp	0x1e5               		; 	JMP	_00278_DS_                     	0001e3 11e5		
;	.line	382; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	fun_dty = 0;
clr	0x3b                		; 	CLR	_fun_dty                       	0001e4 39bb		
;	.line	385; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	if( cold_dty < 9 )
mov	a, @0x9             		; 	MOV	A,@0x09                        	0001e5 0809		
sub	a, 0x3d             		; 	SUB	A,_cold_dty                    	0001e6 3a3d		
jbtc	0x3, 0             		; 	JBTC	STATUS,0                      	0001e7 2003		
jmp	0x1eb               		; 	JMP	_00284_DS_                     	0001e8 11eb		
;	.line	387; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	COLD_PORT( ) = 1;	
bts	0x6, 0x7            		; 	BTS	_PORT6bits,7                   	0001e9 2f86		
jmp	0x20c               		; 	JMP	_00297_DS_                     	0001ea 120c		
;	.line	389; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	else if( cold_dty >= 9 )
mov	a, @0x9             		; 	MOV	A,@0x09                        	0001eb 0809		
sub	a, 0x3d             		; 	SUB	A,_cold_dty                    	0001ec 3a3d		
jbts	0x3, 0             		; 	JBTS	STATUS,0                      	0001ed 2403		
jmp	0x20c               		; 	JMP	_00297_DS_                     	0001ee 120c		
;	.line	391; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	COLD_PORT( ) = 0;	
btc	0x6, 0x7            		; 	BTC	_PORT6bits,7                   	0001ef 2b86		
;	.line	392; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	if( cold_dty >= 10 )
mov	a, @0xa             		; 	MOV	A,@0x0a                        	0001f0 080a		
sub	a, 0x3d             		; 	SUB	A,_cold_dty                    	0001f1 3a3d		
jbts	0x3, 0             		; 	JBTS	STATUS,0                      	0001f2 2403		
jmp	0x20c               		; 	JMP	_00297_DS_                     	0001f3 120c		
;	.line	394; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	cold_dty = 0;
clr	0x3d                		; 	CLR	_cold_dty                      	0001f4 39bd		
;	.line	398; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	break;
jmp	0x20c               		; 	JMP	_00297_DS_                     	0001f5 120c		
;	.line	402; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	if( fun_dty < 8 )
mov	a, @0x8             		; 	MOV	A,@0x08                        	0001f6 0808		
sub	a, 0x3b             		; 	SUB	A,_fun_dty                     	0001f7 3a3b		
jbtc	0x3, 0             		; 	JBTC	STATUS,0                      	0001f8 2003		
jmp	0x1fc               		; 	JMP	_00292_DS_                     	0001f9 11fc		
;	.line	404; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	FUN_PORT() = 1;	
bts	0x6, 0x6            		; 	BTS	_PORT6bits,6                   	0001fa 2f06		
jmp	0x206               		; 	JMP	_00293_DS_                     	0001fb 1206		
;	.line	406; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	else if( fun_dty >= 8 )
mov	a, @0x8             		; 	MOV	A,@0x08                        	0001fc 0808		
sub	a, 0x3b             		; 	SUB	A,_fun_dty                     	0001fd 3a3b		
jbts	0x3, 0             		; 	JBTS	STATUS,0                      	0001fe 2403		
jmp	0x206               		; 	JMP	_00293_DS_                     	0001ff 1206		
;	.line	408; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	FUN_PORT() = 0;	
btc	0x6, 0x6            		; 	BTC	_PORT6bits,6                   	000200 2b06		
;	.line	409; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	if( fun_dty >= 10 )
mov	a, @0xa             		; 	MOV	A,@0x0a                        	000201 080a		
sub	a, 0x3b             		; 	SUB	A,_fun_dty                     	000202 3a3b		
jbts	0x3, 0             		; 	JBTS	STATUS,0                      	000203 2403		
jmp	0x206               		; 	JMP	_00293_DS_                     	000204 1206		
;	.line	411; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	fun_dty = 0;
clr	0x3b                		; 	CLR	_fun_dty                       	000205 39bb		
;	.line	414; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	COLD_PORT( ) = 1;
bts	0x6, 0x7            		; 	BTS	_PORT6bits,7                   	000206 2f86		
;	.line	415; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	if( cold_dty >= 10 )
mov	a, @0xa             		; 	MOV	A,@0x0a                        	000207 080a		
sub	a, 0x3d             		; 	SUB	A,_cold_dty                    	000208 3a3d		
jbts	0x3, 0             		; 	JBTS	STATUS,0                      	000209 2403		
jmp	0x20c               		; 	JMP	_00297_DS_                     	00020a 120c		
;	.line	417; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	cold_dty = 0;
clr	0x3d                		; 	CLR	_cold_dty                      	00020b 39bd		
;	.line	421; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	}
;	.line	420; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	}
ret                     		; 	RET	                               	00020c 3822		
;	.line	287; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	if( led_cnt == 20 )
mov	a, 0x39             		; 	MOV	A,_led_cnt                     	0000a8 3039		
xor	a, @0x14            		; 	XOR	A,@0x14                        	0000a9 0e14		
jbts	0x3, 0x2           		; 	JBTS	STATUS,2                      	0000aa 2503		
jmp	0xb4                		; 	JMP	_00242_DS_                     	0000ab 10b4		
;	.line	289; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	led_cnt = 0;
clr	0x39                		; 	CLR	_led_cnt                       	0000ac 39b9		
;	.line	290; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	cir_mode = !cir_mode;
mov	a, 0x37             		; 	MOV	A,_cir_mode                    	0000ad 3037		
mov	a, @0               		; 	MOV	A,@0x00                        	0000ae 0800		
jbtc	0x3, 0x2           		; 	JBTC	STATUS,2                      	0000af 2103		
mov	a, @0x1             		; 	MOV	A,@0x01                        	0000b0 0801		
mov	0x1b, a             		; 	MOV	r0x1013,A                      	0000b1 389b		
mov	a, 0x1b             		; 	MOV	A,r0x1013                      	0000b2 301b		
mov	0x37, a             		; 	MOV	_cir_mode,A                    	0000b3 38b7		
;	.line	292; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	switch( led_switch )
mov	a, @0x1             		; 	MOV	A,@0x01                        	0000b4 0801		
sub	a, 0x2f             		; 	SUB	A,_led_switch                  	0000b5 3a2f		
jbts	0x3, 0             		; 	JBTS	STATUS,0                      	0000b6 2403		
jmp	0x114               		; 	JMP	_00265_DS_                     	0000b7 1114		
mov	a, @0x4             		; 	MOV	A,@0x04                        	0000b8 0804		
sub	a, 0x2f             		; 	SUB	A,_led_switch                  	0000b9 3a2f		
jbtc	0x3, 0             		; 	JBTC	STATUS,0                      	0000ba 2003		
jmp	0x114               		; 	JMP	_00265_DS_                     	0000bb 1114		
deca	0x2f               		; 	DECA	_led_switch                   	0000bc 3b2f		
mov	0x1b, a             		; 	MOV	r0x1013,A                      	0000bd 389b		
mov	a, 0x1b             		; 	MOV	A,r0x1013                      	0000be 301b		
add	0x2, a              		; 	ADD	PCL,A                          	0000bf 3f82		
jmp	0xc3                		; 	JMP	_00243_DS_                     	0000c0 10c3		
jmp	0xd8                		; 	JMP	_00249_DS_                     	0000c1 10d8		
jmp	0xfe                		; 	JMP	_00259_DS_                     	0000c2 10fe		
;	.line	296; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	if( CIR_FADEIN == cir_mode )
mov	a, 0x37             		; 	MOV	A,_cir_mode                    	0000c3 3037		
xor	a, @0x1             		; 	XOR	A,@0x01                        	0000c4 0e01		
jbts	0x3, 0x2           		; 	JBTS	STATUS,2                      	0000c5 2503		
jmp	0xca                		; 	JMP	_00247_DS_                     	0000c6 10ca		
;	.line	298; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	color_pwm_duty += 5;
mov	a, @0x5             		; 	MOV	A,@0x05                        	0000c7 0805		
add	0x33, a             		; 	ADD	_color_pwm_duty,A              	0000c8 3fb3		
jmp	0xd0                		; 	JMP	_00248_DS_                     	0000c9 10d0		
;	.line	300; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	else if( CIR_DIEOUT == cir_mode )
mov	a, @0               		; 	MOV	A,@0x00                        	0000ca 0800		
or	a, 0x37              		; 	OR	A,_cir_mode                     	0000cb 3c37		
jbts	0x3, 0x2           		; 	JBTS	STATUS,2                      	0000cc 2503		
jmp	0xd0                		; 	JMP	_00248_DS_                     	0000cd 10d0		
;	.line	302; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	color_pwm_duty -= 5;
dw	0x8fb  ;unknown opcode		; 	MOV	A,@0xfb                        	0000ce 08fb		
add	0x33, a             		; 	ADD	_color_pwm_duty,A              	0000cf 3fb3		
;	.line	304; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	led_cnt++;
inc	0x39                		; 	INC	_led_cnt                       	0000d0 32b9		
;	.line	305; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	R_PWMDTY = color_pwm_duty;
mov	a, 0x33             		; 	MOV	A,_color_pwm_duty              	0000d1 3033		
mov	0xb, a              		; 	MOV	_PDC2,A                        	0000d2 388b		
;	.line	306; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	G_PWMDTY = color_pwm_duty;			
mov	a, 0x33             		; 	MOV	A,_color_pwm_duty              	0000d3 3033		
mov	0xa, a              		; 	MOV	_PDC1,A                        	0000d4 388a		
;	.line	307; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	B_PWMDTY = color_pwm_duty;
mov	a, 0x33             		; 	MOV	A,_color_pwm_duty              	0000d5 3033		
mov	0xc, a              		; 	MOV	_PDC3,A                        	0000d6 388c		
;	.line	308; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	break;
jmp	0x114               		; 	JMP	_00265_DS_                     	0000d7 1114		
;	.line	312; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	if( 1 == cir_mode )
mov	a, 0x37             		; 	MOV	A,_cir_mode                    	0000d8 3037		
xor	a, @0x1             		; 	XOR	A,@0x01                        	0000d9 0e01		
jbts	0x3, 0x2           		; 	JBTS	STATUS,2                      	0000da 2503		
jmp	0xdf                		; 	JMP	_00253_DS_                     	0000db 10df		
;	.line	314; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	once_pwm_duty += 5;
mov	a, @0x5             		; 	MOV	A,@0x05                        	0000dc 0805		
add	0x35, a             		; 	ADD	_once_pwm_duty,A               	0000dd 3fb5		
jmp	0xe5                		; 	JMP	_00254_DS_                     	0000de 10e5		
;	.line	316; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	else if( 0 == cir_mode )
mov	a, @0               		; 	MOV	A,@0x00                        	0000df 0800		
or	a, 0x37              		; 	OR	A,_cir_mode                     	0000e0 3c37		
jbts	0x3, 0x2           		; 	JBTS	STATUS,2                      	0000e1 2503		
jmp	0xe5                		; 	JMP	_00254_DS_                     	0000e2 10e5		
;	.line	318; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	once_pwm_duty -= 5;
dw	0x8fb  ;unknown opcode		; 	MOV	A,@0xfb                        	0000e3 08fb		
add	0x35, a             		; 	ADD	_once_pwm_duty,A               	0000e4 3fb5		
;	.line	320; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	led_cnt++;
inc	0x39                		; 	INC	_led_cnt                       	0000e5 32b9		
;	.line	321; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	switch( led_mode )
mov	a, @0x3             		; 	MOV	A,@0x03                        	0000e6 0803		
sub	a, 0x2d             		; 	SUB	A,_led_mode                    	0000e7 3a2d		
jbtc	0x3, 0             		; 	JBTC	STATUS,0                      	0000e8 2003		
jmp	0x114               		; 	JMP	_00265_DS_                     	0000e9 1114		
mov	a, 0x2d             		; 	MOV	A,_led_mode                    	0000ea 302d		
add	0x2, a              		; 	ADD	PCL,A                          	0000eb 3f82		
jmp	0xef                		; 	JMP	_00255_DS_                     	0000ec 10ef		
jmp	0xf4                		; 	JMP	_00256_DS_                     	0000ed 10f4		
jmp	0xf9                		; 	JMP	_00257_DS_                     	0000ee 10f9		
;	.line	324; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	R_PWMDTY = once_pwm_duty;
mov	a, 0x35             		; 	MOV	A,_once_pwm_duty               	0000ef 3035		
mov	0xb, a              		; 	MOV	_PDC2,A                        	0000f0 388b		
;	.line	325; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	G_PWMDTY = 0;
clr	0xa                 		; 	CLR	_PDC1                          	0000f1 398a		
;	.line	326; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	B_PWMDTY = 0;
clr	0xc                 		; 	CLR	_PDC3                          	0000f2 398c		
;	.line	327; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	break;
jmp	0x114               		; 	JMP	_00265_DS_                     	0000f3 1114		
;	.line	329; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	R_PWMDTY = 0;
clr	0xb                 		; 	CLR	_PDC2                          	0000f4 398b		
;	.line	330; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	G_PWMDTY = once_pwm_duty;
mov	a, 0x35             		; 	MOV	A,_once_pwm_duty               	0000f5 3035		
mov	0xa, a              		; 	MOV	_PDC1,A                        	0000f6 388a		
;	.line	331; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	B_PWMDTY = 0;
clr	0xc                 		; 	CLR	_PDC3                          	0000f7 398c		
;	.line	332; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	break;
jmp	0x114               		; 	JMP	_00265_DS_                     	0000f8 1114		
;	.line	334; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	R_PWMDTY = 0;
clr	0xb                 		; 	CLR	_PDC2                          	0000f9 398b		
;	.line	335; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	G_PWMDTY = 0;
clr	0xa                 		; 	CLR	_PDC1                          	0000fa 398a		
;	.line	336; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	B_PWMDTY = once_pwm_duty;
mov	a, 0x35             		; 	MOV	A,_once_pwm_duty               	0000fb 3035		
mov	0xc, a              		; 	MOV	_PDC3,A                        	0000fc 388c		
;	.line	339; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	break;
jmp	0x114               		; 	JMP	_00265_DS_                     	0000fd 1114		
;	.line	342; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	R_PWMDTY = 0;
clr	0xb                 		; 	CLR	_PDC2                          	0000fe 398b		
;	.line	343; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	G_PWMDTY = 0;			
clr	0xa                 		; 	CLR	_PDC1                          	0000ff 398a		
;	.line	344; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	B_PWMDTY = 0;
clr	0xc                 		; 	CLR	_PDC3                          	000100 398c		
;	.line	345; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	once_pwm_duty = 100;
mov	a, @0x64            		; 	MOV	A,@0x64                        	000101 0864		
mov	0x35, a             		; 	MOV	_once_pwm_duty,A               	000102 38b5		
;	.line	346; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	switch( led_mode )
mov	a, @0x3             		; 	MOV	A,@0x03                        	000103 0803		
sub	a, 0x2d             		; 	SUB	A,_led_mode                    	000104 3a2d		
jbtc	0x3, 0             		; 	JBTC	STATUS,0                      	000105 2003		
jmp	0x114               		; 	JMP	_00265_DS_                     	000106 1114		
mov	a, 0x2d             		; 	MOV	A,_led_mode                    	000107 302d		
add	0x2, a              		; 	ADD	PCL,A                          	000108 3f82		
jmp	0x10c               		; 	JMP	_00260_DS_                     	000109 110c		
jmp	0x10f               		; 	JMP	_00261_DS_                     	00010a 110f		
jmp	0x112               		; 	JMP	_00262_DS_                     	00010b 1112		
;	.line	349; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	R_PWMDTY = once_pwm_duty;
mov	a, @0x64            		; 	MOV	A,@0x64                        	00010c 0864		
mov	0xb, a              		; 	MOV	_PDC2,A                        	00010d 388b		
;	.line	350; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	break;
jmp	0x114               		; 	JMP	_00265_DS_                     	00010e 1114		
;	.line	352; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	G_PWMDTY = once_pwm_duty;
mov	a, @0x64            		; 	MOV	A,@0x64                        	00010f 0864		
mov	0xa, a              		; 	MOV	_PDC1,A                        	000110 388a		
;	.line	353; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	break;
jmp	0x114               		; 	JMP	_00265_DS_                     	000111 1114		
;	.line	355; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	B_PWMDTY = once_pwm_duty;
mov	a, @0x64            		; 	MOV	A,@0x64                        	000112 0864		
mov	0xc, a              		; 	MOV	_PDC3,A                        	000113 388c		
;	.line	360; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	}
;	.line	359; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	}	
ret                     		; 	RET	                               	000114 3822		
;	.line	196; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	if( 0 == PWRKY_PORT( ) )
jbtc	0x5, 0x2           		; 	JBTC	_PORT5bits,2                  	00001d 2105		
jmp	0x23                		; 	JMP	_00168_DS_                     	00001e 1023		
;	.line	198; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	pwrkey_delay++;
inc	0x12                		; 	INC	_pwrkey_delay                  	00001f 3292		
jbtc	0x3, 0x2           		; 	JBTC	STATUS,2                      	000020 2103		
inc	0x13                		; 	INC	(_pwrkey_delay + 1)            	000021 3293		
jmp	0x68                		; 	JMP	_00169_DS_                     	000022 1068		
;	.line	203; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	if( pwrkey_delay >= 2 )
mov	a, @0               		; 	MOV	A,@0x00                        	000023 0800		
sub	a, 0x13             		; 	SUB	A,(_pwrkey_delay + 1)          	000024 3a13		
jbts	0x3, 0x2           		; 	JBTS	STATUS,2                      	000025 2503		
jmp	0x29                		; 	JMP	_00226_DS_                     	000026 1029		
mov	a, @0x2             		; 	MOV	A,@0x02                        	000027 0802		
sub	a, 0x12             		; 	SUB	A,_pwrkey_delay                	000028 3a12		
jbts	0x3, 0             		; 	JBTS	STATUS,0                      	000029 2403		
jmp	0x66                		; 	JMP	_00166_DS_                     	00002a 1066		
;	.line	206; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	if( pwrkey_delay < 800 )
mov	a, @0x3             		; 	MOV	A,@0x03                        	00002b 0803		
sub	a, 0x13             		; 	SUB	A,(_pwrkey_delay + 1)          	00002c 3a13		
jbts	0x3, 0x2           		; 	JBTS	STATUS,2                      	00002d 2503		
jmp	0x31                		; 	JMP	_00227_DS_                     	00002e 1031		
mov	a, @0x20            		; 	MOV	A,@0x20                        	00002f 0820		
sub	a, 0x12             		; 	SUB	A,_pwrkey_delay                	000030 3a12		
jbtc	0x3, 0             		; 	JBTC	STATUS,0                      	000031 2003		
jmp	0x54                		; 	JMP	_00163_DS_                     	000032 1054		
;	.line	208; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	switch( mode_switch )
mov	a, @0x3             		; 	MOV	A,@0x03                        	000033 0803		
sub	a, 0x31             		; 	SUB	A,_mode_switch                 	000034 3a31		
jbtc	0x3, 0             		; 	JBTC	STATUS,0                      	000035 2003		
jmp	0x66                		; 	JMP	_00166_DS_                     	000036 1066		
mov	a, 0x31             		; 	MOV	A,_mode_switch                 	000037 3031		
add	0x2, a              		; 	ADD	PCL,A                          	000038 3f82		
jmp	0x3c                		; 	JMP	_00155_DS_                     	000039 103c		
jmp	0x44                		; 	JMP	_00156_DS_                     	00003a 1044		
jmp	0x4c                		; 	JMP	_00157_DS_                     	00003b 104c		
;	.line	212; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	mode_switch = TWO_GEARS;
mov	a, @0x2             		; 	MOV	A,@0x02                        	00003c 0802		
mov	0x31, a             		; 	MOV	_mode_switch,A                 	00003d 38b1		
;	.line	213; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	beep_mode = BEEP_ONE;
mov	a, @0x1             		; 	MOV	A,@0x01                        	00003e 0801		
mov	0x29, a             		; 	MOV	_beep_mode,A                   	00003f 38a9		
;	.line	214; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	beep_delay = 0;
clr	0x1d                		; 	CLR	_beep_delay                    	000040 399d		
;	.line	215; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	beep_cnt = 1;
mov	a, @0x1             		; 	MOV	A,@0x01                        	000041 0801		
mov	0x2b, a             		; 	MOV	_beep_cnt,A                    	000042 38ab		
;	.line	216; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	break;
jmp	0x66                		; 	JMP	_00166_DS_                     	000043 1066		
;	.line	219; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	beep_mode = BEEP_ONE;
mov	a, @0x1             		; 	MOV	A,@0x01                        	000044 0801		
mov	0x29, a             		; 	MOV	_beep_mode,A                   	000045 38a9		
;	.line	220; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	beep_delay = 0;
clr	0x1d                		; 	CLR	_beep_delay                    	000046 399d		
;	.line	221; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	beep_cnt = 1;
mov	a, @0x1             		; 	MOV	A,@0x01                        	000047 0801		
mov	0x2b, a             		; 	MOV	_beep_cnt,A                    	000048 38ab		
;	.line	222; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	mode_switch = TWO_GEARS;
mov	a, @0x2             		; 	MOV	A,@0x02                        	000049 0802		
mov	0x31, a             		; 	MOV	_mode_switch,A                 	00004a 38b1		
;	.line	223; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	break; 
jmp	0x66                		; 	JMP	_00166_DS_                     	00004b 1066		
;	.line	226; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	beep_mode = BEEP_TWO; 
mov	a, @0x2             		; 	MOV	A,@0x02                        	00004c 0802		
mov	0x29, a             		; 	MOV	_beep_mode,A                   	00004d 38a9		
;	.line	227; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	beep_delay = 0;
clr	0x1d                		; 	CLR	_beep_delay                    	00004e 399d		
;	.line	228; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	beep_cnt = 2;
mov	a, @0x2             		; 	MOV	A,@0x02                        	00004f 0802		
mov	0x2b, a             		; 	MOV	_beep_cnt,A                    	000050 38ab		
;	.line	229; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	mode_switch = ONE_GEARS;
mov	a, @0x1             		; 	MOV	A,@0x01                        	000051 0801		
mov	0x31, a             		; 	MOV	_mode_switch,A                 	000052 38b1		
;	.line	231; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	}
jmp	0x66                		; 	JMP	_00166_DS_                     	000053 1066		
;	.line	234; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	else if( ( pwrkey_delay >= 800 ) && ( mode_switch != NONE_GEARS ) )
mov	a, @0x3             		; 	MOV	A,@0x03                        	000054 0803		
sub	a, 0x13             		; 	SUB	A,(_pwrkey_delay + 1)          	000055 3a13		
jbts	0x3, 0x2           		; 	JBTS	STATUS,2                      	000056 2503		
jmp	0x5a                		; 	JMP	_00230_DS_                     	000057 105a		
mov	a, @0x20            		; 	MOV	A,@0x20                        	000058 0820		
sub	a, 0x12             		; 	SUB	A,_pwrkey_delay                	000059 3a12		
jbts	0x3, 0             		; 	JBTS	STATUS,0                      	00005a 2403		
jmp	0x66                		; 	JMP	_00166_DS_                     	00005b 1066		
mov	a, @0               		; 	MOV	A,@0x00                        	00005c 0800		
or	a, 0x31              		; 	OR	A,_mode_switch                  	00005d 3c31		
jbtc	0x3, 0x2           		; 	JBTC	STATUS,2                      	00005e 2103		
jmp	0x66                		; 	JMP	_00166_DS_                     	00005f 1066		
;	.line	237; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	mode_switch = NONE_GEARS;
clr	0x31                		; 	CLR	_mode_switch                   	000060 39b1		
;	.line	238; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	beep_mode = BEEP_ONE;
mov	a, @0x1             		; 	MOV	A,@0x01                        	000061 0801		
mov	0x29, a             		; 	MOV	_beep_mode,A                   	000062 38a9		
;	.line	239; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	beep_delay = 0;
clr	0x1d                		; 	CLR	_beep_delay                    	000063 399d		
;	.line	240; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	beep_cnt = 1;
mov	a, @0x1             		; 	MOV	A,@0x01                        	000064 0801		
mov	0x2b, a             		; 	MOV	_beep_cnt,A                    	000065 38ab		
;	.line	243; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	pwrkey_delay = 0;
clr	0x12                		; 	CLR	_pwrkey_delay                  	000066 3992		
clr	0x13                		; 	CLR	(_pwrkey_delay + 1)            	000067 3993		
;	.line	247; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	if( 0 == LEDKEY_PORT( ) && ( mode_switch != NONE_GEARS )  )
jbtc	0x5, 0x1           		; 	JBTC	_PORT5bits,1                  	000068 2085		
jmp	0x72                		; 	JMP	_00182_DS_                     	000069 1072		
mov	a, @0               		; 	MOV	A,@0x00                        	00006a 0800		
or	a, 0x31              		; 	OR	A,_mode_switch                  	00006b 3c31		
jbtc	0x3, 0x2           		; 	JBTC	STATUS,2                      	00006c 2103		
jmp	0x72                		; 	JMP	_00182_DS_                     	00006d 1072		
;	.line	249; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	ledkey_delay++;
inc	0x15                		; 	INC	_ledkey_delay                  	00006e 3295		
jbtc	0x3, 0x2           		; 	JBTC	STATUS,2                      	00006f 2103		
inc	0x16                		; 	INC	(_ledkey_delay + 1)            	000070 3296		
jmp	0xa7                		; 	JMP	_00185_DS_                     	000071 10a7		
;	.line	254; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	if( ledkey_delay >= 2 )
mov	a, @0               		; 	MOV	A,@0x00                        	000072 0800		
sub	a, 0x16             		; 	SUB	A,(_ledkey_delay + 1)          	000073 3a16		
jbts	0x3, 0x2           		; 	JBTS	STATUS,2                      	000074 2503		
jmp	0x78                		; 	JMP	_00231_DS_                     	000075 1078		
mov	a, @0x2             		; 	MOV	A,@0x02                        	000076 0802		
sub	a, 0x15             		; 	SUB	A,_ledkey_delay                	000077 3a15		
jbts	0x3, 0             		; 	JBTS	STATUS,0                      	000078 2403		
jmp	0xa5                		; 	JMP	_00180_DS_                     	000079 10a5		
;	.line	257; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	if( ledkey_delay < 800 )
mov	a, @0x3             		; 	MOV	A,@0x03                        	00007a 0803		
sub	a, 0x16             		; 	SUB	A,(_ledkey_delay + 1)          	00007b 3a16		
jbts	0x3, 0x2           		; 	JBTS	STATUS,2                      	00007c 2503		
jmp	0x80                		; 	JMP	_00232_DS_                     	00007d 1080		
mov	a, @0x20            		; 	MOV	A,@0x20                        	00007e 0820		
sub	a, 0x15             		; 	SUB	A,_ledkey_delay                	00007f 3a15		
jbtc	0x3, 0             		; 	JBTC	STATUS,0                      	000080 2003		
jmp	0x9c                		; 	JMP	_00177_DS_                     	000081 109c		
;	.line	259; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	led_switch = 1;
mov	a, @0x1             		; 	MOV	A,@0x01                        	000082 0801		
mov	0x2f, a             		; 	MOV	_led_switch,A                  	000083 38af		
;	.line	260; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	switch( led_mode )
mov	a, @0x1             		; 	MOV	A,@0x01                        	000084 0801		
sub	a, 0x2d             		; 	SUB	A,_led_mode                    	000085 3a2d		
jbts	0x3, 0             		; 	JBTS	STATUS,0                      	000086 2403		
jmp	0xa5                		; 	JMP	_00180_DS_                     	000087 10a5		
mov	a, @0x4             		; 	MOV	A,@0x04                        	000088 0804		
sub	a, 0x2d             		; 	SUB	A,_led_mode                    	000089 3a2d		
jbtc	0x3, 0             		; 	JBTC	STATUS,0                      	00008a 2003		
jmp	0xa5                		; 	JMP	_00180_DS_                     	00008b 10a5		
deca	0x2d               		; 	DECA	_led_mode                     	00008c 3b2d		
mov	0x1b, a             		; 	MOV	r0x1013,A                      	00008d 389b		
mov	a, 0x1b             		; 	MOV	A,r0x1013                      	00008e 301b		
add	0x2, a              		; 	ADD	PCL,A                          	00008f 3f82		
jmp	0x93                		; 	JMP	_00170_DS_                     	000090 1093		
jmp	0x96                		; 	JMP	_00171_DS_                     	000091 1096		
jmp	0x99                		; 	JMP	_00172_DS_                     	000092 1099		
;	.line	263; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	led_mode = RGB_ONE_CIR;
mov	a, @0x2             		; 	MOV	A,@0x02                        	000093 0802		
mov	0x2d, a             		; 	MOV	_led_mode,A                    	000094 38ad		
;	.line	264; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	break;
jmp	0xa5                		; 	JMP	_00180_DS_                     	000095 10a5		
;	.line	266; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	led_mode = RGB_ONE_ONCE;
mov	a, @0x3             		; 	MOV	A,@0x03                        	000096 0803		
mov	0x2d, a             		; 	MOV	_led_mode,A                    	000097 38ad		
;	.line	267; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	break;
jmp	0xa5                		; 	JMP	_00180_DS_                     	000098 10a5		
;	.line	269; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	led_mode = RGB_COLOR_CIR;
mov	a, @0x1             		; 	MOV	A,@0x01                        	000099 0801		
mov	0x2d, a             		; 	MOV	_led_mode,A                    	00009a 38ad		
;	.line	271; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	}
jmp	0xa5                		; 	JMP	_00180_DS_                     	00009b 10a5		
;	.line	274; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	else if( ledkey_delay >= 800 )
mov	a, @0x3             		; 	MOV	A,@0x03                        	00009c 0803		
sub	a, 0x16             		; 	SUB	A,(_ledkey_delay + 1)          	00009d 3a16		
jbts	0x3, 0x2           		; 	JBTS	STATUS,2                      	00009e 2503		
jmp	0xa2                		; 	JMP	_00236_DS_                     	00009f 10a2		
mov	a, @0x20            		; 	MOV	A,@0x20                        	0000a0 0820		
sub	a, 0x15             		; 	SUB	A,_ledkey_delay                	0000a1 3a15		
jbts	0x3, 0             		; 	JBTS	STATUS,0                      	0000a2 2403		
jmp	0xa5                		; 	JMP	_00180_DS_                     	0000a3 10a5		
;	.line	276; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	led_mode = RGB_ONE_NONE;
clr	0x2d                		; 	CLR	_led_mode                      	0000a4 39ad		
;	.line	279; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	ledkey_delay = 0;
clr	0x15                		; 	CLR	_ledkey_delay                  	0000a5 3995		
clr	0x16                		; 	CLR	(_ledkey_delay + 1)            	0000a6 3996		
;	.line	281; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	}
ret                     		; 	RET	                               	0000a7 3822		
;	.line	187; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	if( 0 ==  SHAKE_PORT( ) )
jbtc	0x5, 0             		; 	JBTC	_PORT5bits,0                  	00025e 2005		
jmp	0x267               		; 	JMP	_00150_DS_                     	00025f 1267		
;	.line	189; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	led_switch = !led_switch;
mov	a, 0x2f             		; 	MOV	A,_led_switch                  	000260 302f		
mov	a, @0               		; 	MOV	A,@0x00                        	000261 0800		
jbtc	0x3, 0x2           		; 	JBTC	STATUS,2                      	000262 2103		
mov	a, @0x1             		; 	MOV	A,@0x01                        	000263 0801		
mov	0x1b, a             		; 	MOV	r0x1013,A                      	000264 389b		
mov	a, 0x1b             		; 	MOV	A,r0x1013                      	000265 301b		
mov	0x2f, a             		; 	MOV	_led_switch,A                  	000266 38af		
;	.line	191; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	}
ret                     		; 	RET	                               	000267 3822		
;	.line	148; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	switch( beep_mode )
mov	a, @0x3             		; 	MOV	A,@0x03                        	00020d 0803		
sub	a, 0x29             		; 	SUB	A,_beep_mode                   	00020e 3a29		
jbtc	0x3, 0             		; 	JBTC	STATUS,0                      	00020f 2003		
jmp	0x23e               		; 	JMP	_00143_DS_                     	000210 123e		
mov	a, 0x29             		; 	MOV	A,_beep_mode                   	000211 3029		
add	0x2, a              		; 	ADD	PCL,A                          	000212 3f82		
jmp	0x216               		; 	JMP	_00128_DS_                     	000213 1216		
jmp	0x218               		; 	JMP	_00129_DS_                     	000214 1218		
jmp	0x228               		; 	JMP	_00134_DS_                     	000215 1228		
;	.line	151; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	BEEP_PORT( ) = 0;
btc	0x6, 0x5            		; 	BTC	_PORT6bits,5                   	000216 2a86		
;	.line	152; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	break;	
jmp	0x23e               		; 	JMP	_00143_DS_                     	000217 123e		
;	.line	154; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	BEEP_PORT( ) = 1;
bts	0x6, 0x5            		; 	BTS	_PORT6bits,5                   	000218 2e86		
;	.line	155; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	beep_cnt--;
dec	0x2b                		; 	DEC	_beep_cnt                      	000219 3bab		
;	.line	156; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	if( beep_delay++ >= 30 )
mov	a, 0x1d             		; 	MOV	A,_beep_delay                  	00021a 301d		
mov	0x1b, a             		; 	MOV	r0x1013,A                      	00021b 389b		
inc	0x1d                		; 	INC	_beep_delay                    	00021c 329d		
mov	a, @0x1e            		; 	MOV	A,@0x1e                        	00021d 081e		
sub	a, 0x1b             		; 	SUB	A,r0x1013                      	00021e 3a1b		
jbts	0x3, 0             		; 	JBTS	STATUS,0                      	00021f 2403		
jmp	0x23e               		; 	JMP	_00143_DS_                     	000220 123e		
;	.line	158; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	if( beep_cnt == 0 )
mov	a, @0               		; 	MOV	A,@0x00                        	000221 0800		
or	a, 0x2b              		; 	OR	A,_beep_cnt                     	000222 3c2b		
jbts	0x3, 0x2           		; 	JBTS	STATUS,2                      	000223 2503		
jmp	0x23e               		; 	JMP	_00143_DS_                     	000224 123e		
;	.line	160; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	beep_mode = BEEP_NONE;
clr	0x29                		; 	CLR	_beep_mode                     	000225 39a9		
;	.line	161; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	beep_delay = 0;
clr	0x1d                		; 	CLR	_beep_delay                    	000226 399d		
;	.line	164; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	break;	
jmp	0x23e               		; 	JMP	_00143_DS_                     	000227 123e		
;	.line	166; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	BEEP_PORT( ) = 1;
bts	0x6, 0x5            		; 	BTS	_PORT6bits,5                   	000228 2e86		
;	.line	167; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	if( beep_delay++ >= 10 )
mov	a, 0x1d             		; 	MOV	A,_beep_delay                  	000229 301d		
mov	0x1b, a             		; 	MOV	r0x1013,A                      	00022a 389b		
inc	0x1d                		; 	INC	_beep_delay                    	00022b 329d		
mov	a, @0xa             		; 	MOV	A,@0x0a                        	00022c 080a		
sub	a, 0x1b             		; 	SUB	A,r0x1013                      	00022d 3a1b		
jbts	0x3, 0             		; 	JBTS	STATUS,0                      	00022e 2403		
jmp	0x23e               		; 	JMP	_00143_DS_                     	00022f 123e		
;	.line	169; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	beep_cnt--;
dec	0x2b                		; 	DEC	_beep_cnt                      	000230 3bab		
;	.line	170; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	if( beep_cnt == 0 )
mov	a, @0               		; 	MOV	A,@0x00                        	000231 0800		
or	a, 0x2b              		; 	OR	A,_beep_cnt                     	000232 3c2b		
jbts	0x3, 0x2           		; 	JBTS	STATUS,2                      	000233 2503		
jmp	0x238               		; 	JMP	_00138_DS_                     	000234 1238		
;	.line	172; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	beep_delay = 0;
clr	0x1d                		; 	CLR	_beep_delay                    	000235 399d		
;	.line	173; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	beep_mode = BEEP_NONE;
clr	0x29                		; 	CLR	_beep_mode                     	000236 39a9		
jmp	0x23e               		; 	JMP	_00143_DS_                     	000237 123e		
;	.line	175; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	else if( beep_cnt == 1 )
mov	a, 0x2b             		; 	MOV	A,_beep_cnt                    	000238 302b		
xor	a, @0x1             		; 	XOR	A,@0x01                        	000239 0e01		
jbts	0x3, 0x2           		; 	JBTS	STATUS,2                      	00023a 2503		
jmp	0x23e               		; 	JMP	_00143_DS_                     	00023b 123e		
;	.line	177; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	beep_delay = 0;
clr	0x1d                		; 	CLR	_beep_delay                    	00023c 399d		
;	.line	178; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	BEEP_PORT( ) = 0;
btc	0x6, 0x5            		; 	BTC	_PORT6bits,5                   	00023d 2a86		
;	.line	183; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	}
;	.line	182; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	}
ret                     		; 	RET	                               	00023e 3822		
;	.line	116; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	IOCP_W(IMR,0x09);		//TCC+PWM周期中断,根据需要调用	
mov	a, @0x9             		; 	mov	a,@0x09                        	000001 0809		
iw	0xf                  		; 	iw	IMR                             	000002 380f		
;	.line	117; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	PWMCON = 0xf8;			//使能3路pwm输出，pwm=1/8*2(分频)*4clock*100=100us
dw	0x8f8  ;unknown opcode		; 	MOV	A,@0xf8                        	000003 08f8		
mov	0x8, a              		; 	MOV	_PWMCON,A                      	000004 3888		
;	.line	118; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	PRD = 100;				//PWM周期寄存器
mov	a, @0x64            		; 	MOV	A,@0x64                        	000005 0864		
mov	0x9, a              		; 	MOV	_PRD,A                         	000006 3889		
;	.line	119; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	}
ret                     		; 	RET	                               	000007 3822		
;	.line	95; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	CONTW(0x02);			//TCC 8分频
mov	a, @0x2             		; 	mov	a,@0x02                        	00023f 0802		
ctw                     		; 	ctw                                	000240 3802		
;	.line	96; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	TCC = 6;				//1/2 * 8 * (256-6) = 1000us	公式：1/IRC频率 * 预分频 * （256-初值）
mov	a, @0x6             		; 	MOV	A,@0x06                        	000241 0806		
mov	0x1, a              		; 	MOV	_TCC,A                         	000242 3881		
;	.line	97; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	PORT5 = 0;				//
clr	0x5                 		; 	CLR	_PORT5                         	000243 3985		
;	.line	98; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	PORT6 = 0;				//
clr	0x6                 		; 	CLR	_PORT6                         	000244 3986		
;	.line	99; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	IOCP_W(P5CR,0x0F);		// 50 51 52 53 均为输入
mov	a, @0xf             		; 	mov	a,@0x0F                        	000245 080f		
iw	0x5                  		; 	iw	P5CR                            	000246 3805		
;	.line	100; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	IOCP_W(P6CR,0x00);		// 65 66 67 输出
mov	a, @0               		; 	mov	a,@0x00                        	000247 0800		
iw	0x6                  		; 	iw	P6CR                            	000248 3806		
;	.line	101; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	IOCP_W(PHDCR,0xf0);		//端口上下拉控制寄存器，bit7-bit4对应P67-P64下拉;bit3-bit0对应P53-P50上拉 
dw	0x8f0  ;unknown opcode		; 	mov	a,@0xf0                        	000249 08f0		
iw	0x9                  		; 	iw	PHDCR                           	00024a 3809		
;	.line	102; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	IOCP_W(PDCR,0xff);		//端口下拉控制寄存器，  bit6-bit4对应P62-P60,bit3-bit0对应P53-P50
dw	0x8ff  ;unknown opcode		; 	mov	a,@0xff                        	00024b 08ff		
iw	0xb                  		; 	iw	PDCR                            	00024c 380b		
;	.line	103; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	IOCP_W(PHCR,0xff);		//P6端口上拉控制寄存器  bit7-bit0对应P67-P60
dw	0x8ff  ;unknown opcode		; 	mov	a,@0xff                        	00024d 08ff		
iw	0xd                  		; 	iw	PHCR                            	00024e 380d		
;	.line	104; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	IOCP_W(WDTCR,0x00);		//WDT 使能控制寄存器	IOCP_W(IMR,0x01);		//中断使能控制寄存器 
mov	a, @0               		; 	mov	a,@0x00                        	00024f 0800		
iw	0xe                  		; 	iw	WDTCR                           	000250 380e		
;	.line	105; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	ISR = 0x0;				//清TC0中断标志位 
clr	0xf                 		; 	CLR	_ISR                           	000251 398f		
;	.line	106; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	}
ret                     		; 	RET	                               	000252 3822		
;	.line	85; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	for(RSR=0xD0;RSR<0xFF;RSR++)	//清零 BANK0 RAM  IAR-R0,RSR-R4
dw	0x8d0  ;unknown opcode		; 	MOV	A,@0xd0                        	000253 08d0		
mov	0x4, a              		; 	MOV	_RSR,A                         	000254 3884		
dw	0x8ff  ;unknown opcode		; 	MOV	A,@0xff                        	000255 08ff		
sub	a, 0x4              		; 	SUB	A,_RSR                         	000256 3a04		
jbtc	0x3, 0             		; 	JBTC	STATUS,0                      	000257 2003		
jmp	0x25c               		; 	JMP	_00105_DS_                     	000258 125c		
;	.line	87; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	{IAR = 0;}
clr	0                   		; 	CLR	_IAR                           	000259 3980		
;	.line	85; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	for(RSR=0xD0;RSR<0xFF;RSR++)	//清零 BANK0 RAM  IAR-R0,RSR-R4
inc	0x4                 		; 	INC	_RSR                           	00025a 3284		
jmp	0x255               		; 	JMP	_00107_DS_                     	00025b 1255		
;	.line	88; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	IAR = 0;
clr	0                   		; 	CLR	_IAR                           	00025c 3980		
;	.line	89; C:\USERS\14440\DESKTOP\XJ\FUN\XC8P9521-PWM-3.C	}
ret                     		; 	RET	                               	00025d 3822		
