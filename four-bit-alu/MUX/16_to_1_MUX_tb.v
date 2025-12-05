//16 to 1 mux test bench 

`timescale 1ps/1ps

module sixteenToOneMuxTB;

    reg [15:0] a;
    reg [ 3:0] s;
    wire f;

    //instantiate the DUT
    sixteenToOneMux(.a(a), .s(s), .f(f));

integer i,t;

initial begin
    $display("---Sixteen to One Mux TB ---");












endmodule
