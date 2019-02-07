#include <stdlib.h>
#include <stdio.h>
#include <string.h>


struct myStringStruct {
  char qstring[128];
};

int compare(const void *elem1, const void *elem2)
{
  int result;
  
  result = strcmp((*((struct myStringStruct *)elem1)).qstring, (*((struct myStringStruct *)elem2)).qstring);

  return (result < 0) ? 1 : ((result == 0) ? 0 : -1);
}


int
main(int argc, char *argv[]) {
  struct myStringStruct *array;
  FILE *fp;
  int i,count=0;
  int size;
  
  if (argc<3) {
    fprintf(stderr,"Usage: qsort_small <size> <file>\n");
    exit(-1);
  }
  else {

    size = atoi(argv[1]);
    fp = fopen(argv[2],"r");
   
   array = (struct myStringStruct*) malloc(size*sizeof(struct myStringStruct));

    while((fscanf(fp, "%s", &array[count].qstring) == 1) && (count < size)) {
	 count++;
    }
  }
  printf("\nSorting %d elements.\n\n",count);
  qsort(array,count,sizeof(struct myStringStruct),compare);
  
  for(i=0;i<count;i++)
    printf("%s\n", array[i].qstring);

  free(array);
  return 0;
}
