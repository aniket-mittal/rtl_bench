module origen_004722 (
    input wire rstn,
    input wire clk,
    input wire x_in,
    output reg y_out,
    output reg [1:0] state,
    output reg [1:0] next_state
);

    // State encoding
    localparam S0 = 2'b00;
    localparam S1 = 2'b01;
    localparam S2 = 2'b10;
    localparam S3 = 2'b11;

    // State transition logic
    always @(posedge clk or negedge rstn) begin
        if (!rstn) begin
            state <= S0;
        end else begin
            state <= next_state;
        end
    end

    // Combinational logic for next state and output
    always @(*) begin
        case (state)
            S0: begin
                next_state = x_in ? S1 : S0;
                y_out = 1'b0;
            end
            S1: begin
                next_state = x_in ? S3 : S0;
                y_out = ~x_in;
            end
            S2: begin
                next_state = x_in ? S2 : S0;
                y_out = ~x_in;
            end
            S3: begin
                next_state = x_in ? S2 : S0;
                y_out = ~x_in;
            end
            default: begin
                next_state = S0;
                y_out = 1'b0;
            end
        endcase
    end

endmodule