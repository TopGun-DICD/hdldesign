module device(
  input clk, r,
  input [1:0] PE,
  input [3:0] D,
  output [3:0] Q
);
  wire en, nen, nc, nr, q1, q2, q3, q4, d1, d2, d3, d4;
  not_and u1(PE[0], PE[1], en);
  assign nen = ~en;
  assign nc = ~clk;
  assign nr = ~r;
  oa22  u5(q1, nen, en, D[0], d1),
        u6(q2, nen, en, D[1], d2),
        u7(q3, nen, en, D[2], d3),
        u8(q4, nen, en, D[3], d4);
  dcrtt u9(.clk(nc), .d(d1), .r(nr), .q(q1), .nq(Q[0])),
        uA(.clk(nc), .d(d2), .r(nr), .q(q2), .nq(Q[1])),
        uB(.clk(nc), .d(d3), .r(nr), .q(q3), .nq(Q[2])),
        uC(.clk(nc), .d(d4), .r(nr), .q(q4), .nq(Q[3]));
endmodule

