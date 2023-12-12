`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: ABHISHEK KUMAR KUSHWAHA
// 
// Create Date: 12.12.2023 12:06:20
// Design Name: 
// Module Name: glitch_free_clock_mux
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


module glitch_free_clock_mux(

    input clk1,
    input clk2,
    input sel,
    input rst_n,
    output clk_out  

    );
    
 //Registers
 reg r_clk2_ff1;   
 reg r_clk2_ff2;  
 reg r_clk1_ff1;  
 reg r_clk1_ff2;
 
 //wires
 wire i_and1;  
 wire i_and2;  
 wire o_and1;  
 wire o_and2;  
 
 // and login input side
 
 assign i_and1 = (!sel) && (!r_clk2_ff2);
 assign i_and2 = (sel)  && (!r_clk1_ff2);
 
 // and logic output side
 assign o_and1 = clk1 && r_clk1_ff2 ;
 assign o_and2 = clk2 && r_clk2_ff2 ;
 
 
 // output logic
 
 assign clk_out = o_and1 || o_and2 ;
 
 
 //sync clk1
 always @(posedge clk1 or negedge rst_n) begin
    if(!rst_n) begin
    r_clk1_ff1 <= 1'b0;
    r_clk1_ff2 <= 1'b0;
    end
    
    else begin
    r_clk1_ff1 <= i_and1;
    r_clk1_ff2 <= r_clk1_ff1;
    end
  
 end
    
  //sync clk2
 always @(posedge clk2 or negedge rst_n) begin
    if(!rst_n) begin
    r_clk2_ff1 <= 1'b0;
    r_clk2_ff2 <= 1'b0;
    end
    
    else begin
    r_clk2_ff1 <= i_and2;
    r_clk2_ff2 <= r_clk2_ff1;
    end
  
 end
           
endmodule
