
#include <iostream>
#include <fstream>
#include <string>

using namespace std;

struct Node {
	string data;			
	int counter;			// so lan xuat hien 
	int lineNumber[1000];	// list of line
	int dong;		// dong xuat hien 
	struct Node* left;		
	struct Node* right;		
};



Node* createNode(string data, int lineNum) {
	Node* p = new Node();
	p->data = data;
	p->counter = 1;
	p->dong = 1;
	p->lineNumber[0] = lineNum;
	p->left = p->right = NULL;
	return p;
}

// ham them 1 node 
void addNode(Node* &tree, Node* node) {
	if (tree == NULL) { 
		tree = node; 
		return; 
	}
	// de quy cho den khi ti thay node cuoi la Null
	int result = tree->data.compare(node->data);
	
	if (result == 0) {
		tree->counter++;
		bool isExist = false;
		for (int  i = 0; i < tree->dong; i++)
		{  
			if (tree->lineNumber[i] == node->lineNumber[0]) {
				isExist = true;
				break;
			}
		}
		
		if (!isExist) { // neu dong chua ton tai thi them vao danh sach 
			tree->lineNumber[(tree->dong)++] = node->lineNumber[0];
		} //neu khong thi bo qua 
	}
	else if (result < 0) { // de quy  phai 
		addNode(tree->right, node);
	}
	else { // de quy trai 
		addNode(tree->left, node);
	}
}

void Xuat(Node* p) 
{	
	cout << " '"<< p->data << "'  : " << p->counter <<"\t";
	cout << "  ";
	for (int  i = 0; i < p->dong; i++)
	{
		cout << p->lineNumber[i] << ", ";
	}
	cout << endl<<endl;
}

void show(Node* tree) {
	if (tree != NULL) {
		show(tree->left);
		Xuat(tree);
		show(tree->right);
	}
}

void readFile(string fileName, Node* &tree) {
	ifstream ifs(fileName.c_str());
	int line = 1;
	while (!ifs.eof()) {
		string data;
		getline(ifs, data);
		string word = "";
		for (int  i = 0; i < data.length(); i++)
		{
			if (data[i] == ' ') {
				Node* p = createNode(word, line);
				addNode(tree , p);
				word = "";
			}
			else {
				word += data.at(i);
			}
		}
//		if (word.length() > 0 && word.compare(" ") != 0) {
//			Node* p = createNode(word, line);
//			addNode(tree, p);
//		}
		line++;
	}
	ifs.close();
}

Node* search(Node* tree, string data) {
	if (tree != NULL) {
		int isMatch = tree->data.compare(data);
		if (isMatch == 0) { 
			return tree;
		}
		else if (isMatch > 0) { 
			return search(tree->left, data);
		}
		else {
			return search(tree->right, data);
		}
	}

	return NULL; 
}

void findResult(Node* tree, string fileName) {
	ifstream ifs(fileName.c_str());	
	string data[5000];
	int dataSize = 0;
	while (!ifs.eof()) {
		getline(ifs, data[dataSize++]);
	}
	ifs.close();
	Node* searchResult = NULL;
	for (int  i = 0; i < dataSize ; i++)
	{
		searchResult = search(tree, data[i]);
		if (searchResult != NULL) {
			Xuat(searchResult);
		}
		else {
			cout << data[i] << "  \n";
		}
	}
	
}
void findResult1(Node* tree, string fileName, int line) {
	ifstream ifs(fileName.c_str());	
	string data[5000];
	int dataSize = 0;
	while (!ifs.eof()) {
		getline(ifs, data[dataSize++]);
	}
	ifs.close();
	Node* searchResult = NULL;
	for (int  i = 0; i < dataSize ; i++)
	{
		searchResult = search(tree, data[i]);
		if (searchResult != NULL) {
			for (int  j = 0; j < searchResult->dong; j++)
	    {
	    	if (searchResult->lineNumber[j]==line)
			 {
				cout<<searchResult->data<<"   ";
	    		break;
			}
		
	
		}
	}
	
}
}



int main()
{
    
	struct Node* tree = NULL;
	readFile("input.txt", tree); 
	findResult(tree, "key.txt"); 
//	string a;
//	cout<<" nhap vao 1 tu ";
//	cin>>a;
//		Node* searchResult = NULL;
//	searchResult = search(tree, a);
//	if(	searchResult!=NULL)
//	     	Xuat(searchResult);
//



   int b;
    cout<<" Nhap vao 1 dong ";
   cin>>b;
    findResult1(tree, "key.txt", b); 
     
    
}
