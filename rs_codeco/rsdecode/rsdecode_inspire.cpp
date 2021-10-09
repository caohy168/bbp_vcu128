#include "rsdecode.h"

int main()
{
	int i;
	int alpha_to_sim [nn+1],index_to_sim[nn+1];
	int gg_sim [nn-kk+1];
	//int recd_in_sim[nn]={190,114,171, 41, 11, 24,252,222, 60, 80, 84,200,232,192,174, 66, 68,  6, 49,254,
	//		0,  1,  2,  3,  4,  5,  6,  7,  8,  9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191,192,193,194,195,196,197,198,199,200,201,202,203,204,205,206,207,208,209,210,211,212,213,214,215,216,217,218,219,220,221,222,223,224,225,226,227,228,229,230,231,232,233,234};

	int recd_in_err1[nn]={190,114,171, 41, 11, 24,252,222, 60, 80, 84,200,232,192,174, 66, 68,  6, 49,254,
		    0,  1,  2,  3,  3,  5,  6,  7,  7,  9, 10, 11, 12, 12, 14, 15, 16, 16, 18, 19, 20, 21, 22, 22, 24, 25, 26, 26, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191,192,193,194,195,196,197,198,199,200,201,202,203,204,205,206,207,208,209,210,211,212,213,214,215,216,217,218,219,220,221,222,223,224,225,226,227,228,229,230,231,232,233,234};


	int recd_in_err2[nn]={190,114,171, 41, 11, 24,252,222, 60, 80, 84,200,232,192,174, 66, 68,  6, 49,254,
			0,  1,  1,  3,  3,  5,  7,  7,  8,  9, 11, 11, 12, 13, 14, 15, 16, 16, 18, 19, 20, 21, 22, 24, 24, 25, 26, 26, 28, 29, 30, 31, 32, 33, 33, 35, 36, 36, 38, 39, 40, 40, 42, 43, 44, 45, 46, 46, 48, 49, 50, 50, 52, 53, 54, 55, 56, 57, 57, 59, 60, 61, 61, 63, 63, 65, 65, 67, 67, 69, 70, 71, 72, 73, 73, 75, 76, 77, 78, 79, 80, 81, 81, 83, 84, 84, 86, 86, 88, 89, 90, 90, 92, 92, 94, 95, 95, 97, 98, 98,100,100,102,103,103,105,106,106,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191,192,193,194,195,196,197,198,199,200,201,202,203,204,205,206,207,208,209,210,211,212,213,214,215,216,217,218,219,220,221,222,223,224,225,226,227,228,229,230,231,232,233,234};

	int recd_out_sim[nn];
	int recd_gf_sim[nn];
	int syn_error_sim;

	//generate_gf(alpha_to_sim,index_to_sim);
	//gen_poly(gg_sim);

	//decode_rs(recd_in_sim,recd_out_sim,recd_gf_sim,syn_error_sim);
	decode_rs(recd_in_err1,recd_out_sim,recd_gf_sim,syn_error_sim,alpha_to_sim,index_to_sim,gg_sim);

	printf("Results for Reed-Solomon code (n=%3d, k=%3d, t= %3d)\n\n",nn,kk,tt) ;
	printf("  i  recd[i](decoded) (recd in polynomial form)\n");
		for (i=0; i<nn; i++)
			printf("%3d   %3d\n",i,recd_out_sim[i]);
	printf("  i  recd_gf[i]\n");
		for (i=0; i<nn; i++)
			printf("%3d   %3d\n",i,recd_gf_sim[i]);
	printf("syn_error_sim= %3d)\n",syn_error_sim);
}