//////////////////////////////////////////////////////////////////////////////////
// Company: htgd_thz
// Engineer: caohuiyang 
// 
// Create Date: March 26 2021
// Design Name: 
// Module Name: bbp(base band processor)_transmit
// Project Name: 
// Target Devices: vcu128
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
//
// Project    : The Xilinx PCI Express DMA 
// File       : sample_tests.vh
// Version    : 4.1
//-----------------------------------------------------------------------------
//
//------------------------------------------------------------------------------

else if(testname =="dma_stream0")
begin

   //----------------------------------------------------------------------------------------
   // XDMA H2C Test Starts
   //----------------------------------------------------------------------------------------

    $display(" **** XDMA AXI-ST *** \n");
    $display(" **** read Address at BAR0  = %h\n", board.RP_R.tx_usrapp.BAR_INIT_P_BAR[0][31:0]);
    $display(" **** read Address at BAR1  = %h\n", board.RP_R.tx_usrapp.BAR_INIT_P_BAR[1][31:0]);

    //-------------- Load DATA in Buffer ----------------------------------------------------
    board.RP_R.tx_usrapp.TSK_INIT_DATA_H2C;
    board.RP_R.tx_usrapp.TSK_INIT_DATA_C2H;

    board.RP_R.tx_usrapp.TSK_XDMA_REG_READ(16'h00);
      
    //-------------- Descriptor start address for both H2C and C2H --------------------------
    board.RP_R.tx_usrapp.TSK_XDMA_REG_WRITE(16'h4080, 32'h00000100, 4'hF);
    board.RP_R.tx_usrapp.TSK_XDMA_REG_WRITE(16'h5080, 32'h00000300, 4'hF);
    
    // completion count writeback addresses
    board.RP_R.tx_usrapp.TSK_XDMA_REG_WRITE(16'h0088, 32'h00000000, 4'hF);
    board.RP_R.tx_usrapp.TSK_XDMA_REG_WRITE(16'h008C, 32'h0, 4'hF);
    board.RP_R.tx_usrapp.TSK_XDMA_REG_WRITE(16'h1088, 32'h00000080, 4'hF);
    board.RP_R.tx_usrapp.TSK_XDMA_REG_WRITE(16'h108C, 32'h0, 4'hF);
      
 //add by caohy 

    //-------------- Start DMA tranfer ------------------------------------------------------
    
    $display(" **** Start DMA Stream for both H2C and C2H transfer ***\n");    
    
    board.RP_R.tx_usrapp.TSK_XDMA_REG_WRITE(16'h1004, 32'h2fffe7f, 4'hF);   // Enable C2H DMA
    fork
    board.RP_R.tx_usrapp.TSK_XDMA_REG_WRITE(16'h0004, 32'h2fffe7f, 4'hF);   // Enable H2C DMA
    
    //compare C2H data
    $display("------Compare C2H Data--------\n");
    board.RP_R.tx_usrapp.COMPARE_DATA_C2H({16'h0,board.RP_R.tx_usrapp.DMA_BYTE_CNT});
    join
    
    // Wait for data transfer complete.
    
    // For this example design there is 1 descriptor for H2c and 1 for C2H
    // Read C2H Descriptor count and wiat until it returns 1.
    // Becase it is a loopback, by reading C2H descriptor count to 1
    // it ensures H2C descriptor is also set to 1.
    loop_timeout = 0;
    desc_count = 0;
    while (desc_count == 0 && loop_timeout <= 10) begin
          board.RP_R.tx_usrapp.TSK_XDMA_REG_READ(16'h1040);
          $display ("**** C2H status = %h\n", P_READ_DATA);
          board.RP_R.tx_usrapp.TSK_XDMA_REG_READ(16'h0040);
          $display ("**** H2C status = %h\n", P_READ_DATA);
          board.RP_R.tx_usrapp.TSK_XDMA_REG_READ(16'h0048);
          $display ("**** H2C Decsriptor Count = %h\n", P_READ_DATA);
          board.RP_R.tx_usrapp.TSK_XDMA_REG_READ(16'h1048);
          $display ("**** C2H Decsriptor Count = %h\n", P_READ_DATA);
          if (P_READ_DATA == 32'h1) begin
            desc_count = 1;
          end else begin
            #10;
            loop_timeout = loop_timeout + 1;
          end
    end
    
        if (desc_count != 1) begin
            $display ("---***ERROR*** C2H Descriptor count mismatch,Loop Timeout occured ---\n");
        end
    // Read status of both H2C and C2H engines.
    board.RP_R.tx_usrapp.TSK_XDMA_REG_READ(16'h1040);
    c2h_status = P_READ_DATA;
    if (c2h_status != 32'h6) begin
        $display ("---***ERROR*** C2H status mismatch ---\n");
    end
    board.RP_R.tx_usrapp.TSK_XDMA_REG_READ(16'h0040);
    h2c_status = P_READ_DATA;
    if (h2c_status != 32'h6) begin
        $display ("---***ERROR*** H2C status mismatch ---\n");
    end
    // Disable run bit for H2C and C2H engine
    board.RP_R.tx_usrapp.TSK_XDMA_REG_WRITE(16'h1004, 32'h0, 4'hF);
    board.RP_R.tx_usrapp.TSK_XDMA_REG_WRITE(16'h0004, 32'h0, 4'hF);
//    modified by caohy168
    //-------------- Descriptor start address for both H2C and C2H --------------------------
    for (pkg_i=0; pkg_i< `dma_receive_pkg_mun; pkg_i=pkg_i+1)begin
    wait(board.RP_R.m_axis_rc_tready)
    board.RP_R.tx_usrapp.TSK_XDMA_REG_WRITE(16'h4080, 32'h00000100, 4'hF);
    board.RP_R.tx_usrapp.TSK_XDMA_REG_WRITE(16'h5080, 32'h00000300, 4'hF);
    
    // completion count writeback addresses
    board.RP_R.tx_usrapp.TSK_XDMA_REG_WRITE(16'h0088, 32'h00000000, 4'hF);
    board.RP_R.tx_usrapp.TSK_XDMA_REG_WRITE(16'h008C, 32'h0, 4'hF);
    board.RP_R.tx_usrapp.TSK_XDMA_REG_WRITE(16'h1088, 32'h00000080, 4'hF);
    board.RP_R.tx_usrapp.TSK_XDMA_REG_WRITE(16'h108C, 32'h0, 4'hF);
    
    //-------------- Start DMA tranfer ------------------------------------------------------
    
    $display(" **** Start DMA Stream for both H2C and C2H transfer ***\n");    
    
    board.RP_R.tx_usrapp.TSK_XDMA_REG_WRITE(16'h1004, 32'h2fffe7f, 4'hF);   // Enable C2H DMA
    fork
    board.RP_R.tx_usrapp.TSK_XDMA_REG_WRITE(16'h0004, 32'h2fffe7f, 4'hF);   // Enable H2C DMA
    
    //compare C2H data
    $display("------Compare C2H Data--------\n");
    board.RP_R.tx_usrapp.COMPARE_DATA_C2H({16'h0,board.RP_R.tx_usrapp.DMA_BYTE_CNT});
    join
    
    // Wait for data transfer complete.
    
    // For this example design there is 1 descriptor for H2c and 1 for C2H
    // Read C2H Descriptor count and wiat until it returns 1.
    // Becase it is a loopback, by reading C2H descriptor count to 1
    // it ensures H2C descriptor is also set to 1.
    loop_timeout = 0;
    desc_count = 0;
    while (desc_count == 0 && loop_timeout <= 10) begin
          board.RP_R.tx_usrapp.TSK_XDMA_REG_READ(16'h1040);
          $display ("**** C2H status = %h\n", P_READ_DATA);
          board.RP_R.tx_usrapp.TSK_XDMA_REG_READ(16'h0040);
          $display ("**** H2C status = %h\n", P_READ_DATA);
          board.RP_R.tx_usrapp.TSK_XDMA_REG_READ(16'h0048);
          $display ("**** H2C Decsriptor Count = %h\n", P_READ_DATA);
          board.RP_R.tx_usrapp.TSK_XDMA_REG_READ(16'h1048);
          $display ("**** C2H Decsriptor Count = %h\n", P_READ_DATA);
          if (P_READ_DATA == 32'h1) begin
            desc_count = 1;
          end else begin
            #10;
            loop_timeout = loop_timeout + 1;
          end
    end
    
        if (desc_count != 1) begin
            $display ("---***ERROR*** C2H Descriptor count mismatch,Loop Timeout occured ---\n");
        end
    // Read status of both H2C and C2H engines.
    board.RP_R.tx_usrapp.TSK_XDMA_REG_READ(16'h1040);
    c2h_status = P_READ_DATA;
    if (c2h_status != 32'h6) begin
        $display ("---***ERROR*** C2H status mismatch ---\n");
    end
    board.RP_R.tx_usrapp.TSK_XDMA_REG_READ(16'h0040);
    h2c_status = P_READ_DATA;
    if (h2c_status != 32'h6) begin
        $display ("---***ERROR*** H2C status mismatch ---\n");
    end
    // Disable run bit for H2C and C2H engine
    board.RP_R.tx_usrapp.TSK_XDMA_REG_WRITE(16'h1004, 32'h0, 4'hF);
    board.RP_R.tx_usrapp.TSK_XDMA_REG_WRITE(16'h0004, 32'h0, 4'hF);
    end
      

end


else if(testname =="dma_stream1")
begin
   
   //------------ This test performs H2C and C2H transactions with 2 descriptors of 32byte data each  
   //----------------------------------------------------------------------------------------
   // XDMA H2C Test Starts
   //----------------------------------------------------------------------------------------

    $display(" **** XDMA AXI-ST *** \n");
    $display(" **** read Address at BAR0  = %h\n", board.RP_R.tx_usrapp.BAR_INIT_P_BAR[0][31:0]);
    $display(" **** read Address at BAR1  = %h\n", board.RP_R.tx_usrapp.BAR_INIT_P_BAR[1][31:0]);

    //-------------- Load DATA in Buffer ----------------------------------------------------
    board.RP_R.tx_usrapp.TSK_INIT_DATA_H2C_2DS;
    board.RP_R.tx_usrapp.TSK_INIT_DATA_C2H_2DS;

    board.RP_R.tx_usrapp.TSK_XDMA_REG_READ(16'h00);
      
    //-------------- Descriptor start address for both H2C and C2H --------------------------
    board.RP_R.tx_usrapp.TSK_XDMA_REG_WRITE(16'h4080, 32'h00000100, 4'hF);
    board.RP_R.tx_usrapp.TSK_XDMA_REG_WRITE(16'h5080, 32'h00000300, 4'hF);
    
    // completion count writeback addresses
    board.RP_R.tx_usrapp.TSK_XDMA_REG_WRITE(16'h0088, 32'h00000000, 4'hF);
    board.RP_R.tx_usrapp.TSK_XDMA_REG_WRITE(16'h008C, 32'h0, 4'hF);
    board.RP_R.tx_usrapp.TSK_XDMA_REG_WRITE(16'h1088, 32'h00000080, 4'hF);
    board.RP_R.tx_usrapp.TSK_XDMA_REG_WRITE(16'h108C, 32'h0, 4'hF);
      
    //-------------- Start DMA tranfer ------------------------------------------------------
    $display(" **** Start DMA Stream for both H2C and C2H transfer ***\n");    
    
    board.RP_R.tx_usrapp.TSK_XDMA_REG_WRITE(16'h1004, 32'h2fffe7f, 4'hF);   // Enable C2H DMA
    fork
    board.RP_R.tx_usrapp.TSK_XDMA_REG_WRITE(16'h0004, 32'h2fffe7f, 4'hF);   // Enable H2C DMA
    
    //compare C2H data
    $display("------Compare C2H Data--------\n");
    board.RP_R.tx_usrapp.COMPARE_DATA_C2H_2DS({16'h0,board.RP_R.tx_usrapp.DMA_BYTE_CNT/2});
    join

    // Wait for data transfer complete.

    // For this example design there is 1 descriptor for H2c and 1 for C2H
    // Read C2H Descriptor count and wiat until it returns 1.
    // Becase it is a loopback, by reading C2H descriptor count to 1
    // it ensures H2C descriptor is also set to 1.
    loop_timeout = 0;
    desc_count = 0;
    while (desc_count == 0 && loop_timeout <= 10) begin
          board.RP_R.tx_usrapp.TSK_XDMA_REG_READ(16'h1040);
          $display ("**** C2H status = %h\n", P_READ_DATA);
          board.RP_R.tx_usrapp.TSK_XDMA_REG_READ(16'h0040);
          $display ("**** H2C status = %h\n", P_READ_DATA);
          board.RP_R.tx_usrapp.TSK_XDMA_REG_READ(16'h0048);
          $display ("**** H2C Decsriptor Count = %h\n", P_READ_DATA);
          board.RP_R.tx_usrapp.TSK_XDMA_REG_READ(16'h1048);
          $display ("**** C2H Decsriptor Count = %h\n", P_READ_DATA);
          if (P_READ_DATA == 32'h2) begin
            desc_count = 2;
          end else begin
            #10;
            loop_timeout = loop_timeout + 1;
          end
    end

        if (desc_count != 2) begin
            $display ("---***ERROR*** C2H Descriptor count mismatch,Loop Timeout occured ---\n");
        end
    // Read status of both H2C and C2H engines.
    board.RP_R.tx_usrapp.TSK_XDMA_REG_READ(16'h1040);
    c2h_status = P_READ_DATA;
    if (c2h_status != 32'h6) begin
        $display ("---***ERROR*** C2H status mismatch ---\n");
    end
    board.RP_R.tx_usrapp.TSK_XDMA_REG_READ(16'h0040);
    h2c_status = P_READ_DATA;
    if (h2c_status != 32'h6) begin
        $display ("---***ERROR*** H2C status mismatch ---\n");
    end
    // Disable run bit for H2C and C2H engine
    board.RP_R.tx_usrapp.TSK_XDMA_REG_WRITE(16'h1004, 32'h0, 4'hF);
    board.RP_R.tx_usrapp.TSK_XDMA_REG_WRITE(16'h0004, 32'h0, 4'hF);

    #100;  
   $finish;
end

else if(testname =="dma_test0")
begin

    //------------- This test performs a 32 bit write to a 32 bit Memory space and performs a read back

	//----------------------------------------------------------------------------------------
	// XDMA H2C Test Starts
	//----------------------------------------------------------------------------------------

    $display(" *** XDMA H2C *** \n");

    $display(" **** read Address at BAR0  = %h\n", board.RP_R.tx_usrapp.BAR_INIT_P_BAR[0][31:0]);
    $display(" **** read Address at BAR1  = %h\n", board.RP_R.tx_usrapp.BAR_INIT_P_BAR[1][31:0]);

    //-------------- Load DATA in Buffer ----------------------------------------------------
      board.RP_R.tx_usrapp.TSK_INIT_DATA_H2C;

	//-------------- DMA Engine ID Read -----------------------------------------------------
      board.RP_R.tx_usrapp.TSK_XDMA_REG_READ(16'h00);
      
    //-------------- Descriptor start address x0100 -----------------------------------------
	  board.RP_R.tx_usrapp.TSK_XDMA_REG_WRITE(16'h4080, 32'h00000100, 4'hF);
      
    //-------------- Start DMA tranfer ------------------------------------------------------
      $display(" **** Start DMA H2C transfer ***\n");

    fork
    //-------------- Writing XDMA CFG Register to start DMA Transfer for H2C ----------------
      board.RP_R.tx_usrapp.TSK_XDMA_REG_WRITE(16'h0004, 32'hfffe7f, 4'hF);   // Enable H2C DMA

    //-------------- compare H2C data -------------------------------------------------------
      $display("------Compare H2C Data--------\n");
      board.RP_R.tx_usrapp.COMPARE_DATA_H2C({16'h0,board.RP_R.tx_usrapp.DMA_BYTE_CNT});    //input payload bytes
    join
    loop_timeout = 0;
    desc_count = 0;
    //For this Example Design there is only one Descriptor used, so Descriptor Count would be 1
      while (desc_count == 0 && loop_timeout <= 10) begin
          board.RP_R.tx_usrapp.TSK_XDMA_REG_READ(16'h0040);
          $display ("**** H2C status = %h\n", P_READ_DATA);
          board.RP_R.tx_usrapp.TSK_XDMA_REG_READ(16'h48);
          $display ("**** H2C Decsriptor Count = %h\n", P_READ_DATA);
          if (P_READ_DATA == 32'h1) begin
            desc_count = 1;
          end else begin
            #10;
            loop_timeout = loop_timeout + 1;
          end

      end
      if (desc_count != 1) begin
          $display ("---***ERROR*** H2C Descriptor count mismatch,Loop Timeout occured ---\n");
      end
      board.RP_R.tx_usrapp.TSK_XDMA_REG_READ(16'h40);
      $display ("H2C DMA_STATUS  = %h\n", P_READ_DATA); // bit2 : Descriptor completed; bit1: Descriptor end; bit0: DMA Stopped
      h2c_status = P_READ_DATA;
      if (h2c_status != 32'h6) begin
        $display ("---***ERROR*** H2C status mismatch ---\n");
      end
	  $display ("bit2 : Descriptor completed; bit1: Descriptor end; bit0: DMA Stopped\n");

    //-------------- XDMA H2C and C2H Transfer separated by 1000ns --------------------------
      #1000;

    //----------------------------------------------------------------------------------------
    // XDMA C2H Test Starts
    //----------------------------------------------------------------------------------------
	
      $display(" *** XDMA C2H *** \n");

      desc_count = 0;
      loop_timeout = 0;
    //-------------- Load DATA in Buffer ----------------------------------------------------
      board.RP_R.tx_usrapp.TSK_INIT_DATA_C2H;

    //-------------- Descriptor start address x0300 -----------------------------------------
      board.RP_R.tx_usrapp.TSK_XDMA_REG_WRITE(16'h5080, 32'h00000300, 4'hF);

    // Start DMA transfer
      $display(" **** Start DMA C2H transfer ***\n");

    fork
    //-------------- Writing XDMA CFG Register to start DMA Transfer for C2H ----------------
      board.RP_R.tx_usrapp.TSK_XDMA_REG_WRITE(16'h1004, 32'hfffe7f, 4'hF);   // Enable C2H DMA

    //compare C2H data
      $display("------Compare C2H Data--------\n");
      board.RP_R.tx_usrapp.COMPARE_DATA_C2H({16'h0,board.RP_R.tx_usrapp.DMA_BYTE_CNT});
    join

    //For this Example Design there is only one Descriptor used, so Descriptor Count would be 1

      while (desc_count == 0 && loop_timeout <= 10) begin
          board.RP_R.tx_usrapp.TSK_XDMA_REG_READ(16'h1040);
          $display ("**** C2H status = %h\n", P_READ_DATA);
          board.RP_R.tx_usrapp.TSK_XDMA_REG_READ(16'h1048);
          $display ("**** C2H Decsriptor Count = %h\n", P_READ_DATA);
          if (P_READ_DATA == 32'h1) begin
            desc_count = 1;
          end else begin
            #10;
            loop_timeout = loop_timeout + 1;
          end
      end
      if (desc_count != 1) begin
          $display ("---***ERROR*** C2H Descriptor count mismatch,Loop Timeout occured ---\n");
      end
      board.RP_R.tx_usrapp.TSK_XDMA_REG_READ(16'h1040);
      $display ("C2H DMA_STATUS  = %h\n", P_READ_DATA); // bit2 : Descriptor completed; bit1: Descriptor end; bit0: DMA Stopped
      c2h_status = P_READ_DATA;
      if (c2h_status != 32'h6) begin
        $display ("---***ERROR*** C2H status mismatch ---\n");
      end
      $display ("bit2 : Descriptor completed; bit1: Descriptor end; bit0: DMA Stopped\n");



      #100;

    #1000;

   $finish;
end
else if(testname =="dma_test1")
begin

    //------------- This test performs H2C and C2H transactions with 2 descriptors of 32byte data each 

	//----------------------------------------------------------------------------------------
	// XDMA H2C Test Starts
	//----------------------------------------------------------------------------------------

    $display(" *** XDMA H2C *** \n");
    $display(" **** read Address at BAR0  = %h\n", board.RP_R.tx_usrapp.BAR_INIT_P_BAR[0][31:0]);
    $display(" **** read Address at BAR1  = %h\n", board.RP_R.tx_usrapp.BAR_INIT_P_BAR[1][31:0]);
    //-------------- Load DATA in Buffer ----------------------------------------------------
      board.RP_R.tx_usrapp.TSK_INIT_DATA_H2C_2DS;
	//-------------- DMA Engine ID Read -----------------------------------------------------
      board.RP_R.tx_usrapp.TSK_XDMA_REG_READ(16'h00);

    //-------------- Descriptor start address x0100 -----------------------------------------
	  board.RP_R.tx_usrapp.TSK_XDMA_REG_WRITE(16'h4080, 32'h00000100, 4'hF);
      
    //-------------- Start DMA tranfer ------------------------------------------------------
      $display(" **** Start DMA H2C transfer ***\n");

    fork
    //-------------- Writing XDMA CFG Register to start DMA Transfer for H2C ----------------
      board.RP_R.tx_usrapp.TSK_XDMA_REG_WRITE(16'h0004, 32'hfffe7f, 4'hF);   // Enable H2C DMA

    //-------------- compare H2C data -------------------------------------------------------
      $display("------Compare H2C Data--------\n");
      board.RP_R.tx_usrapp.COMPARE_DATA_H2C_2DS({16'h0,board.RP_R.tx_usrapp.DMA_BYTE_CNT/2});    //input payload bytes
    join
    loop_timeout = 0;
    desc_count = 0;
    //For this Example Design there is only one Descriptor used, so Descriptor Count would be 1
      while (desc_count == 0 && loop_timeout <= 10) begin
          board.RP_R.tx_usrapp.TSK_XDMA_REG_READ(16'h0040);
          $display ("**** H2C status = %h\n", P_READ_DATA);
          board.RP_R.tx_usrapp.TSK_XDMA_REG_READ(16'h48);
          $display ("**** H2C Decsriptor Count = %h\n", P_READ_DATA);
          if (P_READ_DATA == 32'h2) begin
            desc_count = 2;
          end else begin
            #10;
            loop_timeout = loop_timeout + 1;
          end

      end
      if (desc_count != 2) begin
          $display ("---***ERROR*** H2C Descriptor count mismatch,Loop Timeout occured ---\n");
      end
      board.RP_R.tx_usrapp.TSK_XDMA_REG_READ(16'h40);
      $display ("H2C DMA_STATUS  = %h\n", P_READ_DATA); // bit2 : Descriptor completed; bit1: Descriptor end; bit0: DMA Stopped
      h2c_status = P_READ_DATA;
      if (h2c_status != 32'h6) begin
        $display ("---***ERROR*** H2C status mismatch ---\n");
      end
	  $display ("bit2 : Descriptor completed; bit1: Descriptor end; bit0: DMA Stopped\n");

    //-------------- XDMA H2C and C2H Transfer separated by 1000ns --------------------------
      #1000;
    //----------------------------------------------------------------------------------------
    // XDMA C2H Test Starts
    //----------------------------------------------------------------------------------------
      $display(" *** XDMA C2H *** \n");

      desc_count = 0;
      loop_timeout = 0;
    //-------------- Load DATA in Buffer ----------------------------------------------------
      board.RP_R.tx_usrapp.TSK_INIT_DATA_C2H_2DS;
    //-------------- Descriptor start address x0300 -----------------------------------------
      board.RP_R.tx_usrapp.TSK_XDMA_REG_WRITE(16'h5080, 32'h00000300, 4'hF);
    // Start DMA transfer
      $display(" **** Start DMA C2H transfer ***\n");

    fork
    //-------------- Writing XDMA CFG Register to start DMA Transfer for C2H ----------------
      board.RP_R.tx_usrapp.TSK_XDMA_REG_WRITE(16'h1004, 32'hfffe7f, 4'hF);   // Enable C2H DMA

    //compare C2H data
      $display("------Compare C2H Data--------\n");
      board.RP_R.tx_usrapp.COMPARE_DATA_C2H_2DS({16'h0,board.RP_R.tx_usrapp.DMA_BYTE_CNT/2}); 
    join

    //For this Example Design there is only one Descriptor used, so Descriptor Count would be 1

      while (desc_count == 0 && loop_timeout <= 10) begin
          board.RP_R.tx_usrapp.TSK_XDMA_REG_READ(16'h1040);
          $display ("**** C2H status = %h\n", P_READ_DATA);
          board.RP_R.tx_usrapp.TSK_XDMA_REG_READ(16'h1048);
          $display ("**** C2H Decsriptor Count = %h\n", P_READ_DATA);
          if (P_READ_DATA == 32'h2) begin
            desc_count = 2;
          end else begin
            #10;
            loop_timeout = loop_timeout + 1;
          end
      end
      if (desc_count != 2) begin
          $display ("---***ERROR*** C2H Descriptor count mismatch,Loop Timeout occured ---\n");
      end
      board.RP_R.tx_usrapp.TSK_XDMA_REG_READ(16'h1040);
      $display ("C2H DMA_STATUS  = %h\n", P_READ_DATA); // bit2 : Descriptor completed; bit1: Descriptor end; bit0: DMA Stopped
      c2h_status = P_READ_DATA;
      if (c2h_status != 32'h6) begin
        $display ("---***ERROR*** C2H status mismatch ---\n");
      end
      $display ("bit2 : Descriptor completed; bit1: Descriptor end; bit0: DMA Stopped\n");


      #100;

    #1000;

   $finish;
end


else if(testname == "dma_irq_test")
begin

    // This test performs a single descriptor H2c transaction and generates an DMA interrupt once the descriptor successfully completed

    
    $display(" *** XDMA H2C *** \n");

    $display(" **** read Address at BAR0  = %h\n", board.RP_R.tx_usrapp.BAR_INIT_P_BAR[0][31:0]);
    $display(" **** read Address at BAR1  = %h\n", board.RP_R.tx_usrapp.BAR_INIT_P_BAR[1][31:0]);
 
    //-------------- Load DATA in Buffer ----------------------------------------------------
      board.RP_R.tx_usrapp.TSK_INIT_DATA_H2C;

	//-------------- DMA Engine ID Read -----------------------------------------------------
      board.RP_R.tx_usrapp.TSK_XDMA_REG_READ(16'h00);
    //  board.baseband_processor.bbp_receive.EP.xdma_0_i.usr_irq_req = 'b1;
    //-------------- Descriptor start address x0100 -----------------------------------------
	  board.RP_R.tx_usrapp.TSK_XDMA_REG_WRITE(16'h4080, 32'h00000100, 4'hF);
     
      board.RP_R.tx_usrapp.TSK_XDMA_REG_WRITE(16'h0090, 32'h00000004, 4'hF);   // mask enable
      board.RP_R.tx_usrapp.TSK_XDMA_REG_WRITE(16'h2010, 32'h00000001, 4'hF);   // irq block channel mask
    //-------------- Start DMA tranfer ------------------------------------------------------
      $display(" **** Start DMA H2C transfer ***\n");

    fork
    //-------------- Writing XDMA CFG Register to start DMA Transfer for H2C ----------------
      board.RP_R.tx_usrapp.TSK_XDMA_REG_WRITE(16'h0004, 32'hfffe7f, 4'hF);   // Enable H2C DMA

    //-------------- compare H2C data -------------------------------------------------------
      $display("------Compare H2C Data--------\n");
      board.RP_R.tx_usrapp.COMPARE_DATA_H2C({16'h0,(board.RP_R.tx_usrapp.DMA_BYTE_CNT/2)});    //input payload bytes

  
  
    join
    loop_timeout = 0;
    desc_count = 0;
   
      
    //For this Example Design there is only one Descriptor used, so Descriptor Count would be 1
      while (desc_count == 0 && loop_timeout <= 3) begin
          board.RP_R.tx_usrapp.TSK_XDMA_REG_READ(16'h0040);
          $display ("**** H2C status = %h\n", P_READ_DATA);
          board.RP_R.tx_usrapp.TSK_XDMA_REG_READ(16'h48);
          $display ("**** H2C Decsriptor Count = %h\n", P_READ_DATA);
          if (P_READ_DATA == 32'h1) begin
            desc_count = 1;
          end else begin
            #10;
            loop_timeout = loop_timeout + 1;
          end

      end
      if (desc_count != 1) begin
          $display ("---***ERROR*** H2C Descriptor count mismatch,Loop Timeout occured ---\n");
      end
      board.RP_R.tx_usrapp.TSK_XDMA_REG_READ(16'h40);
      $display ("H2C DMA_STATUS  = %h\n", P_READ_DATA); // bit2 : Descriptor completed; bit1: Descriptor end; bit0: DMA Stopped
      h2c_status = P_READ_DATA;
      if (h2c_status != 32'h6) begin
        $display ("---***ERROR*** H2C status mismatch ---\n");
      end
	  $display ("bit2 : Descriptor completed; bit1: Descriptor end; bit0: DMA Stopped\n");
	  
	  
      board.RP_R.tx_usrapp.TSK_XDMA_REG_READ(16'h0044);
      $display ("**** READ to CLEAR THE INTERRUPT/H2C **** = %h\n", P_READ_DATA);  
      board.RP_R.tx_usrapp.TSK_XDMA_REG_READ(16'h2044);
      $display ("**** READ to CLEAR THE INTERRUPT/BLOCK CHANNEL ***** = %h\n", P_READ_DATA);  


   $finish;
end


else if(testname == "usr_irq_msix_test")
begin
        board.RP_R.tx_usrapp.TSK_MSIX_EN;

        board.RP_R.tx_usrapp.TSK_XDMA_REG_WRITE((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h0040),32'h00000001,4'hF);
        board.RP_R.tx_usrapp.TSK_XDMA_REG_WRITE((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h0044),32'h00000000,4'hF);
        board.RP_R.tx_usrapp.TSK_XDMA_REG_WRITE((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h0048),32'h11111111,4'hF);
        board.RP_R.tx_usrapp.TSK_XDMA_REG_WRITE((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h004C),32'h00000000,4'hF);
        
        board.RP_R.tx_usrapp.TSK_XDMA_REG_WRITE((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h0050),32'h00000002,4'hF);
        board.RP_R.tx_usrapp.TSK_XDMA_REG_WRITE((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h0054),32'h00000000,4'hF);
        board.RP_R.tx_usrapp.TSK_XDMA_REG_WRITE((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h0058),32'h22222222,4'hF);
        board.RP_R.tx_usrapp.TSK_XDMA_REG_WRITE((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h005C),32'h00000000,4'hF);
        board.RP_R.tx_usrapp.TSK_XDMA_REG_WRITE((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h0060),32'h00000003,4'hF);
        board.RP_R.tx_usrapp.TSK_XDMA_REG_WRITE((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h0064),32'h00000000,4'hF);
        board.RP_R.tx_usrapp.TSK_XDMA_REG_WRITE((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h0068),32'h33333333,4'hF);
        board.RP_R.tx_usrapp.TSK_XDMA_REG_WRITE((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h006C),32'h00000000,4'hF);
        board.RP_R.tx_usrapp.TSK_XDMA_REG_WRITE((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h0070),32'h00000004,4'hF);
        board.RP_R.tx_usrapp.TSK_XDMA_REG_WRITE((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h0074),32'h00000000,4'hF);
        board.RP_R.tx_usrapp.TSK_XDMA_REG_WRITE((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h0078),32'h44444444,4'hF);
        board.RP_R.tx_usrapp.TSK_XDMA_REG_WRITE((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h007C),32'h00000000,4'hF);
        board.RP_R.tx_usrapp.TSK_XDMA_REG_WRITE((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h0080),32'h00000005,4'hF);
        board.RP_R.tx_usrapp.TSK_XDMA_REG_WRITE((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h0084),32'h00000000,4'hF);
        board.RP_R.tx_usrapp.TSK_XDMA_REG_WRITE((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h0088),32'h55555555,4'hF);
        board.RP_R.tx_usrapp.TSK_XDMA_REG_WRITE((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h008C),32'h00000000,4'hF);
        board.RP_R.tx_usrapp.TSK_XDMA_REG_WRITE((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h0090),32'h00000006,4'hF);
        board.RP_R.tx_usrapp.TSK_XDMA_REG_WRITE((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h0094),32'h00000000,4'hF);
        board.RP_R.tx_usrapp.TSK_XDMA_REG_WRITE((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h0098),32'h66666666,4'hF);
        board.RP_R.tx_usrapp.TSK_XDMA_REG_WRITE((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h009C),32'h00000000,4'hF);
        board.RP_R.tx_usrapp.TSK_XDMA_REG_WRITE((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h00A0),32'h00000007,4'hF);
        board.RP_R.tx_usrapp.TSK_XDMA_REG_WRITE((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h00A4),32'h00000000,4'hF);
        board.RP_R.tx_usrapp.TSK_XDMA_REG_WRITE((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h00A8),32'h77777777,4'hF);
        board.RP_R.tx_usrapp.TSK_XDMA_REG_WRITE((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h00AC),32'h00000000,4'hF);
        board.RP_R.tx_usrapp.TSK_XDMA_REG_WRITE((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h00B0),32'h00000008,4'hF);
        board.RP_R.tx_usrapp.TSK_XDMA_REG_WRITE((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h00B4),32'h00000000,4'hF);
        board.RP_R.tx_usrapp.TSK_XDMA_REG_WRITE((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h00B8),32'h88888888,4'hF);
        board.RP_R.tx_usrapp.TSK_XDMA_REG_WRITE((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h00BC),32'h00000000,4'hF);
        board.RP_R.tx_usrapp.TSK_XDMA_REG_WRITE((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h00C0),32'h00000009,4'hF);
        board.RP_R.tx_usrapp.TSK_XDMA_REG_WRITE((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h00C4),32'h00000000,4'hF);
        board.RP_R.tx_usrapp.TSK_XDMA_REG_WRITE((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h00C8),32'h99999999,4'hF);
        board.RP_R.tx_usrapp.TSK_XDMA_REG_WRITE((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h00CC),32'h00000000,4'hF);
        board.RP_R.tx_usrapp.TSK_XDMA_REG_WRITE((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h00D0),32'h0000000A,4'hF);
        board.RP_R.tx_usrapp.TSK_XDMA_REG_WRITE((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h00D4),32'h00000000,4'hF);
        board.RP_R.tx_usrapp.TSK_XDMA_REG_WRITE((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h00D8),32'hAAAAAAAA,4'hF);
        board.RP_R.tx_usrapp.TSK_XDMA_REG_WRITE((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h00DC),32'h00000000,4'hF);
        board.RP_R.tx_usrapp.TSK_XDMA_REG_WRITE((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h00E0),32'h0000000B,4'hF);
        board.RP_R.tx_usrapp.TSK_XDMA_REG_WRITE((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h00E4),32'h00000000,4'hF);
        board.RP_R.tx_usrapp.TSK_XDMA_REG_WRITE((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h00E8),32'hBBBBBBBB,4'hF);
        board.RP_R.tx_usrapp.TSK_XDMA_REG_WRITE((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h00EC),32'h00000000,4'hF);
        board.RP_R.tx_usrapp.TSK_XDMA_REG_WRITE((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h00F0),32'h0000000C,4'hF);
        board.RP_R.tx_usrapp.TSK_XDMA_REG_WRITE((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h00F4),32'h00000000,4'hF);
        board.RP_R.tx_usrapp.TSK_XDMA_REG_WRITE((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h00F8),32'hCCCCCCCC,4'hF);
        board.RP_R.tx_usrapp.TSK_XDMA_REG_WRITE((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h00FC),32'h00000000,4'hF);
        board.RP_R.tx_usrapp.TSK_XDMA_REG_WRITE((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h0100),32'h0000000D,4'hF);
        board.RP_R.tx_usrapp.TSK_XDMA_REG_WRITE((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h0104),32'h00000000,4'hF);
        board.RP_R.tx_usrapp.TSK_XDMA_REG_WRITE((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h0108),32'hDDDDDDDD,4'hF);
        board.RP_R.tx_usrapp.TSK_XDMA_REG_WRITE((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h010C),32'h00000000,4'hF);
        board.RP_R.tx_usrapp.TSK_XDMA_REG_WRITE((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h0110),32'h0000000E,4'hF);
        board.RP_R.tx_usrapp.TSK_XDMA_REG_WRITE((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h0114),32'h00000000,4'hF);
        board.RP_R.tx_usrapp.TSK_XDMA_REG_WRITE((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h0118),32'hEEEEEEEE,4'hF);
        board.RP_R.tx_usrapp.TSK_XDMA_REG_WRITE((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h011C),32'h00000000,4'hF);
        board.RP_R.tx_usrapp.TSK_XDMA_REG_WRITE((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h0120),32'h0000000F,4'hF);
        board.RP_R.tx_usrapp.TSK_XDMA_REG_WRITE((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h0124),32'h00000000,4'hF);
        board.RP_R.tx_usrapp.TSK_XDMA_REG_WRITE((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h0128),32'hFFFFFFFF,4'hF);
        board.RP_R.tx_usrapp.TSK_XDMA_REG_WRITE((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h012C),32'h00000000,4'hF);
        board.RP_R.tx_usrapp.TSK_XDMA_REG_WRITE((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h0130),32'h00000010,4'hF);
        board.RP_R.tx_usrapp.TSK_XDMA_REG_WRITE((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h0134),32'h00000000,4'hF);
        board.RP_R.tx_usrapp.TSK_XDMA_REG_WRITE((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h0138),32'h76543210,4'hF);
        board.RP_R.tx_usrapp.TSK_XDMA_REG_WRITE((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h013C),32'h00000000,4'hF);

        board.RP_R.tx_usrapp.TSK_XDMA_REG_READ((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h0040));
        board.RP_R.tx_usrapp.TSK_XDMA_REG_READ((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h0044));
        board.RP_R.tx_usrapp.TSK_XDMA_REG_READ((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h0048));
        board.RP_R.tx_usrapp.TSK_XDMA_REG_READ((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h004C));
        board.RP_R.tx_usrapp.TSK_XDMA_REG_READ((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h0050));
        board.RP_R.tx_usrapp.TSK_XDMA_REG_READ((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h0054));
        board.RP_R.tx_usrapp.TSK_XDMA_REG_READ((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h0058));
        board.RP_R.tx_usrapp.TSK_XDMA_REG_READ((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h005C));
        board.RP_R.tx_usrapp.TSK_XDMA_REG_READ((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h0060));
        board.RP_R.tx_usrapp.TSK_XDMA_REG_READ((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h0064));
        board.RP_R.tx_usrapp.TSK_XDMA_REG_READ((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h0068));
        board.RP_R.tx_usrapp.TSK_XDMA_REG_READ((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h006C));
        board.RP_R.tx_usrapp.TSK_XDMA_REG_READ((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h0070));
        board.RP_R.tx_usrapp.TSK_XDMA_REG_READ((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h0074));
        board.RP_R.tx_usrapp.TSK_XDMA_REG_READ((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h0078));
        board.RP_R.tx_usrapp.TSK_XDMA_REG_READ((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h007C));
        board.RP_R.tx_usrapp.TSK_XDMA_REG_READ((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h0080));
        board.RP_R.tx_usrapp.TSK_XDMA_REG_READ((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h0084));
        board.RP_R.tx_usrapp.TSK_XDMA_REG_READ((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h0088));
        board.RP_R.tx_usrapp.TSK_XDMA_REG_READ((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h008C));
        board.RP_R.tx_usrapp.TSK_XDMA_REG_READ((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h0090));
        board.RP_R.tx_usrapp.TSK_XDMA_REG_READ((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h0094));
        board.RP_R.tx_usrapp.TSK_XDMA_REG_READ((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h0098));
        board.RP_R.tx_usrapp.TSK_XDMA_REG_READ((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h009C));
        board.RP_R.tx_usrapp.TSK_XDMA_REG_READ((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h00A0));
        board.RP_R.tx_usrapp.TSK_XDMA_REG_READ((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h00A4));
        board.RP_R.tx_usrapp.TSK_XDMA_REG_READ((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h00A8));
        board.RP_R.tx_usrapp.TSK_XDMA_REG_READ((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h00AC));
        board.RP_R.tx_usrapp.TSK_XDMA_REG_READ((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h00B0));
        board.RP_R.tx_usrapp.TSK_XDMA_REG_READ((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h00B4));
        board.RP_R.tx_usrapp.TSK_XDMA_REG_READ((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h00B8));
        board.RP_R.tx_usrapp.TSK_XDMA_REG_READ((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h00BC));
        board.RP_R.tx_usrapp.TSK_XDMA_REG_READ((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h00C0));
        board.RP_R.tx_usrapp.TSK_XDMA_REG_READ((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h00C4));
        board.RP_R.tx_usrapp.TSK_XDMA_REG_READ((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h00C8));
        board.RP_R.tx_usrapp.TSK_XDMA_REG_READ((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h00CC));
        board.RP_R.tx_usrapp.TSK_XDMA_REG_READ((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h00D0));
        board.RP_R.tx_usrapp.TSK_XDMA_REG_READ((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h00D4));
        board.RP_R.tx_usrapp.TSK_XDMA_REG_READ((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h00D8));
        board.RP_R.tx_usrapp.TSK_XDMA_REG_READ((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h00DC));
        board.RP_R.tx_usrapp.TSK_XDMA_REG_READ((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h00E0));
        board.RP_R.tx_usrapp.TSK_XDMA_REG_READ((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h00E4));
        board.RP_R.tx_usrapp.TSK_XDMA_REG_READ((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h00E8));
        board.RP_R.tx_usrapp.TSK_XDMA_REG_READ((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h00EC));
        board.RP_R.tx_usrapp.TSK_XDMA_REG_READ((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h00F0));
        board.RP_R.tx_usrapp.TSK_XDMA_REG_READ((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h00F4));
        board.RP_R.tx_usrapp.TSK_XDMA_REG_READ((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h00F8));
        board.RP_R.tx_usrapp.TSK_XDMA_REG_READ((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h00FC));
        board.RP_R.tx_usrapp.TSK_XDMA_REG_READ((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h0100));
        board.RP_R.tx_usrapp.TSK_XDMA_REG_READ((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h0104));
        board.RP_R.tx_usrapp.TSK_XDMA_REG_READ((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h0108));
        board.RP_R.tx_usrapp.TSK_XDMA_REG_READ((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h010C));
        board.RP_R.tx_usrapp.TSK_XDMA_REG_READ((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h0110));
        board.RP_R.tx_usrapp.TSK_XDMA_REG_READ((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h0114));
        board.RP_R.tx_usrapp.TSK_XDMA_REG_READ((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h0118));
        board.RP_R.tx_usrapp.TSK_XDMA_REG_READ((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h011C));
        board.RP_R.tx_usrapp.TSK_XDMA_REG_READ((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h0120));
        board.RP_R.tx_usrapp.TSK_XDMA_REG_READ((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h0124));
        board.RP_R.tx_usrapp.TSK_XDMA_REG_READ((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h0128));
        board.RP_R.tx_usrapp.TSK_XDMA_REG_READ((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h012C));
        board.RP_R.tx_usrapp.TSK_XDMA_REG_READ((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h0130));
        board.RP_R.tx_usrapp.TSK_XDMA_REG_READ((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h0134));
        board.RP_R.tx_usrapp.TSK_XDMA_REG_READ((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h0138));
        board.RP_R.tx_usrapp.TSK_XDMA_REG_READ((board.RP_R.tx_usrapp.PF0_MSIX_TABLE_BASE | 32'h013C));

        board.RP_R.tx_usrapp.TSK_XDMA_REG_READ(16'h3014); // check MSIX enablement for PF0 MSIX
        board.RP_R.tx_usrapp.TSK_XDMA_REG_WRITE(32'h2080,32'h07060504,4'hF);
        board.RP_R.tx_usrapp.TSK_XDMA_REG_WRITE(32'h2084,32'h0B0A0908,4'hF);
        board.RP_R.tx_usrapp.TSK_XDMA_REG_WRITE(32'h2088,32'h0F0E0D0C,4'hF);
        board.RP_R.tx_usrapp.TSK_XDMA_REG_WRITE(32'h208C,32'h13121110,4'hF);
        for (board.RP_R.tx_usrapp.j=0;board.RP_R.tx_usrapp.j < board.baseband_processor.bbp_receive.EP.C_NUM_USR_IRQ;board.RP_R.tx_usrapp.j=board.RP_R.tx_usrapp.j+1) begin
            board.RP_R.tx_usrapp.usr_irq_enable_mask = board.RP_R.tx_usrapp.usr_irq_enable_mask | (1 << board.RP_R.tx_usrapp.j);
        end
        board.RP_R.tx_usrapp.TSK_XDMA_REG_WRITE(32'h2004,board.RP_R.tx_usrapp.usr_irq_enable_mask,4'hF);
        board.RP_R.tx_usrapp.TSK_XDMA_REG_READ(16'h2004);
        #10000;
        fork
            begin
                for (board.RP_R.tx_usrapp.j=0;board.RP_R.tx_usrapp.j < board.baseband_processor.bbp_receive.EP.C_NUM_USR_IRQ;board.RP_R.tx_usrapp.j=board.RP_R.tx_usrapp.j+1) begin
                board.baseband_processor.bbp_receive.EP.usr_irq_req[board.RP_R.tx_usrapp.j] = 1'b1;
                wait (board.baseband_processor.bbp_receive.EP.usr_irq_ack[board.RP_R.tx_usrapp.j] == 1);
                wait (board.baseband_processor.bbp_receive.EP.usr_irq_ack[board.RP_R.tx_usrapp.j] == 0);
                board.baseband_processor.bbp_receive.EP.usr_irq_req[board.RP_R.tx_usrapp.j] = 1'b0;
                end
            end
        join
        #10000;
   

   $finish;
end
else if(testname == "sample_smoke_test0")
begin


    TSK_SIMULATION_TIMEOUT(5050);

    //System Initialization
    TSK_SYSTEM_INITIALIZATION;




    
    $display("[%t] : Expected Device/Vendor ID = %x", $realtime, DEV_VEN_ID); 
    
    //--------------------------------------------------------------------------
    // Read core configuration space via PCIe fabric interface
    //--------------------------------------------------------------------------

    $display("[%t] : Reading from PCI/PCI-Express Configuration Register 0x00", $realtime);

    TSK_TX_TYPE0_CONFIGURATION_READ(DEFAULT_TAG, 12'h0, 4'hF);
    TSK_WAIT_FOR_READ_DATA;
    if  (P_READ_DATA != DEV_VEN_ID) begin
        $display("[%t] : TEST FAILED --- Data Error Mismatch, Write Data %x != Read Data %x", $realtime, 
                                    DEV_VEN_ID, P_READ_DATA);
    end
    else begin
        $display("[%t] : TEST PASSED --- Device/Vendor ID %x successfully received", $realtime, P_READ_DATA);
        $display("[%t] : Test Completed Successfully",$realtime);
    end

    //--------------------------------------------------------------------------
    // Direct Root Port to allow upstream traffic by enabling Mem, I/O and
    // BusMstr in the command register
    //--------------------------------------------------------------------------

    board.RP_R.cfg_usrapp.TSK_READ_CFG_DW(32'h00000001);
    board.RP_R.cfg_usrapp.TSK_WRITE_CFG_DW(32'h00000001, 32'h00000007, 4'b0001);
    board.RP_R.cfg_usrapp.TSK_READ_CFG_DW(32'h00000001);

  $finish;
end


else if(testname == "sample_smoke_test1")
begin

    // This test use tlp expectation tasks.

    TSK_SIMULATION_TIMEOUT(5050);

    // System Initialization
    TSK_SYSTEM_INITIALIZATION;
    // Program BARs (Required so Completer ID at the Endpoint is updated)
    TSK_BAR_INIT;

fork
  begin
    //--------------------------------------------------------------------------
    // Read core configuration space via PCIe fabric interface
    //--------------------------------------------------------------------------

    $display("[%t] : Reading from PCI/PCI-Express Configuration Register 0x00", $realtime);

    TSK_TX_TYPE0_CONFIGURATION_READ(DEFAULT_TAG, 12'h0, 4'hF);
    DEFAULT_TAG = DEFAULT_TAG + 1;
    TSK_TX_CLK_EAT(100);
  end
    //---------------------------------------------------------------------------
    // List Rx TLP expections
    //---------------------------------------------------------------------------
  begin
    test_vars[0] = 0;                                                                                                                         
                                          
    $display("[%t] : Expected Device/Vendor ID = %x", $realtime, DEV_VEN_ID);                                              

    expect_cpld_payload[0] = DEV_VEN_ID[31:24];
    expect_cpld_payload[1] = DEV_VEN_ID[23:16];
    expect_cpld_payload[2] = DEV_VEN_ID[15:8];
    expect_cpld_payload[3] = DEV_VEN_ID[7:0];
    @(posedge board.RP_R.pcie_4_0_rport.pcie_rq_tag_vld0);
    exp_tag = board.RP_R.pcie_4_0_rport.pcie_rq_tag0;

    board.RP_R.com_usrapp.TSK_EXPECT_CPLD(
      3'h0, //traffic_class;
      1'b0, //td;
      1'b0, //ep;
      2'h0, //attr;
      10'h1, //length;
      board.RP_R.tx_usrapp.EP_BUS_DEV_FNS, //completer_id;
      3'h0, //completion_status;
      1'b0, //bcm;
      12'h4, //byte_count;
      board.RP_R.tx_usrapp.RP_BUS_DEV_FNS, //requester_id;
      exp_tag ,
      7'b0, //address_low;
      expect_status //expect_status;
    );

    if (expect_status) 
      test_vars[0] = test_vars[0] + 1;      
  end
join
  
  expect_finish_check = 1;

  if (test_vars[0] == 1) begin
    $display("[%t] : TEST PASSED --- Finished transmission of PCI-Express TLPs", $realtime);
    $display("[%t] : Test Completed Successfully",$realtime);
  end else begin
    $display("[%t] : TEST FAILED --- Haven't Received All Expected TLPs", $realtime);

    //--------------------------------------------------------------------------
    // Direct Root Port to allow upstream traffic by enabling Mem, I/O and
    // BusMstr in the command register
    //--------------------------------------------------------------------------

    board.RP_R.cfg_usrapp.TSK_READ_CFG_DW(32'h00000001);
    board.RP_R.cfg_usrapp.TSK_WRITE_CFG_DW(32'h00000001, 32'h00000007, 4'b0001);
    board.RP_R.cfg_usrapp.TSK_READ_CFG_DW(32'h00000001);

  end

  $finish;
end

else if(testname == "pio_writeReadBack_test0")
begin

    // This test performs a 32 bit write to a 32 bit Memory space and performs a read back

    board.RP_R.tx_usrapp.TSK_SIMULATION_TIMEOUT(10050);

    board.RP_R.tx_usrapp.TSK_SYSTEM_INITIALIZATION;

    board.RP_R.tx_usrapp.TSK_BAR_INIT;

//--------------------------------------------------------------------------
// Event : Testing BARs
//--------------------------------------------------------------------------

        for (board.RP_R.tx_usrapp.ii = 0; board.RP_R.tx_usrapp.ii <= 6; board.RP_R.tx_usrapp.ii =
            board.RP_R.tx_usrapp.ii + 1) begin
            if ((board.RP_R.tx_usrapp.BAR_INIT_P_BAR_ENABLED[board.RP_R.tx_usrapp.ii] > 2'b00)) // bar is enabled
               case(board.RP_R.tx_usrapp.BAR_INIT_P_BAR_ENABLED[board.RP_R.tx_usrapp.ii])
                   2'b01 : // IO SPACE
                        begin

                          $display("[%t] : Transmitting TLPs to IO Space BAR %x", $realtime, board.RP_R.tx_usrapp.ii);

                          //--------------------------------------------------------------------------
                          // Event : IO Write bit TLP
                          //--------------------------------------------------------------------------



                          board.RP_R.tx_usrapp.TSK_TX_IO_WRITE(board.RP_R.tx_usrapp.DEFAULT_TAG,
                             board.RP_R.tx_usrapp.BAR_INIT_P_BAR[board.RP_R.tx_usrapp.ii][31:0], 4'hF, 32'hdead_beef);
                             @(posedge pcie_rq_tag_vld);
                             exp_tag = pcie_rq_tag;


                          board.RP_R.com_usrapp.TSK_EXPECT_CPL(3'h0, 1'b0, 1'b0, 2'b0,
                             board.RP_R.tx_usrapp.EP_BUS_DEV_FNS, 3'h0, 1'b0, 12'h4,
                             board.RP_R.tx_usrapp.RP_BUS_DEV_FNS, exp_tag,
                             board.RP_R.tx_usrapp.BAR_INIT_P_BAR[board.RP_R.tx_usrapp.ii][31:0], test_vars[0]);

                          board.RP_R.tx_usrapp.TSK_TX_CLK_EAT(10);
                          board.RP_R.tx_usrapp.DEFAULT_TAG = board.RP_R.tx_usrapp.DEFAULT_TAG + 1;

                          //--------------------------------------------------------------------------
                          // Event : IO Read bit TLP
                          //--------------------------------------------------------------------------


                          // make sure P_READ_DATA has known initial value
                          board.RP_R.tx_usrapp.P_READ_DATA = 32'hffff_ffff;
                          fork
                             board.RP_R.tx_usrapp.TSK_TX_IO_READ(board.RP_R.tx_usrapp.DEFAULT_TAG,
                                board.RP_R.tx_usrapp.BAR_INIT_P_BAR[board.RP_R.tx_usrapp.ii][31:0], 4'hF);
                             board.RP_R.tx_usrapp.TSK_WAIT_FOR_READ_DATA;
                          join
                          if  (board.RP_R.tx_usrapp.P_READ_DATA != 32'hdead_beef)
                             begin
			       testError=1'b1;
                               $display("[%t] : Test FAILED --- Data Error Mismatch, Write Data %x != Read Data %x",
                                   $realtime, 32'hdead_beef, board.RP_R.tx_usrapp.P_READ_DATA);
                             end
                          else
                             begin
                               $display("[%t] : Test PASSED --- Write Data: %x successfully received",
                                   $realtime, board.RP_R.tx_usrapp.P_READ_DATA);
                             end


                          board.RP_R.tx_usrapp.TSK_TX_CLK_EAT(10);
                          board.RP_R.tx_usrapp.DEFAULT_TAG = board.RP_R.tx_usrapp.DEFAULT_TAG + 1;


                        end

                   2'b10 : // MEM 32 SPACE
                        begin


                          $display("[%t] : Transmitting TLPs to Memory 32 Space BAR %x", $realtime,
                              board.RP_R.tx_usrapp.ii);

                          //--------------------------------------------------------------------------
                          // Event : Memory Write 32 bit TLP
                          //--------------------------------------------------------------------------

                          board.RP_R.tx_usrapp.DATA_STORE[0] = 8'h04;
                          board.RP_R.tx_usrapp.DATA_STORE[1] = 8'h03;
                          board.RP_R.tx_usrapp.DATA_STORE[2] = 8'h02;
                          board.RP_R.tx_usrapp.DATA_STORE[3] = 8'h01;

                          board.RP_R.tx_usrapp.TSK_TX_MEMORY_WRITE_32(board.RP_R.tx_usrapp.DEFAULT_TAG,
                              board.RP_R.tx_usrapp.DEFAULT_TC, 11'd1,
                              board.RP_R.tx_usrapp.BAR_INIT_P_BAR[board.RP_R.tx_usrapp.ii][31:0]+8'h10, 4'h0, 4'hF, 1'b0);
                          board.RP_R.tx_usrapp.TSK_TX_CLK_EAT(100);
                          board.RP_R.tx_usrapp.DEFAULT_TAG = board.RP_R.tx_usrapp.DEFAULT_TAG + 1;

                          //--------------------------------------------------------------------------
                          // Event : Memory Read 32 bit TLP
                          //--------------------------------------------------------------------------


                         // make sure P_READ_DATA has known initial value
                         board.RP_R.tx_usrapp.P_READ_DATA = 32'hffff_ffff;
                          fork
                             board.RP_R.tx_usrapp.TSK_TX_MEMORY_READ_32(board.RP_R.tx_usrapp.DEFAULT_TAG,
                                 board.RP_R.tx_usrapp.DEFAULT_TC, 11'd1,
                                 board.RP_R.tx_usrapp.BAR_INIT_P_BAR[board.RP_R.tx_usrapp.ii][31:0]+8'h10, 4'h0, 4'hF);
                             board.RP_R.tx_usrapp.TSK_WAIT_FOR_READ_DATA;
                          join

                          if (board.RP_R.tx_usrapp.ii == 6)
                          begin
                            $display("[%t] : Test DISABLED --- EROM is Read-Only Memory. Read Data: %x successfully received",
                                     $realtime, board.RP_R.tx_usrapp.P_READ_DATA);
                          end
                          else
                          begin
                            if  (board.RP_R.tx_usrapp.P_READ_DATA != {board.RP_R.tx_usrapp.DATA_STORE[3],
                               board.RP_R.tx_usrapp.DATA_STORE[2], board.RP_R.tx_usrapp.DATA_STORE[1],
                               board.RP_R.tx_usrapp.DATA_STORE[0] })
                               begin
			         testError=1'b1;
                                 $display("[%t] : Test FAILED --- Data Error Mismatch, Write Data %x != Read Data %x",
                                      $realtime, {board.RP_R.tx_usrapp.DATA_STORE[3],board.RP_R.tx_usrapp.DATA_STORE[2],
                                       board.RP_R.tx_usrapp.DATA_STORE[1],board.RP_R.tx_usrapp.DATA_STORE[0]},
                                       board.RP_R.tx_usrapp.P_READ_DATA);

                               end
                            else
                               begin
                                 $display("[%t] : Test PASSED --- Write Data: %x successfully received",
                                     $realtime, board.RP_R.tx_usrapp.P_READ_DATA);
                               end
                          end

                          board.RP_R.tx_usrapp.TSK_TX_CLK_EAT(10);
                          board.RP_R.tx_usrapp.DEFAULT_TAG = board.RP_R.tx_usrapp.DEFAULT_TAG + 1;

                     end
                2'b11 : // MEM 64 SPACE
                     begin


                          $display("[%t] : Transmitting TLPs to Memory 64 Space BAR %x", $realtime,
                              board.RP_R.tx_usrapp.ii);


                          //--------------------------------------------------------------------------
                          // Event : Memory Write 64 bit TLP
                          //--------------------------------------------------------------------------

                          board.RP_R.tx_usrapp.DATA_STORE[0] = 8'h64;
                          board.RP_R.tx_usrapp.DATA_STORE[1] = 8'h63;
                          board.RP_R.tx_usrapp.DATA_STORE[2] = 8'h62;
                          board.RP_R.tx_usrapp.DATA_STORE[3] = 8'h61;

                          board.RP_R.tx_usrapp.TSK_TX_MEMORY_WRITE_64(board.RP_R.tx_usrapp.DEFAULT_TAG,
                              board.RP_R.tx_usrapp.DEFAULT_TC, 10'd1,
                              {board.RP_R.tx_usrapp.BAR_INIT_P_BAR[board.RP_R.tx_usrapp.ii+1][31:0],
                              board.RP_R.tx_usrapp.BAR_INIT_P_BAR[board.RP_R.tx_usrapp.ii][31:0]+8'h20}, 4'h0, 4'hF, 1'b0);
                          board.RP_R.tx_usrapp.TSK_TX_CLK_EAT(10);
                          board.RP_R.tx_usrapp.DEFAULT_TAG = board.RP_R.tx_usrapp.DEFAULT_TAG + 1;

                          //--------------------------------------------------------------------------
                          // Event : Memory Read 64 bit TLP
                          //--------------------------------------------------------------------------


                          // make sure P_READ_DATA has known initial value
                          board.RP_R.tx_usrapp.P_READ_DATA = 32'hffff_ffff;
                          fork
                             board.RP_R.tx_usrapp.TSK_TX_MEMORY_READ_64(board.RP_R.tx_usrapp.DEFAULT_TAG,
                                 board.RP_R.tx_usrapp.DEFAULT_TC, 10'd1,
                                 {board.RP_R.tx_usrapp.BAR_INIT_P_BAR[board.RP_R.tx_usrapp.ii+1][31:0],
                                 board.RP_R.tx_usrapp.BAR_INIT_P_BAR[board.RP_R.tx_usrapp.ii][31:0]+8'h20}, 4'h0, 4'hF);
                             board.RP_R.tx_usrapp.TSK_WAIT_FOR_READ_DATA;
                          join
                          if  (board.RP_R.tx_usrapp.P_READ_DATA != {board.RP_R.tx_usrapp.DATA_STORE[3],
                             board.RP_R.tx_usrapp.DATA_STORE[2], board.RP_R.tx_usrapp.DATA_STORE[1],
                             board.RP_R.tx_usrapp.DATA_STORE[0] })

                             begin
			       testError=1'b1;
                               $display("[%t] : Test FAILED --- Data Error Mismatch, Write Data %x != Read Data %x",
                                   $realtime, {board.RP_R.tx_usrapp.DATA_STORE[3],
                                   board.RP_R.tx_usrapp.DATA_STORE[2], board.RP_R.tx_usrapp.DATA_STORE[1],
                                   board.RP_R.tx_usrapp.DATA_STORE[0]}, board.RP_R.tx_usrapp.P_READ_DATA);

                             end
                          else
                             begin
                               $display("[%t] : Test PASSED --- Write Data: %x successfully received",
                                   $realtime, board.RP_R.tx_usrapp.P_READ_DATA);
                             end


                          board.RP_R.tx_usrapp.TSK_TX_CLK_EAT(10);
                          board.RP_R.tx_usrapp.DEFAULT_TAG = board.RP_R.tx_usrapp.DEFAULT_TAG + 1;


                     end
                default : $display("Error case in usrapp_tx\n");
            endcase

         end
    if(testError==1'b0)
      $display("[%t] : Test Completed Successfully",$realtime);

    $display("[%t] : Finished transmission of PCI-Express TLPs", $realtime);
    $finish;
end
