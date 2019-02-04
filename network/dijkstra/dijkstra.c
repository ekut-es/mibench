#include <stdio.h>
#include <stdlib.h>

#define NONE                               9999

struct _NODE
{
  int iDist;
  int iPrev;
};
typedef struct _NODE NODE;

struct _QITEM
{
  int iNode;
  int iDist;
  int iPrev;
  struct _QITEM *qNext;
};
typedef struct _QITEM QITEM;

QITEM *qHead = NULL;

             
int num_nodes;             
             
//int AdjMatrix[NUM_NODES][NUM_NODES];
int** AdjMatrix;

int g_qCount = 0;

NODE* rgnNodes;

int ch;
int iPrev, iNode;
int i, iCost, iDist;


void print_path (NODE *rgnNodes, int chNode)
{
  if (rgnNodes[chNode].iPrev != NONE)
    {
      print_path(rgnNodes, rgnNodes[chNode].iPrev);
    }
  printf (" %d", chNode);
  fflush(stdout);
}


void enqueue (int iNode, int iDist, int iPrev)
{
  QITEM *qNew = (QITEM *) malloc(sizeof(QITEM));
  QITEM *qLast = qHead;
  
  if (!qNew) 
    {
      fprintf(stderr, "Out of memory.\n");
      exit(1);
    }
  qNew->iNode = iNode;
  qNew->iDist = iDist;
  qNew->iPrev = iPrev;
  qNew->qNext = NULL;
  
  if (!qLast) 
    {
      qHead = qNew;
    }
  else
    {
      while (qLast->qNext) qLast = qLast->qNext;
      qLast->qNext = qNew;
    }
  g_qCount++;
  //               ASSERT(g_qCount);
}


void dequeue (int *piNode, int *piDist, int *piPrev)
{
  QITEM *qKill = qHead;
  
  if (qHead)
    {
      //                 ASSERT(g_qCount);
      *piNode = qHead->iNode;
      *piDist = qHead->iDist;
      *piPrev = qHead->iPrev;
      qHead = qHead->qNext;
      free(qKill);
      g_qCount--;
    }
}


int qcount (void)
{
  return(g_qCount);
}

int dijkstra(int chStart, int chEnd) 
{
  

  
  for (ch = 0; ch < num_nodes; ch++)
    {
      rgnNodes[ch].iDist = NONE;
      rgnNodes[ch].iPrev = NONE;
    }

  if (chStart == chEnd) 
    {
      printf("Shortest path is 0 in cost. Just stay where you are.\n");
    }
  else
    {
      rgnNodes[chStart].iDist = 0;
      rgnNodes[chStart].iPrev = NONE;
      
      enqueue (chStart, 0, NONE);
      
     while (qcount() > 0)
	{
	  dequeue (&iNode, &iDist, &iPrev);
	  for (i = 0; i < num_nodes; i++)
	    {
	      if ((iCost = AdjMatrix[iNode][i]) != NONE)
		{
		  if ((NONE == rgnNodes[i].iDist) || 
		      (rgnNodes[i].iDist > (iCost + iDist)))
		    {
		      rgnNodes[i].iDist = iDist + iCost;
		      rgnNodes[i].iPrev = iNode;
		      enqueue (i, iDist + iCost, iNode);
		    }
		}
	    }
	}
      
      printf("Shortest path is %d in cost. ", rgnNodes[chEnd].iDist);
      printf("Path is: ");
      print_path(rgnNodes, chEnd);
      printf("\n");
    }
}

int main(int argc, char *argv[]) {
  int i,j,k;
  FILE *fp;
  
  if (argc<3) {
    fprintf(stderr, "Usage: dijkstra <NUM_NODES> <INPUT_FILE>\n");
    //fprintf(stderr, "Only supports matrix size is #define'd.\n");
  }

  num_nodes = atoi(argv[1]);

    rgnNodes = (NODE*) malloc(num_nodes*sizeof(NODE));

    AdjMatrix = (int**) malloc(num_nodes*sizeof(int*));

    for(i = 0; i < num_nodes; i++) {
        AdjMatrix[i] = (int*) malloc(num_nodes*sizeof(int));
    }

  /* open the adjacency matrix file */
  fp = fopen (argv[2],"r");

  /* make a fully connected matrix */
  for (i=0;i<num_nodes;i++) {
    for (j=0;j<num_nodes;j++) {
      /* make it more sparce */
      fscanf(fp,"%d",&k);
			AdjMatrix[i][j]= k;
    }
  }

  /* finds 10 shortest paths between nodes */
  for (i=0,j=num_nodes/2;i<20;i++,j++) {
		j=j%num_nodes;
      dijkstra(i,j);
  }

  free(rgnNodes);

  for(i = 0; i < num_nodes; i++) {
      free(AdjMatrix[i]);
  }

  free(AdjMatrix);

  exit(0);

}
