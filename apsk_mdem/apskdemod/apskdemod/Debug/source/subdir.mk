################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
/home/caohy168/Work/apsk_mdem/apskdemod/apskdemod.cpp 

OBJS += \
./source/apskdemod.o 

CPP_DEPS += \
./source/apskdemod.d 


# Each subdirectory must supply rules for building sources it contributes
source/apskdemod.o: /home/caohy168/Work/apsk_mdem/apskdemod/apskdemod.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -DAESL_TB -D__llvm__ -D__llvm__ -I/tools/Xilinx/Vitis_HLS/2020.2/include -I/tools/Xilinx/Vitis_HLS/2020.2/lnx64/tools/systemc/include -I/tools/Xilinx/Vitis_HLS/2020.2/lnx64/tools/auto_cc/include -I/tools/Xilinx/Vitis_HLS/2020.2/include/ap_sysc -I/tools/Xilinx/Vitis_HLS/2020.2/include/etc -I/home/caohy168/Work/apsk_mdem/apskdemod -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

