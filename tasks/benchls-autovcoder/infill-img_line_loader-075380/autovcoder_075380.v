module autovcoder_075380 (
    input clk,
    rst,
    input loading_loc,
    input linebegin,
    input [8:0] mem_addr_0,
    mem_addr_1,
    mem_addr_2,
    mem_addr_3,
    mem_addr_4,

    output reg [8:0] mem_addr_out,
    output reg [4:0] load_en,
    output reg img_load_done
);
  reg [2:0] cnt;


  reg state_reg;

  wire eq_max;
  reg shft_en;
  reg loading_loc1;
  wire f_edge;
  reg img_load_doneN;

  parameter IDLE = 1'b0;
  parameter LOAD = 1'b1;

  assign eq_max = (cnt == 3'd5);
  assign f_edge = loading_loc1 & ~loading_loc;

  [MASKED]


  always @(posedge clk) begin
    case (cnt)
      5'd0: mem_addr_out <= mem_addr_0;
      5'd1: mem_addr_out <= mem_addr_1;
      5'd2: mem_addr_out <= mem_addr_2;
      5'd3: mem_addr_out <= mem_addr_3;
      5'd4: mem_addr_out <= mem_addr_4;
      default: mem_addr_out <= 9'd0;
    endcase
  end


endmodule

