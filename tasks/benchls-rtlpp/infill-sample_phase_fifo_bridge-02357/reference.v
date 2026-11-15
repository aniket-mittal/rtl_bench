module rtlpp_02357 (
  input clk,
  input resetn,
  input processing_resetn,
  output s_axis_sample_ready,
  input s_axis_sample_valid,
  input [7:0] s_axis_sample_data,
  input sample_has_stat,
  input conv_done,
  input [31:0] phase,
  output reg m_axis_sample_valid,
  input m_axis_sample_ready,
  output [23:0] m_axis_sample_data,
  output reg m_axis_phase_valid,
  input m_axis_phase_ready,
  output [31:0] m_axis_phase_data,
  output reg overflow
);

  reg [1:0] data_counter;
  reg [31:0] phase_hold;
  reg [23:0] sample_hold;
  reg sample_hold_valid;
  reg conv_done_d1;
  reg synced;
  wire sync;

  assign s_axis_sample_ready = 1'b1;
  assign m_axis_sample_data = {~sample_hold[23],sample_hold[22:0]};
  assign m_axis_phase_data = phase_hold;

  always @(posedge clk) begin
    if (!conv_done_d1 && conv_done) begin
      if (m_axis_sample_valid || m_axis_phase_valid || !processing_resetn) begin
        overflow <= 1'b1;
      end else begin
        phase_hold <= phase;
        overflow <= 1'b0;
      end
    end else begin
      overflow <= 1'b0;
    end
    conv_done_d1 <= conv_done;
  end

  always @(posedge clk) begin
    if (!processing_resetn) begin
      m_axis_phase_valid <= 1'b0;
      m_axis_sample_valid <= 1'b0;
    end else begin
      if (sample_hold_valid) begin
        m_axis_phase_valid <= 1'b1;
        m_axis_sample_valid <= 1'b1;
      end else begin
        if (m_axis_phase_ready) begin
          m_axis_phase_valid <= 1'b0;
        end
        if (m_axis_sample_ready) begin
          m_axis_sample_valid <= 1'b0;
        end
      end
    end
  end

  always @(posedge clk) begin
    sample_hold_valid <= 1'b0;
    if (!sample_has_stat) begin
      if (s_axis_sample_valid && data_counter == 2'h2) begin
        sample_hold_valid <= 1'b1;
      end
    end else begin
      if (s_axis_sample_valid && data_counter == 2'h3 && 
          (sync || synced)) begin
        sample_hold_valid <= 1'b1;
      end
    end
  end

  always @(posedge clk) begin
    if (s_axis_sample_valid && data_counter != 2'h3) begin
      sample_hold <= {sample_hold[15:0], s_axis_sample_data};
    end
  end

  always @(posedge clk) begin
    if (s_axis_sample_valid) begin
      if (data_counter == 2'h2 && !sample_has_stat) begin
        data_counter <= 2'h0;
      end else begin
        data_counter <= data_counter + 1'b1;
      end
    end
  end

  assign sync = (s_axis_sample_data[3:0] == 4'h0) && (data_counter == 2'h3);

  always @(posedge clk) begin
    if (!processing_resetn) begin
      synced <= ~sample_has_stat;
    end else begin
      if (s_axis_sample_valid && sync) begin
        synced <= 1'b1;
      end
    end
  end

endmodule