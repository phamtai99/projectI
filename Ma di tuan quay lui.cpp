#include <stdio.h>
#include <conio.h>

int **a;
int x, y, n,d;
int row[8] = { -2, -1, 1, 2, 2, 1, -1, -2 };
int col[8] = { 1, 2, 2, 1, -1, -2, -2, -1 };
//int row[8]={2,2,1,-1,1,-1,2,2};
//int col[8]={1,-1,2,2,-2,-2,1,-1};
void init(){
    printf( "Nhap vao kich thuoc ban co  ");
    scanf("%d",&n);
    printf("Nhap vao vi tri bat dau  (x & y): ");
    scanf("%d %d",&x,&y);
    
    a = new int*[n];
    for(int i=0; i<n; i++){
        a[i] = new int[n];
        for(int j=0; j<n; j++)
            a[i][j] = 0;
    }
    	a[y][x] = 1;// danh dau da di 
}
void HienThi(){
	d++;
	printf("\n Cach xep %d là:",d);
	printf("\n");
	 
//    for(int i=0;i<n;i++) printf("______"); 
//	printf("\n");
//	
//	for(int i=0; i<n; i++)
//	{
//		for(int j=0; j<n; j++){
//			printf("|     ");
//		}
//		printf("|\n");
//		
//		for(int j=0; j<n; j++)
//			if(a[i][j]<10)
//			   printf("| %d   ",a[i][j]);
//			else printf("| %d  ",a[i][j]);
//		
//			   	
//		printf("|\n");
//		
//		for(int j=0 ;j<n; j++){
//			printf("|_____");
//		}
//		printf("|\n");
//		
//	}  
//	if(d%20==0) getch();	  
//		
   
	}

void backTrack(int step){
   
    for(int i=0; i<8; i++) {
        x += row[i];// tao 1 vi tri x moi 
        y += col[i];// tao mot vi tri y moi
        // neu hop le thi tien hanh di chuyen
        if( x<n && y<n && x>=0 && y>=0 )
            if( a[y][x] == 0 ) {
                a[y][x] = step+1;
                if( step == n*n-1 )
                    HienThi();
                else backTrack(step+1);
                a[y][x] = 0;
            }
        // neu ko hop le thi phai tra lai gia tri ban dau 
        x -= row[i];
        y -= col[i];
    }
}

int main(){
    init();
    backTrack(1);
    getch();
    return 0;
}
