#include "XC8P9521.h"
#include "XJ_9521Define.h"

// 函数声明
void delayUs(unsigned char Time);
void delayMs(unsigned char Time);
void key_process(void);
void rgb_process(void);
void output_process(void);
void beep_process(void);
void shake_process(void);

// 宏定义声明
#define SHAKE_PORT() PORT5_0	// 振动开关
#define LEDKEY_PORT() PORT5_1	// LED灯按键
#define PWRKY_PORT() PORT5_2    // 电源按键
#define LIMIT_PORT() PORT5_3	// 限位开关

#define	BEEP_PORT() PORT6_5		// 蜂鸣器输出
#define	FUN_PORT() PORT6_6		// 风扇输出
#define	COLD_PORT() PORT6_7		// 制冷输出

#define	R_PWMDTY PDC2			// G占空比
#define	G_PWMDTY PDC1			// G占空比
#define	B_PWMDTY PDC3			// B占空比

enum{
	NONE_GEARS, // 关机状态
	ONE_GEARS,// 1档
	TWO_GEARS,// 2档
};
enum
{
	RGB_ONE_NONE,
	RGB_COLOR_CIR,
	RGB_ONE_CIR,
	RGB_ONE_ONCE,
};
enum
{
	RGB_R,
	RGB_G,	
	RGB_B,
};
enum
{
	CIR_DIEOUT,
	CIR_FADEIN,	
};
enum
{
	BEEP_NONE,
	BEEP_ONE,	
	BEEP_TWO,	
};
// 全局变量声明

unsigned char beep_delay = 0;		     	// 蜂鸣器响应时间
unsigned char sys_delay = 0;		        // 系统计时
unsigned char beep_mode = 0;			// 蜂鸣器响模式
unsigned char beep_cnt = 0;			// 蜂鸣器响应次数
unsigned char led_mode = RGB_COLOR_CIR;		// 单色灯选择
unsigned char led_switch = RGB_COLOR_CIR;	// 彩灯模式
unsigned char mode_switch = 0;	// 运行模式
unsigned char color_pwm_duty = 0;		// 彩灯的占空比
unsigned char once_pwm_duty = 0;		// 单色灯的占空比
unsigned char cir_mode = 0;	// 渐亮灭标志 1：渐亮 0：渐灭
unsigned char led_cnt = 0;	// 渐亮灭计数
unsigned char fun_dty = 0;	// 风扇占空比
unsigned char cold_dty = 0;	// 制冷占空比

unsigned short pwrkey_delay = 0;			// 电源按键按下时间
unsigned short ledkey_delay = 0;			// 灯光按键按下时间
unsigned short r_delay = 0;		     	    // 红灯闪烁时间

//===================================//
//void file_clrRam(void);
//void file_init(void);
//void file_project_init(void);
//===================================//
//初始化RAM:10H~3FH
//===================================//
void file_clrRam()
{
	for(RSR=0xD0;RSR<0xFF;RSR++)	//清零 BANK0 RAM  IAR-R0,RSR-R4
									//RSR的高两位默认只读为1					
	{IAR = 0;}
	 IAR = 0;
}
//===================================//
//端口初始化
//===================================//
void file_init(void)
{	
	CONTW(0x02);			//TCC 8分频
	TCC = 6;				//1/2 * 8 * (256-6) = 1000us	公式：1/IRC频率 * 预分频 * （256-初值）
	PORT5 = 0;				//
	PORT6 = 0;				//
	IOCP_W(P5CR,0x0F);		// 50 51 52 53 均为输入
	IOCP_W(P6CR,0x00);		// 65 66 67 输出
	IOCP_W(PHDCR,0xf0);		//端口上下拉控制寄存器，bit7-bit4对应P67-P64下拉;bit3-bit0对应P53-P50上拉 
	IOCP_W(PDCR,0xff);		//端口下拉控制寄存器，  bit6-bit4对应P62-P60,bit3-bit0对应P53-P50
	IOCP_W(PHCR,0xff);		//P6端口上拉控制寄存器  bit7-bit0对应P67-P60
	IOCP_W(WDTCR,0x00);		//WDT 使能控制寄存器	IOCP_W(IMR,0x01);		//中断使能控制寄存器 
	ISR = 0x0;				//清TC0中断标志位 
}
//===================================//
//TC0初始化
//===================================//
void file_project_init(void)
{	
//---------------------------------
//PWM设置，3路pwm是共周期的
//---------------------------------
//file_pwm_set:   
	IOCP_W(IMR,0x09);		//TCC+PWM周期中断,根据需要调用	
	PWMCON = 0xf8;			//使能3路pwm输出，pwm=1/8*2(分频)*4clock*100=100us
	PRD = 100;				//PWM周期寄存器
}
//===================================//
//中断服务程序
//===================================//
void int_isr(void) __interrupt 
{    	
	__asm__("org 0x08");			//中断入口地址			
	PUSH(_A_BUFF,_R3_BUFF);			//中断入栈保护
//=========Tcc中断程序===============//
	if(TCIF)					//判断TCIF是否为1
	{
		fun_dty++;
		cold_dty++;
		sys_delay++;
		TCC	  += 6;			//1/2 * 8 * (256-6) = 1000us	公式：1/IRC频率 * 预分频 * （256-初值）
		ISR    = 0xfe;				//清TC0中断标志位
	}	 
//======== PWM周期中断程序===============//
	if(T1IF)					//判断T1IF是否为1,pwm周期中断
	{	 
		ISR    = 0xf7;				//ISR的bit3:T1IF清零
	}

	POP(_A_BUFF,_R3_BUFF);			//中断出栈保护恢复
}

// 蜂鸣器任务
void beep_process(void)
{	
	switch( beep_mode )
	{
		case BEEP_NONE:
			BEEP_PORT( ) = 0;
		break;	
		case BEEP_ONE:
			BEEP_PORT( ) = 1;
			beep_cnt--;
			if( beep_delay++ >= 30 )
			{
				if( beep_cnt == 0 )
				{
					beep_mode = BEEP_NONE;
					beep_delay = 0;
				}
			}
		break;	
		case BEEP_TWO:
			BEEP_PORT( ) = 1;
			if( beep_delay++ >= 10 )
			{
				beep_cnt--;
				if( beep_cnt == 0 )
				{
					beep_delay = 0;
					beep_mode = BEEP_NONE;
				}
				else if( beep_cnt == 1 )
				{
					beep_delay = 0;
					BEEP_PORT( ) = 0;
				}
			}
		break;	
	}
}
void shake_process(void)
{
	// 振动触发
	if( 0 ==  SHAKE_PORT( ) )
	{
		led_switch = !led_switch;
	}
}
// 按键任务
void key_process(void)
{
	// 电源按键按下
	if( 0 == PWRKY_PORT( ) )
	{
		pwrkey_delay++;
	}
	else
	{
		// 消抖
		if( pwrkey_delay >= 2 )
		{
			// 短按
			if( pwrkey_delay < 800 )
			{
				switch( mode_switch )
				{
					// 第一次按下按键
					case NONE_GEARS:
						mode_switch = TWO_GEARS;
						beep_mode = BEEP_ONE;
						beep_delay = 0;
						beep_cnt = 1;
					break;
					// 一档
					case ONE_GEARS:
						beep_mode = BEEP_ONE;
						beep_delay = 0;
						beep_cnt = 1;
						mode_switch = TWO_GEARS;
					break; 
					// 二档
					case TWO_GEARS:
						beep_mode = BEEP_TWO; 
						beep_delay = 0;
						beep_cnt = 2;
						mode_switch = ONE_GEARS;
					break;
				}
			}
			// 长按
			else if( ( pwrkey_delay >= 800 ) && ( mode_switch != NONE_GEARS ) )
			{
				// 关机
				mode_switch = NONE_GEARS;
				beep_mode = BEEP_ONE;
				beep_delay = 0;
				beep_cnt = 1;
			}
		}
		pwrkey_delay = 0;
	}

	// 灯光按键按下
	if( 0 == LEDKEY_PORT( ) && ( mode_switch != NONE_GEARS )  )
	{
		ledkey_delay++;
	}
	else
	{
		// 消抖
		if( ledkey_delay >= 2 )
		{
			// 短按
			if( ledkey_delay < 800 )
			{
				led_switch = 1;
				switch( led_mode )
				{
					case RGB_COLOR_CIR:
						led_mode = RGB_ONE_CIR;
					break;
					case RGB_ONE_CIR:
						led_mode = RGB_ONE_ONCE;
					break;
					case RGB_ONE_ONCE:
						led_mode = RGB_COLOR_CIR;
					break;
				}
			}
			// 长按
			else if( ledkey_delay >= 800 )
			{
				led_mode = RGB_ONE_NONE;
			}
		}	
		ledkey_delay = 0;
	}
}

// 采灯任务
void rgb_process(void)
{
	// 渐亮到渐灭
	if( led_cnt == 20 )
	{
		led_cnt = 0;
		cir_mode = !cir_mode;
	}
	switch( led_switch )
	{
		// 七彩循环呼吸
		case RGB_COLOR_CIR: 
			if( CIR_FADEIN == cir_mode )
			{	
				color_pwm_duty += 5;
			}
			else if( CIR_DIEOUT == cir_mode )
			{	
				color_pwm_duty -= 5;
			}
			led_cnt++;
			R_PWMDTY = color_pwm_duty;
			G_PWMDTY = color_pwm_duty;			
			B_PWMDTY = color_pwm_duty;
		break;

		// 单色循环呼吸
		case RGB_ONE_CIR: 
			if( 1 == cir_mode )
			{	
				once_pwm_duty += 5;
			}
			else if( 0 == cir_mode )
			{	
				once_pwm_duty -= 5;
			}
			led_cnt++;
			switch( led_mode )
			{
				case RGB_R:
					R_PWMDTY = once_pwm_duty;
					G_PWMDTY = 0;
					B_PWMDTY = 0;
				break;
				case RGB_G:
					R_PWMDTY = 0;
					G_PWMDTY = once_pwm_duty;
					B_PWMDTY = 0;
				break;
				case RGB_B:
					R_PWMDTY = 0;
					G_PWMDTY = 0;
					B_PWMDTY = once_pwm_duty;
				break;
			}
		break;
		// 单色高亮
		case RGB_ONE_ONCE: 
			R_PWMDTY = 0;
			G_PWMDTY = 0;			
			B_PWMDTY = 0;
			once_pwm_duty = 100;
			switch( led_mode )
			{
				case RGB_R:
					R_PWMDTY = once_pwm_duty;
				break;
				case RGB_G:
					G_PWMDTY = once_pwm_duty;
				break;
				case RGB_B:
					B_PWMDTY = once_pwm_duty;
				break;
			}
		break;
	}	
}
// 制冷和风扇控制任务
void output_process(void)
{
	// 10ms周期
	switch( mode_switch )
	{
		// 一档 风扇60%占空比 制冷90%占空比
		case NONE_GEARS:
			FUN_PORT( ) = 0;
			COLD_PORT( ) = 0;
		break;
		case ONE_GEARS: 
			if( fun_dty < 6 )
			{
				FUN_PORT( ) = 1;	
			}
			else if( fun_dty >= 6 )
			{
				FUN_PORT( ) = 0;	
				if( fun_dty >= 10 )
				{
					fun_dty = 0;
				}
			}
			if( cold_dty < 9 )
			{
				COLD_PORT( ) = 1;	
			}
			else if( cold_dty >= 9 )
			{
				COLD_PORT( ) = 0;	
				if( cold_dty >= 10 )
				{
					cold_dty = 0;
				}
			}

		break;

		// 二档 风扇80%占空比 制冷100%占空比
		case TWO_GEARS: 
			if( fun_dty < 8 )
			{
				FUN_PORT() = 1;	
			}
			else if( fun_dty >= 8 )
			{
				FUN_PORT() = 0;	
				if( fun_dty >= 10 )
				{
					fun_dty = 0;
				}
			}
			COLD_PORT( ) = 1;
			if( cold_dty >= 10 )
			{
				cold_dty = 0;
			}	
		break;
	}
}
//===================================//
//MAIN主程序
//===================================//
void main()
{
	file_clrRam();					//清RAM
	file_init();					//io寄存器初始化
	file_project_init();			//程序所需功能设置
	EI();							//打开总中断
	while(1)
	{
		// 2ms运行一次程序 
		if( sys_delay >= 2 )
		{
			sys_delay = 0;
			// 按键检测 
			key_process( );
			// 限位开关 1：开 0：关
			// 当限位开关关闭时，R灯一秒闪一次，制冷和风扇输出0
			if( ( 0 == LIMIT_PORT( ) )&& ( mode_switch != NONE_GEARS ) )
			{
				FUN_PORT() = 0;
				COLD_PORT() = 0;
				G_PWMDTY = 0;
				B_PWMDTY = 0;
				if( ++r_delay < 500 )
				{
					// 延时1秒
					R_PWMDTY = 100;
				}
				else if(  r_delay > 500 )
				{
					// 延时1秒
				    R_PWMDTY = 0;
					if( r_delay >= 1000 )
					{
						r_delay = 0;
					}
				}
			}
			if( ( 1 == LIMIT_PORT( ) )&& ( mode_switch != NONE_GEARS ) )
			{
				// 振动开关 1：开 0：关
				// 振动开关开和关一次都会使RGB开或者直接关
				if( 0 == led_switch )
				{
					// 灯熄灭
					R_PWMDTY = 0;
					G_PWMDTY = 0;
					B_PWMDTY = 0;
				}
				else if( 1 == led_switch )
				{
					// 灯光运行
					rgb_process( );
				}
				// 振动开关
				shake_process( );
				// 蜂鸣器运行
				beep_process( );
				// 制冷和风扇运行
				output_process( );
			}		
		}
	}
}