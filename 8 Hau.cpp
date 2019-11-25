#include<stdio.h>
#include<conio.h>
#include<math.h>

int a[20];
int d;
int n;

void Nhap(int &n)
{
	printf(" Nhap vao kich thuoc ban co :");
	scanf("%d",&n);
	if(n<4 || n>10){
		printf(" Khong hop le !Hay nhap lai");
	}
}

int Check(int x, int y){
	for(int i=1;i<x;i++)
	// a[i] =y de kiem tra xem quan hau nay co nam cung cot voi quan hau truoc do 
	//abs(i-x)==abs(a[i]-y) de kiem tra xem quan hau nay co nam tren duong cheo cac  quan hau truoc do ko
		if( a[i]==y || abs(i-x)==abs(a[i]-y))
			return 0;
		
	return 1; 	

	}
	
void Xuatkq(int n){
	d++;
	printf("\n Cach xep %1d là:",d);
	printf("\n");
	 
    for(int i=1;i<=n;i++) printf("______"); 
	printf("\n");
	
	for(int i=1; i<=n; i++)
	{
		for(int j=1; j<=n; j++){
			printf("|     ");
		}
		printf("|\n");
		
		for(int j=1; j<=n; j++)
			if(a[i]==j)
			   printf("|  Q  ");
			else 
			   printf("|     ");
			   	
		printf("|\n");
		
		for(int j=1 ;j<=n; j++){
			printf("|_____");
		}
		printf("|\n");
		
	}  
		  
		
   printf("\n\n\n");
   if(d%20==0) getch();	
	}


void TimKiem(int i,int n){
	for(int j=1;j<=n;j++){
		// thu dat qua  hau vao cac cot tu 1 den n
		if(Check(i,j)){
		// nau cach dat nay thoa man thi luu lai vi tri 	
			a[i]=j;
			if(i==n) Xuatkq(n); // dat xong quan hau thu n thi in kq
			TimKiem(i+1,n);
			}
		}
	
	}
int main(){
	Nhap(n);
	TimKiem(1,n);
	getch();
	
	}
