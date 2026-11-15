module rtlpp_05649 (
  address,
  chipselect,
  clk,
  reset_n,
  write_n,
  writedata,
  irq,
  readdata
);

  output           irq;
  output  [15:0]   readdata;
  input   [3:0]    address;
  input            chipselect;
  input            clk;
  input            reset_n;
  input            write_n;
  input   [15:0]   writedata;

  reg              irq;
  reg    [15:0]    readdata;
  reg              counter_is_running;
  reg              delayed_unxcounter_is_zeroxx0;
  reg              timeout_occurred;
  reg              force_reload;
  reg    [63:0]    internal_counter;
  reg    [15:0]    period_halfword_0_register;
  reg    [15:0]    period_halfword_1_register;
  reg    [15:0]    period_halfword_2_register;
  reg    [15:0]    period_halfword_3_register;
  reg    [63:0]    counter_snapshot;
  reg    [3:0]     control_register;

  wire             clk_en = 1;
  wire             counter_is_zero;
  wire   [63:0]    counter_load_value;
  wire   [15:0]    read_mux_out;
  wire             control_continuous;
  wire             control_interrupt_enable;
  wire             start_strobe;
  wire             stop_strobe;
  wire             do_start_counter;
  wire             do_stop_counter;
  wire             snap_strobe;
  wire             timeout_event;
  wire             status_wr_strobe;
  wire             control_wr_strobe;
  wire             period_halfword_0_wr_strobe;
  wire             period_halfword_1_wr_strobe;
  wire             period_halfword_2_wr_strobe;
  wire             period_halfword_3_wr_strobe;
  wire             snap_halfword_0_wr_strobe;
  wire             snap_halfword_1_wr_strobe;
  wire             snap_halfword_2_wr_strobe;
  wire             snap_halfword_3_wr_strobe;
  wire   [63:0]    snap_read_value;

  always @(posedge clk or negedge reset_n) begin
    if (!reset_n)
      internal_counter <= 64'hC34F;
    else if (counter_is_running || force_reload) begin
      if (counter_is_zero || force_reload)
        internal_counter <= counter_load_value;
      else
        internal_counter <= internal_counter - 1;
    end
  end

  assign counter_is_zero = internal_counter == 0;
  assign counter_load_value = {period_halfword_3_register, period_halfword_2_register, period_halfword_1_register, period_halfword_0_register};

  always @(posedge clk or negedge reset_n) begin
    if (!reset_n)
      force_reload <= 0;
    else if (clk_en)
      force_reload <= period_halfword_3_wr_strobe || period_halfword_2_wr_strobe || period_halfword_1_wr_strobe || period_halfword_0_wr_strobe;
  end

  assign do_start_counter = start_strobe;
  assign do_stop_counter = stop_strobe || force_reload || (counter_is_zero && ~control_continuous);

  always @(posedge clk or negedge reset_n) begin
    if (!reset_n)
      counter_is_running <= 1'b0;
    else if (clk_en) begin
      if (do_start_counter)
        counter_is_running <= 1'b1;
      else if (do_stop_counter)
        counter_is_running <= 1'b0;
    end
  end

  always @(posedge clk or negedge reset_n) begin
    if (!reset_n)
      delayed_unxcounter_is_zeroxx0 <= 1'b0;
    else if (clk_en)
      delayed_unxcounter_is_zeroxx0 <= counter_is_zero;
  end

  assign timeout_event = counter_is_zero & ~delayed_unxcounter_is_zeroxx0;
  always @(posedge clk or negedge reset_n) begin
    if (!reset_n)
      timeout_occurred <= 0;
    else if (clk_en) begin
      if (status_wr_strobe)
        timeout_occurred <= 0;
      else if (timeout_event)
        timeout_occurred <= 1;
    end
  end

  assign irq = timeout_occurred && control_interrupt_enable;

  assign read_mux_out = ({16{(address == 4'd2)}} & period_halfword_0_register) |
                        ({16{(address == 4'd3)}} & period_halfword_1_register) |
                        ({16{(address == 4'd4)}} & period_halfword_2_register) |
                        ({16{(address == 4'd5)}} & period_halfword_3_register) |
                        ({16{(address == 4'd6)}} & snap_read_value[15:0]) |
                        ({16{(address == 4'd7)}} & snap_read_value[31:16]) |
                        ({16{(address == 4'd8)}} & snap_read_value[47:32]) |
                        ({16{(address == 4'd9)}} & snap_read_value[63:48]) |
                        ({16{(address == 4'd1)}} & control_register) |
                        ({16{(address == 4'd0)}} & {counter_is_running, timeout_occurred, 14'b0});

  always @(posedge clk or negedge reset_n) begin
    if (!reset_n)
      readdata <= 0;
    else if (clk_en)
      readdata <= read_mux_out;
  end

  assign period_halfword_0_wr_strobe = chipselect && ~write_n && (address == 4'd2);
  assign period_halfword_1_wr_strobe = chipselect && ~write_n && (address == 4'd3);
  assign period_halfword_2_wr_strobe = chipselect && ~write_n && (address == 4'd4);
  assign period_halfword_3_wr_strobe = chipselect && ~write_n && (address == 4'd5);
    
  always @(posedge clk or negedge reset_n) begin
    if (!reset_n)
      period_halfword_0_register <= 16'hC34F;
    else if (period_halfword_0_wr_strobe)
      period_halfword_0_register <= writedata;
  end

  always @(posedge clk or negedge reset_n) begin
    if (!reset_n)
      period_halfword_1_register <= 16'h0;
    else if (period_halfword_1_wr_strobe)
      period_halfword_1_register <= writedata;
  end
  
  always @(posedge clk or negedge reset_n) begin
    if (!reset_n)
      period_halfword_2_register <= 16'h0;
    else if (period_halfword_2_wr_strobe)
      period_halfword_2_register <= writedata;
  end

  always @(posedge clk or negedge reset_n) begin
    if (!reset_n)
      period_halfword_3_register <= 16'h0;
    else if (period_halfword_3_wr_strobe)
      period_halfword_3_register <= writedata;
  end

  assign snap_halfword_0_wr_strobe = chipselect && ~write_n && (address == 4'd6);
  assign snap_halfword_1_wr_strobe = chipselect && ~write_n && (address == 4'd7);
  assign snap_halfword_2_wr_strobe = chipselect && ~write_n && (address == 4'd8);
  assign snap_halfword_3_wr_strobe = chipselect && ~write_n && (address == 4'd9);
  assign snap_strobe = snap_halfword_0_wr_strobe || snap_halfword_1_wr_strobe || snap_halfword_2_wr_strobe || snap_halfword_3_wr_strobe;

  always @(posedge clk or negedge reset_n) begin
    if (!reset_n)
      counter_snapshot <= 64'd0;
    else if (snap_strobe)
      counter_snapshot <= internal_counter;
  end

  assign snap_read_value = counter_snapshot;
  assign control_wr_strobe = chipselect && ~write_n && (address == 4'd1);
  
  always @(posedge clk or negedge reset_n) begin
    if (!reset_n)
      control_register <= 4'd0;
    else if (control_wr_strobe)
      control_register <= writedata[3:0];
  end

  assign stop_strobe = writedata[3] && control_wr_strobe;
  assign start_strobe = writedata[2] && control_wr_strobe;
  assign control_continuous = control_register[1];
  assign control_interrupt_enable = control_register[0];
  assign status_wr_strobe = chipselect && ~write_n && (address == 4'd0);

endmodule