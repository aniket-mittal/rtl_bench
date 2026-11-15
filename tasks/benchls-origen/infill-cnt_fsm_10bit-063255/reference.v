module origen_063255 (
    input wire clk,
    input wire rst_n,
    input wire start,
    input wire valid,
    input wire Done,
    output reg valid_out,
    output reg [9:0] cnt
);

    // State encoding
    localparam S0 = 2'b00;
    localparam S1 = 2'b01;
    localparam S2 = 2'b10;
    localparam S3 = 2'b11;

    reg [1:0] current_state, next_state;

    // State transition logic
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            current_state <= S0;
        else
            current_state <= next_state;
    end

    // Next state logic
    always @(*) begin
        case (current_state)
            S0: next_state = start ? S2 : S0;
            S1: next_state = S0;
            S2: next_state = (cnt == 10'b0100_0001_10) ? S3 : S2;
            S3: next_state = Done ? S0 : S3;
            default: next_state = S0;
        endcase
    end

    // Counter logic
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            cnt <= 10'b1111111111;
        else begin
            case (current_state)
                S0, S1: cnt <= 10'b0000000000;
                S2, S3: cnt <= valid ? cnt + 1'b1 : cnt;
                default: cnt <= cnt;
            endcase
        end
    end

    // Output logic
    always @(*) begin
        valid_out = (current_state == S3) && valid;
    end

endmodule