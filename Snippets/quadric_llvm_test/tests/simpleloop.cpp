
extern  "C"
{

void kernel_function(int * a ,int *b ,int size){
    for(int i = 0 ; i <size ; i++){
       b[i] = a[i];     
    }
}

}