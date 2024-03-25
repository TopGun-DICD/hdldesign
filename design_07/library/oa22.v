module ao22(
  input x1, x2, x3, x4,
  output y
);
  assign y = (x1 & x2) | (x3 & x4);
endmodule
