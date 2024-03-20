#define NOSYSTEM system/**
 * @file myshell.c 
 * @brief written in system programming course 
 * for education purposes,
 * @version 0.1
 * @date 2024-03-15
 * @author adaskin
 * 
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
int readusrin(char *buf) {
    int r = read(0, buf, 256);
    if (r <= 0) {
        //write(1, &"lutfen deger giriniz", 24);
        exit(-1);
    } else {
    }
    return -1;
}
int tokenize(char *str, char *tokens[], int maxtoken) {
    char *delim = "\t \n";
    char *token = strtok(str, delim);
    tokens[0] = NULL;
    int i = 0;
    while (token != NULL) {
        tokens[i] = token;
        /*TODO: tokens[i][0] == '\"' ise, 
        ikinci '"' bularak arasini token olarak al*/
        printf("%d.token: %s\n", i, tokens[i]);
        i++;
        token = strtok(NULL, delim);
    }
    tokens[i] = NULL;
    return i;
}
void printchars(char *str) {
    for (int c = 0; c < strlen(str); c++) {
        printf("%c-", str[c]);
    }
}
int addpathname(char *dest, char *str) {
    char path[128] = "/usr/bin/";
    strncpy(dest, path, strlen(path) + 1);
    strncat(dest, str, strlen(str));
    return 0;
}
int main(int argc, char *argv[]) {
    char c = '$';
    char usrin[256] = {0};
    char path[128] = {0};
    /*TODO: */
    char *newargv[10];
    int shouldrun = 1;
    while (shouldrun == 1) {
        write(1, &c, 1);
        int r = read(0, &usrin, 256);
        if (r <= 1) {
            //exit(1);
            continue; /*bir sonraki dongu*/
        }
        usrin[r - 1] = '\0';  //\n -> \0
        if(strncmp(usrin, "exit", 4) == 0){
            exit(0);
            shouldrun = 0;
        }
        tokenize(usrin, newargv, 10);

        /*add path name, e.g. /usr/bin/*/
        addpathname(path, newargv[0]);
        // char *test[] = {"vim", "example.txt", NULL};
        
        int re = execv(path, newargv);
        if (re == -1) {
            printf("command not found\n");
            
            exit(0);
        }
        
    }
    return 0;
}