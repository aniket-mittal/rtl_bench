module origen_076973 (
    input wire clk,
    input wire reset,
    input wire enable_i,
    input wire [5:0] money_i,
    input wire [1:0] drinktype_i,
    output reg ready_o,
    output reg enable_o,
    output reg [5:0] change_o,
    output reg [1:0] drink_o
);

    // Internal signals
    reg [5:0] drinkcost [0:3];
    reg [1:0] state, n_state;
    reg [5:0] money;
    reg [1:0] drinktype;
    reg ready, enable;
    reg [5:0] change;
    reg [1:0] drink;

    // State definitions
    localparam IDLE = 2'b00;
    localparam MONEY = 2'b01;
    localparam ENOUGH = 2'b10;
    localparam NOT = 2'b11;

    // Initialize drink costs
    initial begin
        drinkcost[0] = 6'd10; // Cost for drink type 0
        drinkcost[1] = 6'd15; // Cost for drink type 1
        drinkcost[2] = 6'd20; // Cost for drink type 2
        drinkcost[3] = 6'd25; // Cost for drink type 3
    end

    // State transition logic
    always @(posedge clk or posedge reset) begin
        if (reset)
            state <= IDLE;
        else
            state <= n_state;
    end

    // Next state and output logic
    always @(*) begin
        n_state = state;
        ready = 1'b0;
        enable = 1'b0;
        change = 6'd0;
        drink = 2'd0;

        case (state)
            IDLE: begin
                ready = 1'b1;
                if (enable_i) begin
                    n_state = MONEY;
                    money = money_i;
                    drinktype = drinktype_i;
                end
            end
            MONEY: begin
                if (money >= drinkcost[drinktype])
                    n_state = ENOUGH;
                else
                    n_state = NOT;
            end
            ENOUGH: begin
                drink = drinktype;
                change = money - drinkcost[drinktype];
                enable = 1'b1;
                n_state = IDLE;
            end
            NOT: begin
                change = money;
                enable = 1'b1;
                n_state = IDLE;
            end
        endcase
    end

    // Output assignment
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            ready_o <= 1'b1;
            enable_o <= 1'b0;
            change_o <= 6'd0;
            drink_o <= 2'd0;
        end else begin
            ready_o <= ready;
            enable_o <= enable;
            change_o <= change;
            drink_o <= drink;
        end
    end

endmodule