module autovcoder_011153 (
    input            io_push_valid,
    output           io_push_ready,
    output reg       io_pop_valid,
    input            io_pop_ready,
    input            io_flush,
    output     [2:0] io_occupancy,
    input            io_axiClk,
    input            resetCtrl_axiReset
);

  wire [1:0] _zz_pushPtr_valueNext;
  wire [0:0] _zz_pushPtr_valueNext_1;
  wire [1:0] _zz_popPtr_valueNext;
  wire [0:0] _zz_popPtr_valueNext_1;
  reg        pushPtr_willIncrement;
  reg        pushPtr_willClear;
  reg  [1:0] pushPtr_valueNext;
  reg  [1:0] pushPtr_value;
  wire       pushPtr_willOverflowIfInc;
  wire       pushPtr_willOverflow;
  reg        popPtr_willIncrement;
  reg        popPtr_willClear;
  reg  [1:0] popPtr_valueNext;
  reg  [1:0] popPtr_value;
  wire       popPtr_willOverflowIfInc;
  wire       popPtr_willOverflow;
  wire       ptrMatch;
  reg        risingOccupancy;
  wire       empty;
  wire       full;
  wire       pushing;
  wire       popping;
  wire       when_Stream_l1086;
  wire       when_Stream_l1099;
  wire [1:0] ptrDif;

  assign _zz_pushPtr_valueNext_1 = pushPtr_willIncrement;
  assign _zz_pushPtr_valueNext = {1'd0, _zz_pushPtr_valueNext_1};
  assign _zz_popPtr_valueNext_1 = popPtr_willIncrement;
  assign _zz_popPtr_valueNext = {1'd0, _zz_popPtr_valueNext_1};
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

  assign pushPtr_willOverflowIfInc = (pushPtr_value == 2'b11);
  assign pushPtr_willOverflow = (pushPtr_willOverflowIfInc && pushPtr_willIncrement);
  always @(*) begin
    pushPtr_valueNext = (pushPtr_value + _zz_pushPtr_valueNext);
    if (pushPtr_willClear) begin
      pushPtr_valueNext = 2'b00;
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

  assign popPtr_willOverflowIfInc = (popPtr_value == 2'b11);
  assign popPtr_willOverflow = (popPtr_willOverflowIfInc && popPtr_willIncrement);
  always @(*) begin
    popPtr_valueNext = (popPtr_value + _zz_popPtr_valueNext);
    if (popPtr_willClear) begin
      popPtr_valueNext = 2'b00;
    end
  end

  assign ptrMatch = (pushPtr_value == popPtr_value);
  assign empty = (ptrMatch && (!risingOccupancy));
  assign full = (ptrMatch && risingOccupancy);
  assign pushing = (io_push_valid && io_push_ready);
  assign popping = (io_pop_valid && io_pop_ready);
  assign io_push_ready = (!full);
  assign when_Stream_l1086 = (!empty);
  always @(*) begin
    if (when_Stream_l1086) begin
      io_pop_valid = 1'b1;
    end else begin
      io_pop_valid = io_push_valid;
    end
  end

  assign when_Stream_l1099 = (pushing != popping);
  assign ptrDif = (pushPtr_value - popPtr_value);
  assign io_occupancy = {(risingOccupancy && ptrMatch), ptrDif};
  always @(posedge io_axiClk or posedge resetCtrl_axiReset) begin
    if (resetCtrl_axiReset) begin
      pushPtr_value <= 2'b00;
      popPtr_value <= 2'b00;
      risingOccupancy <= 1'b0;
    end else begin
      pushPtr_value <= pushPtr_valueNext;
      popPtr_value  <= popPtr_valueNext;
      if (when_Stream_l1099) begin
        risingOccupancy <= pushing;
      end
      if (io_flush) begin
        risingOccupancy <= 1'b0;
      end
    end
  end


endmodule

