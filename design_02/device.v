
module device(clk, r, EC, Q);
    input           clk,
                    r,
                    EC;
    output  [3:0]   Q;

    wire nr, nc, c3, c2, c1, c0, nc3, nq0, nq1, nq2, nq3, q3_1, q3_2;

    not         u1(r, nr),
                u2(clk, nc),
                u3(c3, nc3),
                u4(q3_1, q3_2),
                u5(q3_2, Q[3]);
    nor         u6(nc, EC, c3);
    not_and2    u7(nc3, q3_2, c2);
    not_and3    u8(nc3, q3_2, nq2, c1);
    not_and4    u9(nc3, q3_2, nq2, nq1, c0);
    sdctt       uA(.clk(c3), .d(nq3), .s(nr), .q(q3_1), .nq(nq3)),
                uB(.clk(c2), .d(nq2), .s(nr), .q(Q[2]), .nq(nq2)),
                uC(.clk(c1), .d(nq1), .s(nr), .q(Q[1]), .nq(nq1)),
                uD(.clk(c0), .d(nq0), .s(nr), .q(Q[0]), .nq(nq0));
endmodule

