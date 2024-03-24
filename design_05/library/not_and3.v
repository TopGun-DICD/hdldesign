module not_and3(x1, x2, x3, y);
    input   x1, x2, x3;
    output  y;

    assign y = ~x1 & ~x2 & ~x3;
endmodule
