module autovcoder_068461 (
    input io_push_valid,
    output io_push_ready,
    input io_push_payload_error,
    input [31:0] io_push_payload_inst,
    output reg io_pop_valid,
    input io_pop_ready,
    output reg io_pop_payload_error,
    output reg [31:0] io_pop_payload_inst,
    input io_flush,
    output [0:0] io_occupancy,
    input io_clk,
    input resetCtrl_systemReset
);
  wire [0:0] _zz_5_;
  reg _zz_1_;
  reg pushPtr_willIncrement;
  reg pushPtr_willClear;
  wire pushPtr_willOverflowIfInc;
  wire pushPtr_willOverflow;
  reg popPtr_willIncrement;
  reg popPtr_willClear;
  wire popPtr_willOverflowIfInc;
  wire popPtr_willOverflow;
  wire ptrMatch;
  reg risingOccupancy;
  wire empty;
  wire full;
  wire pushing;
  wire popping;
  wire [32:0] _zz_2_;
  wire [32:0] _zz_3_;
  reg [32:0] _zz_4_;
  assign _zz_5_ = _zz_2_[0 : 0];
  always @(*) begin
    _zz_1_ = 1'b0;
    pushPtr_willIncrement = 1'b0;
    if (pushing) begin
      _zz_1_ = 1'b1;
      pushPtr_willIncrement = 1'b1;
    end
  end

  always @(*) begin
    pushPtr_willClear = 1'b0;
    popPtr_willClear  = 1'b0;
    if (io_flush) begin
      pushPtr_willClear = 1'b1;
      popPtr_willClear  = 1'b1;
    end
  end

  assign pushPtr_willOverflowIfInc = 1'b1;
  assign pushPtr_willOverflow = (pushPtr_willOverflowIfInc && pushPtr_willIncrement);
  always @(*) begin
    popPtr_willIncrement = 1'b0;
    if (popping) begin
      popPtr_willIncrement = 1'b1;
    end
  end

  assign popPtr_willOverflowIfInc = 1'b1;
  assign popPtr_willOverflow = (popPtr_willOverflowIfInc && popPtr_willIncrement);
  assign ptrMatch = 1'b1;
  assign empty = (ptrMatch && (!risingOccupancy));
  assign full = (ptrMatch && risingOccupancy);
  assign pushing = (io_push_valid && io_push_ready);
  assign popping = (io_pop_valid && io_pop_ready);
  assign io_push_ready = (!full);
  always @(*) begin
    if ((!empty)) begin
      io_pop_valid = 1'b1;
      io_pop_payload_error = _zz_5_[0];
      io_pop_payload_inst = _zz_2_[32 : 1];
    end else begin
      io_pop_valid = io_push_valid;
      io_pop_payload_error = io_push_payload_error;
      io_pop_payload_inst = io_push_payload_inst;
    end
  end

  assign _zz_2_ = _zz_3_;
  assign io_occupancy = (risingOccupancy && ptrMatch);
  assign _zz_3_ = _zz_4_;
  always @(posedge io_clk or posedge resetCtrl_systemReset) begin
    if (resetCtrl_systemReset) begin
      risingOccupancy <= 1'b0;
    end else begin
      if ((pushing != popping)) begin
        risingOccupancy <= pushing;
      end
      if (io_flush) begin
        risingOccupancy <= 1'b0;
      end
    end
  end

  always @(posedge io_clk) begin
    if (_zz_1_) begin
      _zz_4_ <= {io_push_payload_inst, io_push_payload_error};
    end
  end

endmodule

