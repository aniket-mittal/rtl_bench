module autovcoder_025439 (
    input       clk,
    input [7:0] selector,

    input [15:0] data_300_1,
    input [15:0] data_301_1,
    input [15:0] data_302_1,
    input [15:0] data_303_1,
    input [15:0] data_304_1,
    input [15:0] data_305_1,
    input [15:0] data_306_1,
    input [15:0] data_307_1,
    input [15:0] data_308_1,
    input [15:0] data_309_1,
    input [15:0] data_310_1,
    input [15:0] data_311_1,
    input [15:0] data_312_1,
    input [15:0] data_313_1,
    input [15:0] data_314_1,
    input [15:0] data_315_1,
    input [15:0] data_316_1,
    input [15:0] data_317_1,
    input [15:0] data_318_1,
    input [15:0] data_319_1,
    input [15:0] data_320_1,
    input [15:0] data_321_1,
    input [15:0] data_322_1,
    input [15:0] data_323_1,
    input [15:0] data_324_1,
    input [15:0] data_325_1,
    input [15:0] data_326_1,
    input [15:0] data_327_1,
    input [15:0] data_328_1,
    input [15:0] data_329_1,

    input    reset,
    output reg [7:0]  adr,
    output reg [15:0] adr_first_reg_tx,
    output reg [7:0]  num_reg_tx,
    output reg [15:0] adr_first_reg_rx,
    output reg [7:0]  num_reg_rx,
    output reg [15:0] data_out
);

  parameter [7:0] slave_adr = 1;
  parameter [15:0] adr_first_reg_write = 300;
  parameter [7:0] num_reg_write = 30;
  parameter [15:0] adr_first_reg_read = 340;
  parameter [7:0] num_reg_write_read = 30;


  initial begin
    data_out         = 16'h0000;
    adr              = slave_adr;
    adr_first_reg_tx = adr_first_reg_write;
    num_reg_tx       = num_reg_write;
    adr_first_reg_rx = adr_first_reg_read;
    num_reg_rx       = num_reg_write_read;
  end

  [MASKED]
endmodule

