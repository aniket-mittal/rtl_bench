module origen_025952(
    input wire reset,
    input wire [7:0] pc,
    input wire [7:0] inst,
    input wire [7:0] resreg,
    input wire [7:0] val_i,
    output reg [7:0] val1,
    output reg [7:0] val2,
    output reg wmem,
    output reg [4:0] wmemaddr,
    output reg wresreg,
    output reg wpc,
    output reg [7:0] pc_o,
    output reg rmem,
    output reg [4:0] rmemaddr
);

always @(*) begin
    if (reset) begin
        val1 = 8'b0;
        val2 = 8'b0;
        wmem = 1'b0;
        wmemaddr = 5'b0;
        wresreg = 1'b0;
        wpc = 1'b0;
        pc_o = 8'b0;
        rmem = 1'b0;
        rmemaddr = 5'b0;
    end else begin
        if (!inst[7]) begin // ALU operations
            case (inst[6:4])
                3'b001: begin // Load immediate
                    val1 = resreg;
                    val2 = {4'b0, inst[3:0]};
                    wresreg = 1'b1;
                    wpc = 1'b1;
                    pc_o = pc + 1;
                end
                3'b010: begin // Add immediate
                    val1 = resreg;
                    val2 = {4'b0, inst[3:0]};
                    wresreg = 1'b1;
                    wpc = 1'b1;
                    pc_o = pc + 1;
                end
                default: begin
                    val1 = 8'b0;
                    val2 = 8'b0;
                    wresreg = 1'b0;
                    wpc = 1'b1;
                    pc_o = pc + 1;
                end
            endcase
            wmem = 1'b0;
            wmemaddr = 5'b0;
            rmem = 1'b0;
            rmemaddr = 5'b0;
        end else begin // Memory and control operations
            case (inst[6:5])
                2'b00: begin // Read from memory and add to result register
                    rmem = 1'b1;
                    rmemaddr = inst[4:0];
                    val1 = resreg;
                    val2 = val_i;
                    wresreg = 1'b1;
                    wpc = 1'b1;
                    pc_o = pc + 1;
                end
                2'b01: begin // Read from memory and store in result register
                    rmem = 1'b1;
                    rmemaddr = inst[4:0];
                    val1 = 8'b0;
                    val2 = val_i;
                    wresreg = 1'b1;
                    wpc = 1'b1;
                    pc_o = pc + 1;
                end
                2'b10: begin // Write result register to memory
                    wmem = 1'b1;
                    wmemaddr = inst[4:0];
                    val1 = resreg;
                    val2 = 8'b0;
                    wresreg = 1'b0;
                    wpc = 1'b1;
                    pc_o = pc + 1;
                end
                2'b11: begin // Jump
                    val1 = 8'b0;
                    val2 = 8'b0;
                    wresreg = 1'b0;
                    wpc = 1'b1;
                    pc_o = {3'b0, inst[4:0]};
                end
            endcase
        end
    end
end

endmodule