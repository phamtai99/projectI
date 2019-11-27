#include <iostream>
#include <iomanip>
#include <fstream>

using namespace std;
#include <string.h>
#include <conio.h>

#define MAX 20

int cost[MAX][MAX], n;
int chuaxet[MAX], x[MAX], chiphi = 0;
int a[MAX][MAX], mincost = 0, size;

void printResult()
{
    cout << "\n chi phi toi uu : " << mincost << endl;
 	 cout << "\n Co " << size << " duong di toi uu: \n";

    for(int i=0; i<size; i++){
        for(int j=0; j<n; j++)
            cout << a[i][j]+1 << " -> ";
        cout << a[i][0] +1<< endl;
    }
}

void Tinh() {
    chiphi += cost[x[0]][x[n-1]];

    if(chiphi == mincost){
        memcpy(a[size++], x, n*sizeof(int));
    } 
	else if(chiphi > mincost){
        memcpy(a[0], x, n*sizeof(int));
        mincost = chiphi;
        size = 1;
    }
    chiphi -= cost[x[0]][x[n-1]];
}

int Tim(int i ){
	
    for(int j = 1; j<n; j++){
        if( chuaxet[j])
		{
            x[i] = j;
            chiphi += cost[j][x[i-1]];
            chuaxet[j] = false;
            if( i == n-1 ) Tinh();
            else Tim(i+1);
            chiphi -= cost[j][x[i-1]];
            chuaxet[j] = true;
        }
    }
}

void init(){
    ifstream file("data.txt", ios::in);
    file >> n;
    for(int i = 0; i<n; i++){
        chuaxet[i] = true;
        cout << endl ;
        for(int j = 0; j<n; j++){
            file >> cost[i][j];
            cout << setw(4) << cost[i][j];
        }
    }
    cout << endl;
}

int main() {
    init();
    Tim(1);
    printResult();
    getch();
    return 0;
}
