#include <systemc>
#include <vector>
#include <iostream>
#include "hls_stream.h"
#include "ap_int.h"
#include "ap_fixed.h"
using namespace std;
using namespace sc_dt;
class AESL_RUNTIME_BC {
  public:
    AESL_RUNTIME_BC(const char* name) {
      file_token.open( name);
      if (!file_token.good()) {
        cout << "Failed to open tv file " << name << endl;
        exit (1);
      }
      file_token >> mName;//[[[runtime]]]
    }
    ~AESL_RUNTIME_BC() {
      file_token.close();
    }
    int read_size () {
      int size = 0;
      file_token >> mName;//[[transaction]]
      file_token >> mName;//transaction number
      file_token >> mName;//pop_size
      size = atoi(mName.c_str());
      file_token >> mName;//[[/transaction]]
      return size;
    }
  public:
    fstream file_token;
    string mName;
};
extern "C" void encode_rs(volatile void *, int*, volatile void *, int*, int*, int*);
extern "C" void apatb_encode_rs_hw(volatile void * __xlx_apatb_param_data_in, volatile void * __xlx_apatb_param_bb_out, volatile void * __xlx_apatb_param_recd_out, volatile void * __xlx_apatb_param_alpha_to_out, volatile void * __xlx_apatb_param_index_of_out, volatile void * __xlx_apatb_param_gg_out) {
  // Collect __xlx_bb_out__tmp_vec
  vector<sc_bv<32> >__xlx_bb_out__tmp_vec;
  for (int j = 0, e = 20; j != e; ++j) {
    __xlx_bb_out__tmp_vec.push_back(((int*)__xlx_apatb_param_bb_out)[j]);
  }
  int __xlx_size_param_bb_out = 20;
  int __xlx_offset_param_bb_out = 0;
  int __xlx_offset_byte_param_bb_out = 0*4;
  int* __xlx_bb_out__input_buffer= new int[__xlx_bb_out__tmp_vec.size()];
  for (int i = 0; i < __xlx_bb_out__tmp_vec.size(); ++i) {
    __xlx_bb_out__input_buffer[i] = __xlx_bb_out__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_alpha_to_out__tmp_vec
  vector<sc_bv<32> >__xlx_alpha_to_out__tmp_vec;
  for (int j = 0, e = 256; j != e; ++j) {
    __xlx_alpha_to_out__tmp_vec.push_back(((int*)__xlx_apatb_param_alpha_to_out)[j]);
  }
  int __xlx_size_param_alpha_to_out = 256;
  int __xlx_offset_param_alpha_to_out = 0;
  int __xlx_offset_byte_param_alpha_to_out = 0*4;
  int* __xlx_alpha_to_out__input_buffer= new int[__xlx_alpha_to_out__tmp_vec.size()];
  for (int i = 0; i < __xlx_alpha_to_out__tmp_vec.size(); ++i) {
    __xlx_alpha_to_out__input_buffer[i] = __xlx_alpha_to_out__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_index_of_out__tmp_vec
  vector<sc_bv<32> >__xlx_index_of_out__tmp_vec;
  for (int j = 0, e = 256; j != e; ++j) {
    __xlx_index_of_out__tmp_vec.push_back(((int*)__xlx_apatb_param_index_of_out)[j]);
  }
  int __xlx_size_param_index_of_out = 256;
  int __xlx_offset_param_index_of_out = 0;
  int __xlx_offset_byte_param_index_of_out = 0*4;
  int* __xlx_index_of_out__input_buffer= new int[__xlx_index_of_out__tmp_vec.size()];
  for (int i = 0; i < __xlx_index_of_out__tmp_vec.size(); ++i) {
    __xlx_index_of_out__input_buffer[i] = __xlx_index_of_out__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_gg_out__tmp_vec
  vector<sc_bv<32> >__xlx_gg_out__tmp_vec;
  for (int j = 0, e = 21; j != e; ++j) {
    __xlx_gg_out__tmp_vec.push_back(((int*)__xlx_apatb_param_gg_out)[j]);
  }
  int __xlx_size_param_gg_out = 21;
  int __xlx_offset_param_gg_out = 0;
  int __xlx_offset_byte_param_gg_out = 0*4;
  int* __xlx_gg_out__input_buffer= new int[__xlx_gg_out__tmp_vec.size()];
  for (int i = 0; i < __xlx_gg_out__tmp_vec.size(); ++i) {
    __xlx_gg_out__input_buffer[i] = __xlx_gg_out__tmp_vec[i].range(31, 0).to_uint64();
  }
  // DUT call
  encode_rs(__xlx_apatb_param_data_in, __xlx_bb_out__input_buffer, __xlx_apatb_param_recd_out, __xlx_alpha_to_out__input_buffer, __xlx_index_of_out__input_buffer, __xlx_gg_out__input_buffer);
// print __xlx_apatb_param_bb_out
  sc_bv<32>*__xlx_bb_out_output_buffer = new sc_bv<32>[__xlx_size_param_bb_out];
  for (int i = 0; i < __xlx_size_param_bb_out; ++i) {
    __xlx_bb_out_output_buffer[i] = __xlx_bb_out__input_buffer[i+__xlx_offset_param_bb_out];
  }
  for (int i = 0; i < __xlx_size_param_bb_out; ++i) {
    ((int*)__xlx_apatb_param_bb_out)[i] = __xlx_bb_out_output_buffer[i].to_uint64();
  }
// print __xlx_apatb_param_alpha_to_out
  sc_bv<32>*__xlx_alpha_to_out_output_buffer = new sc_bv<32>[__xlx_size_param_alpha_to_out];
  for (int i = 0; i < __xlx_size_param_alpha_to_out; ++i) {
    __xlx_alpha_to_out_output_buffer[i] = __xlx_alpha_to_out__input_buffer[i+__xlx_offset_param_alpha_to_out];
  }
  for (int i = 0; i < __xlx_size_param_alpha_to_out; ++i) {
    ((int*)__xlx_apatb_param_alpha_to_out)[i] = __xlx_alpha_to_out_output_buffer[i].to_uint64();
  }
// print __xlx_apatb_param_index_of_out
  sc_bv<32>*__xlx_index_of_out_output_buffer = new sc_bv<32>[__xlx_size_param_index_of_out];
  for (int i = 0; i < __xlx_size_param_index_of_out; ++i) {
    __xlx_index_of_out_output_buffer[i] = __xlx_index_of_out__input_buffer[i+__xlx_offset_param_index_of_out];
  }
  for (int i = 0; i < __xlx_size_param_index_of_out; ++i) {
    ((int*)__xlx_apatb_param_index_of_out)[i] = __xlx_index_of_out_output_buffer[i].to_uint64();
  }
// print __xlx_apatb_param_gg_out
  sc_bv<32>*__xlx_gg_out_output_buffer = new sc_bv<32>[__xlx_size_param_gg_out];
  for (int i = 0; i < __xlx_size_param_gg_out; ++i) {
    __xlx_gg_out_output_buffer[i] = __xlx_gg_out__input_buffer[i+__xlx_offset_param_gg_out];
  }
  for (int i = 0; i < __xlx_size_param_gg_out; ++i) {
    ((int*)__xlx_apatb_param_gg_out)[i] = __xlx_gg_out_output_buffer[i].to_uint64();
  }
}
