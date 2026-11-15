module rtlpp_11645 (
  input                 clk,
  input                 reset,
  input       [15:0]    data,
  input                 data_valid,
  input       [1:0]     trigger_i,
  input                 trigger_in,
  input       [17:0]    edge_detect_enable,
  input       [17:0]    rise_edge_enable,
  input       [17:0]    fall_edge_enable,
  input       [17:0]    low_level_enable,
  input       [17:0]    high_level_enable,
  input       [6:0]     trigger_logic,
  output  reg           trigger_out,
  output  reg           trigger_out_adc
);

  reg     [1:0]   ext_t_m;
  reg     [1:0]   ext_t_low_level_hold;
  reg     [1:0]   ext_t_high_level_hold;
  reg     [1:0]   ext_t_edge_detect_hold;
  reg     [1:0]   ext_t_rise_edge_hold;
  reg     [1:0]   ext_t_fall_edge_hold;
  reg             ext_t_low_level_ack;
  reg             ext_t_high_level_ack;
  reg             ext_t_edge_detect_ack;
  reg             ext_t_rise_edge_ack;
  reg             ext_t_fall_edge_ack;
  reg     [15:0]  data_m1;
  reg     [15:0]  low_level;
  reg     [15:0]  high_level;
  reg     [15:0]  edge_detect;
  reg     [15:0]  rise_edge;
  reg     [15:0]  fall_edge;
  reg     [15:0]  low_level_m;
  reg     [15:0]  high_level_m;
  reg     [15:0]  edge_detect_m;
  reg     [15:0]  rise_edge_m;
  reg     [15:0]  fall_edge_m;
  reg             trigger_active;
  reg             trigger_active_mux;
  reg             trigger_active_d1;

  always @(posedge clk) begin
    if (data_valid == 1'b1) begin
      trigger_active_d1 <= trigger_active_mux;
      trigger_out <= trigger_active_d1;
      trigger_out_adc <= trigger_active_mux;
    end
  end

  always @(posedge clk) begin
    if (data_valid == 1'b1) begin
      case (trigger_logic[0])
        0: trigger_active = |(({ext_t_edge_detect_hold, edge_detect_m} & edge_detect_enable) |
                              ({ext_t_rise_edge_hold,   rise_edge_m}   & rise_edge_enable) |
                              ({ext_t_fall_edge_hold,   fall_edge_m}   & fall_edge_enable) |
                              ({ext_t_low_level_hold,   low_level_m}   & low_level_enable) |
                              ({ext_t_high_level_hold , high_level_m}  & high_level_enable));
        1: trigger_active = &(({ext_t_edge_detect_hold, edge_detect_m} | ~edge_detect_enable) &
                              ({ext_t_rise_edge_hold,   rise_edge_m}   | ~rise_edge_enable) &
                              ({ext_t_fall_edge_hold,   fall_edge_m}   | ~fall_edge_enable) &
                              ({ext_t_low_level_hold,   low_level_m}   | ~low_level_enable) &
                              ({ext_t_high_level_hold , high_level_m}  | ~high_level_enable));
        default: trigger_active = 1'b1;
      endcase
    end
  end

  always @(*) begin
    case (trigger_logic[6:4])
      3'd0: trigger_active_mux = trigger_active;
      3'd1: trigger_active_mux = trigger_in;
      3'd2: trigger_active_mux = trigger_active & trigger_in;
      3'd3: trigger_active_mux = trigger_active | trigger_in;
      3'd4: trigger_active_mux = trigger_active ^ trigger_in;
      3'd7: trigger_active_mux = 1'b0; 
      default: trigger_active_mux = 1'b0;
    endcase
  end

  always @(posedge clk) begin
    if (reset == 1'b1) begin
      data_m1 <= 16'd0;
      edge_detect <= 16'd0;
      rise_edge <= 16'd0;
      fall_edge <= 16'd0;
      low_level <= 16'd0;
      high_level <= 16'd0;
    end else begin
      if (data_valid == 1'b1) begin
        data_m1 <=  data;
        edge_detect <=  data_m1 ^ data;
        rise_edge   <= (data_m1 ^ data) & data;
        fall_edge   <= (data_m1 ^ data) & ~data;
        low_level   <= ~data;
        high_level  <= data;
        edge_detect_m <= edge_detect;
        rise_edge_m   <= rise_edge;
        fall_edge_m   <= fall_edge;
        low_level_m   <= low_level;
        high_level_m  <= high_level;
      end
    end
  end

  always @(posedge clk) begin
    if (reset == 1'b1) begin
      ext_t_m <= 2'd0;
      ext_t_edge_detect_hold <= 2'd0;
      ext_t_rise_edge_hold <= 2'd0;
      ext_t_fall_edge_hold <= 2'd0;
      ext_t_low_level_hold <= 2'd0;
      ext_t_high_level_hold <= 2'd0;
    end else begin
      ext_t_m <=  trigger_i;
      ext_t_edge_detect_hold <= ext_t_edge_detect_ack ? 2'b0 : (ext_t_m ^ trigger_i) | ext_t_edge_detect_hold;
      ext_t_rise_edge_hold   <= ext_t_rise_edge_ack   ? 2'b0 : ((ext_t_m ^ trigger_i) & trigger_i) | ext_t_rise_edge_hold;
      ext_t_fall_edge_hold   <= ext_t_fall_edge_ack   ? 2'b0 : ((ext_t_m ^ trigger_i) & ~trigger_i) | ext_t_fall_edge_hold;
      ext_t_low_level_hold   <= ext_t_low_level_ack   ? 2'b0 : (~trigger_i) | ext_t_low_level_hold;
      ext_t_high_level_hold  <= ext_t_high_level_ack  ? 2'b0 : (trigger_i) | ext_t_high_level_hold;
      ext_t_edge_detect_ack <= data_valid & (|ext_t_edge_detect_hold);
      ext_t_rise_edge_ack   <= data_valid & (|ext_t_rise_edge_hold);
      ext_t_fall_edge_ack   <= data_valid & (|ext_t_fall_edge_hold);
      ext_t_low_level_ack   <= data_valid & (|ext_t_low_level_hold);
      ext_t_high_level_ack  <= data_valid & (|ext_t_high_level_hold);
    end
  end

endmodule