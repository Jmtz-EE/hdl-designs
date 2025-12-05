// Explicit 2x1 Mux 

module mux2x1 (
    input a0,
    input b0,
    input s,
    output y;
);

    wire ns;
    wire w0,w1;

    not (ns,s);
    and (w0,a0,ns);
    and (w1,b0,s);
    or  (y,w1,w0);

endmodule