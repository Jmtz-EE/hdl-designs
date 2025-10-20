`timescale 1ns/1ps
`default_nettype none
module NOT4 (
    input[3:0] a,b,
    output[3:0] x,y
);
    assign x = ~a;
    assign y = ~b; 
endmodule
`default_nettype wire