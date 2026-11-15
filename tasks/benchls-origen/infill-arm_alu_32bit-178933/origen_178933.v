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

[MASKED]

endmodule