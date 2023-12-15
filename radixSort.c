#include <stdio.h>

int main()
{
    int arr[] = {67, 24, 847, 12, 45}; // 12,24,45,67,847
    int size = sizeof(arr) / sizeof(int);
    int highestNum = arr[0];
    for (int i = 1; i < size; i++)
    {
        if (arr[i] > highestNum)
        {
            highestNum = arr[i];
        }
    }
    printf("%d", highestNum);
    int digitCount = 0;
    int numberrr = 4567;
    while (numberrr > 0)
    {
        numberrr = numberrr / 10;
        digitCount++;
    }

    for (int j = 0; j < count; j++)
    {
    }

    printf("\n\n\n%d", digitCount);
    return 1;
}