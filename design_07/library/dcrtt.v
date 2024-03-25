module dcrtt(
  input clk, r,
  input d,
  output reg q, nq
);
  always@(posedge clk or posedge r) begin
    if(r == 1'b1) begin
      q <= 1'b0;
      nq <= 1'b1;
    end
    else begin
      q <= d;
      nq <= ~d;
    end
  end
endmodule