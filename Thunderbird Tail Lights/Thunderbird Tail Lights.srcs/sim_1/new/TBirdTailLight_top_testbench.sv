`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/16/2018 12:42:54 PM
// Design Name: 
// Module Name: TBirdTailLight_top_testbench
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


module TBirdTailLight_top_testbench();
    logic clk = 1'b0, scaled_clk = 1'b0;
    logic reset;
    logic left, right;
    logic la, lb, lc, ra, rb, rc;
    
    parameter Time_Period = 10;
    
    // creates clock with a 1ms period
    always #(Time_Period/2) clk = ~clk;
    
    // instantiates devices under test
    Clock_Scalar DUT1(.clk(clk),
                  .reset(reset),
                  .scaled_clk(scaled_clk));
                      
    TBirdTailLights DUT2(.clk(clk), 
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
        #1000000000
        reset = 0; right = 1;
        #1000000000
        right = 0; left = 1;
    end

endmodule
