void printf(char *str)
{
    unsigned short *VideoMemory = (unsigned short *)0xb8000;

    for (int i = 0; str[i] != '\0'; ++i)
    {
        VideoMemory[i] = (VideoMemory[i] & 0xFF00) | str[i];
    }
}

int main(void *multiboot_structure, unsigned int magicnumber)
{
    printf("Hello world on my OS");

    while (1)
        ;

    return 0;
}