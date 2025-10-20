`timescale 1ns/1ps
`default_nettype none
module xnor_4 (
    input [3:0] a,b,
    output [3:0] y
);
    assign y = ~(a ^ b);
endmodule
`default_nettype wire