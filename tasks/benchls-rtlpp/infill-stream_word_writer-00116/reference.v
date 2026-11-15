module rtlpp_00116 (
  input               clk,
  input               rst,
  input               i_enable,
  input       [1:0]   i_wr_rdy,
  output  reg [1:0]   o_wr_act,
  input       [23:0]  i_wr_size,
  output  reg         o_wr_stb,
  output  reg [31:0]  o_wr_data
);

  reg   [23:0]          r_count;

  always @ (posedge clk) begin
    if (rst) begin
      o_wr_act        <=  2'b00;
      o_wr_stb        <=  0;
      o_wr_data       <=  32'b0;
      r_count         <=  24'b0;
    end
    else begin
      o_wr_stb        <= 0;
      if (i_enable) begin
        if ((i_wr_rdy > 0) && (o_wr_act == 2'b00))begin
          r_count     <=  0;
          if (i_wr_rdy[0]) begin
            o_wr_act[0]  <=  1;
          end
          else begin
            o_wr_act[1]  <=  1;
          end
        end
        else if (o_wr_act > 0) begin
          if (r_count < i_wr_size) begin
            r_count   <=  r_count + 1;
            o_wr_stb  <=  1;
            o_wr_data <=  r_count;
          end
          else begin
            o_wr_act  <=  2'b00;
          end
        end
      end
    end
  end

endmodule