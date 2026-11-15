module autovcoder_094208 #(
    parameter FAMILY = "common",
    parameter DATA_WIDTH = 36,
    parameter REGMODE = "noreg",
    parameter WRITE_MODE = "normal"
) (
    input clk_i,
    input clk_en_i,
    input wr_en_i,
    input rst_i,
    input [(DATA_WIDTH - 1):0] wr_data_i,
    input [(DATA_WIDTH - 1):0] mem_out_i,
    output [(DATA_WIDTH - 1):0] rd_data_o
);
  if ((WRITE_MODE == "write-through")) begin : WRITE_THROUGH
    reg [(DATA_WIDTH - 1):0] wr_data_p_r;
    reg wr_en_p_r;
    always @(posedge clk_i or posedge rst_i) begin
      if (rst_i) begin
        wr_data_p_r <= {DATA_WIDTH{1'b0}};
        wr_en_p_r   <= 1'b0;
      end else begin
        wr_data_p_r <= wr_data_i;
        wr_en_p_r   <= wr_en_i;
      end
    end
    if ((REGMODE == "noreg")) begin : _NREG
      assign rd_data_o = (wr_en_p_r ? wr_data_p_r : mem_out_i);
    end else begin : _REG
      reg  [(DATA_WIDTH - 1):0] rd_data_r;
      wire [(DATA_WIDTH - 1):0] rd_data_nxt_w = (wr_en_p_r ? wr_data_p_r : mem_out_i);
      assign rd_data_o = rd_data_r;
      always @(posedge clk_i or posedge rst_i) begin
        if (rst_i) begin
          rd_data_r <= {DATA_WIDTH{1'b0}};
        end else begin
          rd_data_r <= rd_data_nxt_w;
        end
      end
    end
  end else begin : NORMAL
    assign rd_data_o = mem_out_i;
  end
endmodule

