
extern  "C"
{

void kernel_function(int * a ,int *b ,int size,  int dim){

    for(int i = 0 ; i <size ; i++){
      for(int j = size ; j >=0 ; j--){
         for(int l = 0 ; l < j%4 ; l++){   
         int k = (i + j) % size;
         b[k+l] = a[k + l];     
        }
      }
    }
}

}