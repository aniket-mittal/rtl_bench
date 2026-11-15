module origen_045727(
    input CLK100MHZ,
    input CLKSLOW,
    input [15:0] ir_inst,
    output reg pc_load,
    output reg pc_clear,
    output reg pc_inc,
    output reg ir_load,
    output reg mb_sel,
    output reg [7:0] mb_addr,
    output reg mb_read,
    output reg mb_write,
    output reg [7:0] dp_imm,
    output reg [1:0] dp_sel,
    output reg [3:0] dp_write_addr,
    output reg dp_write,
    output reg [3:0] dp_a_addr,
    output reg dp_a_read,
    output reg [3:0] dp_b_addr,
    output reg dp_b_read,
    output reg [3:0] dp_alu_sel
);

    reg [3:0] state, n_state;

    always @(posedge CLKSLOW) begin
        state <= n_state;
    end

    always @(*) begin
        // Default values
        pc_load = 0;
        pc_clear = 0;
        pc_inc = 0;
        ir_load = 0;
        mb_sel = 0;
        mb_addr = 8'b0;
        mb_read = 0;
        mb_write = 0;
        dp_imm = 8'b0;
        dp_sel = 2'b0;
        dp_write_addr = 4'b0;
        dp_write = 0;
        dp_a_addr = 4'b0;
        dp_a_read = 0;
        dp_b_addr = 4'b0;
        dp_b_read = 0;
        dp_alu_sel = 4'b0;

        case(state)
            4'h0: begin // Reset state
                n_state = 4'h1;
                pc_clear = 1;
            end
            4'h1: begin // Fetch instruction
                n_state = 4'h2;
                mb_read = 1;
                ir_load = 1;
                pc_inc = 1;
            end
            4'h2: begin // Decode instruction
                case(ir_inst[15:12])
                    4'h0, 4'h1, 4'h2, 4'h3, 4'h4, 4'h5, 4'h6, 4'h7: n_state = 4'h3; // ALU operations
                    4'h8: n_state = 4'h4; // Immediate load
                    4'h9: n_state = 4'h5; // Load from memory
                    4'hA: n_state = 4'h6; // Store to memory
                    default: n_state = 4'hF; // Halt or wait state
                endcase
            end
            4'h3: begin // Execute ALU operation
                n_state = 4'h1;
                dp_a_addr = ir_inst[11:8];
                dp_b_addr = ir_inst[7:4];
                dp_write_addr = ir_inst[3:0];
                dp_a_read = 1;
                dp_b_read = 1;
                dp_write = 1;
                dp_alu_sel = ir_inst[15:12];
            end
            4'h4: begin // Execute immediate load
                n_state = 4'h1;
                dp_imm = ir_inst[7:0];
                dp_write_addr = ir_inst[11:8];
                dp_sel = 2'b01;
                dp_write = 1;
            end
            4'h5: begin // Execute load from memory
                n_state = 4'h1;
                mb_addr = ir_inst[7:0];
                mb_sel = 1;
                mb_read = 1;
                dp_write_addr = ir_inst[11:8];
                dp_sel = 2'b10;
                dp_write = 1;
            end
            4'h6: begin // Execute store to memory
                n_state = 4'h1;
                mb_addr = ir_inst[7:0];
                mb_sel = 1;
                mb_write = 1;
                dp_a_addr = ir_inst[11:8];
                dp_a_read = 1;
            end
            4'hF: begin // Halt or wait state
                n_state = 4'hF;
            end
            default: n_state = 4'h0;
        endcase
    end

endmodule