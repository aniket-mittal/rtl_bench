module autovcoder_032855 (
    input io_tick,
    input io_clear,
    input [15:0] io_limit,
    output io_full,
    output [15:0] io_value,
    input toplevel_io_axiClk,
    input toplevel_resetCtrl_axiReset
);
  wire [0:0] _zz_1_;
  wire [15:0] _zz_2_;
  reg [15:0] counter;
  wire limitHit;
  reg inhibitFull;

  initial begin
    counter = 0;
    inhibitFull = 0;
  end

  assign _zz_1_   = (!limitHit);
  assign _zz_2_   = {15'd0, _zz_1_};
  assign limitHit = (counter == io_limit);
  assign io_full  = ((limitHit && io_tick) && (!inhibitFull));
  assign io_value = counter;
  always @(posedge toplevel_io_axiClk or posedge toplevel_resetCtrl_axiReset) begin
    if (toplevel_resetCtrl_axiReset) begin
      inhibitFull <= 1'b0;
    end else begin
      if (io_tick) begin
        inhibitFull <= limitHit;
      end
      if (io_clear) begin
        inhibitFull <= 1'b0;
      end
    end
  end

  always @(posedge toplevel_io_axiClk) begin
    if (io_tick) begin
      counter <= (counter + _zz_2_);
    end
    if (io_clear) begin
      counter <= (16'b0000000000000000);
    end
  end

endmodule

