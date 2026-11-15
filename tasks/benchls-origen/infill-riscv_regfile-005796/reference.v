module origen_005796 (
    input wire clk,
    input wire reset,
    input wire [4:0] reg1,
    input wire [4:0] reg2,
    input wire [4:0] write_reg,
    input wire [31:0] write_data,
    input wire write,
    input wire load,
    input wire store,
    input wire [2:0] funct3,
    output reg [31:0] read1,
    output reg [31:0] read2
);

    reg [31:0] registers [31:0];
    integer i;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            for (i = 0; i < 32; i = i + 1) begin
                registers[i] <= 32'b0;
            end
        end else begin
            read1 <= registers[reg1];

            if (store) begin
                case (funct3)
                    3'b000: read2 <= {{24{registers[reg2][7]}}, registers[reg2][7:0]};
                    3'b001: read2 <= {{16{registers[reg2][15]}}, registers[reg2][15:0]};
                    default: read2 <= registers[reg2];
                endcase
            end else begin
                read2 <= registers[reg2];
            end

            if (write) begin
                if (load) begin
                    case (funct3)
                        3'b000: registers[write_reg] <= {{24{write_data[7]}}, write_data[7:0]};
                        3'b001: registers[write_reg] <= {{16{write_data[15]}}, write_data[15:0]};
                        3'b100: registers[write_reg] <= {24'b0, write_data[7:0]};
                        3'b101: registers[write_reg] <= {16'b0, write_data[15:0]};
                        default: registers[write_reg] <= write_data;
                    endcase
                end else begin
                    registers[write_reg] <= write_data;
                end
            end
        end
    end

endmodule