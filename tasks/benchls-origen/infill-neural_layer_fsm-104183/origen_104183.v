module origen_104183 (
    input wire Clk,
    input wire Reset,
    input wire Compute,
    output reg [2:0] Layer,
    output reg [2:0] Active,
    output reg [9:0] Tick,
    output reg ActFuncActive,
    output reg R
);

    // State encoding
    localparam [3:0] IDLE   = 4'b0000,
                     START  = 4'b0001,
                     LOAD_1 = 4'b0010,
                     ACT_1  = 4'b0011,
                     LOAD_2 = 4'b0100,
                     ACT_2  = 4'b0101,
                     LOAD_3 = 4'b0110,
                     ACT_3  = 4'b0111,
                     DONE   = 4'b1000;

    reg [3:0] current_state, next_state;

    // State transition logic
    always @(posedge Clk or posedge Reset) begin
        if (Reset)
            current_state <= IDLE;
        else
            current_state <= next_state;
    end

    // Next state logic and output control
    [MASKED]

    // Tick counter
    always @(posedge Clk or posedge Reset) begin
        if (Reset) begin
            Tick <= 10'd0;
        end else if (current_state == IDLE || current_state == START || current_state != next_state) begin
            Tick <= 10'd0;
        end else begin
            Tick <= Tick + 1'b1;
        end
    end

endmodule