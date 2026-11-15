module autovcoder_068912 (
    ic_clk,
    ic_res,
    ic_stb,
    ic_sel,
    ic_data_in_0,
    ic_data_in_1,
    ic_data_in_2,
    ic_data_valid_in,
    ic_data_out_0,
    ic_data_out_1,
    ic_data_out_2,
    ic_data_out_3,
    ic_data_collected
);

  input ic_clk, ic_res, ic_stb;
  input [1:0] ic_sel;
  input [7:0] ic_data_in_0, ic_data_in_1, ic_data_in_2;
  input ic_data_valid_in;
  output [7:0] ic_data_out_0, ic_data_out_1, ic_data_out_2, ic_data_out_3;
  output [0:127] ic_data_collected;

  reg ic_stb_was_1;

  reg [7:0] ic_data_out_0, ic_data_out_1, ic_data_out_2, ic_data_out_3;
  reg [0:127] ic_data_collected;

  reg [7:0] ic_data[0:3];
  integer i, j, k;

  integer fh;

  always @(posedge ic_clk or posedge ic_res)
    if (ic_res) begin
      ic_stb_was_1 = 0;
      ic_data_out_0 = 0;
      ic_data_out_1 = 0;
      ic_data_out_2 = 0;
      ic_data_out_3 = 0;
      ic_data_collected = 0;
      for (j = 0; j < 4; j = j + 1) ic_data[j] = 0;
      i = 0;
      j = 0;
      k = 0;
    end else begin
      if (ic_stb) ic_stb_was_1 = 1;
      if (ic_data_valid_in) begin
        case (ic_sel)
          'd0: ic_data[k] = ic_data_in_0;
          'd1: ic_data[k] = ic_data_in_1;
          'd2: ic_data[k] = ic_data_in_2;
        endcase
        k = k + 1;
      end else begin
        if (ic_stb_was_1) begin
          k = 0;
          for (j = 0; j < 4; j = j + 1)
          case (j)
            'd0: ic_data_out_0 = ic_data[j];
            'd1: ic_data_out_1 = ic_data[j];
            'd2: ic_data_out_2 = ic_data[j];
            'd3: ic_data_out_3 = ic_data[j];
          endcase
        end
        if (ic_stb_was_1) begin
          ic_data_collected[i] = 1;
          i = i + 1;
          ic_stb_was_1 = 0;
        end
      end
    end

  //Print INPUT COLLECTOR buffer contents
  [MASKED]

endmodule

