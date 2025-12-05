//2 to 1 mux using ?:

module twoToOneMux
(
    input a0, b0, s,
    output y
);
    assign y = s ? a0 : b0;

endmodule   