#include "rscode.h"
#include <stdio.h>
#include <math.h>
#include <cmath>
#include <fstream>
#include <iostream>
#include <iomanip>
#include <string>
using namespace std;

int main()
{
	int i;
	int strSrc[kk];
	int alpha_to_sim [nn+1],index_to_sim[nn+1];
	int gg_sim [nn-kk+1];
	int data_in_sim[kk],bb_sim[nn-kk];
	int recd_sim [nn];

	for(i=0; i<255; i++)
		alpha_to_sim[i] = 0;
	for(i=0; i<kk; i++){
		strSrc[i] = i;
		data_in_sim[i]=strSrc[i];}

	encode_rs(data_in_sim,bb_sim,recd_sim,alpha_to_sim,index_to_sim,gg_sim);

	printf("Look-up tables for GF(2**%2d)\n",8);
	printf("  i   alpha_to[i]  index_of[i]\n");
	for (i=0; i<=nn; i++)
		{printf("%3d      %3d        %3d\n",i,alpha_to_sim[i],index_to_sim[i]);}

	printf("gg[] as below\n" );
	for (i=0; i<=nn-kk; i++)
		{printf("%3d      %3d\n",i,gg_sim[i]);}

	printf("Results for Reed-Solomon code (n=%3d, k=%3d, t= %3d)\n",nn,kk,tt);
	printf("  i  data[i]   recd[i](decoded)   (data, recd in polynomial form)\n");
	for (i=0; i<nn-kk; i++)
		{printf("%3d    %3d      %3d\n",i, bb_sim[i], recd_sim[i]);}
	for (i=nn-kk; i<=nn; i++)
		{printf("%3d    %3d      %3d\n",i, data_in_sim[i-nn+kk], recd_sim[i]);}


	for( int i = 0; i <nn; i = i + 1 ){
		cout <<recd_sim[i]<<',';
		if ((i+1)%20 == 0)cout << endl;}cout << endl;



return 0;
}
