module origen_109165(
    input wire clk,
    input wire reset,
    input wire [11:0] irOutput,
    input wire pushBtnLeft,
    input wire pushBtnRight,
    input wire [11:0] switches,
    output reg [3:0] D_addr,
    output reg D_rd,
    output reg D_wr,
    output reg RF_we,
    output reg [2:0] RF_waddr,
    output reg isExternal,
    output reg AluSel,
    output reg [2:0] ra,
    output reg [2:0] rb
);

    // State encoding
    localparam S0 = 3'b000;
    localparam S1 = 3'b001;
    localparam S2a = 3'b010;
    localparam S2b = 3'b011;
    localparam S2c = 3'b100;
    localparam S2d = 3'b101;
    localparam S3 = 3'b110;

    reg [2:0] state, next_state;
    reg [2:0] opcode;

    // State register
    always @(posedge clk or posedge reset) begin
        if (reset)
            state <= S0;
        else
            state <= next_state;
    end

    // Next state logic
    always @(*) begin
        case (state)
            S0: next_state = S1;
            S1: begin
                case (opcode)
                    3'b000: next_state = S2a;
                    3'b001: next_state = S2b;
                    3'b010: next_state = S2c;
                    3'b011: next_state = S2d;
                    default: next_state = S3;
                endcase
            end
            S2a, S2b, S2c, S2d: next_state = S3;
            S3: next_state = S0;
            default: next_state = S0;
        endcase
    end

    // Output logic
    always @(*) begin
        // Default values
        D_addr = 4'b0000;
        D_rd = 1'b0;
        D_wr = 1'b0;
        RF_we = 1'b0;
        RF_waddr = 3'b000;
        isExternal = 1'b0;
        AluSel = 1'b0;
        ra = 3'b000;
        rb = 3'b000;

        case (state)
            S0: begin
                isExternal = pushBtnRight;
            end
            S1: begin
                opcode = irOutput[11:9];
                ra = irOutput[8:6];
                rb = irOutput[5:3];
                RF_waddr = irOutput[2:0];
            end
            S2a: begin
                D_addr = irOutput[3:0];
                D_rd = 1'b1;
                RF_we = 1'b1;
            end
            S2b: begin
                D_addr = irOutput[3:0];
                D_wr = 1'b1;
            end
            S2c: begin
                RF_we = 1'b1;
                AluSel = 1'b0;
            end
            S2d: begin
                RF_we = 1'b1;
                AluSel = 1'b1;
            end
            S3: begin
                // No specific outputs
            end
        endcase
    end

endmodule