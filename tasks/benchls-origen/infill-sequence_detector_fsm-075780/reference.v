module origen_075780 (
    input wire din,
    input wire clk,
    input wire rst_n,
    output reg flag
);

    // State encoding
    localparam [8:0] IDLE = 9'b000000001,
                     A    = 9'b000000010,
                     B    = 9'b000000100,
                     C    = 9'b000001000,
                     D    = 9'b000010000,
                     E    = 9'b000100000,
                     F    = 9'b001000000,
                     G    = 9'b010000000,
                     H    = 9'b100000000;

    reg [8:0] current_state, next_state;

    // State transition logic
    always @(negedge clk or negedge rst_n) begin
        if (!rst_n)
            current_state <= IDLE;
        else
            current_state <= next_state;
    end

    // Next state logic
    always @(*) begin
        case (current_state)
            IDLE: next_state = din ? A : B;
            A:    next_state = din ? C : B;
            B:    next_state = din ? A : D;
            C:    next_state = din ? E : D;
            D:    next_state = din ? G : B;
            E:    next_state = din ? F : D;
            F:    next_state = din ? C : B;
            G:    next_state = din ? H : B;
            H:    next_state = din ? C : B;
            default: next_state = IDLE;
        endcase
    end

    // Output logic
    always @(*) begin
        flag = (current_state == F) || (current_state == H);
    end

    // Monitor for simulation
    initial begin
        $monitor("Time=%0t din=%b clk=%b rst_n=%b flag=%b state=%b",
                 $time, din, clk, rst_n, flag, current_state);
    end

endmodule