`timescale 1ns/1ps
`default_nettype none 

module NOT4_tb; 

    reg  [3:0] a_tb, b_tb;
    wire [3:0] x_tb, y_tb;

    NOT4 dut (
        .a(a_tb),
        .b(b_tb),
        .x(x_tb),
        .y(y_tb)
        );   
    
    integer errors = 0;
    
    initial begin
        $shm_open("waves.shm");
        $shm_probe("NOT4_tb", "AS");
    end

    task check;
        reg [3:0] exp1, exp2;
            begin
                exp1 = ~a_tb;
                exp2 = ~b_tb;

    initial 
        begin
            #10 a_tb = 

        end

endmodule