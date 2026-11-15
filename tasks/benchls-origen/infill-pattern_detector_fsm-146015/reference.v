module origen_146015 (
    input wire clk,
    input wire [15:0] data_in,
    output reg pattern_detected
);

    // State encoding
    localparam S0 = 3'b000;
    localparam S1 = 3'b001;
    localparam S2 = 3'b010;
    localparam S3 = 3'b011;
    localparam S4 = 3'b100;

    reg [2:0] current_state, next_state;

    // State register
    always @(posedge clk) begin
        current_state <= next_state;
    end

    // Next state logic and output logic
    always @(*) begin
        next_state = current_state;
        pattern_detected = 1'b0;

        case (current_state)
            S0: begin
                if (data_in[15:12] == 4'b1010) next_state = S4;
                else if (data_in[15] == 1'b1) next_state = S1;
            end
            S1: begin
                if (data_in[14:11] == 4'b0101) next_state = S4;
                else if (data_in[14] == 1'b0) next_state = S2;
                else next_state = S1;
            end
            S2: begin
                if (data_in[13:10] == 4'b1010) next_state = S4;
                else if (data_in[13] == 1'b1) next_state = S3;
                else next_state = S0;
            end
            S3: begin
                if (data_in[12:9] == 4'b0101) next_state = S4;
                else if (data_in[12] == 1'b0) next_state = S2;
                else next_state = S1;
            end
            S4: begin
                pattern_detected = 1'b1;
                next_state = S0;
            end
            default: next_state = S0;
        endcase
    end

endmodule