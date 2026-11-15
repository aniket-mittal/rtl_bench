module autovcoder_008353 (

    // adi interface

    clk,
    rst,
    valid,
    last,
    data,

    // xilinx interface

    inf_valid,
    inf_last,
    inf_data,
    inf_ready
);

  // parameter for data width

  parameter DATA_WIDTH = 16;
  localparam DW = DATA_WIDTH - 1;

  // adi interface

  input clk;
  input rst;
  input valid;
  input last;
  input [DW:0] data;

  // xil interface

  output inf_valid;
  output inf_last;
  output [DW:0] inf_data;
  input inf_ready;

  // internal registers

  reg [ 2:0] wcnt = 'd0;
  reg        wlast_0 = 'd0;
  reg [DW:0] wdata_0 = 'd0;
  reg        wlast_1 = 'd0;
  reg [DW:0] wdata_1 = 'd0;
  reg        wlast_2 = 'd0;
  reg [DW:0] wdata_2 = 'd0;
  reg        wlast_3 = 'd0;
  reg [DW:0] wdata_3 = 'd0;
  reg        wlast_4 = 'd0;
  reg [DW:0] wdata_4 = 'd0;
  reg        wlast_5 = 'd0;
  reg [DW:0] wdata_5 = 'd0;
  reg        wlast_6 = 'd0;
  reg [DW:0] wdata_6 = 'd0;
  reg        wlast_7 = 'd0;
  reg [DW:0] wdata_7 = 'd0;
  reg [ 2:0] rcnt = 'd0;
  reg        inf_valid = 'd0;
  reg        inf_last = 'd0;
  reg [DW:0] inf_data = 'd0;

  // write interface

  always @(posedge clk) begin
    if (rst == 1'b1) begin
      wcnt <= 'd0;
    end else if (valid == 1'b1) begin
      wcnt <= wcnt + 1'b1;
    end
    if ((wcnt == 3'd0) && (valid == 1'b1)) begin
      wlast_0 <= last;
      wdata_0 <= data;
    end
    if ((wcnt == 3'd1) && (valid == 1'b1)) begin
      wlast_1 <= last;
      wdata_1 <= data;
    end
    if ((wcnt == 3'd2) && (valid == 1'b1)) begin
      wlast_2 <= last;
      wdata_2 <= data;
    end
    if ((wcnt == 3'd3) && (valid == 1'b1)) begin
      wlast_3 <= last;
      wdata_3 <= data;
    end
    if ((wcnt == 3'd4) && (valid == 1'b1)) begin
      wlast_4 <= last;
      wdata_4 <= data;
    end
    if ((wcnt == 3'd5) && (valid == 1'b1)) begin
      wlast_5 <= last;
      wdata_5 <= data;
    end
    if ((wcnt == 3'd6) && (valid == 1'b1)) begin
      wlast_6 <= last;
      wdata_6 <= data;
    end
    if ((wcnt == 3'd7) && (valid == 1'b1)) begin
      wlast_7 <= last;
      wdata_7 <= data;
    end
  end

  // read interface

  always @(posedge clk) begin
    if (rst == 1'b1) begin
      rcnt <= 'd0;
      inf_valid <= 'd0;
      inf_last <= 'b0;
      inf_data <= 'd0;
    end else if ((inf_ready == 1'b1) || (inf_valid == 1'b0)) begin
      if (rcnt == wcnt) begin
        rcnt <= rcnt;
        inf_valid <= 1'd0;
        inf_last <= 1'b0;
        inf_data <= 'd0;
      end else begin
        rcnt <= rcnt + 1'b1;
        inf_valid <= 1'b1;
        case (rcnt)
          3'd0: begin
            inf_last <= wlast_0;
            inf_data <= wdata_0;
          end
          3'd1: begin
            inf_last <= wlast_1;
            inf_data <= wdata_1;
          end
          3'd2: begin
            inf_last <= wlast_2;
            inf_data <= wdata_2;
          end
          3'd3: begin
            inf_last <= wlast_3;
            inf_data <= wdata_3;
          end
          3'd4: begin
            inf_last <= wlast_4;
            inf_data <= wdata_4;
          end
          3'd5: begin
            inf_last <= wlast_5;
            inf_data <= wdata_5;
          end
          3'd6: begin
            inf_last <= wlast_6;
            inf_data <= wdata_6;
          end
          default: begin
            inf_last <= wlast_7;
            inf_data <= wdata_7;
          end
        endcase
      end
    end
  end

endmodule

