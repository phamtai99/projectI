#include <iostream>
#include <iomanip>
#include <fstream>

using namespace std;
#include <string.h>
#include <conio.h>

#define MAX 20

int cost[MAX][MAX], n;
int x[MAX];
int a[MAX][MAX], mincost = 100000, size;

void printResult()
{
     cout << "\n chi phi toi uu : " << mincost << endl;
 	 cout << "\n Co " << size << "  duong di toi uu: \n";

    for(int i=0; i<size; i++){
        for(int j=0; j<n; j++)
            cout << a[i][j]+1 << " -> ";
        cout << endl;
    }
}

void swap(int &a, int &b) {
	int temp = a;
    a = b;
    b = temp;
}

int Sinhhoanvi(int p[], int n) {
    int j, k;
    j = n - 2;// j la vi tri doan cuoi giam dan 
    //tim vi tri dau tien ma doan cuoi giam dan 
    while (p[j] > p[j + 1]){
        if (j == 0)
            return 0;
        j--;
    }
    k = n - 1;
    while (p[j] > p[k]) k--;//tim so p[k] nho nhat trong doan giam dan
    swap(p[j], p[k]);

    for(k = n-1, j++; j<k; j++, k--)//dao nguoc doan cuoi giam dan thanh tang dan 
        swap(p[j], p[k]);
    return 1;
}

int Tinh(){
    int c = 0;
    for(int i = 1; i<n; i++)
        c+=cost[x[i]][x[i-1]];
    return c;
}

void generate(int start)
{
    x[0] = start ;
    int di = 0;
    for (int i = 1; i < n; i++, di++)
    {
        if (di == start)
            di++;

        x[i] = di;
    }
    do
    {
        int c = Tinh();
        if (c == mincost)
        {
            memcpy(a[size++], x, n*sizeof(int));
        }
        else if (c < mincost)
        {
            memcpy(a[0], x, n*sizeof(int));
            mincost = c;
            size = 1;
        }
    } while (Sinhhoanvi(x + 1, n -1));
}

void init(){
	
    ifstream file("data.txt", ios::in);
    file >> n;
//    cout << setw(4) <<"City";
//    for(int i = 0; i<n; i++)
//        cout << setw(4) << i;
    for(int i = 0; i<n; i++){
        cout << endl ;
        for(int j = 0; j<n; j++){
            file >> cost[i][j];
            cout << setw(4) << cost[i][j];
        }
    }
    cout << endl;
}

int main() {
	int start;
    init();
    cout<<"Nhap thanh pho bat dau :";
    cin>>start;
    generate(start);
    printResult();
    getch();
    return 0;
}
