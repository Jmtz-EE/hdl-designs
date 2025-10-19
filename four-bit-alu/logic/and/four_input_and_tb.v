`timescale 1ns/1ps
`default_nettype none // prevents typos from defualting to wires 

module AND4_tb;

    //Declare registers for testbench inputs
    reg  [3:0] a_tb, b_tb;
    wire [3:0] y_tb;

    //DUT instantiation
    AND4 dut (
    .a(a_tb), 
    .b(b_tb),
    .y(y_tb)
    );

    integer errors = 0; //holds errors

     //xcellium wave dump 
        initial begin
        $shm_open("waves.shm");       // open SHM database
        $shm_probe("AND4_tb", "AS");   // A=all nets/regs, S=structure
        end

        task check;
            reg [3:0] exp;
                begin 
                    exp = (a_tb & b_tb); 
                    if(y_tb !== exp) 
                    begin
                        errors = errors +1;
                        $error("Mismatch @ t=%0t: a=%b b=%b y=%b expected=%b",
                        $time, a_tb, b_tb, y_tb, (a_tb & b_tb));
                    end
                end
            endtask;


    //Initial block to provide stimulus
    initial begin
        /*initialize inputs 
        wire types will default to high z and reg default to x unknown value.*/ 
        a_tb = 4'b0000;
        b_tb = 4'b0000;

        //Monitor
        $monitor("t=%0t ns | a=%b b=%b -> y=%b", $time, a_tb, b_tb, y_tb);
        
        #10 a_tb = 4'b1111; b_tb = 4'b1111; check();
        #10 a_tb = 4'b1010; b_tb = 4'b1100; check();
        #10 a_tb = 4'b0110; b_tb = 4'b1001; check();
        #10 a_tb = 4'b1111; b_tb = 4'b0000; check();
        #10 a_tb = 4'b0000; b_tb = 4'b1111; check();
        #10 a_tb = 4'b0101; b_tb = 4'b0011; check();

        #1;
        if (errors == 0) $display("PASS: all vectors matched.");
        else             $display("FAIL: %0d mismatches.", errors);

        #10 $finish; //the end of the simulation is specified by $finish
    end 
endmodule