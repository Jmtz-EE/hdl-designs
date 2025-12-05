//place holder
module fourBitFA(
    input  [3:0] a,b,
    input cin, 
    output [3:0]s
    output cout
)
assign s[0] = a[0] ^ b[0];
assign s[1] = a[1] ^ b[1];
assign s[2] = a[2] ^ b[2];
assign s[3] = a[3] ^ b[3];


endmodule 