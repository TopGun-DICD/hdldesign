module not_and2(x1, x2, x3, x4, y);
    input   x1, x2, x3, x4;
    output  y;

    assign y = ~x1 & ~x2 & ~x3 & ~x4;
endmodule