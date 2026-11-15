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
    always @(posedge sm_clk or posedge reset) begin
        if (reset) begin
            state <= CHECK_START_A;
            start_target_state_machine <= 1'b0;
            finish_a <= 1'b0;
            finish_b <= 1'b0;
            reset_start_request_a <= 1'b0;
            reset_start_request_b <= 1'b0;
            received_data_a <= {M{1'b0}};
            received_data_b <= {M{1'b0}};
            output_arguments <= {N{1'b0}};
        end else begin
            case (state)
                CHECK_START_A: begin
                    if (start_request_a) begin
                        state <= GIVE_START_A;
                        output_arguments <= input_arguments_a;
                    end else begin
                        state <= CHECK_START_B;
                    end
                    finish_a <= 1'b0;
                    finish_b <= 1'b0;
                    reset_start_request_a <= 1'b0;
                    reset_start_request_b <= 1'b0;
                end

                GIVE_START_A: begin
                    state <= WAIT_FOR_FINISH_A;
                    start_target_state_machine <= 1'b1;
                end

                WAIT_FOR_FINISH_A: begin
                    start_target_state_machine <= 1'b0;
                    if (target_state_machine_finished) begin
                        state <= REGISTER_DATA_A;
                    end
                end

                REGISTER_DATA_A: begin
                    received_data_a <= in_received_data;
                    state <= GIVE_FINISH_A;
                end

                GIVE_FINISH_A: begin
                    finish_a <= 1'b1;
                    reset_start_request_a <= 1'b1;
                    state <= CHECK_START_B;
                end

                CHECK_START_B: begin
                    if (start_request_b) begin
                        state <= GIVE_START_B;
                        output_arguments <= input_arguments_b;
                    end else begin
                        state <= CHECK_START_A;
                    end
                    finish_a <= 1'b0;
                    finish_b <= 1'b0;
                    reset_start_request_a <= 1'b0;
                    reset_start_request_b <= 1'b0;
                end

                GIVE_START_B: begin
                    state <= WAIT_FOR_FINISH_B;
                    start_target_state_machine <= 1'b1;
                end

                WAIT_FOR_FINISH_B: begin
                    start_target_state_machine <= 1'b0;
                    if (target_state_machine_finished) begin
                        state <= REGISTER_DATA_B;
                    end
                end

                REGISTER_DATA_B: begin
                    received_data_b <= in_received_data;
                    state <= GIVE_FINISH_B;
                end

                GIVE_FINISH_B: begin
                    finish_b <= 1'b1;
                    reset_start_request_b <= 1'b1;
                    state <= CHECK_START_A;
                end

                default: state <= CHECK_START_A;
            endcase
        end
    end

endmodule