module origen_165322 (
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
    output wire [31:0] read1,
    output wire [31:0] read2
);

    reg [31:0] register [31:0];

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            for (integer i = 0; i < 32; i = i + 1) begin
                register[i] <= 32'b0;
            end
        end
        else begin
            if (write) begin
                if (store) begin
                    case (funct3)
                        3'b000: register[reg2] <= {{24{register[reg2][7]}}, register[reg2][7:0]}; // sb
                        3'b001: register[reg2] <= {{16{register[reg2][15]}}, register[reg2][15:0]}; // sh
                        3'b010: register[reg2] <= register[reg2]; // sw
                        default: register[reg2] <= 32'b0;
                    endcase
                end
                else if (load) begin
                    case (funct3)
                        3'b000: register[write_reg] <= {{24{write_data[7]}}, write_data[7:0]}; // lb
                        3'b001: register[write_reg] <= {{16{write_data[15]}}, write_data[15:0]}; // lh
                        3'b010: register[write_reg] <= write_data; // lw
                        3'b100: register[write_reg] <= {24'b0, write_data[7:0]}; // lbu
                        3'b101: register[write_reg] <= {16'b0, write_data[15:0]}; // lhu
                        default: register[write_reg] <= 32'b0;
                    endcase
                end
                else begin
                    register[write_reg] <= write_data;
                end
            end
        end
    end

    assign read1 = register[reg1];
    assign read2 = register[reg2];

endmodule