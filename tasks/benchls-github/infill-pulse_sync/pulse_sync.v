module pulse_sync (
  output wire dout,
  input  wire inclk,
  input  wire rst_inclk,
  input  wire outclk,
  input  wire rst_outclk,
  input  wire din
);

  (* ASYNC_REG = "TRUE" *) reg din_d1;
  (* ASYNC_REG = "TRUE" *) reg t;
  reg [2:0] t_d;
  reg       dout_r;

  always @(posedge inclk) begin
    if(rst_inclk) begin
      din_d1 <= 1'b0;
      t <= 1'b0;
    end else begin
      din_d1 <= din;
      if(din && !din_d1) begin
         t <= ~t;
      end
    end
  end

  [MASKED]

  assign dout = dout_r;

endmodule