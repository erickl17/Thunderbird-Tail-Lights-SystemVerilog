`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/15/2018 08:28:54 PM
// Design Name: 
// Module Name: TBirdTailLights
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


module TBirdTailLights(input logic clk,
                       input logic reset,
                       input logic right, left,
                       output logic la, lb, lc, ra, rb, rc);
                       
    typedef enum logic [2:0] {S0, S1, S2, S3, S4, S5, S6} statetype;
    statetype state, nextstate;
    
    // state register
    always_ff @(posedge clk, posedge reset)
    begin
        if (reset) 
            state <= S0;
        else
            state <= nextstate;
    end
    
    // next state logic
    always_comb
    begin
        case(state)
            S0: if (left)
                    nextstate = S1;
                else if (right)
                    nextstate = S4;
                else
                    nextstate = S0;
            S1: nextstate = S2;
            S2: nextstate = S3;
            S3: nextstate = S0;
            S4: nextstate = S5;
            S5: nextstate = S6;
            S6: nextstate = S0;
            default: nextstate = S0;
            endcase
    end
    
    // output logic
    always_comb
    begin
        case(state)
        S0: {lc, lb, la, ra, rb, rc} = 6'b000000;
        S1: {lc, lb, la, ra, rb, rc} = 6'b001000;
        S2: {lc, lb, la, ra, rb, rc} = 6'b011000;
        S3: {lc, lb, la, ra, rb, rc} = 6'b111000;
        S4: {lc, lb, la, ra, rb, rc} = 6'b000100;
        S5: {lc, lb, la, ra, rb, rc} = 6'b000110;
        S6: {lc, lb, la, ra, rb, rc} = 6'b000111;
        default: {lc, lb, la, ra, rb, rc} = 6'b000000;
        endcase
    end
    
endmodule


module Clock_Scalar(input logic clk,
                    input logic reset,
                    output logic scaled_clk);
    
    logic [27:0] counter;

    always @(posedge clk, posedge reset)
    begin
        if (reset)
            begin
                scaled_clk <= 0;
                counter <= 0;
            end
        else
            begin
                if (counter == 27'd50_000_000)
                begin
                    counter <= 0;
                    scaled_clk <= ~scaled_clk;
                end
                else
                begin
                    counter <= counter + 1;
                end
            end
    end

endmodule
