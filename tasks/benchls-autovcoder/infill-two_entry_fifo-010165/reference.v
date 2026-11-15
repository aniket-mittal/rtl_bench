module autovcoder_010165 (
    input io_push_valid,
    output io_push_ready,
    input [15:0] io_push_payload_data,
    input [4:0] io_push_payload_context_context,
    output reg io_pop_valid,
    input io_pop_ready,
    output reg [15:0] io_pop_payload_data,
    output reg [4:0] io_pop_payload_context_context,
    input io_flush,
    output [1:0] io_occupancy,
    input clock_out,
    input clockCtrl_systemReset
);
  wire [20:0] _zz_3_;
  wire _zz_4_;
  wire [4:0] _zz_5_;
  wire [20:0] _zz_6_;
  reg _zz_1_;
  reg pushPtr_willIncrement;
  reg pushPtr_willClear;
  reg [0:0] pushPtr_valueNext;
  reg [0:0] pushPtr_value;
  wire pushPtr_willOverflowIfInc;
  wire pushPtr_willOverflow;
  reg popPtr_willIncrement;
  reg popPtr_willClear;
  reg [0:0] popPtr_valueNext;
  reg [0:0] popPtr_value;
  wire popPtr_willOverflowIfInc;
  wire popPtr_willOverflow;
  wire ptrMatch;
  reg risingOccupancy;
  wire empty;
  wire full;
  wire pushing;
  wire popping;
  wire [20:0] _zz_2_;
  wire [0:0] ptrDif;
  reg [20:0] ram[0:1];
  assign _zz_4_ = (!empty);
  assign _zz_5_ = _zz_2_[20 : 16];
  assign _zz_6_ = {io_push_payload_context_context, io_push_payload_data};
  always @(posedge clock_out) begin
    if (_zz_1_) begin
      ram[pushPtr_value] <= _zz_6_;
    end
  end

  assign _zz_3_ = ram[popPtr_value];
  always @(*) begin
    _zz_1_ = 1'b0;
    if (pushing) begin
      _zz_1_ = 1'b1;
    end
  end

  always @(*) begin
    pushPtr_willIncrement = 1'b0;
    if (pushing) begin
      pushPtr_willIncrement = 1'b1;
    end
  end

  always @(*) begin
    pushPtr_willClear = 1'b0;
    if (io_flush) begin
      pushPtr_willClear = 1'b1;
    end
  end

  assign pushPtr_willOverflowIfInc = (pushPtr_value == (1'b1));
  assign pushPtr_willOverflow = (pushPtr_willOverflowIfInc && pushPtr_willIncrement);
  always @(*) begin
    pushPtr_valueNext = (pushPtr_value + pushPtr_willIncrement);
    if (pushPtr_willClear) begin
      pushPtr_valueNext = (1'b0);
    end
  end

  always @(*) begin
    popPtr_willIncrement = 1'b0;
    if (popping) begin
      popPtr_willIncrement = 1'b1;
    end
  end

  always @(*) begin
    popPtr_willClear = 1'b0;
    if (io_flush) begin
      popPtr_willClear = 1'b1;
    end
  end

  assign popPtr_willOverflowIfInc = (popPtr_value == (1'b1));
  assign popPtr_willOverflow = (popPtr_willOverflowIfInc && popPtr_willIncrement);
  always @(*) begin
    popPtr_valueNext = (popPtr_value + popPtr_willIncrement);
    if (popPtr_willClear) begin
      popPtr_valueNext = (1'b0);
    end
  end

  assign ptrMatch = (pushPtr_value == popPtr_value);
  assign empty = (ptrMatch && (!risingOccupancy));
  assign full = (ptrMatch && risingOccupancy);
  assign pushing = (io_push_valid && io_push_ready);
  assign popping = (io_pop_valid && io_pop_ready);
  assign io_push_ready = (!full);
  always @(*) begin
    if (_zz_4_) begin
      io_pop_valid = 1'b1;
    end else begin
      io_pop_valid = io_push_valid;
    end
  end

  assign _zz_2_ = _zz_3_;
  always @(*) begin
    if (_zz_4_) begin
      io_pop_payload_data = _zz_2_[15 : 0];
    end else begin
      io_pop_payload_data = io_push_payload_data;
    end
  end

  always @(*) begin
    if (_zz_4_) begin
      io_pop_payload_context_context = _zz_5_[4 : 0];
    end else begin
      io_pop_payload_context_context = io_push_payload_context_context;
    end
  end

  assign ptrDif = (pushPtr_value - popPtr_value);
  assign io_occupancy = {(risingOccupancy && ptrMatch), ptrDif};
  always @(posedge clock_out) begin
    if (clockCtrl_systemReset) begin
      pushPtr_value <= (1'b0);
      popPtr_value <= (1'b0);
      risingOccupancy <= 1'b0;
    end else begin
      pushPtr_value <= pushPtr_valueNext;
      popPtr_value  <= popPtr_valueNext;
      if ((pushing != popping)) begin
        risingOccupancy <= pushing;
      end
      if (io_flush) begin
        risingOccupancy <= 1'b0;
      end
    end
  end

endmodule

