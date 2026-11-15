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
    always @(*) begin
        next_state = current_state;
        Layer = 3'b000;
        Active = 3'b000;
        ActFuncActive = 1'b0;
        R = 1'b0;

        case (current_state)
            IDLE: begin
                if (Compute)
                    next_state = START;
            end
            START: begin
                next_state = LOAD_1;
            end
            LOAD_1: begin
                Layer = 3'b001;
                if (Tick >= 2)
                    Active = 3'b001;
                if (Tick == 785)
                    next_state = ACT_1;
            end
            ACT_1: begin
                Layer = 3'b001;
                if (Tick >= 2)
                    ActFuncActive = 1'b1;
                if (Tick == 20)
                    next_state = LOAD_2;
            end
            LOAD_2: begin
                Layer = 3'b010;
                if (Tick >= 2)
                    Active = 3'b010;
                if (Tick == 21)
                    next_state = ACT_2;
            end
            ACT_2: begin
                Layer = 3'b010;
                if (Tick >= 2)
                    ActFuncActive = 1'b1;
                if (Tick == 20)
                    next_state = LOAD_3;
            end
            LOAD_3: begin
                Layer = 3'b100;
                if (Tick >= 2)
                    Active = 3'b100;
                if (Tick == 21)
                    next_state = ACT_3;
            end
            ACT_3: begin
                Layer = 3'b100;
                if (Tick >= 2)
                    ActFuncActive = 1'b1;
                if (Tick == 20)
                    next_state = DONE;
            end
            DONE: begin
                R = 1'b1;
                if (!Compute)
                    next_state = IDLE;
            end
        endcase
    end

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