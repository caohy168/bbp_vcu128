; ModuleID = '/home/caohy168/Work/bbp_vcu128/rs_codeco/rscode/rscode/solution1/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

; Function Attrs: noinline
define void @apatb_encode_rs_ir(i32* %data_in, i32* %bb_out, i32* %recd_out, i32* %alpha_to_out, i32* %index_of_out, i32* %gg_out) local_unnamed_addr #0 {
entry:
  %data_in_copy = alloca [235 x i32], align 512
  %bb_out_copy = alloca [20 x i32], align 512
  %recd_out_copy = alloca [255 x i32], align 512
  %alpha_to_out_copy = alloca [256 x i32], align 512
  %index_of_out_copy = alloca [256 x i32], align 512
  %gg_out_copy = alloca [21 x i32], align 512
  %0 = bitcast i32* %data_in to [235 x i32]*
  %1 = bitcast i32* %bb_out to [20 x i32]*
  %2 = bitcast i32* %recd_out to [255 x i32]*
  %3 = bitcast i32* %alpha_to_out to [256 x i32]*
  %4 = bitcast i32* %index_of_out to [256 x i32]*
  %5 = bitcast i32* %gg_out to [21 x i32]*
  call fastcc void @copy_in([235 x i32]* %0, [235 x i32]* nonnull align 512 %data_in_copy, [20 x i32]* %1, [20 x i32]* nonnull align 512 %bb_out_copy, [255 x i32]* %2, [255 x i32]* nonnull align 512 %recd_out_copy, [256 x i32]* %3, [256 x i32]* nonnull align 512 %alpha_to_out_copy, [256 x i32]* %4, [256 x i32]* nonnull align 512 %index_of_out_copy, [21 x i32]* %5, [21 x i32]* nonnull align 512 %gg_out_copy)
  %6 = getelementptr inbounds [235 x i32], [235 x i32]* %data_in_copy, i32 0, i32 0
  %7 = getelementptr inbounds [20 x i32], [20 x i32]* %bb_out_copy, i32 0, i32 0
  %8 = getelementptr inbounds [255 x i32], [255 x i32]* %recd_out_copy, i32 0, i32 0
  %9 = getelementptr inbounds [256 x i32], [256 x i32]* %alpha_to_out_copy, i32 0, i32 0
  %10 = getelementptr inbounds [256 x i32], [256 x i32]* %index_of_out_copy, i32 0, i32 0
  %11 = getelementptr inbounds [21 x i32], [21 x i32]* %gg_out_copy, i32 0, i32 0
  call void @apatb_encode_rs_hw(i32* %6, i32* %7, i32* %8, i32* %9, i32* %10, i32* %11)
  call fastcc void @copy_out([235 x i32]* %0, [235 x i32]* nonnull align 512 %data_in_copy, [20 x i32]* %1, [20 x i32]* nonnull align 512 %bb_out_copy, [255 x i32]* %2, [255 x i32]* nonnull align 512 %recd_out_copy, [256 x i32]* %3, [256 x i32]* nonnull align 512 %alpha_to_out_copy, [256 x i32]* %4, [256 x i32]* nonnull align 512 %index_of_out_copy, [21 x i32]* %5, [21 x i32]* nonnull align 512 %gg_out_copy)
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @copy_in([235 x i32]* readonly, [235 x i32]* noalias align 512, [20 x i32]* readonly, [20 x i32]* noalias align 512, [255 x i32]* readonly, [255 x i32]* noalias align 512, [256 x i32]* readonly, [256 x i32]* noalias align 512, [256 x i32]* readonly, [256 x i32]* noalias align 512, [21 x i32]* readonly, [21 x i32]* noalias align 512) unnamed_addr #1 {
entry:
  call fastcc void @onebyonecpy_hls.p0a235i32([235 x i32]* align 512 %1, [235 x i32]* %0)
  call fastcc void @onebyonecpy_hls.p0a20i32([20 x i32]* align 512 %3, [20 x i32]* %2)
  call fastcc void @onebyonecpy_hls.p0a255i32([255 x i32]* align 512 %5, [255 x i32]* %4)
  call fastcc void @onebyonecpy_hls.p0a256i32([256 x i32]* align 512 %7, [256 x i32]* %6)
  call fastcc void @onebyonecpy_hls.p0a256i32([256 x i32]* align 512 %9, [256 x i32]* %8)
  call fastcc void @onebyonecpy_hls.p0a21i32([21 x i32]* align 512 %11, [21 x i32]* %10)
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @onebyonecpy_hls.p0a235i32([235 x i32]* noalias align 512, [235 x i32]* noalias readonly) unnamed_addr #2 {
entry:
  %2 = icmp eq [235 x i32]* %0, null
  %3 = icmp eq [235 x i32]* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %copy
  %for.loop.idx3 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr.gep1 = getelementptr [235 x i32], [235 x i32]* %0, i64 0, i64 %for.loop.idx3
  %5 = bitcast i32* %dst.addr.gep1 to i8*
  %src.addr.gep2 = getelementptr [235 x i32], [235 x i32]* %1, i64 0, i64 %for.loop.idx3
  %6 = bitcast i32* %src.addr.gep2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %5, i8* align 1 %6, i64 4, i1 false)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx3, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 235
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %for.loop, %entry
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1) #3

; Function Attrs: argmemonly noinline
define internal fastcc void @onebyonecpy_hls.p0a20i32([20 x i32]* noalias align 512, [20 x i32]* noalias readonly) unnamed_addr #2 {
entry:
  %2 = icmp eq [20 x i32]* %0, null
  %3 = icmp eq [20 x i32]* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %copy
  %for.loop.idx3 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr.gep1 = getelementptr [20 x i32], [20 x i32]* %0, i64 0, i64 %for.loop.idx3
  %5 = bitcast i32* %dst.addr.gep1 to i8*
  %src.addr.gep2 = getelementptr [20 x i32], [20 x i32]* %1, i64 0, i64 %for.loop.idx3
  %6 = bitcast i32* %src.addr.gep2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %5, i8* align 1 %6, i64 4, i1 false)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx3, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 20
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %for.loop, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @onebyonecpy_hls.p0a255i32([255 x i32]* noalias align 512, [255 x i32]* noalias readonly) unnamed_addr #2 {
entry:
  %2 = icmp eq [255 x i32]* %0, null
  %3 = icmp eq [255 x i32]* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %copy
  %for.loop.idx3 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr.gep1 = getelementptr [255 x i32], [255 x i32]* %0, i64 0, i64 %for.loop.idx3
  %5 = bitcast i32* %dst.addr.gep1 to i8*
  %src.addr.gep2 = getelementptr [255 x i32], [255 x i32]* %1, i64 0, i64 %for.loop.idx3
  %6 = bitcast i32* %src.addr.gep2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %5, i8* align 1 %6, i64 4, i1 false)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx3, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 255
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %for.loop, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @onebyonecpy_hls.p0a256i32([256 x i32]* noalias align 512, [256 x i32]* noalias readonly) unnamed_addr #2 {
entry:
  %2 = icmp eq [256 x i32]* %0, null
  %3 = icmp eq [256 x i32]* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %copy
  %for.loop.idx3 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr.gep1 = getelementptr [256 x i32], [256 x i32]* %0, i64 0, i64 %for.loop.idx3
  %5 = bitcast i32* %dst.addr.gep1 to i8*
  %src.addr.gep2 = getelementptr [256 x i32], [256 x i32]* %1, i64 0, i64 %for.loop.idx3
  %6 = bitcast i32* %src.addr.gep2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %5, i8* align 1 %6, i64 4, i1 false)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx3, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 256
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %for.loop, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @onebyonecpy_hls.p0a21i32([21 x i32]* noalias align 512, [21 x i32]* noalias readonly) unnamed_addr #2 {
entry:
  %2 = icmp eq [21 x i32]* %0, null
  %3 = icmp eq [21 x i32]* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %copy
  %for.loop.idx3 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr.gep1 = getelementptr [21 x i32], [21 x i32]* %0, i64 0, i64 %for.loop.idx3
  %5 = bitcast i32* %dst.addr.gep1 to i8*
  %src.addr.gep2 = getelementptr [21 x i32], [21 x i32]* %1, i64 0, i64 %for.loop.idx3
  %6 = bitcast i32* %src.addr.gep2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %5, i8* align 1 %6, i64 4, i1 false)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx3, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 21
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %for.loop, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @copy_out([235 x i32]*, [235 x i32]* noalias readonly align 512, [20 x i32]*, [20 x i32]* noalias readonly align 512, [255 x i32]*, [255 x i32]* noalias readonly align 512, [256 x i32]*, [256 x i32]* noalias readonly align 512, [256 x i32]*, [256 x i32]* noalias readonly align 512, [21 x i32]*, [21 x i32]* noalias readonly align 512) unnamed_addr #4 {
entry:
  call fastcc void @onebyonecpy_hls.p0a235i32([235 x i32]* %0, [235 x i32]* align 512 %1)
  call fastcc void @onebyonecpy_hls.p0a20i32([20 x i32]* %2, [20 x i32]* align 512 %3)
  call fastcc void @onebyonecpy_hls.p0a255i32([255 x i32]* %4, [255 x i32]* align 512 %5)
  call fastcc void @onebyonecpy_hls.p0a256i32([256 x i32]* %6, [256 x i32]* align 512 %7)
  call fastcc void @onebyonecpy_hls.p0a256i32([256 x i32]* %8, [256 x i32]* align 512 %9)
  call fastcc void @onebyonecpy_hls.p0a21i32([21 x i32]* %10, [21 x i32]* align 512 %11)
  ret void
}

declare void @apatb_encode_rs_hw(i32*, i32*, i32*, i32*, i32*, i32*)

define void @encode_rs_hw_stub_wrapper(i32*, i32*, i32*, i32*, i32*, i32*) #5 {
entry:
  %6 = bitcast i32* %0 to [235 x i32]*
  %7 = bitcast i32* %1 to [20 x i32]*
  %8 = bitcast i32* %2 to [255 x i32]*
  %9 = bitcast i32* %3 to [256 x i32]*
  %10 = bitcast i32* %4 to [256 x i32]*
  %11 = bitcast i32* %5 to [21 x i32]*
  call void @copy_out([235 x i32]* null, [235 x i32]* %6, [20 x i32]* null, [20 x i32]* %7, [255 x i32]* null, [255 x i32]* %8, [256 x i32]* null, [256 x i32]* %9, [256 x i32]* null, [256 x i32]* %10, [21 x i32]* null, [21 x i32]* %11)
  %12 = bitcast [235 x i32]* %6 to i32*
  %13 = bitcast [20 x i32]* %7 to i32*
  %14 = bitcast [255 x i32]* %8 to i32*
  %15 = bitcast [256 x i32]* %9 to i32*
  %16 = bitcast [256 x i32]* %10 to i32*
  %17 = bitcast [21 x i32]* %11 to i32*
  call void @encode_rs_hw_stub(i32* %12, i32* %13, i32* %14, i32* %15, i32* %16, i32* %17)
  call void @copy_in([235 x i32]* null, [235 x i32]* %6, [20 x i32]* null, [20 x i32]* %7, [255 x i32]* null, [255 x i32]* %8, [256 x i32]* null, [256 x i32]* %9, [256 x i32]* null, [256 x i32]* %10, [21 x i32]* null, [21 x i32]* %11)
  ret void
}

declare void @encode_rs_hw_stub(i32*, i32*, i32*, i32*, i32*, i32*)

attributes #0 = { noinline "fpga.wrapper.func"="wrapper" }
attributes #1 = { argmemonly noinline "fpga.wrapper.func"="copyin" }
attributes #2 = { argmemonly noinline "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #3 = { argmemonly nounwind }
attributes #4 = { argmemonly noinline "fpga.wrapper.func"="copyout" }
attributes #5 = { "fpga.wrapper.func"="stub" }

!llvm.dbg.cu = !{}
!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!llvm.module.flags = !{!1, !2, !3}
!blackbox_cfg = !{!4}

!0 = !{!"clang version 7.0.0 "}
!1 = !{i32 2, !"Dwarf Version", i32 4}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = !{}
