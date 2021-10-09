// Reed-Solomon Encode Modle.
// Author:CaoHuiyang at HTGD-THZ Research and Department.
// Web:https://www.htgd.com.cn/
// e-mail:caohy@htgd.com.cn;QQ:2685997598
#include "rscode.h"

int pp[mm+1] = {1, 0, 1, 1, 1, 0, 0, 0, 1};
int alpha_to [nn+1],index_of [nn+1],gg [nn-kk+1];
int recd [nn], data [kk], bb [nn-kk] ;

void encode_rs(int data_in[kk],int bb_out[nn-kk],int recd_out [nn],
		int alpha_to_out [nn+1],int index_of_out [nn+1],int gg_out [nn-kk+1])
//----encode-----
{

	generate_gf(alpha_to_out,index_of_out);
	gen_poly(gg_out);
	int i,j ;
	int feedback ;
	for(i=0; i<kk; i++)
		data[i] = data_in[i];
	for (i=0; i<nn-kk; i++)   bb[i] = 0 ;
	for (i=kk-1; i>=0; i--)
    {
		//step by step minus save into bb(i)
		feedback = index_of[data[i]^bb[nn-kk-1]] ;
		if(feedback != -1)
        {
			for (j=nn-kk-1; j>0; j--)
            if (gg[j] != -1)
				bb[j] = bb[j-1]^alpha_to[(gg[j]+feedback)%nn] ;		//plus = ^
            else
				bb[j] = bb[j-1] ;
			bb[0] = alpha_to[(gg[0]+feedback)%nn] ;
        }
		else
        {
			for (j=nn-kk-1; j>0; j--)
				bb[j] = bb[j-1] ;
			bb[0] = 0 ;
        };
    };

	for (i=0; i<nn-kk; i++)   bb_out[i] = bb[i];

//	data_sim[0] = 19 ;
	for (i=0; i<nn-kk; i++)
		recd_out[i] = bb[i] ;
	for (i=0; i<kk; i++)
		recd_out[i+nn-kk] = data_in[i] ;

}

void generate_gf(int alpha_out[nn+1],int index_out[nn+1])
/* make GF(2^m) domain */
{
	register int i, mask ;
	mask = 1;
	alpha_to[mm] = 0;
	for (i=0; i<mm; i++)
	{
		alpha_to[i] = mask;
		index_of[alpha_to[i]] = i;
		if (pp[i]!=0)
			alpha_to[mm] ^= mask;
		mask <<= 1;
	}
	index_of[alpha_to[mm]] = mm;
	mask >>= 1;
	for (i=mm+1; i<nn; i++)
	{
		if (alpha_to[i-1] >= mask)
			alpha_to[i] = alpha_to[mm] ^ ((alpha_to[i-1]^mask)<<1);
		else
			alpha_to[i] = alpha_to[i-1]<<1;
		index_of[alpha_to[i]] = i;
	}
	index_of[0] = -1 ;
	for (i=0; i<nn; i++)
	{alpha_out[i] = alpha_to[i];
	 index_out[i] = index_of[i];}
}

void gen_poly(int gg_out [nn-kk+1])
// make---poly
{
	register int i,j ;
	gg[0] = 2 ;    //primitive element alpha = 2  for GF(2**mm)
	gg[1] = 1 ;    //g(x) = (X+alpha) initially
	for (i=2; i<=nn-kk; i++)
    {
		gg[i] = 1 ;
		for (j=i-1; j>0; j--)
			if (gg[j] != 0)
				gg[j] = gg[j-1]^ alpha_to[(index_of[gg[j]]+i)%nn];
			else
				gg[j] = gg[j-1] ;
		gg[0] = alpha_to[(index_of[gg[0]]+i)%nn] ;     // gg[0] can never be zero
   }
   //printf("polynomial:\n");
   //for(i=0; i<=nn-kk; i++)
   //printf("%d      ", gg[i]);
   //printf("\n");
   //convert gg[] to index form for quicker encoding
   for (i=0; i<=nn-kk; i++){
	   gg[i] = index_of[gg[i]];}
   for (i=0; i<=nn-kk; i++){
   	   gg_out[i]=gg[i];}
}

