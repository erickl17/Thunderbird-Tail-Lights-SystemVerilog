`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/16/2018 11:25:28 AM
// Design Name: 
// Module Name: Clock_Scalar_testbench
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


module Clock_Scalar_testbench();
    logic clk = 1'b0;
    logic reset;
    logic scaled_clk;
    
    parameter Time_Period = 10;

    always #(Time_Period/2) clk = ~clk;

    Clock_Scalar DUT(.clk(clk),
                     .reset(reset),
                     .scaled_clk(scaled_clk));

    initial begin
        reset = 1;
        #10
        reset = 0;
    end

endmodule
