
#include <stdio.h>
#if _WIN64 
extern "C" {void _f(int x, int y, float z, float r, double t, char e); }
#else
extern "C" {void _f_cdecl(int x, int y, float z, float r, double t, char e); 
				  void _stdcall _f_stdcall(int x, int y, float z, float r, double t, char e); 
				  void _fastcall _f_fastcall(int x, int y, float z, float r, double t, char e); }
#endif 


int main()
{

	printf("");
#if _WIN64 
	_f(1, 2, 3.0f, 4.0f, 5.0f, '1');
#else
	_f_cdecl(1, 2, 3.0f, 4.0f, 5.0f, '1');
	_f_stdcall(1, 2, 3.0f, 4.0f, 5.0f, '1');
	_f_fastcall(1, 2, 3.0f, 4.0f, 5.0f, '1');
#endif 
    return 0;
}

