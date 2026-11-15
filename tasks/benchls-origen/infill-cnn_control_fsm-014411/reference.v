module origen_014411 (
    input wire clk,
    input wire srstn,
    input wire conv_start,
    input wire conv1_done,
    input wire conv_done,
    input wire fc_done,
    output reg [1:0] mode,
    output reg mem_sel
);

    // State encoding
    localparam IDLE  = 2'b00;
    localparam CONV1 = 2'b01;
    localparam CONV2 = 2'b10;
    localparam DONE  = 2'b11;

    reg [1:0] current_state, next_state;
    reg done_control;

    // State transition logic
    always @(posedge clk or negedge srstn) begin
        if (!srstn) begin
            current_state <= IDLE;
            done_control <= 1'b0;
            mem_sel <= 1'b0;
        end else begin
            current_state <= next_state;
            if (conv_done) begin
                done_control <= 1'b1;
            end
            if (!done_control && conv_done) begin
                mem_sel <= ~mem_sel;
            end else if (done_control && fc_done) begin
                mem_sel <= ~mem_sel;
            end
        end
    end

    // Next state logic
    always @(*) begin
        case (current_state)
            IDLE: next_state = conv_start ? CONV1 : IDLE;
            CONV1: next_state = conv1_done ? CONV2 : CONV1;
            CONV2: next_state = conv_done ? DONE : CONV2;
            DONE: next_state = IDLE;
            default: next_state = IDLE;
        endcase
    end

    // Output logic
    always @(*) begin
        mode = current_state;
    end

endmodule