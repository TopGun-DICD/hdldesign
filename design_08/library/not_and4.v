module not_and4(x1, x2, x3, x4, y);
    input   x1, x2, x3, x4;
    output  y;

    assign y = ~x1 & ~x2 & ~x3 & ~x4;
endmodule