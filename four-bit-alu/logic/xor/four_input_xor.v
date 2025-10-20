`timescale 1ns/1ps
`defeault_nettype none
module xor_4 (
    input  wire [3:0] a,b, 
    output wire [3:0] y
);
    assign y = a ^ b;
endmodule
`defeault_nettype wire 