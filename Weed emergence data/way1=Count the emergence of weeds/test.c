#include<stdio.h>

int main(void)
{
    printf("hello\r\n");
}

unsigned short ModBusCRC(unsigned char *buf, unsigned int lenth)
{
    int i, j;
    unsigned short crc;
    for (i = 0, crc = 0xffff; i < lenth; i++)
    {
        crc ^= buf[i];
        //printf("%0X ",buf[i]);
        for (j = 0; j < 8; j++)
        {
            if (crc & 0x01)
                crc = (crc >> 1) ^ POLY;
            else
                crc >>= 1;
        }
    }
    return crc;
}