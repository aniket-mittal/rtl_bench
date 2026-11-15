module origen_127507 (
    input wire clk,
    input wire rst,
    input wire sensor1,
    output reg red,
    output reg yellow,
    output reg green
);

    // State encoding
    localparam S1 = 3'b000;  // Red light
    localparam S2 = 3'b001;  // Green light (sensor1 detected)
    localparam S3 = 3'b010;  // Yellow light (3 seconds)
    localparam S4 = 3'b011;  // Green light (20 seconds)
    localparam S5 = 3'b100;  // Yellow light (3 seconds)

    reg [2:0] state, next_state;
    reg [5:0] timer;  // 6-bit timer for up to 63 seconds

    // State transition logic
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= S1;
            timer <= 0;
        end else begin
            state <= next_state;
            timer <= (timer == 6'd59) ? 6'd0 : timer + 1;
        end
    end

    // Next state logic
    always @(*) begin
        case (state)
            S1: next_state = (sensor1) ? S2 : S1;
            S2: next_state = S3;
            S3: next_state = (timer == 6'd2) ? S4 : S3;
            S4: next_state = (timer == 6'd19) ? S5 : S4;
            S5: next_state = (timer == 6'd2) ? S1 : S5;
            default: next_state = S1;
        endcase
    end

    // Output logic
    always @(*) begin
        case (state)
            S1: {red, yellow, green} = 3'b100;
            S2: {red, yellow, green} = 3'b001;
            S3: {red, yellow, green} = 3'b010;
            S4: {red, yellow, green} = 3'b001;
            S5: {red, yellow, green} = 3'b010;
            default: {red, yellow, green} = 3'b100;
        endcase
    end

endmodule