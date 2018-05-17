`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/15/2018 09:52:41 PM
// Design Name: 
// Module Name: TBirdTailLights_top
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


module TBirdTailLights_top(input logic clk,
                           input logic reset,
                           input logic right, left,
                           output logic la, lb, lc, ra, rb, rc);
                       
    logic scaled_clk; 
    
    Clock_Scalar clockScalar(.clk(clk),
                      .reset(reset),
                      .scaled_clk(scaled_clk));

    TBirdTailLights tailLights(.clk(scaled_clk), 
                         .reset(reset), 
                         .right(right),
                         .left(left),
                         .la(la),
                         .lb(lb),
                         .lc(lc),
                         .ra(ra),
                         .rb(rb),
                         .rc(rc));
                     
endmodule
