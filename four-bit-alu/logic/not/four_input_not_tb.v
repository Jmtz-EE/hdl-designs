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
        $shm_probe(NOT4_tb, "AS");
    end

    task check;
        reg [3:0] expx, expy;
        begin
            expx = ~a_tb;
            expy = ~b_tb;
            if (x_tb !== expx || y_tb !== expy) begin
                errors = errors + 1;
                $display("ERROR @ t=%0t: a=%b b=%b | x=%b y=%b | exp x=%b y=%b",
                         $time, a_tb, b_tb, x_tb, y_tb, expx, expy);
            end
        end
    endtask

    initial begin
        a_tb = 4'b0000; b_tb = 4'b0000;
        $monitor("t=%0t ns | a=%b b=%b -> x=%b y=%b",
                 $time, a_tb, b_tb, x_tb, y_tb);

        #1 check;
        
        #10 a_tb = 4'b1111; b_tb = 4'b1111; #1 check;
        #10 a_tb = 4'b1010; b_tb = 4'b0101; #1 check;
        #10 a_tb = 4'b1100; b_tb = 4'b0011; #1 check;
        #10 a_tb = 4'b0001; b_tb = 4'b1000; #1 check;
        #10 a_tb = 4'b0110; b_tb = 4'b1001; #1 check;
        #10 a_tb = 4'b0101; b_tb = 4'b0011; #1 check;

        // Summary
        #1;
        if (errors == 0) $display("PASS: all vectors matched.");
        else             $display("FAIL: %0d mismatches.", errors);

        #10 $finish;
    end

endmodule
