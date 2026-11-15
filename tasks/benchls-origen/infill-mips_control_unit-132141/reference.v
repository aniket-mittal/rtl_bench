module origen_132141(
    input wire [5:0] op,
    input wire [5:0] func,
    input wire equal_result,
    output wire JR,
    output wire J,
    output wire JAL,
    output wire LW,
    output wire WREG,
    output wire WMEM,
    output wire RDorRT,
    output wire SE,
    output wire SA,
    output wire IorR,
    output wire BJ,
    output wire [4:0] Aluc
);

    // Define opcodes and function codes
    localparam R_TYPE = 6'b000000;
    localparam J_TYPE = 6'b000010;
    localparam JAL_TYPE = 6'b000011;
    localparam BEQ = 6'b000100;
    localparam LW_OP = 6'b100011;
    localparam SW_OP = 6'b101011;
    
    localparam JR_FUNC = 6'b001000;
    localparam ADD_FUNC = 6'b100000;
    localparam SUB_FUNC = 6'b100010;
    localparam AND_FUNC = 6'b100100;
    localparam OR_FUNC = 6'b100101;
    localparam SLT_FUNC = 6'b101010;

    // Control signals
    reg jr, j, jal, lw, wreg, wmem, rdorrt, se, sa, iorr, bj;
    reg [4:0] aluc;

    always @(*) begin
        // Default values
        {jr, j, jal, lw, wreg, wmem, rdorrt, se, sa, iorr, bj} = 11'b0;
        aluc = 5'b00000;

        case(op)
            R_TYPE: begin
                wreg = 1'b1;
                iorr = 1'b1;
                case(func)
                    JR_FUNC: begin
                        jr = 1'b1;
                        wreg = 1'b0;
                    end
                    ADD_FUNC: aluc = 5'b00010;
                    SUB_FUNC: aluc = 5'b00110;
                    AND_FUNC: aluc = 5'b00000;
                    OR_FUNC:  aluc = 5'b00001;
                    SLT_FUNC: aluc = 5'b00111;
                endcase
            end
            J_TYPE: j = 1'b1;
            JAL_TYPE: begin
                jal = 1'b1;
                wreg = 1'b1;
            end
            BEQ: begin
                bj = equal_result;
                se = 1'b1;
                aluc = 5'b00110; // Subtraction for comparison
            end
            LW_OP: begin
                lw = 1'b1;
                wreg = 1'b1;
                se = 1'b1;
                aluc = 5'b00010; // Addition for address calculation
            end
            SW_OP: begin
                wmem = 1'b1;
                se = 1'b1;
                aluc = 5'b00010; // Addition for address calculation
            end
            default: begin
                // For immediate arithmetic/logical operations
                wreg = 1'b1;
                se = 1'b1;
                case(op[5:3])
                    3'b001: aluc = {2'b00, op[2:0]}; // ADDI, ADDIU, SLTI, SLTIU
                    3'b100: aluc = {2'b00, op[2:0]}; // ANDI, ORI, XORI
                endcase
            end
        endcase
    end

    // Assign outputs
    assign JR = jr;
    assign J = j;
    assign JAL = jal;
    assign LW = lw;
    assign WREG = wreg;
    assign WMEM = wmem;
    assign RDorRT = rdorrt;
    assign SE = se;
    assign SA = sa;
    assign IorR = iorr;
    assign BJ = bj;
    assign Aluc = aluc;

endmodule