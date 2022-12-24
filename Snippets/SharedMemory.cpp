#include <sys/mman.h>
#include <memory>
#include <fcntl.h>
#include <unistd.h>
#include <cerrno>

#include <iostream>
#include <string>
#include <cstring>

template<typename T>
class SharedMemoryCleanup{
public:
	void operator() (T* p){
		const char * AreaName = "/tmp101010";
		if(shm_unlink(AreaName) !=0){
			std::cerr<< "Unlink Failed!\n";
		}else{
			std::cout<<"Done!";
		}
	}

};

template<typename T,size_t Size>
class SharedMemory{
	public:
    static 
	std::shared_ptr<T> get(){
		const char * AreaName = "/tmp101010";
		int shfd = shm_open(AreaName,O_CREAT |  O_RDWR,  S_IRWXU | S_IRWXG);
		
		if( shfd < 0)
		   throw std::string(strerror(errno));
		if(ftruncate(shfd,Size * sizeof(T)) ==  -1)
		   throw std::string(strerror(errno));

		void * mptr = mmap(nullptr,Size*sizeof(T),PROT_READ| PROT_WRITE,MAP_SHARED,shfd,0);
		if(mptr == MAP_FAILED)
			throw std::string(strerror(errno));

		return  std::shared_ptr<T>(static_cast<T*>(mptr),SharedMemoryCleanup<T>());
	}
};

int main(){
	// create shared memory block
	std::shared_ptr<char> shMem(SharedMemory<char,100>::get());

}

