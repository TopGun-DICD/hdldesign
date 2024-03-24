module dcrtt(clk, d, r, q, nq);
    input       clk, d, r;
    output reg  q, nq;

    always@(posedge clk, posedge r)
        if(r == 1'b1) begin
            q <= 1'b1;
            nq <= 1'b0;
        end
        else begin
            q <= d;
            n1 <= ~d;
        end
endmodule