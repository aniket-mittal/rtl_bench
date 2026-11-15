module autovcoder_062611 #(
    parameter DATA_WIDTH = 32,
    parameter TOTAL_PARTICLE_NUM = 20000,
    parameter PARTICLE_GLOBAL_ID_WIDTH = 15,  // log(TOTAL_PARTICLE_NUM)/log(2)
    parameter NUM_CELL_X = 5,
    parameter NUM_CELL_Y = 5,
    parameter NUM_CELL_Z = 5,
    parameter NUM_TOTAL_CELL = NUM_CELL_X * NUM_CELL_Y * NUM_CELL_Z
) (
    input clk,
    input rst,
    input [NUM_TOTAL_CELL-1:0] cell_id_to_sum,
    input cell_id_access_valid,
    input [3*DATA_WIDTH-1:0] number_of_partical,
    output reg [PARTICLE_GLOBAL_ID_WIDTH-1:0] access_address,
    output reg [NUM_TOTAL_CELL-1:0] cell_id,
    output reg rd_en,
    output reg resume,
    output reg valid_out_to_adder,
    input valid_in
);

  reg [1:0] state;
  reg [7:0] number_of_partical_r;

  parameter IDLE = 2'b00;
  parameter CHECK = 2'b01;
  parameter ACCESS = 2'b10;

  [MASKED]

endmodule

