#include<vector>
#include<array>
#include<iostream>
#include<bits/stdc++.h>

template<typename T,int N>
class SmallDisjointSet{
   std::array<T,N> mLeader;

    void makeSet(){
        for(auto i = 0; i < N; i++){
            mLeader[i] = i;
        }
    }

public:
    SmallDisjointSet(){
        this->makeSet();
    }

    T doFind(T entry){
        if(mLeader[entry] == entry)
            return entry;
        return doFind(mLeader[entry]);    
    }
    
    void doUnion(T first, T second){
        auto  firstLeader = doFind(first);
        auto  secondLeader = doFind(second);
        if(firstLeader == secondLeader)  // Same Set;
            return;
        mLeader[firstLeader] = secondLeader;     
    }


    void print(){
        std::copy(mLeader.begin(),mLeader.end(),std::ostream_iterator<T>(std::cout," "));
    }

};


int main(){
    SmallDisjointSet<int,5> DSet;
    DSet.doUnion(0,1);
    DSet.doUnion(2,3);
    DSet.doUnion(4,1);    
    DSet.print();
}