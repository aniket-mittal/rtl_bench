module origen_210043(
    input clk,
    input rst,
    input [1:0] full_adder_output,
    output reg [7:0] led
);

reg [1:0] M_counter_q;
reg [1:0] M_state_q, M_state_d;

localparam CORRECT_OUTPUT_state = 2'b00;
localparam WRONG_OUTPUT_state = 2'b01;

always @(posedge clk) begin
    if (rst) begin
        M_counter_q <= 2'b00;
        M_state_q <= CORRECT_OUTPUT_state;
    end
    else begin
        M_counter_q <= M_counter_q + 2'b01;
        M_state_q <= M_state_d;
    end
end

always @(*) begin
    case (M_state_q)
        CORRECT_OUTPUT_state: begin
            if (M_counter_q == 2'b00 && full_adder_output == 2'b00) begin
                M_state_d = CORRECT_OUTPUT_state;
                led = 8'b00000001;
            end
            else if (M_counter_q == 2'b01 && full_adder_output == 2'b01) begin
                M_state_d = CORRECT_OUTPUT_state;
                led = 8'b00000010;
            end
            else if (M_counter_q == 2'b10 && full_adder_output == 2'b10) begin
                M_state_d = CORRECT_OUTPUT_state;
                led = 8'b00000100;
            end
            else begin
                M_state_d = WRONG_OUTPUT_state;
            end
        end
        WRONG_OUTPUT_state: begin
            M_state_d = WRONG_OUTPUT_state;
            led = 8'b11111111;
        end
        default: begin
            M_state_d = CORRECT_OUTPUT_state;
            led = 8'b00000000;
        end
    endcase
end

endmodule