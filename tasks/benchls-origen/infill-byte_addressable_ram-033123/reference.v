module origen_033123 #(
    parameter DATA_WIDTH = 32,
    parameter ADDRESS_WIDTH = 10
)(
    input wire clk,
    input wire MemWrite,
    input wire MemRead,
    input wire [1:0] mode,
    input wire [ADDRESS_WIDTH-1:0] i_address,
    input wire [DATA_WIDTH-1:0] i_write_data,
    output reg [DATA_WIDTH-1:0] o_read_data
);

    reg [7:0] D_memory [0:999];  // 1000-byte memory array

    integer i;
    initial begin
        for (i = 0; i < 1000; i = i + 1) begin
            D_memory[i] = 8'b0;
        end
    end

    always @(*) begin
        if (MemRead) begin
            case (mode)
                2'b10: o_read_data = {24'b0, D_memory[i_address]};
                2'b01: o_read_data = {16'b0, D_memory[i_address+1], D_memory[i_address]};
                2'b00: o_read_data = {D_memory[i_address+3], D_memory[i_address+2], D_memory[i_address+1], D_memory[i_address]};
                default: o_read_data = 32'b0;
            endcase
        end else begin
            o_read_data = 32'b0;
        end
    end

    always @(negedge clk) begin
        if (MemWrite) begin
            case (mode)
                2'b10: D_memory[i_address] <= i_write_data[7:0];
                2'b01: begin
                    D_memory[i_address] <= i_write_data[7:0];
                    D_memory[i_address+1] <= i_write_data[15:8];
                end
                2'b00: begin
                    D_memory[i_address] <= i_write_data[7:0];
                    D_memory[i_address+1] <= i_write_data[15:8];
                    D_memory[i_address+2] <= i_write_data[23:16];
                    D_memory[i_address+3] <= i_write_data[31:24];
                end
            endcase
        end
    end

endmodule