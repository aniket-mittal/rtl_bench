module autovcoder_021001 #(
    parameter data_width = 14
) (
    input [data_width-1:0] din,
    input rst,
    clk,
    output wire [data_width-1:0] dout
);

  reg [data_width-1:0] t0, t1, t2, t3, t4, t5, t6;
  reg [data_width-1:0] t7, t8, t9, t10, t11, t12;

  always @(posedge clk or posedge rst) begin
    if (rst) begin
      t0  <= 0;
      t1  <= 0;
      t2  <= 0;
      t3  <= 0;
      t4  <= 0;
      t5  <= 0;
      t6  <= 0;
      t7  <= 0;
      t8  <= 0;
      t9  <= 0;
      t10 <= 0;
      t11 <= 0;
      t12 <= 0;
    end else begin
      t0  <= din;
      t1  <= t0;
      t2  <= t1;
      t3  <= t2;
      t4  <= t3;
      t5  <= t4;
      t6  <= t5;
      t7  <= t6;
      t8  <= t7;
      t9  <= t8;
      t10 <= t9;
      t11 <= t10;
      t12 <= t11;
    end
  end

  assign dout = t12;
endmodule

