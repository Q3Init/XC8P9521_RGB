//*******************************************��������*******************************************//
/*��������΢�������޹�˾����ƣ���������΢���������ڸ����̿ɿ��ԡ����ܺ���Ʒ���ĸĽ�����һ��˵����Ȩ����
����ʹ�ñ������е���Ϣ�����ݶ����µ�ֱ�ӣ���ӣ��ر𸽴�������𺦣���������΢û��������
�������д����Ӧ�ý�����������������ʾ������˾����֤��Щ����û�и�����Ĳ��Ծ������á�
��������ʹ�õ����������������Ȩ���ܺ�Լ���Ϸ��ṩ�ģ�����ֻ������Щ��Լ�����������ʹ�û��߸��ơ�
��������΢�Ĳ�Ʒ����ר�������Ӧ��������ά�ֵ��þߣ�װ�û���ϵͳ����������΢�Ĳ�Ʒ��֧�ֶ��ҽ�ֹ����Щ�����Ӧ�á�
�������������б䶯ˡ������֪ͨ�����������Ϣ����ο���˾�ٷ���վwww.xjmcu.com��*/
//===================================================================================//
//��Ƶ��8M/4T
//PWM-DEMO����˵���� 
//Tcc�ж�1ms,P64�˿�ȡ��
//pwm�ж�100us,P65�˿�ȡ��
//pwmʱ��ѡ��Fcpu
//pwm1-P62	20%ռ�ձȣ�����100us (PWM1�Ƿ�ȡ��������Ҫ����)
//pwm2-P61	40%ռ�ձȣ�����100us
//pwm3-P60	80%ռ�ձȣ�����100us
//===================================================================================//
//==============================================================================//
//ͷ�ļ�	����ͷ�ļ�	ͨ�üĴ��������ļ�
//==============================================================================//
#include "XC8P9521.h"
#include "XJ_9521Define.h"

// ��������
void delayUs(unsigned char Time);
void delayMs(unsigned char Time);
void key_process(void);
void rgb_process(void);
void output_process(void);
void beep_process(void);
void shake_process(void);

// �궨������
#define SHAKE_PORT() PORT5_0	// �񶯿���
#define LEDKEY_PORT() PORT5_1	// LED�ư���
#define PWRKY_PORT() PORT5_2    // ��Դ����
#define LIMIT_PORT() PORT5_3	// ��λ����

#define	BEEP_PORT() PORT6_5		// ���������
#define	FUN_PORT() PORT6_6		// �������
#define	COLD_PORT() PORT6_7		// �������

#define	R_PWMDTY PDC1			// Rռ�ձ�
#define	G_PWMDTY PDC2			// Gռ�ձ�
#define	B_PWMDTY PDC3			// Bռ�ձ�

enum{
	ONE_GEARS,// 1��
	TWO_GEARS,// 2��
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
// ȫ�ֱ�������
unsigned short pwrkey_delay = 0;			// ��Դ��������ʱ��
unsigned short ledkey_delay = 0;			// �ƹⰴ������ʱ��
unsigned short beep_delay = 0;			// ��������Ӧʱ��
unsigned char shake_flag = 0;		// �񶯿���
unsigned char beep_mode = 0;			// ��������ģʽ
unsigned char beep_cnt = 0;			// ��������Ӧ����
unsigned char led_mode = RGB_COLOR_CIR;		// ��ɫ��ѡ��
unsigned char led_switch = RGB_COLOR_CIR;	// �ʵ�ģʽ
unsigned char mode_switch = 0;	// ����ģʽ
unsigned char color_pwm_duty = 0;		// �ʵƵ�ռ�ձ�
unsigned char once_pwm_duty = 0;		// ��ɫ�Ƶ�ռ�ձ�
unsigned char cir_mode = 0;	// �������־ 1������ 0������
unsigned char led_cnt = 0;	// ���������
//===================================//
//void file_clrRam(void);
//void file_init(void);
//void file_project_init(void);
//===================================//
//��ʼ��RAM:10H~3FH
//===================================//
void file_clrRam()
{
	for(RSR=0xD0;RSR<0xFF;RSR++)	//���� BANK0 RAM  IAR-R0,RSR-R4
									//RSR�ĸ���λĬ��ֻ��Ϊ1					
	{IAR = 0;}
	 IAR = 0;
}
//===================================//
//�˿ڳ�ʼ��
//===================================//
void file_init(void)
{	
	CONTW(0x02);			//TCC 8��Ƶ
	TCC = 6;				//1/2 * 8 * (256-6) = 1000us	��ʽ��1/IRCƵ�� * Ԥ��Ƶ * ��256-��ֵ��
	PORT5 = 0;				//
	PORT6 = 0;				//
	IOCP_W(P5CR,0x0F);		// 50 51 52 53 ��Ϊ����
	IOCP_W(P6CR,0x00);		// 65 66 67 ���
	IOCP_W(PHDCR,0xff);		//�˿����������ƼĴ�����bit7-bit4��ӦP67-P64����;bit3-bit0��ӦP53-P50���� 
	IOCP_W(PDCR,0xff);		//�˿��������ƼĴ�����  bit6-bit4��ӦP62-P60,bit3-bit0��ӦP53-P50
	IOCP_W(PHCR,0xff);		//P6�˿��������ƼĴ���  bit7-bit0��ӦP67-P60
	IOCP_W(WDTCR,0x00);		//WDT ʹ�ܿ��ƼĴ���	IOCP_W(IMR,0x01);		//�ж�ʹ�ܿ��ƼĴ��� 
	ISR = 0x0;				//��TC0�жϱ�־λ 
}
//===================================//
//TC0��ʼ��
//===================================//
void file_project_init(void)
{	
//---------------------------------
//PWM���ã�3·pwm�ǹ����ڵ�
//---------------------------------
//file_pwm_set:   
	IOCP_W(IMR,0x09);		//TCC+PWM�����ж�,������Ҫ����	
	PWMCON = 0xf8;			//ʹ��3·pwm�����pwm=1/8*2(��Ƶ)*4clock*100=100us
	PRD = 100;				//PWM���ڼĴ���
}
//===================================//
//�жϷ������
//===================================//
void int_isr(void) __interrupt 
{    	
	__asm__("org 0x08");			//�ж���ڵ�ַ			
	PUSH(_A_BUFF,_R3_BUFF);			//�ж���ջ����
//=========Tcc�жϳ���===============//
	if(TCIF)					//�ж�TCIF�Ƿ�Ϊ1
	{
		TCC	  += 6;			//1/2 * 8 * (256-6) = 1000us	��ʽ��1/IRCƵ�� * Ԥ��Ƶ * ��256-��ֵ��
		ISR    = 0xfe;				//��TC0�жϱ�־λ
	}	 
//======== PWM�����жϳ���===============//
	if(T1IF)					//�ж�T1IF�Ƿ�Ϊ1,pwm�����ж�
	{	 
		ISR    = 0xf7;				//ISR��bit3:T1IF����
	}

	POP(_A_BUFF,_R3_BUFF);			//�жϳ�ջ�����ָ�
}

// ����������
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
// ��������
void key_process(void)
{
	// ��Դ��������
	if( 0 == PWRKY_PORT() )
	{
		pwrkey_delay++;
	}
	else
	{
		// ����
		if( pwrkey_delay >= 20 )
		{
			// �̰�
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
			// ����
			else if( pwrkey_delay >= 3000 )
			{
				// �ػ�
				NOP( );
			}
		}
		pwrkey_delay = 0;
	}

	// �ƹⰴ������
	if( 0 == LEDKEY_PORT( ) )
	{
		ledkey_delay++;
	}
	else
	{
		// ����
		if( ledkey_delay >= 20 )
		{
			// �̰�
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
			// ����
			else if( ledkey_delay >= 3000 )
			{
				led_mode = RGB_ONE_NONE;
			}
		}	
		ledkey_delay = 0;
	}
}

// �ɵ�����
void rgb_process(void)
{
	// ����������
	if( led_cnt == 20 )
	{
		led_cnt = 0;
		cir_mode = !cir_mode;
	}
	switch( led_switch )
	{
		// �߲�ѭ������
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

		// ��ɫѭ������
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
		// ��ɫ����
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

// ����ͷ��ȿ�������
void output_process(void)
{
	switch( mode_switch )
	{
		// һ�� ����60%ռ�ձ� ����90%ռ�ձ�
		case ONE_GEARS: 
			NOP();
		break;

		// ���� ����80%ռ�ձ� ����100%ռ�ձ�
		case TWO_GEARS: 
			NOP();
		break;
	}
}
//===================================//
//MAIN������
//===================================//
void main()
{
	file_clrRam();					//��RAM
	file_init();					//io�Ĵ�����ʼ��
	file_project_init();			//�������蹦������
	EI();							//�����ж�
	while(1)
	{
		// ��λ���� 1���� 0����
		// ����λ���عر�ʱ��R��һ����һ�Σ�����ͷ������0
		if( 1 == LIMIT_PORT() )
		{
			FUN_PORT() = 0;
			COLD_PORT() = 0;
			R_PWMDTY = 100;
			G_PWMDTY = 0;
			B_PWMDTY = 100;
			// ��ʱ1��
			R_PWMDTY = 0;
			// ��ʱ1��
		}
		else if( 0 == LIMIT_PORT( ) )
		{
			// �񶯿��� 1���� 0����
			// �񶯿��ؿ��͹�һ�ζ���ʹRGB������ֱ�ӹ�
			if( 0 == led_switch )
			{
				// ��Ϩ��
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