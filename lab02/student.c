#include <stdio.h>
#include <string.h>

//  a struct named "Student" to store student information
struct Student {
    char name[50];
    int ID;
    int age;
};

// Function to print student informatio
void printStudent(struct Student student) {
    printf("Name is  %s\n", student.name);
    printf("ID is    %d\n", student.ID);
    printf("Age is   %d\n", student.age);
}

int main() {
     struct Student s1;
    strcpy(s1.name, "Waseem_Abbas");
    s1.ID = 5;   // Note: I corrected "s1->id" to "s1.ID"
    s1.age = 23;
    printStudent(s1); // Note: I corrected "student" to "s1"
    return 0;
}


