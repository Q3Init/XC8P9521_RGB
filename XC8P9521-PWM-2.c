//*******************************************免责声明*******************************************//
/*无锡矽杰微电子有限公司（简称：无锡矽杰微）保留关于该例程可靠性、功能和设计方面的改进作进一步说明的权利。
由于使用本例程中的信息或内容而导致的直接，间接，特别附带结果的损害，无锡矽杰微没有义务负责。
本例程中代码的应用仅仅是用来做功能演示，本公司不保证这些代码没有更深入的测试就能适用。
本例程中使用的软件，都是依据授权或保密合约所合法提供的，并且只能在这些合约的许可条件下使用或者复制。
无锡矽杰微的产品不是专门设计来应用于生命维持的用具，装置或者系统。无锡矽杰微的产品不支持而且禁止在这些方面的应用。
本例程内容如有变动恕不另作通知，具体更新信息，请参考公司官方网站www.xjmcu.com。*/
//===================================================================================//
//主频：8M/4T
//PWM-DEMO功能说明： 
//Tcc中断1ms,P64端口取反
//pwm中断100us,P65端口取反
//pwm时钟选择Fcpu
//pwm1-P62	20%占空比，周期100us (PWM1是否取反根据需要调用)
//pwm2-P61	40%占空比，周期100us
//pwm3-P60	80%占空比，周期100us
//===================================================================================//
//==============================================================================//
//头文件	运用头文件	通用寄存器定义文件
//==============================================================================//
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

#define	R_PWMDTY PDC1			// R占空比
#define	G_PWMDTY PDC2			// G占空比
#define	B_PWMDTY PDC3			// B占空比

enum{
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
unsigned short pwrkey_delay = 0;			// 电源按键按下时间
unsigned short ledkey_delay = 0;			// 灯光按键按下时间
unsigned short beep_delay = 0;			// 蜂鸣器响应时间
unsigned char shake_flag = 0;		// 振动开关
unsigned char beep_mode = 0;			// 蜂鸣器响模式
unsigned char beep_cnt = 0;			// 蜂鸣器响应次数
unsigned char led_mode = RGB_COLOR_CIR;		// 单色灯选择
unsigned char led_switch = RGB_COLOR_CIR;	// 彩灯模式
unsigned char mode_switch = 0;	// 运行模式
unsigned char color_pwm_duty = 0;		// 彩灯的占空比
unsigned char once_pwm_duty = 0;		// 单色灯的占空比
unsigned char cir_mode = 0;	// 渐亮灭标志 1：渐亮 0：渐灭
unsigned char led_cnt = 0;	// 渐亮灭计数
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
	IOCP_W(PHDCR,0xff);		//端口上下拉控制寄存器，bit7-bit4对应P67-P64下拉;bit3-bit0对应P53-P50上拉 
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
			if( beep_delay++ >= 2000 )
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
			if( beep_delay++ >= 20)
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
	if( 1 ==  SHAKE_PORT( ) )
	{
		led_switch = !led_switch;
	}
}
// 按键任务
void key_process(void)
{
	// 电源按键按下
	if( 0 == PWRKY_PORT() )
	{
		pwrkey_delay++;
	}
	else
	{
		// 消抖
		if( pwrkey_delay >= 20 )
		{
			// 短按
			if( pwrkey_delay < 3000 )
			{
				switch( mode_switch )
				{
					case ONE_GEARS:
						beep_mode = BEEP_ONE;
						beep_delay = 0;
						beep_cnt = 1;
						mode_switch = TWO_GEARS;
					break; 

					case TWO_GEARS:
						beep_mode = BEEP_TWO; 
						beep_delay = 0;
						beep_cnt = 2;
						mode_switch = ONE_GEARS;
					break;
				}
			}
			// 长按
			else if( pwrkey_delay >= 3000 )
			{
				// 关机
				NOP( );
			}
		}
		pwrkey_delay = 0;
	}

	// 灯光按键按下
	if( 0 == LEDKEY_PORT( ) )
	{
		ledkey_delay++;
	}
	else
	{
		// 消抖
		if( ledkey_delay >= 20 )
		{
			// 短按
			if( ledkey_delay < 3000 )
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
			else if( ledkey_delay >= 3000 )
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
	switch( mode_switch )
	{
		// 一档 风扇60%占空比 制冷90%占空比
		case ONE_GEARS: 
			NOP();
		break;

		// 二档 风扇80%占空比 制冷100%占空比
		case TWO_GEARS: 
			NOP();
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
		// 限位开关 1：开 0：关
		// 当限位开关关闭时，R灯一秒闪一次，制冷和风扇输出0
		if( 1 == LIMIT_PORT() )
		{
			FUN_PORT() = 0;
			COLD_PORT() = 0;
			R_PWMDTY = 100;
			G_PWMDTY = 0;
			B_PWMDTY = 100;
			// 延时1秒
			R_PWMDTY = 0;
			// 延时1秒
		}
		else if( 0 == LIMIT_PORT( ) )
		{
			// 振动开关 1：开 0：关
			// 振动开关开和关一次都会使RGB开或者直接关
			if( 0 == led_switch )
			{
				// 灯熄灭
				R_PWMDTY = 0;
				G_PWMDTY = 0;
				B_PWMDTY = 100;
			}
			else if( 1 == led_switch )
			{
				key_process( );
			}

		}
	}
}