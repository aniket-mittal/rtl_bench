module autovcoder_122913 (
    input        i_clk,
    input        i_rst,
    input        i_en,         //ʹźţЧ
    input        i_out_level,  //ƽ
    input  [3:0] i_width,
    output       o_trig
);

  localparam ST_WAIT = 2'd0;
  localparam ST_START = 2'd1;
  localparam ST_HOLD = 2'd2;
  localparam ST_END = 2'd3;

  //״̬
  reg  [1:0] state_current = 0;
  reg  [1:0] state_next = 0;

  //
  reg  [3:0] reg_hold_cnt = 0;
  reg  [1:0] reg_en_rise = 0;

  reg        reg_trig = 0;  //

  //־
  wire       flg_en;  //ʹźЧ
  reg        flg_hold = 0;  //ִﵽʱ

  //
  reg        buffer_out_level = 1;  //Ĭߵƽ

  assign flg_en = (reg_en_rise == 2'b01);
  assign o_trig = reg_trig;

  //źŻ
  always @(posedge i_clk or negedge i_rst) begin
    //͵ƽλ
    if (!i_rst) begin
      buffer_out_level <= 1;
    end else begin
      buffer_out_level <= i_out_level;
    end
  end

  //״ִ̬
  always @(posedge i_clk or negedge i_rst) begin
    //͵ƽλ
    if (!i_rst) begin
      reg_trig <= 0;
    end else if (state_current == ST_HOLD) begin
      reg_trig <= buffer_out_level;
    end else begin
      reg_trig <= !buffer_out_level;
    end
  end

  //״̬
  always @(*) begin
    case (state_current)

      ST_WAIT: begin
        if (flg_en) begin
          state_next <= ST_START;
        end else begin
          state_next <= ST_WAIT;
        end
      end

      ST_START: begin
        state_next <= ST_HOLD;
      end

      ST_HOLD: begin
        if (flg_hold) begin
          state_next <= ST_END;
        end else begin
          state_next <= ST_HOLD;
        end
      end

      ST_END: begin
        if (!flg_en) begin
          state_next <= ST_WAIT;
        end else begin
          state_next <= ST_END;
        end
      end
    endcase
  end

  //״ֵ̬
  always @(posedge i_clk or negedge i_rst) begin
    //͵ƽλ
    if (!i_rst) begin
      state_current <= ST_WAIT;
    end else begin
      state_current <= state_next;
    end
  end

  //ʹźؼ
  always @(posedge i_clk or negedge i_rst) begin
    //͵ƽλ
    if (!i_rst) begin
      reg_en_rise <= 0;
    end else begin
      reg_en_rise <= {reg_en_rise[0], i_en};
    end
  end

  //ּ
  always @(posedge i_clk or negedge i_rst) begin
    //͵ƽλ
    if (!i_rst) begin
      flg_hold <= 0;
      reg_hold_cnt <= 0;
    end else if (state_current == ST_HOLD) begin
      if (reg_hold_cnt < i_width) reg_hold_cnt <= reg_hold_cnt + 1;
      else begin
        flg_hold <= 1;
        reg_hold_cnt <= i_width;
      end
    end else begin
      flg_hold <= 0;
      reg_hold_cnt <= 0;
    end
  end
endmodule

