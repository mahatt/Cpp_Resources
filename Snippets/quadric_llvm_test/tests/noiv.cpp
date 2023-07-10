
extern  "C"
{

void kernel_function(volatile int * a ,int *b ,int size){
    for( ; ; ){
       b[5] = a[0];     
    }
}

}