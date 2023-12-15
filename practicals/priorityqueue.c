#include <stdio.h>
#define MAX_SIZE 5

int queue[MAX_SIZE];
int priorities[MAX_SIZE];
int rear = -1;

void enqueue(int data, int priority)
{
    if (rear >= MAX_SIZE - 1)
    {
        printf("Queue is full. Cannot enqueue.\n");
        return;
    }

    int i;
    for (i = rear; i >= 0 && priority < priorities[i]; i--)
    {
        queue[i + 1] = queue[i];
        priorities[i + 1] = priorities[i];
    }

    queue[i + 1] = data;
    priorities[i + 1] = priority;
    rear++;
}

void dequeue()
{
    if (rear == -1)
    {
        printf("Queue is empty. Cannot dequeue.\n");
        return;
    }

    printf("Dequeued element: %d with priority %d\n", queue[rear], priorities[rear]);
    rear--;
}

void display()
{
    if (rear == -1)
    {
        printf("Queue is empty. Nothing to display.\n");
        return;
    }

    printf("Priority Queue elements:\n");
    for (int i = 0; i <= rear; i++)
    {
        printf("Data: %d, Priority: %d\n", queue[i], priorities[i]);
    }
}

int main()
{
    int choice, data, priority;

    do
    {
        printf("\nPriority Queue Operations:");
        printf("\n1. Enqueue");
        printf("\n2. Dequeue");
        printf("\n3. Display");
        printf("\n4. Exit");
        printf("\nEnter your choice: ");
        scanf("%d", &choice);

        switch (choice)
        {
        case 1:
            printf("Enter data and priority to enqueue: ");
            scanf("%d %d", &data, &priority);
            enqueue(data, priority);
            break;

        case 2:
            dequeue();
            break;

        case 3:
            display();
            break;

        case 4:
            printf("Exiting program.\n");
            break;

        default:
            printf("Invalid choice! Please enter a valid option.\n");
        }
    } while (choice != 4);

    return 0;
}
