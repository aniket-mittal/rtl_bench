module autovcoder_063660 #(
    parameter GEN1_PIPEWIDTH = 8,
    parameter GEN2_PIPEWIDTH = 16,
    parameter GEN3_PIPEWIDTH = 32,
    parameter GEN4_PIPEWIDTH = 8,
    parameter GEN5_PIPEWIDTH = 8
) (


    input valid_pd,
    input [2:0] gen,
    input linkup,
    input [4:0] numberOfDetectedLanes,

    output sel,
    output [63:0] valid,
    output w

);

  localparam gen1_sel = 3'd1;
  localparam gen2_sel = 3'd2;
  localparam gen3_sel = 3'd3;
  localparam gen4_sel = 3'd4;
  localparam gen5_sel = 3'd5;


  localparam N = 64;

  reg [63:0] valid_reg;



  // gen decoder
  [MASKED]


  assign sel = (gen == gen1_sel | gen == gen2_sel) ? 1'b0 : 1'b1;
  assign w = valid_pd & linkup;
  assign valid = (linkup) ? valid_reg : 64'b0;
endmodule

