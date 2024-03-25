
module device(clk, r, EC, Q);
    input           clk,
                    r,
                    EC;
    output  [3:0]   Q;

    wire nr, nc, c3, c2, c1, c0, nc3, nq0, nq1, nq2, nq3, q3_1, q3_2;

    not         u1(.y(nr), 		.x(r));
    not         u2(.y(nc), 		.x(clk));
    not         u3(.y(nc3), 	.x(c3));
    not         u4(.y(q3_2), 	.x(q3_1));
    not         u5(.y(Q[3]), 	.x(q3_2));
    nor2        u6(.y(c3), .x2(nc), .x1(EC));
    not_and2    u7(.x2(nc3), .x1(q3_2), .y(c2));
    not_and3    u8(.x3(nc3), .x1(q3_2), .x2(nq2), .y(c1));
    not_and4    u9(.x1(nc3), .x2(q3_2), .x3(nq2), .x4(nq1), .y(c0));
    sdctt       uA(.clk(c3), .d(nq3), .s(nr), .Q(q3_1), .nQ(nq3)),
                uB(.clk(c2), .d(nq2), .s(nr), .Q(Q[2]), .nQ(nq2)),
                uC(.clk(c1), .d(nq1), .s(nr), .Q(Q[1]), .nQ(nq1)),
                uD(.clk(c0), .d(nq0), .s(nr), .Q(Q[0]), .nQ(nq0));
endmodule

