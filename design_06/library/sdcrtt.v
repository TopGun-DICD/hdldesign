module sdcrtt(clk, d, s, r, q, nq);
    input       clk, d, s, r;
    output reg  q, nq;

    always@(posedge clk, posedge r, posedge s)
        if(s == 1'b1 && r == 1'b0) begin
            q <= 0'b1;
            nq <= 0'b0;
        end
        else if(s == 1'b0 && r == 1'b1) begin
            q <= 1'b0;
            nq <= 1'b1;
        end
        else begin
            q <= d;
            nq <= ~d;
        end
endmodule