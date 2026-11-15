module origen_000488(
    input [3:0] nzcv,
    input [11:0] opfunc,
    output reg reg_write,
    output reg mem_to_reg,
    output reg mem_write,
    output reg pc_src,
    output reg update_nzcv,
    output reg link,
    output reg [1:0] alu_src,
    output reg [3:0] alu_op
);

    reg success;

    always @(*) begin
        // Condition evaluation
        case(opfunc[11:8])
            4'b0000: success = (nzcv[2] == 1'b1);              // EQ
            4'b0001: success = (nzcv[2] == 1'b0);              // NE
            4'b0010: success = (nzcv[1] == 1'b1);              // CS/HS
            4'b0011: success = (nzcv[1] == 1'b0);              // CC/LO
            4'b0100: success = (nzcv[3] == 1'b1);              // MI
            4'b0101: success = (nzcv[3] == 1'b0);              // PL
            4'b0110: success = (nzcv[0] == 1'b1);              // VS
            4'b0111: success = (nzcv[0] == 1'b0);              // VC
            4'b1000: success = (nzcv[1] == 1'b1 && nzcv[2] == 1'b0); // HI
            4'b1001: success = (nzcv[1] == 1'b0 || nzcv[2] == 1'b1); // LS
            4'b1010: success = (nzcv[3] == nzcv[0]);           // GE
            4'b1011: success = (nzcv[3] != nzcv[0]);           // LT
            4'b1100: success = (nzcv[2] == 1'b0 && nzcv[3] == nzcv[0]); // GT
            4'b1101: success = (nzcv[2] == 1'b1 || nzcv[3] != nzcv[0]); // LE
            4'b1110: success = 1'b1;                           // AL
            default: success = 1'bx;
        endcase

        // Control signal generation
        if (success == 1'b0) begin
            reg_write = 1'b0;
            mem_to_reg = 1'b0;
            mem_write = 1'b0;
            pc_src = 1'b0;
            update_nzcv = 1'b0;
            link = 1'b0;
            alu_src = 2'b00;
            alu_op = 4'b0000;
        end else begin
            case(opfunc[7:5])
                3'b101: begin // Branch operations
                    pc_src = 1'b1;
                    link = opfunc[4];
                    reg_write = link;
                    mem_to_reg = 1'b0;
                    mem_write = 1'b0;
                    update_nzcv = 1'b0;
                    alu_src = 2'b00;
                    alu_op = 4'b0000;
                end
                3'b000, 3'b001: begin // ALU operations
                    reg_write = 1'b1;
                    mem_to_reg = 1'b0;
                    mem_write = 1'b0;
                    pc_src = 1'b0;
                    update_nzcv = opfunc[4];
                    link = 1'b0;
                    alu_src = {1'b0, opfunc[5]};
                    alu_op = opfunc[3:0];
                end
                3'b010, 3'b011: begin // Memory operations
                    reg_write = ~opfunc[5];
                    mem_to_reg = ~opfunc[5];
                    mem_write = opfunc[5];
                    pc_src = 1'b0;
                    update_nzcv = 1'b0;
                    link = 1'b0;
                    alu_src = 2'b01;
                    alu_op = 4'b0000; // Add for address calculation
                end
                default: begin
                    reg_write = 1'bx;
                    mem_to_reg = 1'bx;
                    mem_write = 1'bx;
                    pc_src = 1'bx;
                    update_nzcv = 1'bx;
                    link = 1'bx;
                    alu_src = 2'bxx;
                    alu_op = 4'bxxxx;
                end
            endcase
        end
    end

endmodule