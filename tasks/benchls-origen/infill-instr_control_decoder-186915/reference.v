module origen_186915(
    input  wire [31:0] instr,
    output reg  reg_write,
    output reg  mem_write,
    output reg  mem_read,
    output reg  mem2reg,
    output reg  ALUSrc
);

always @(*) begin
    case (instr[31:21])
        11'h7C0: begin // Memory write
            reg_write = 0;
            mem_write = 1;
            mem_read  = 0;
            mem2reg   = 1;
            ALUSrc    = 1;
        end
        11'h7C2: begin // Memory read
            reg_write = 1;
            mem_write = 0;
            mem_read  = 1;
            mem2reg   = 0;
            ALUSrc    = 1;
        end
        (11'h450 || 11'h458 || 11'h550 || 11'h658): begin // ALU operations with immediate
            reg_write = 1;
            mem_write = 0;
            mem_read  = 0;
            mem2reg   = 1;
            ALUSrc    = 0;
        end
        11'h794: begin // ALU operation with constant
            reg_write = 1;
            mem_write = 0;
            mem_read  = 0;
            mem2reg   = 1;
            ALUSrc    = 1;
        end
        default: begin
            reg_write = 0;
            mem_write = 0;
            mem_read  = 0;
            mem2reg   = 0;
            ALUSrc    = 0;
        end
    endcase
end

endmodule