#include <systemc>
#include <iostream>
#include <cstdlib>
#include <cstddef>
#include <stdint.h>
#include "SysCFileHandler.h"
#include "ap_int.h"
#include "ap_fixed.h"
#include <complex>
#include <stdbool.h>
#include "autopilot_cbe.h"
#include "hls_stream.h"
#include "hls_half.h"
#include "hls_signal_handler.h"

using namespace std;
using namespace sc_core;
using namespace sc_dt;

// wrapc file define:
#define AUTOTB_TVIN_data_in "../tv/cdatafile/c.encode_rs.autotvin_data_in.dat"
#define AUTOTB_TVOUT_data_in "../tv/cdatafile/c.encode_rs.autotvout_data_in.dat"
// wrapc file define:
#define AUTOTB_TVIN_bb_out "../tv/cdatafile/c.encode_rs.autotvin_bb_out.dat"
#define AUTOTB_TVOUT_bb_out "../tv/cdatafile/c.encode_rs.autotvout_bb_out.dat"
// wrapc file define:
#define AUTOTB_TVIN_recd_out "../tv/cdatafile/c.encode_rs.autotvin_recd_out.dat"
#define AUTOTB_TVOUT_recd_out "../tv/cdatafile/c.encode_rs.autotvout_recd_out.dat"
// wrapc file define:
#define AUTOTB_TVIN_alpha_to_out "../tv/cdatafile/c.encode_rs.autotvin_alpha_to_out.dat"
#define AUTOTB_TVOUT_alpha_to_out "../tv/cdatafile/c.encode_rs.autotvout_alpha_to_out.dat"
// wrapc file define:
#define AUTOTB_TVIN_index_of_out "../tv/cdatafile/c.encode_rs.autotvin_index_of_out.dat"
#define AUTOTB_TVOUT_index_of_out "../tv/cdatafile/c.encode_rs.autotvout_index_of_out.dat"
// wrapc file define:
#define AUTOTB_TVIN_gg_out "../tv/cdatafile/c.encode_rs.autotvin_gg_out.dat"
#define AUTOTB_TVOUT_gg_out "../tv/cdatafile/c.encode_rs.autotvout_gg_out.dat"

#define INTER_TCL "../tv/cdatafile/ref.tcl"

// tvout file define:
#define AUTOTB_TVOUT_PC_data_in "../tv/rtldatafile/rtl.encode_rs.autotvout_data_in.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_bb_out "../tv/rtldatafile/rtl.encode_rs.autotvout_bb_out.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_recd_out "../tv/rtldatafile/rtl.encode_rs.autotvout_recd_out.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_alpha_to_out "../tv/rtldatafile/rtl.encode_rs.autotvout_alpha_to_out.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_index_of_out "../tv/rtldatafile/rtl.encode_rs.autotvout_index_of_out.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_gg_out "../tv/rtldatafile/rtl.encode_rs.autotvout_gg_out.dat"

class INTER_TCL_FILE {
  public:
INTER_TCL_FILE(const char* name) {
  mName = name; 
  data_in_depth = 0;
  bb_out_depth = 0;
  recd_out_depth = 0;
  alpha_to_out_depth = 0;
  index_of_out_depth = 0;
  gg_out_depth = 0;
  trans_num =0;
}
~INTER_TCL_FILE() {
  mFile.open(mName);
  if (!mFile.good()) {
    cout << "Failed to open file ref.tcl" << endl;
    exit (1); 
  }
  string total_list = get_depth_list();
  mFile << "set depth_list {\n";
  mFile << total_list;
  mFile << "}\n";
  mFile << "set trans_num "<<trans_num<<endl;
  mFile.close();
}
string get_depth_list () {
  stringstream total_list;
  total_list << "{data_in " << data_in_depth << "}\n";
  total_list << "{bb_out " << bb_out_depth << "}\n";
  total_list << "{recd_out " << recd_out_depth << "}\n";
  total_list << "{alpha_to_out " << alpha_to_out_depth << "}\n";
  total_list << "{index_of_out " << index_of_out_depth << "}\n";
  total_list << "{gg_out " << gg_out_depth << "}\n";
  return total_list.str();
}
void set_num (int num , int* class_num) {
  (*class_num) = (*class_num) > num ? (*class_num) : num;
}
void set_string(std::string list, std::string* class_list) {
  (*class_list) = list;
}
  public:
    int data_in_depth;
    int bb_out_depth;
    int recd_out_depth;
    int alpha_to_out_depth;
    int index_of_out_depth;
    int gg_out_depth;
    int trans_num;
  private:
    ofstream mFile;
    const char* mName;
};

static void RTLOutputCheckAndReplacement(std::string &AESL_token, std::string PortName) {
  bool no_x = false;
  bool err = false;

  no_x = false;
  // search and replace 'X' with '0' from the 3rd char of token
  while (!no_x) {
    size_t x_found = AESL_token.find('X', 0);
    if (x_found != string::npos) {
      if (!err) { 
        cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'X' on port" 
             << PortName << ", possible cause: There are uninitialized variables in the C design."
             << endl; 
        err = true;
      }
      AESL_token.replace(x_found, 1, "0");
    } else
      no_x = true;
  }
  no_x = false;
  // search and replace 'x' with '0' from the 3rd char of token
  while (!no_x) {
    size_t x_found = AESL_token.find('x', 2);
    if (x_found != string::npos) {
      if (!err) { 
        cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'x' on port" 
             << PortName << ", possible cause: There are uninitialized variables in the C design."
             << endl; 
        err = true;
      }
      AESL_token.replace(x_found, 1, "0");
    } else
      no_x = true;
  }
}
extern "C" void encode_rs_hw_stub_wrapper(volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *);

extern "C" void apatb_encode_rs_hw(volatile void * __xlx_apatb_param_data_in, volatile void * __xlx_apatb_param_bb_out, volatile void * __xlx_apatb_param_recd_out, volatile void * __xlx_apatb_param_alpha_to_out, volatile void * __xlx_apatb_param_index_of_out, volatile void * __xlx_apatb_param_gg_out) {
  refine_signal_handler();
  fstream wrapc_switch_file_token;
  wrapc_switch_file_token.open(".hls_cosim_wrapc_switch.log");
  int AESL_i;
  if (wrapc_switch_file_token.good())
  {

    CodeState = ENTER_WRAPC_PC;
    static unsigned AESL_transaction_pc = 0;
    string AESL_token;
    string AESL_num;{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_data_in);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          std::vector<sc_bv<32> > data_in_pc_buffer(235);
          int i = 0;

          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            RTLOutputCheckAndReplacement(AESL_token, "data_in");
  
            // push token into output port buffer
            if (AESL_token != "") {
              data_in_pc_buffer[i] = AESL_token.c_str();;
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (i > 0) {{
		    int i = 0;
            for (int j = 0, e = 235; j < e; j += 1, ++i) {
            ((int*)__xlx_apatb_param_data_in)[j] = data_in_pc_buffer[i].to_int64();
          }}}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  {
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_bb_out);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          std::vector<sc_bv<32> > bb_out_pc_buffer(20);
          int i = 0;

          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            RTLOutputCheckAndReplacement(AESL_token, "bb_out");
  
            // push token into output port buffer
            if (AESL_token != "") {
              bb_out_pc_buffer[i] = AESL_token.c_str();;
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (i > 0) {{
            int i = 0;
            for (int j = 0, e = 20; j < e; j += 1, ++i) {
            ((int*)__xlx_apatb_param_bb_out)[j] = bb_out_pc_buffer[i].to_int64();
          }}}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  {
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_recd_out);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          std::vector<sc_bv<32> > recd_out_pc_buffer(255);
          int i = 0;

          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            RTLOutputCheckAndReplacement(AESL_token, "recd_out");
  
            // push token into output port buffer
            if (AESL_token != "") {
              recd_out_pc_buffer[i] = AESL_token.c_str();;
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (i > 0) {{
		    int i = 0;
            for (int j = 0, e = 255; j < e; j += 1, ++i) {
            ((int*)__xlx_apatb_param_recd_out)[j] = recd_out_pc_buffer[i].to_int64();
          }}}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  {
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_alpha_to_out);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          std::vector<sc_bv<32> > alpha_to_out_pc_buffer(256);
          int i = 0;

          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            RTLOutputCheckAndReplacement(AESL_token, "alpha_to_out");
  
            // push token into output port buffer
            if (AESL_token != "") {
              alpha_to_out_pc_buffer[i] = AESL_token.c_str();;
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (i > 0) {{
            int i = 0;
            for (int j = 0, e = 256; j < e; j += 1, ++i) {
            ((int*)__xlx_apatb_param_alpha_to_out)[j] = alpha_to_out_pc_buffer[i].to_int64();
          }}}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  {
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_index_of_out);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          std::vector<sc_bv<32> > index_of_out_pc_buffer(256);
          int i = 0;

          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            RTLOutputCheckAndReplacement(AESL_token, "index_of_out");
  
            // push token into output port buffer
            if (AESL_token != "") {
              index_of_out_pc_buffer[i] = AESL_token.c_str();;
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (i > 0) {{
            int i = 0;
            for (int j = 0, e = 256; j < e; j += 1, ++i) {
            ((int*)__xlx_apatb_param_index_of_out)[j] = index_of_out_pc_buffer[i].to_int64();
          }}}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  {
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_gg_out);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          std::vector<sc_bv<32> > gg_out_pc_buffer(21);
          int i = 0;

          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            RTLOutputCheckAndReplacement(AESL_token, "gg_out");
  
            // push token into output port buffer
            if (AESL_token != "") {
              gg_out_pc_buffer[i] = AESL_token.c_str();;
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (i > 0) {{
            int i = 0;
            for (int j = 0, e = 21; j < e; j += 1, ++i) {
            ((int*)__xlx_apatb_param_gg_out)[j] = gg_out_pc_buffer[i].to_int64();
          }}}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  
    AESL_transaction_pc++;
    return ;
  }
static unsigned AESL_transaction;
static AESL_FILE_HANDLER aesl_fh;
static INTER_TCL_FILE tcl_file(INTER_TCL);
std::vector<char> __xlx_sprintf_buffer(1024);
CodeState = ENTER_WRAPC;
//data_in
aesl_fh.touch(AUTOTB_TVIN_data_in);
aesl_fh.touch(AUTOTB_TVOUT_data_in);
//bb_out
aesl_fh.touch(AUTOTB_TVIN_bb_out);
aesl_fh.touch(AUTOTB_TVOUT_bb_out);
//recd_out
aesl_fh.touch(AUTOTB_TVIN_recd_out);
aesl_fh.touch(AUTOTB_TVOUT_recd_out);
//alpha_to_out
aesl_fh.touch(AUTOTB_TVIN_alpha_to_out);
aesl_fh.touch(AUTOTB_TVOUT_alpha_to_out);
//index_of_out
aesl_fh.touch(AUTOTB_TVIN_index_of_out);
aesl_fh.touch(AUTOTB_TVOUT_index_of_out);
//gg_out
aesl_fh.touch(AUTOTB_TVIN_gg_out);
aesl_fh.touch(AUTOTB_TVOUT_gg_out);
CodeState = DUMP_INPUTS;
// print data_in Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_data_in, __xlx_sprintf_buffer.data());
    if (__xlx_apatb_param_data_in) {
    for (int j = 0  - 0, e = 235 - 0; j != e; ++j) {
sc_bv<32> __xlx_tmp_lv = ((int*)__xlx_apatb_param_data_in)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_data_in, __xlx_sprintf_buffer.data()); 
      }
  }

  tcl_file.set_num(235, &tcl_file.data_in_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_data_in, __xlx_sprintf_buffer.data());
}
unsigned __xlx_offset_byte_param_bb_out = 0;
// print bb_out Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_bb_out, __xlx_sprintf_buffer.data());
  {  __xlx_offset_byte_param_bb_out = 0*4;
  if (__xlx_apatb_param_bb_out) {
    for (int j = 0  - 0, e = 20 - 0; j != e; ++j) {
sc_bv<32> __xlx_tmp_lv = ((int*)__xlx_apatb_param_bb_out)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_bb_out, __xlx_sprintf_buffer.data()); 
      }
  }
}
  tcl_file.set_num(20, &tcl_file.bb_out_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_bb_out, __xlx_sprintf_buffer.data());
}
// print recd_out Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_recd_out, __xlx_sprintf_buffer.data());
    if (__xlx_apatb_param_recd_out) {
    for (int j = 0  - 0, e = 255 - 0; j != e; ++j) {
sc_bv<32> __xlx_tmp_lv = ((int*)__xlx_apatb_param_recd_out)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_recd_out, __xlx_sprintf_buffer.data()); 
      }
  }

  tcl_file.set_num(255, &tcl_file.recd_out_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_recd_out, __xlx_sprintf_buffer.data());
}
unsigned __xlx_offset_byte_param_alpha_to_out = 0;
// print alpha_to_out Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_alpha_to_out, __xlx_sprintf_buffer.data());
  {  __xlx_offset_byte_param_alpha_to_out = 0*4;
  if (__xlx_apatb_param_alpha_to_out) {
    for (int j = 0  - 0, e = 256 - 0; j != e; ++j) {
sc_bv<32> __xlx_tmp_lv = ((int*)__xlx_apatb_param_alpha_to_out)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_alpha_to_out, __xlx_sprintf_buffer.data()); 
      }
  }
}
  tcl_file.set_num(256, &tcl_file.alpha_to_out_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_alpha_to_out, __xlx_sprintf_buffer.data());
}
unsigned __xlx_offset_byte_param_index_of_out = 0;
// print index_of_out Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_index_of_out, __xlx_sprintf_buffer.data());
  {  __xlx_offset_byte_param_index_of_out = 0*4;
  if (__xlx_apatb_param_index_of_out) {
    for (int j = 0  - 0, e = 256 - 0; j != e; ++j) {
sc_bv<32> __xlx_tmp_lv = ((int*)__xlx_apatb_param_index_of_out)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_index_of_out, __xlx_sprintf_buffer.data()); 
      }
  }
}
  tcl_file.set_num(256, &tcl_file.index_of_out_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_index_of_out, __xlx_sprintf_buffer.data());
}
unsigned __xlx_offset_byte_param_gg_out = 0;
// print gg_out Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_gg_out, __xlx_sprintf_buffer.data());
  {  __xlx_offset_byte_param_gg_out = 0*4;
  if (__xlx_apatb_param_gg_out) {
    for (int j = 0  - 0, e = 21 - 0; j != e; ++j) {
sc_bv<32> __xlx_tmp_lv = ((int*)__xlx_apatb_param_gg_out)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_gg_out, __xlx_sprintf_buffer.data()); 
      }
  }
}
  tcl_file.set_num(21, &tcl_file.gg_out_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_gg_out, __xlx_sprintf_buffer.data());
}
CodeState = CALL_C_DUT;
encode_rs_hw_stub_wrapper(__xlx_apatb_param_data_in, __xlx_apatb_param_bb_out, __xlx_apatb_param_recd_out, __xlx_apatb_param_alpha_to_out, __xlx_apatb_param_index_of_out, __xlx_apatb_param_gg_out);
CodeState = DUMP_OUTPUTS;
// print data_in Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVOUT_data_in, __xlx_sprintf_buffer.data());
    if (__xlx_apatb_param_data_in) {
    for (int j = 0  - 0, e = 235 - 0; j != e; ++j) {
sc_bv<32> __xlx_tmp_lv = ((int*)__xlx_apatb_param_data_in)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVOUT_data_in, __xlx_sprintf_buffer.data()); 
      }
  }

  tcl_file.set_num(235, &tcl_file.data_in_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVOUT_data_in, __xlx_sprintf_buffer.data());
}
// print bb_out Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVOUT_bb_out, __xlx_sprintf_buffer.data());
  {  __xlx_offset_byte_param_bb_out = 0*4;
  if (__xlx_apatb_param_bb_out) {
    for (int j = 0  - 0, e = 20 - 0; j != e; ++j) {
sc_bv<32> __xlx_tmp_lv = ((int*)__xlx_apatb_param_bb_out)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVOUT_bb_out, __xlx_sprintf_buffer.data()); 
      }
  }
}
  tcl_file.set_num(20, &tcl_file.bb_out_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVOUT_bb_out, __xlx_sprintf_buffer.data());
}
// print recd_out Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVOUT_recd_out, __xlx_sprintf_buffer.data());
    if (__xlx_apatb_param_recd_out) {
    for (int j = 0  - 0, e = 255 - 0; j != e; ++j) {
sc_bv<32> __xlx_tmp_lv = ((int*)__xlx_apatb_param_recd_out)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVOUT_recd_out, __xlx_sprintf_buffer.data()); 
      }
  }

  tcl_file.set_num(255, &tcl_file.recd_out_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVOUT_recd_out, __xlx_sprintf_buffer.data());
}
// print alpha_to_out Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVOUT_alpha_to_out, __xlx_sprintf_buffer.data());
  {  __xlx_offset_byte_param_alpha_to_out = 0*4;
  if (__xlx_apatb_param_alpha_to_out) {
    for (int j = 0  - 0, e = 256 - 0; j != e; ++j) {
sc_bv<32> __xlx_tmp_lv = ((int*)__xlx_apatb_param_alpha_to_out)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVOUT_alpha_to_out, __xlx_sprintf_buffer.data()); 
      }
  }
}
  tcl_file.set_num(256, &tcl_file.alpha_to_out_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVOUT_alpha_to_out, __xlx_sprintf_buffer.data());
}
// print index_of_out Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVOUT_index_of_out, __xlx_sprintf_buffer.data());
  {  __xlx_offset_byte_param_index_of_out = 0*4;
  if (__xlx_apatb_param_index_of_out) {
    for (int j = 0  - 0, e = 256 - 0; j != e; ++j) {
sc_bv<32> __xlx_tmp_lv = ((int*)__xlx_apatb_param_index_of_out)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVOUT_index_of_out, __xlx_sprintf_buffer.data()); 
      }
  }
}
  tcl_file.set_num(256, &tcl_file.index_of_out_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVOUT_index_of_out, __xlx_sprintf_buffer.data());
}
// print gg_out Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVOUT_gg_out, __xlx_sprintf_buffer.data());
  {  __xlx_offset_byte_param_gg_out = 0*4;
  if (__xlx_apatb_param_gg_out) {
    for (int j = 0  - 0, e = 21 - 0; j != e; ++j) {
sc_bv<32> __xlx_tmp_lv = ((int*)__xlx_apatb_param_gg_out)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVOUT_gg_out, __xlx_sprintf_buffer.data()); 
      }
  }
}
  tcl_file.set_num(21, &tcl_file.gg_out_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVOUT_gg_out, __xlx_sprintf_buffer.data());
}
CodeState = DELETE_CHAR_BUFFERS;
AESL_transaction++;
tcl_file.set_num(AESL_transaction , &tcl_file.trans_num);
}
