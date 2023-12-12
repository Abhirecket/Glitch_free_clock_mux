`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: ABHISHEK KUMAR KUSHWAHA
// 
// Create Date: 12.12.2023 12:06:34
// Design Name: 
// Module Name: tb
// Project Name: 
// Target Devices: 
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


module tb;

  // Parameters
  parameter CLK_PERIOD = 10; // Clock period in ns

  // Signals
  reg clk1;
  reg clk2;
  reg sel;
  reg rst_n;
  wire clk_out;

  // Instantiate the module
  glitch_free_clock_mux dut (
    .clk1(clk1),
    .clk2(clk2),
    .sel(sel),
    .rst_n(rst_n),
    .clk_out(clk_out)
  );

  // Clock generation
  always #((CLK_PERIOD / 2)) clk1 = ~clk1;
  always #(1.25 *(CLK_PERIOD)) clk2 = ~clk2;

  // Initial block
  initial begin
    // Initialize signals
    clk1 = 0;
    clk2 = 0;
    rst_n = 0;
    sel = 0;
    
    #12.5 rst_n = 1;

    // Testcase 1: Select clk1
    #26 sel = 1;
    #20;

    // Testcase 2: Select clk2
    #2 sel = 1;
    #20;

    // Testcase 1: Select clk1
    #14 sel = 0; //82
    #80;

    // Testcase 2: Select clk2
    #1 sel = 1; //91
    #20;
    // Add more test cases as needed
    // Testcase 1: Select clk1
    #26 sel = 1;
    #20;

    // Testcase 2: Select clk2
    #2 sel = 1;
    #20;

    // Testcase 1: Select clk1
    #14 sel = 0; //82
    #28;

    // Testcase 2: Select clk2
    #1 sel = 1; //91
    #20;
        // Testcase 1: Select clk1
    #26 sel = 1;
    #20;

    // Testcase 2: Select clk2
    #2 sel = 1;
    #20;

    // Testcase 1: Select clk1
    #14 sel = 0; //82
    #80;

    // Testcase 2: Select clk2
    #1 sel = 1; //91
    #20;
        // Testcase 1: Select clk1
    #26 sel = 1;
    #20;

    // Testcase 2: Select clk2
    #2 sel = 1;
    #20;

    // Testcase 1: Select clk1
    #14 sel = 0; //82
    #80;

    // Testcase 2: Select clk2
    #1 sel = 1; //91
    #20;
    // Add delay to observe the output
    #10000 $stop;
  end

endmodule