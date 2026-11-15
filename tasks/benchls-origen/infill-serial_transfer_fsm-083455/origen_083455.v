module origen_083455 (
    input wire _clk,
    input wire _rst,
    input wire _en,
    input wire [7:0] _input_reg,
    input wire [7:0] _divide_freq,
    output reg _output_wire
);

    // Parameters
    parameter RESET = 2'b00;
    parameter IDLE = 2'b01;
    parameter TRANSFER = 2'b10;
    
    parameter DATA_CAPACITY = 8;
    parameter BIT_LENGTH = 5;
    parameter EOT_KEEP_TIME = 8;

    // Internal registers
    reg [1:0] _state;
    reg [4:0] _trans_cnt;
    reg [9:0] _latch_input;
    reg _eot_flag;
    reg [7:0] _eot_cnt;
    reg [7:0] _clk_div_cnt;
    reg _clk_div;
    reg _transfer_flag;

    // State machine and main logic
    [MASKED]

endmodule