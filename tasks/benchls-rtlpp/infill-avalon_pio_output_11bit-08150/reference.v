module rtlpp_08150 (
                         address,
                         chipselect,
                         clk,
                         reset_n,
                         write_n,
                         writedata,
                        
                         out_port,
                         readdata
                      );

  output  [10: 0] out_port;
  output  [31: 0] readdata;
  input   [1: 0] address;
  input          chipselect;
  input          clk;
  input          reset_n;
  input          write_n;
  input   [31: 0] writedata;

  reg     [10: 0] data_out;
  wire    [10: 0] read_mux_out;

  // No clk_en signal needed as it's always 1
  // assign clk_en = 1;
  
  assign read_mux_out = (address == 0) ? data_out : 11'b0;
  
  always @(posedge clk or negedge reset_n)
  begin
    if (reset_n == 0)
        data_out <= 0;
    else if (chipselect && ~write_n && (address == 0))
        data_out <= writedata[10:0];
  end

  assign readdata = {21'b0, read_mux_out}; // Ensuring readdata is 32 bits wide
  assign out_port = data_out;

endmodule