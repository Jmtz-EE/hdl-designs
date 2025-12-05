//16x1 multiplexer 

module sixteenToOneMux (
    input [15:0]a,
    input [3:0] s,
    output f
);
    wire [3:0] y; 

    fourToOneMux muxA(.a(a[0]),  .b(a[1]),  .c(a[2]),  .d(a[3]),  .s0(s[0]), .s1(s[1]), .f(y[0]));
    fourToOneMux muxB(.a(a[4]),  .b(a[5]),  .c(a[6]),  .d(a[7]),  .s0(s[0]), .s1(s[1]), .f(y[1]));
    fourToOneMux muxC(.a(a[8]),  .b(a[9]),  .c(a[10]), .d(a[11]), .s0(s[0]), .s1(s[1]), .f(y[2]));
    fourToOneMux muxD(.a(a[12]), .b(a[13]), .c(a[14]), .d(a[15]), .s0(s[0]), .s1(s[1]), .f(y[3]));
    fourToOneMux muxF(.a(y[0]),  .b(y[1]),  .c(y[2]),  .d(y[3]),  .s0(s[2]), .s1(s[3]), .f(f));

endmodule
