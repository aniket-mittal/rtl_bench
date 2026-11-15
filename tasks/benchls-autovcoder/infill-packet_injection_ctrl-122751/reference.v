module autovcoder_122751 #(
    parameter MAX_PCK_SIZ = 10,
    parameter MAX_RATIO   = 100
) (
    en,
    pck_size,  // average packet size in flit
    clk,
    reset,
    inject,  // inject one packet
    freez,
    ratio  // 0~100  flit injection ratio


);


  function integer log2;
    input integer number;
    begin
      log2 = (number <= 1) ? 1 : 0;
      while (2 ** log2 < number) begin
        log2 = log2 + 1;
      end
    end
  endfunction  // log2 


  localparam PCK_SIZw = log2(MAX_PCK_SIZ);
  localparam CNTw = log2(MAX_RATIO);
  localparam STATE_INIT = MAX_PCK_SIZ * MAX_RATIO;
  localparam STATEw = log2(MAX_PCK_SIZ * 2 * MAX_RATIO);

  input clk, reset, freez, en;
  output reg inject;
  input [CNTw-1 : 0] ratio;
  input [PCK_SIZw-1 : 0] pck_size;


  wire [CNTw-1 : 0] on_clks, off_clks;
  reg [STATEw-1 : 0] state, next_state;
  wire              input_changed;
  reg  [CNTw-1 : 0] ratio_old;

  always @(posedge clk) ratio_old <= ratio;

  assign input_changed = (ratio_old != ratio);


  assign on_clks = ratio;
  assign off_clks = MAX_RATIO - ratio;

  reg [PCK_SIZw-1 : 0] flit_counter, next_flit_counter;


  reg sent, next_sent, next_inject;



  always @(*) begin
    next_state        = state;
    next_flit_counter = flit_counter;
    next_sent         = sent;
    if (en && ~freez) begin
      case (sent)
        1'b1: begin
          /* verilator lint_off WIDTH */
          next_state = state + off_clks;
          /* verilator lint_on WIDTH */
          next_flit_counter = (flit_counter >= pck_size-1'b1) ? {PCK_SIZw{1'b0}} : flit_counter +1'b1;
          next_inject = (flit_counter == {PCK_SIZw{1'b0}});
          if (next_flit_counter >= pck_size - 1'b1) begin
            if (next_state >= STATE_INIT) next_sent = 1'b0;
          end
        end
        1'b0: begin
          if (next_state < STATE_INIT) next_sent = 1'b1;
          next_inject = 1'b0;
          /* verilator lint_off WIDTH */
          next_state  = state - on_clks;
          /* verilator lint_on WIDTH */
        end
      endcase
    end else begin
      next_inject = 1'b0;
    end
  end




  always @(posedge clk or posedge reset) begin
    if (reset) begin
      state        <= STATE_INIT;
      inject       <= 1'b0;
      sent         <= 1'b1;
      flit_counter <= 0;
    end else begin
      if (input_changed) begin
        state        <= STATE_INIT;
        inject       <= 1'b0;
        sent         <= 1'b1;
        flit_counter <= 0;
      end


      state <= next_state;
      if (ratio != {CNTw{1'b0}}) inject <= next_inject;
      sent         <= next_sent;
      flit_counter <= next_flit_counter;

    end
  end


endmodule

