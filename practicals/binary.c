#include <stdio.h>

int binarySearch(int arr[], int size, int element)
{
    // int low = 0;
    // int high = size - 1;
    // while (low <= high)
    // {
    //     int mid = (low + high) / 2;
    //     if (arr[mid] == element)
    //     {
    //         return mid;
    //     }
    //     else if (arr[mid] < element)
    //     {
    //         low = mid + 1;
    //     }
    //     else if (arr[mid] > element)
    //     {
    //         high = mid - 1;
    //     }
    // }
    // return -1;

    int low = 0;
    int high = size - 1;
    while (low <= high)
    {
        int mid = (low + high) / 2;
        if (arr[mid] == element)
        {
            return mid;
        }
        else if (arr[mid] < element)
        {
            low = mid + 1;
        }
        else
        {
            high = mid - 1;
        }
    }
}

int main()
{
    int arr[] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
    int size = sizeof(arr) / sizeof(int);
    int element = 7;
    int result = binarySearch(arr, size, element);
    printf("The element %d is found at %d", element, result);
}