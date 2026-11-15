module origen_097740 #(
    parameter N = 32,
    parameter M = 16
)(
    input wire sm_clk,
    input wire reset,
    input wire start_request_a,
    input wire start_request_b,
    input wire target_state_machine_finished,
    input wire [N-1:0] input_arguments_a,
    input wire [N-1:0] input_arguments_b,
    input wire [M-1:0] in_received_data,
    output reg [N-1:0] output_arguments,
    output reg start_target_state_machine,
    output reg finish_a,
    output reg finish_b,
    output reg reset_start_request_a,
    output reg reset_start_request_b,
    output reg [M-1:0] received_data_a,
    output reg [M-1:0] received_data_b,
    output reg [11:0] state
);

    // State definitions
    localparam [11:0] CHECK_START_A     = 12'b000000000001,
                      GIVE_START_A      = 12'b000000000010,
                      WAIT_FOR_FINISH_A = 12'b000000000100,
                      REGISTER_DATA_A   = 12'b000000001000,
                      GIVE_FINISH_A     = 12'b000000010000,
                      CHECK_START_B     = 12'b000000100000,
                      GIVE_START_B      = 12'b000001000000,
                      WAIT_FOR_FINISH_B = 12'b000010000000,
                      REGISTER_DATA_B   = 12'b000100000000,
                      GIVE_FINISH_B     = 12'b001000000000;

    // State machine
    [MASKED]

endmodule