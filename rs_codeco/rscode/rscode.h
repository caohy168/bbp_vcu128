// reed-solomon code modle.
// Author:CaoHuiyang at HTGD-THZ Research and Department.
// Web:https://www.htgd.com.cn/
// e-mail:caohy@htgd.com.cn;QQ:2685997598

//rs code
//m=8
#ifndef _rscode_h_
#define _rscode_h_

#include <math.h>
#include <stdio.h>
#include <string.h>

//int pp[mm+1] = {1, 0, 1, 1, 1, 0, 0, 0, 1};
#define mm  8          /* RS code over GF(2**4) - change to suit */
#define nn  255        /* nn=2**mm -1   length of codeword */
#define tt  10         /* number of errors that can be corrected */
#define kk  235        /* kk = nn-2*tt  */

void generate_gf(int alpha_out[nn+1],int index_out[nn+1]);
void gen_poly(int gg_out [nn-kk+1]);
void encode_rs(int data_in[kk],int bb_out[nn-kk],int recd_out [nn],
		       int alpha_to_out [nn+1],int index_of_out [nn+1],int gg_out [nn-kk+1]);
#endif
