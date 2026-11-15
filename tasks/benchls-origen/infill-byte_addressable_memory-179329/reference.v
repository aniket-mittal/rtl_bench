module origen_179329(
    input clk,
    input MemRead,
    input MemWrite,
    input [7:0] addr,
    input [2:0] funct3,
    input [31:0] data_in,
    output reg [31:0] data_out
);

    reg [7:0] mem [0:255];

    initial begin
        // Initialize the memory contents
        mem[0] = 8'h11;
        mem[1] = 8'h22;
        mem[2] = 8'h33;
        mem[3] = 8'h44;
        // Add more initial values as needed
    end

    always @(posedge clk) begin
        if (MemRead) begin
            case (funct3)
                3'b000: // Sign-extended 8-bit data
                    data_out <= {{24{mem[addr][7]}}, mem[addr]};
                3'b001: // Sign-extended 16-bit data
                    data_out <= {{16{mem[addr+1][7]}}, mem[addr+1], mem[addr]};
                3'b010: // 32-bit data
                    data_out <= {mem[addr+3], mem[addr+2], mem[addr+1], mem[addr]};
                3'b100: // Zero-extended 8-bit data
                    data_out <= {24'b0, mem[addr]};
                3'b101: // Zero-extended 16-bit data
                    data_out <= {16'b0, mem[addr+1], mem[addr]};
                default:
                    data_out <= 32'b0;
            endcase
        end
        else if (MemWrite) begin
            case (funct3)
                3'b000: // Write 8-bit data
                    mem[addr] <= data_in[7:0];
                3'b001: // Write 16-bit data
                    {mem[addr+1], mem[addr]} <= data_in[15:0];
                3'b010: // Write 32-bit data
                    {mem[addr+3], mem[addr+2], mem[addr+1], mem[addr]} <= data_in;
                default:
                    ;
            endcase
        end
    end

endmodule