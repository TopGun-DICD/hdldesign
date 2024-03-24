module device(clk, r, PE, D, Q);
    input           clk,
                    r;
    input   [1:0]   PE;
    input   [3:0]   D;
    output  [3:0]   Q;

    wire en, nen, nc, nr, q1, q2, q3, q4, d1, d2, d3, d4;

    not_and u1(PE[1], PE[0], en);
    not     u1(nen, en),
            u2(nc, clk),
            u3(nr, r);
    ao22    u1(q1, nen, en, D[0], d1),
            u2(q2, nen, en, D[1], d2),
            u3(q3, nen, en, D[2], d3),
            u4(q4, nen, en, D[3], d4);
    dcrtt   u1(.clk(nc), .d(d1), .r(nr), .q(q1), .nq(Q[0])),
            u2(.clk(nc), .d(d2), .r(nr), .q(q2), .nq(Q[1])),
            u3(.clk(nc), .d(d3), .r(nr), .q(q3), .nq(Q[2])),
            u4(.clk(nc), .d(d4), .r(nr), .q(q4), .nq(Q[3]));
endmodule

