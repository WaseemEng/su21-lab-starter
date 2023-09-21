#include <stdio.h>
#include <stddef.h>

// Define the node structure
typedef struct Node {
    int data;
    struct Node* next;
} node;

int ll_has_cycle(node* head) {
    if (head == NULL) {
        return 0; // The list is empty, so no cycle
    }

    node* fast_ptr = head;
    node* slow_ptr = head;

    while (fast_ptr != NULL && fast_ptr->next != NULL) {
        fast_ptr = fast_ptr->next->next;
        slow_ptr = slow_ptr->next;

        if (fast_ptr == slow_ptr) {
            return 1; // Cycle detected
        }
    }./test_ll_cycle

    return 0; // No cycle found
}
