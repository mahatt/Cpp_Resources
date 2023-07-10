
extern  "C"
{

void kernel_function(int * a ,int *b ,int size,  int dim){

    for(int i = 0 ; i <size ; i++){
      for(int j = size ; j >=0 ; j--){
         int k = (i + j) % size;
         b[k] = a[k];     
      }
    }
}

}