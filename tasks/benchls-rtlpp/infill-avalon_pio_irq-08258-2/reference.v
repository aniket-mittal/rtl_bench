module rtlpp_08258 (
                                  address,
                                  chipselect,
                                  clk,
                                  in_port,
                                  reset_n,
                                  write_n,
                                  writedata,
                                  irq,
                                  readdata
                               )
;

  output           irq;
  output  [ 31: 0] readdata;
  input   [  1: 0] address;
  input            chipselect;
  input            clk;
  input            in_port;
  input            reset_n;
  input            write_n;
  input   [ 31: 0] writedata;

  wire             clk_en;
  reg              d1_data_in;
  reg              d2_data_in;
  wire             data_in;
  reg              edge_capture;
  wire             edge_capture_wr_strobe;
  wire             edge_detect;
  wire             irq;
  reg              irq_mask;
  wire             read_mux_out;
  reg     [ 31: 0] readdata;

  assign clk_en = 1;
  
  assign read_mux_out = (address == 2'b00) ? data_in :
                        (address == 2'b10) ? irq_mask :
                        (address == 2'b11) ? edge_capture : 0;

  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          readdata <= 0;
      else if (clk_en)
          readdata <= {32'b0 | read_mux_out};
    end

  assign data_in = in_port;
  
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          irq_mask <= 0;
      else if (chipselect && ~write_n && (address == 2'b10))
          irq_mask <= writedata;
    end

  assign irq = |(edge_capture & irq_mask);
  assign edge_capture_wr_strobe = chipselect && ~write_n && (address == 2'b11);
  
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          edge_capture <= 0;
      else if (clk_en)
          if (edge_capture_wr_strobe && writedata[0])
              edge_capture <= 0;
          else if (edge_detect)
              edge_capture <= -1;
    end

  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
        begin
          d1_data_in <= 0;
          d2_data_in <= 0;
        end
      else if (clk_en)
        begin
          d1_data_in <= data_in;
          d2_data_in <= d1_data_in;
        end
    end

  assign edge_detect = ~d1_data_in & d2_data_in;

endmodule