module origen_047771 (
    input [5:0] ALUCon,
    input [31:0] A,
    input [31:0] B,
    output reg [31:0] ALUOut,
    output Zero
);

    // Local parameters for ALU operations
    localparam ADD  = 6'b100000;
    localparam ADDU = 6'b100001;
    localparam SUB  = 6'b100010;
    localparam SUBU = 6'b100011;
    localparam AND  = 6'b100100;
    localparam NOR  = 6'b100111;
    localparam OR   = 6'b100101;
    localparam XOR  = 6'b100110;
    localparam SLT  = 6'b101010;
    localparam SLTU = 6'b101011;
    localparam SLL  = 6'b000000;
    localparam SRL  = 6'b000010;
    localparam SRA  = 6'b000011;
    localparam SLLV = 6'b000100;
    localparam SRLV = 6'b000110;
    localparam SRAV = 6'b000111;

    reg [31:0] ALURes;

    always @(*) begin
        case (ALUCon)
            ADD:  ALURes = $signed(A) + $signed(B);
            ADDU: ALURes = A + B;
            SUB:  ALURes = $signed(A) - $signed(B);
            SUBU: ALURes = A - B;
            AND:  ALURes = A & B;
            NOR:  ALURes = ~(A | B);
            OR:   ALURes = A | B;
            XOR:  ALURes = A ^ B;
            SLT:  ALURes = ($signed(A) < $signed(B)) ? 32'd1 : 32'd0;
            SLTU: ALURes = (A < B) ? 32'd1 : 32'd0;
            SLL:  ALURes = A << B;
            SRL:  ALURes = A >> B;
            SRA:  ALURes = $signed(A) >>> B;
            SLLV: ALURes = A << B[4:0];
            SRLV: ALURes = A >> B[4:0];
            SRAV: ALURes = $signed(A) >>> B[4:0];
            default: ALURes = 32'b0;
        endcase
    end

    assign Zero = (ALURes == 32'b0);
    assign ALUOut = ALURes;

endmodule