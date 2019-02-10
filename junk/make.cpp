#include<bits/stdc++.h>
#include<iterator>
using namespace std;
int main(){
  set<string> x;
  for(int i=0;x.size()<256;i++){
    string a;
    cin >> a;
    if(!x.count(a)){
      x.insert(a);
    }
    else
    {
      cout << a <<" not added\n";
    }
  }
set<string>::iterator it;
int k=1;
for (it = x.begin(); it != x.end(); ++it)
{
    cout << "[\""<< *it<<"\"]="<<k<<"\t"; // Note the "*" here
    k++;
}
cout << endl;
}
