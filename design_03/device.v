module device(D, s, r, clk, Q);
    input           D,
                    s,
                    r,
                    clk;
    output  [3:0]   Q;

    wire        tmp1;
    wire [1:0]  tmp2, tmp3;

    nand2   uA(s, r, tmp1),
            uB(s, tmp1, tmp2[0]),
            uC(r, tmp1, tmp2[1]);
    sdcrtt  u1(.clk(nc), .d(D),    .s(tmp3[0]), .r(tmp3[1]), .q(Q[0]), .nq()),
            u2(.clk(nc), .d(Q[0]), .s(tmp3[0]), .r(tmp3[1]), .q(Q[1]), .nq()),
            u3(.clk(nc), .d(Q[1]), .s(tmp3[0]), .r(tmp3[1]), .q(Q[2]), .nq()),
            u4(.clk(nc), .d(Q[2]), .s(tmp3[0]), .r(tmp3[1]), .q(Q[3]), .nq());
    not     u8(nc, clk),
            u9(tmp3[0], tmp2[0]),
            uA(tmp3[1], tmp2[1]);
endmodule

