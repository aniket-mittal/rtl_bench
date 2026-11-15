module rtlpp_01345 (
                                                                                                                address,
                                                                                                                chipselect,
                                                                                                                clk,
                                                                                                                reset_n,
                                                                                                                write_n,
                                                                                                                writedata,
                                                                                                                out_port,
                                                                                                                readdata
                                                                                                             )
;

  output           out_port;
  output  [ 31: 0] readdata;
  input   [  1: 0] address;
  input            chipselect;
  input            clk;
  input            reset_n;
  input            write_n;
  input   [ 31: 0] writedata;

  reg              data_out;

  wire             clk_en = 1;
  wire             read_mux_out = (address == 0) & data_out;

  always @(posedge clk or negedge reset_n) begin
    if (!reset_n) begin
      data_out <= 0;
    end else if (chipselect && ~write_n && (address == 0)) begin
      data_out <= writedata[0];
    end
  end

  assign readdata = {31'b0, read_mux_out};
  assign out_port = data_out;

endmodule