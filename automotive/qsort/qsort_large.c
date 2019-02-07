#include <stdlib.h>
#include <stdio.h>
#include <math.h>


struct my3DVertexStruct {
  int x, y, z;
  double distance;
};

int compare(const void *elem1, const void *elem2)
{
  /* D = [(x1 - x2)^2 + (y1 - y2)^2 + (z1 - z2)^2]^(1/2) */
  /* sort based on distances from the origin... */

  double distance1, distance2;

  distance1 = (*((struct my3DVertexStruct *)elem1)).distance;
  distance2 = (*((struct my3DVertexStruct *)elem2)).distance;

  return (distance1 > distance2) ? 1 : ((distance1 == distance2) ? 0 : -1);
}


int
main(int argc, char *argv[]) {
  struct my3DVertexStruct* array;
  int size;
  FILE *fp;
  int i,count=0;
  int x, y, z;
  
  if (argc<3) {
    fprintf(stderr,"Usage: qsort_large <size> <file>\n");
    exit(-1);
  }
  else {
    size = atoi(argv[1]);
    array = (struct my3DVertexStruct*) malloc(size*sizeof(struct my3DVertexStruct));
    fp = fopen(argv[2],"r");
    
    while((fscanf(fp, "%d", &x) == 1) && (fscanf(fp, "%d", &y) == 1) && (fscanf(fp, "%d", &z) == 1) &&  (count < size)) {
	 array[count].x = x;
	 array[count].y = y;
	 array[count].z = z;
	 array[count].distance = sqrt(pow(x, 2) + pow(y, 2) + pow(z, 2));
	 count++;
    }
  }
  printf("\nSorting %d vectors based on distance from the origin.\n\n",count);
  qsort(array,count,sizeof(struct my3DVertexStruct),compare);
  
  for(i=0;i<count;i++)
    printf("%d %d %d\n", array[i].x, array[i].y, array[i].z);

  free(array);
  return 0;
}
