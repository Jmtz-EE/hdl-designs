// 16 to 1 mux test bench 

`timescale 1ps/1ps

module sixteenToOneMuxTB;

    reg  [15:0] a;
    reg  [3:0]  s;
    wire        f;

    integer i;

    // Instantiate the DUT
    sixteenToOneMux dut (
        .a(a),
        .s(s),
        .f(f)
    );

    initial begin
        $display("--- Sixteen to One Mux TB ---");

        // Initialize
        a = 16'b0;
        s = 4'b0;

        // Give some time for initialization
        #10;

        // Loop through all 16 select values
        for (i = 0; i < 16; i = i + 1) begin
            // Make 'a' one-hot at position i
            a = 16'b0;
            a[i] = 1'b1;   // only bit i is 1

            s = i[3:0];    // select that input
            #10;           // wait for propagation

            $display("time=%0t  s=%2d (%b)  a=%016b  f=%b  (expected=%b)",
                     $time, i, s, a, f, a[i]);

            if (f !== a[i]) begin
                $display("ERROR: mismatch at s=%0d  expected %b, got %b", i, a[i], f);
            end
        end

        $display("--- Testbench finished ---");
        #10;
        $finish;
    end

endmodule
