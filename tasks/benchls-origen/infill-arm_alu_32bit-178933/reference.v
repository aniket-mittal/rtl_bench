module origen_178933(
    input [31:0] a,
    input [31:0] b,
    input [1:0] ALUControl,
    output reg [31:0] Result,
    output reg [3:0] ALUFlags
);

wire [31:0] condinvb;
wire [32:0] sum;

assign condinvb = (ALUControl[0]) ? ~b : b;
assign sum = a + condinvb + ALUControl[0];

always @(*) begin
    case (ALUControl[1:0])
        2'b01: begin
            Result = sum[31:0];
            ALUFlags[3] = sum[32]; // carry
            ALUFlags[2] = (sum[31:0] == 32'b0); // zero
            ALUFlags[1] = sum[31]; // negative
            ALUFlags[0] = (a[31] == b[31]) && (sum[31] != a[31]); // overflow
        end
        2'b00: begin
            Result = sum[31:0];
            ALUFlags[3] = sum[32]; // carry
            ALUFlags[2] = (sum[31:0] == 32'b0); // zero
            ALUFlags[1] = sum[31]; // negative
            ALUFlags[0] = (a[31] == b[31]) && (sum[31] != a[31]); // overflow
        end
        2'b10: begin
            Result = a & b;
            ALUFlags[3] = 1'b0; // carry
            ALUFlags[2] = (Result == 32'b0); // zero
            ALUFlags[1] = Result[31]; // negative
            ALUFlags[0] = 1'b0; // overflow
        end
        2'b11: begin
            Result = a | b;
            ALUFlags[3] = 1'b0; // carry
            ALUFlags[2] = (Result == 32'b0); // zero
            ALUFlags[1] = Result[31]; // negative
            ALUFlags[0] = 1'b0; // overflow
        end
        default: begin
            Result = 32'b0;
            ALUFlags = 4'b0;
        end
    endcase
end

endmodule