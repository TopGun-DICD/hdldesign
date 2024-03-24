module not_and2(x1, x2, y);
    input   x1, x2;
    output  y;

    assign y = ~x1 & ~x2;
endmodule
