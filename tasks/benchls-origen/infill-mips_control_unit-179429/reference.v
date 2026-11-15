module origen_179429(
    OPCode,
    FunctCode,
    MemtoReg,
    MemWrite,
    Branch,
    ALUsrc,
    ALUop,
    EXTop,
    RegDst,
    RegWrite,
    Jadr,
    Jsrc
);

    input [5:0] OPCode, FunctCode;
    output reg [1:0] MemtoReg;
    output reg MemWrite;
    output reg [2:0] Branch;
    output reg [1:0] ALUsrc;
    output reg [3:0] ALUop;
    output reg [1:0] EXTop;
    output reg [1:0] RegDst;
    output reg RegWrite;
    output reg Jadr;
    output reg Jsrc;

    wire addu, subu, ori, lw, sw, beq, lui, jal, jr, nop;

    assign addu = (OPCode == 6'b000000 && FunctCode == 6'b100001);
    assign subu = (OPCode == 6'b000000 && FunctCode == 6'b100011);
    assign ori = (OPCode == 6'b001101);
    assign lw = (OPCode == 6'b100011);
    assign sw = (OPCode == 6'b101011);
    assign beq = (OPCode == 6'b000100);
    assign lui = (OPCode == 6'b001111);
    assign jal = (OPCode == 6'b000011);
    assign jr = (OPCode == 6'b000000 && FunctCode == 6'b001000);
    assign nop = (OPCode == 6'b000000 && FunctCode == 6'b000000);

    always @(*) begin
        MemtoReg <= 2'b00;
        MemWrite <= 1'b0;
        Branch <= 3'b000;
        ALUsrc <= 2'b00;
        ALUop <= 4'b0000;
        EXTop <= 2'b00;
        RegDst <= 2'b00;
        RegWrite <= 1'b0;
        Jadr <= 1'b0;
        Jsrc <= 1'b0;

        if (addu) begin
            ALUop <= 4'b0010;
            RegWrite <= 1'b1;
            RegDst <= 2'b01;
        end else if (subu) begin
            ALUop <= 4'b0110;
            RegWrite <= 1'b1;
            RegDst <= 2'b01;
        end else if (ori) begin
            ALUop <= 4'b0001;
            RegWrite <= 1'b1;
            RegDst <= 2'b00;
            ALUsrc <= 2'b01;
        end else if (lw) begin
            MemtoReg <= 2'b01;
            ALUsrc <= 2'b01;
            EXTop <= 2'b01;
            RegWrite <= 1'b1;
        end else if (sw) begin
            MemWrite <= 1'b1;
            ALUsrc <= 2'b01;
            EXTop <= 2'b01;
        end else if (beq) begin
            Branch <= 3'b001;
            ALUop <= 4'b0110;
        end else if (lui) begin
            ALUsrc <= 2'b01;
            EXTop <= 2'b10;
            RegWrite <= 1'b1;
        end else if (jal) begin
            MemtoReg <= 2'b10;
            Jadr <= 1'b0;
            Jsrc <= 1'b0;
            RegWrite <= 1'b1;
            RegDst <= 2'b10;
        end else if (jr) begin
            Jadr <= 1'b1;
            Jsrc <= 1'b1;
        end else if (nop) begin
            // Do nothing
        end
    end

endmodule