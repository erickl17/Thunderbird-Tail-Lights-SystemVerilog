`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/15/2018 09:06:35 PM
// Design Name: 
// Module Name: TBirdTailLights_testbench
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


module TBirdTailLights_testbench();
    logic clk = 1'b0;
    logic reset;
    logic left, right;
    logic la, lb, lc, ra, rb, rc;
    
    parameter Time_Period = 10;
    
    // creates clock with a 1ms period
    always #(Time_Period/2) clk = ~clk;

    // instantiates devices under test
    TBirdTailLights DUT(.clk(clk), 
                        .reset(reset), 
                        .right(right),
                        .left(left),
                        .la(la),
                        .lb(lb),
                        .lc(lc),
                        .ra(ra),
                        .rb(rb),
                        .rc(rc));
    
    initial begin
        reset = 1;
        #10
        reset = 0; right = 1;
        #10
        right = 0; left = 1;
    end
    
endmodule
