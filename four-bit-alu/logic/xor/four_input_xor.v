`timescale 1ns/1ps
`defeault_nettype none
module xor_4 (
    input [3:0] a,b, 
    output [3:0] y
);
    assign y = a ^ b;
endmodule
`defeault_nettype wire 