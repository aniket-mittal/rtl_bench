module origen_113378 #(
    parameter DATA_WIDTH = 32
) (
    input wire TCLK,
    input wire TRST,
    input wire TMS,
    input wire TDI,
    output reg TDO,
    output wire clk,
    output wire reset,
    output reg [DATA_WIDTH-1:0] data_reg,
    output reg data_reg_valid,
    output reg [3:0] inst_reg,
    output reg inst_reg_valid
);

    // Internal signals
    reg [3:0] current_state, next_state;

    // State encoding
    localparam [3:0]
        TEST_LOGIC_RESET = 4'h0,
        RUN_TEST_IDLE    = 4'h1,
        SELECT_DR_SCAN   = 4'h2,
        CAPTURE_DR       = 4'h3,
        SHIFT_DR         = 4'h4,
        EXIT1_DR         = 4'h5,
        PAUSE_DR         = 4'h6,
        EXIT2_DR         = 4'h7,
        UPDATE_DR        = 4'h8,
        SELECT_IR_SCAN   = 4'h9,
        CAPTURE_IR       = 4'hA,
        SHIFT_IR         = 4'hB,
        EXIT1_IR         = 4'hC,
        PAUSE_IR         = 4'hD,
        EXIT2_IR         = 4'hE,
        UPDATE_IR        = 4'hF;

    // Clock and reset assignments
    assign clk = TCLK;
    assign reset = TRST;

    // State transition logic
    always @(posedge TCLK or posedge TRST) begin
        if (TRST)
            current_state <= TEST_LOGIC_RESET;
        else
            current_state <= next_state;
    end

    // Next state logic
    always @(*) begin
        case (current_state)
            TEST_LOGIC_RESET: next_state = TMS ? TEST_LOGIC_RESET : RUN_TEST_IDLE;
            RUN_TEST_IDLE:    next_state = TMS ? SELECT_DR_SCAN : RUN_TEST_IDLE;
            SELECT_DR_SCAN:   next_state = TMS ? SELECT_IR_SCAN : CAPTURE_DR;
            CAPTURE_DR:       next_state = TMS ? EXIT1_DR : SHIFT_DR;
            SHIFT_DR:         next_state = TMS ? EXIT1_DR : SHIFT_DR;
            EXIT1_DR:         next_state = TMS ? UPDATE_DR : PAUSE_DR;
            PAUSE_DR:         next_state = TMS ? EXIT2_DR : PAUSE_DR;
            EXIT2_DR:         next_state = TMS ? UPDATE_DR : SHIFT_DR;
            UPDATE_DR:        next_state = TMS ? SELECT_DR_SCAN : RUN_TEST_IDLE;
            SELECT_IR_SCAN:   next_state = TMS ? TEST_LOGIC_RESET : CAPTURE_IR;
            CAPTURE_IR:       next_state = TMS ? EXIT1_IR : SHIFT_IR;
            SHIFT_IR:         next_state = TMS ? EXIT1_IR : SHIFT_IR;
            EXIT1_IR:         next_state = TMS ? UPDATE_IR : PAUSE_IR;
            PAUSE_IR:         next_state = TMS ? EXIT2_IR : PAUSE_IR;
            EXIT2_IR:         next_state = TMS ? UPDATE_IR : SHIFT_IR;
            UPDATE_IR:        next_state = TMS ? SELECT_DR_SCAN : RUN_TEST_IDLE;
            default:          next_state = TEST_LOGIC_RESET;
        endcase
    end

    // Data register logic
    always @(posedge TCLK or posedge TRST) begin
        if (TRST) begin
            data_reg <= {DATA_WIDTH{1'b0}};
            data_reg_valid <= 1'b0;
        end else if (current_state == SHIFT_DR) begin
            data_reg <= {TDI, data_reg[DATA_WIDTH-1:1]};
        end else if (current_state == UPDATE_DR) begin
            data_reg_valid <= 1'b1;
        end else begin
            data_reg_valid <= 1'b0;
        end
    end

    // Instruction register logic
    always @(posedge TCLK or posedge TRST) begin
        if (TRST) begin
            inst_reg <= 4'b0;
            inst_reg_valid <= 1'b0;
        end else if (current_state == SHIFT_IR) begin
            inst_reg <= {TDI, inst_reg[3:1]};
        end else if (current_state == UPDATE_IR) begin
            inst_reg_valid <= 1'b1;
        end else begin
            inst_reg_valid <= 1'b0;
        end
    end

    // TDO output logic (simplified for this example)
    always @(*) begin
        TDO = TDI;
    end

endmodule