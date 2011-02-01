/*
    Christian Reyes

    Modified version of`
	lab-02 Starter Code By Kun Qian (edited by hoffman 9/6/'09) changed 50000 to 30000
*/


#include <time.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h> /* toupper() function and others */

#define MAX_WORDLEN 30
#define MAX_WORDS   30000 /* Don't change this or you might overflow your allotted stack space. */
#define true 1
#define false 0

/* Use the following Macros to print EVERYTHING while executing the menu function */

/* Menu print */
#define printMenu() printf("Choose: 'P'rint, 'S'earch, 'I'nsert, 'R'emove, 'C'ount, 'Q'uit :\n")
#define optP() printf("You chose to 'P'rint:\n")
#define optS() printf("Enter word to 'S'earch:\n")
#define optI() printf("Enter word to 'I'nsert:\n")
#define optR() printf("Enter word to 'R'emove:\n")
#define optC() printf("You chose to 'C'ount:\n")
#define optQ() printf("You chose to 'Q'uit:\n")

/* Insert print */
#define printInserted(word) printf("%s was successfully inserted.\n", word)
#define printFailedToInsert(word) printf("Duplicate found, %s was not inserted.\n", word)

/* Remove print */
#define printRemove(word) printf("%s was successfully removed.\n", word)
#define printFailedToRemove(word) printf("%s cannot be found, and was not removed.\n", word)

/* Search print */
#define printFound(word) printf("%s was successfully found.\n", word)
#define printNotFound(word) printf("%s was not found.\n", word)

/* Count print */
#define printCount(count) printf("%d words currently in the dictionary.\n", count)

/* Other than the printf calls above in the macros, and the ones we put into main,
	you should not call printf anywhere else.

	You DO need fprintf in your printDictionary
*/

/* prototypes */

void loadDictionary( char *infilename, char dictionary[][MAX_WORDLEN], int *    count );
void doMenu( char *outfileName, char dictionary[MAX_WORDS][MAX_WORDLEN], int     *count);
void printDictionary (char dictionary[][MAX_WORDLEN], int count, FILE *stream );
void removeNewLine (char *word);
void insertWord (char dictionary[][MAX_WORDLEN], int *count, char *word );
void swapStrings (char *begA, char *begB);
int  indexOfWord ( char dictionary[][MAX_WORDLEN],const  char *word, int low, int high);
void removeWord (char dictionary[][MAX_WORDLEN], int *count, char *word );

/*    m a i n   f u n c t i o n  */

int main( int argc, char *argv[] )
{
	time_t startTime, stopTime;
	clock_t startCPU, stopCPU;
	double elapsedCPUsecs;

	char dictionary[MAX_WORDS][MAX_WORDLEN]={{'\0'}};
	int count=0;

	if (argc < 3 )
	{
		printf("usage: ./%s <infilename> <outfilename>\n",argv[0]); /* you gotta put in & out file names on cmd line! */
		exit(EXIT_FAILURE);
	}

    startTime = time(NULL);
	printf("\nstarting load of %s at %s", argv[1], ctime( &startTime) );
	startCPU = clock();
	loadDictionary( argv[1], dictionary, &count);
	stopCPU = clock();
	stopTime = time(NULL);
	
    printf("Finished load of %s at %s", argv[1], ctime( &stopTime) );
	elapsedCPUsecs = ((double)(stopCPU-startCPU)) / CLOCKS_PER_SEC;
	printf("Elapsed CPU seconds: %f\n",  elapsedCPUsecs );
 
    printCount(count);

	doMenu( argv[2],  dictionary, &count);
	return EXIT_SUCCESS; /* exit_success defined as 0 in stdlib.h */
}

void loadDictionary( char *infilename, char dictionary[][MAX_WORDLEN], int *count )
{
    FILE *infile;

    char wordBuffer[MAX_WORDLEN];

    infile = fopen(infilename, "rt");
    if( infile == NULL)
    {
        printf("Can't open %s for input\n", infilename);
        exit(EXIT_FAILURE);
    }
    
    while(fgets(wordBuffer, MAX_WORDLEN, infile))
    {
        removeNewLine(wordBuffer);
      /*  
        printf("===========BEFORE===========\n");        
        printDictionary(dictionary, *count, stdout);
        printf("============================\n");
*/
        insertWord(dictionary,count,wordBuffer);
        
       /* printf("===========AFTER===========\n");        
        printDictionary(dictionary, *count, stdout);
        printf("============================\n");
        */
    }
    
    fclose(infile);
}

void removeNewLine(char *word)
{
    char *newLine  = strchr(word, '\n');
    if(newLine)
        word[newLine - word] = '\0';
}

void doMenu( char *outfileName, char dictionary[MAX_WORDS][MAX_WORDLEN], int *count)
{
    char ch;
    FILE *out;
    char in[MAX_WORDLEN];
    printMenu();
    while(scanf("%c%*[^\n]", &ch)<0);
    getchar();
    ch = toupper(ch);

    switch ( ch )
    {
        case 'P':
            optP();
            printDictionary(dictionary,*count,stdout);
            break;
        case 'S':
            optS();
            while(!fgets(in,MAX_WORDLEN,stdin));
            removeNewLine(in);
            if(indexOfWord(dictionary,in,0,*count)!=-1)
            {
                printFound(in);
            }
            else
            {
                printNotFound(in);
            }
            break;
        case 'I':
            optI();
            while(!fgets(in,MAX_WORDLEN,stdin));
            removeNewLine(in);
            if(indexOfWord(dictionary,in,0,*count)==-1)
            {
                printInserted(in);
                insertWord(dictionary,count,in);
            }
            else
            {
                printFailedToInsert(in);
            }
            break;
        case 'R':
            optR();
            while(!fgets(in,MAX_WORDLEN,stdin));
            removeNewLine(in);
            removeWord(dictionary,count,in);
            break;
        case 'C':
            optC();
            printCount(*count);
            break;
        case 'Q':
            optQ();
            out = fopen(outfileName,"wt");
            printDictionary(dictionary,*count,out);
            fclose(out);
            exit(EXIT_SUCCESS);
            break;
    }

    doMenu( outfileName,dictionary,count);
}

/* From the menu this gets called everytime the user selects 'P'rint. In this case you just pass in stdout
    for the stream arg.  If the user type 'Q'uit then you must first open up the output file and pass in the
    file handle.  Be sure to close that file as soon as this function is done. */

void printDictionary( char dictionary[][MAX_WORDLEN], int count, FILE *stream )
{
    int i;
    int currLen;
    int width=0;

    if( !stream )
    {
        printf("Cannot open file for output\n");
        exit(EXIT_FAILURE);
    }

    for(i=0;i<count;i++)
    {
        currLen = strlen(dictionary[i]);

        if(width == 0)
        {
            fprintf(stream,"%s",dictionary[i]);
            width += currLen;
        }
        else if (width + 1 + currLen <= 80)
        {
            fprintf(stream," %s",dictionary[i]);
            width += (1 + currLen);
        }
        else
        {
            fprintf(stream,"\n%s",dictionary[i]);
            width = currLen;
        }
    }
    if(count>0)
    {
        fprintf(stream,"\n");
    }
}

void insertWord( char dictionary[][MAX_WORDLEN], int *count, char *word )
{
    char temp[MAX_WORDLEN];
    char *t = temp;
    int j;
    int i=0;

    if(*count>0)
    {
        while(i<*count && strcmp(word,dictionary[i])>0)
        {
            i++;
        }
        if(i == *count)
        {
            swapStrings(*(dictionary+i), word);
        }
        else
        {
            t = *(dictionary + i);
            swapStrings(*(dictionary + i),word);
            
            for(j = i; j < *count ; j++)
            {
                swapStrings(*(dictionary + j + 1), t);
            }
        }
    }
    else
    {
        swapStrings(*dictionary, word);
    }

    *count+=1;
}

void swapStrings(char *begA, char *begB)
{
    char *t;
    t = begA;
    *begA = *begB;
    begB = t;
}

int indexOfWord( char dictionary[][MAX_WORDLEN], const char *word, int low,     int high)
{
    int mid;
    int comp;

    if(high < low)
    {
        return -1;
    }
    mid = low + (high - low) / 2;
    comp = strcmp(word, dictionary[mid]);
    if(comp < 0)
    {
        return indexOfWord( dictionary, word, low, mid-1);
    }
    else if (comp > 0)
    {
        return indexOfWord( dictionary, word, mid+1,high);
    }
    else
    {
        return mid;
    }

}

void removeWord( char dictionary[][MAX_WORDLEN], int *count, char *word )
{
    int j;
    int index = indexOfWord(dictionary,word,0,*count);

    if(index == -1)
    {
        printFailedToRemove(word);
    }
    else
    {   
        for(j=index;j<*count-1;j++)
        {
            swapStrings(dictionary[j],dictionary[j+1]);
        }
        *count -=1;

        printRemove(word);
    }
}
