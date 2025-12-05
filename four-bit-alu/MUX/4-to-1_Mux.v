//4-to-1 Mux using hierarchy

module fourToOneMux (
    input a,b,c,d,s0,s1,
    output f
);
    wire y1, y2;
    twoToOneMux MuxA(.a0(a), .b0(b), .s(s0), .y(y1));
    twoToOneMux MuxB(.a0(c), .b0(d), .s(s0), .y(y2));
    twoToOneMux MuxF(.a0(y1), .b0(y2), .s(s1), .y(f));
    
endmodule