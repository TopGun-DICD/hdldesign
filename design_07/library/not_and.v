module not_and(
  input x1, x2,
  output y
);
  assign y = ~x1 & ~x2;
endmodule
