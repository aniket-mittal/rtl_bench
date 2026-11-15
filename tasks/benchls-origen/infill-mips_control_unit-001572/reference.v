module origen_001572(
    input [5:0] opcode,
    input [5:0] func,
    output reg [1:0] PCsel,
    output reg [1:0] EXTsel,
    output reg [2:0] ALUsel,
    output reg Bsel,
    output reg DMEn,
    output reg [1:0] A3sel,
    output reg [1:0] WDsel,
    output reg GRFEn
);

    // Instruction type decoding
    wire addu, subu, ori, lui, lw, sw, beq, jal, jr, j, jalr;

    assign addu = (opcode == 6'b000000) && (func == 6'b100001);
    assign subu = (opcode == 6'b000000) && (func == 6'b100011);
    assign ori  = (opcode == 6'b001101);
    assign lui  = (opcode == 6'b001111);
    assign lw   = (opcode == 6'b100011);
    assign sw   = (opcode == 6'b101011);
    assign beq  = (opcode == 6'b000100);
    assign jal  = (opcode == 6'b000011);
    assign jr   = (opcode == 6'b000000) && (func == 6'b001000);
    assign j    = (opcode == 6'b000010);
    assign jalr = (opcode == 6'b000000) && (func == 6'b001001);

    // Control signal generation
    always @(*) begin
        // Default values
        PCsel  = 2'b00;
        EXTsel = 2'b00;
        ALUsel = 3'b000;
        Bsel   = 1'b0;
        DMEn   = 1'b0;
        A3sel  = 2'b00;
        WDsel  = 2'b00;
        GRFEn  = 1'b0;

        if (addu || subu) begin
            ALUsel = addu ? 3'b000 : 3'b001;
            A3sel  = 2'b00;
            WDsel  = 2'b00;
            GRFEn  = 1'b1;
        end
        else if (ori) begin
            EXTsel = 2'b00;
            ALUsel = 3'b010;
            Bsel   = 1'b1;
            A3sel  = 2'b01;
            WDsel  = 2'b00;
            GRFEn  = 1'b1;
        end
        else if (lui) begin
            EXTsel = 2'b10;
            A3sel  = 2'b01;
            WDsel  = 2'b01;
            GRFEn  = 1'b1;
        end
        else if (lw) begin
            EXTsel = 2'b01;
            ALUsel = 3'b000;
            Bsel   = 1'b1;
            A3sel  = 2'b01;
            WDsel  = 2'b10;
            GRFEn  = 1'b1;
        end
        else if (sw) begin
            EXTsel = 2'b01;
            ALUsel = 3'b000;
            Bsel   = 1'b1;
            DMEn   = 1'b1;
        end
        else if (beq) begin
            EXTsel = 2'b01;
            ALUsel = 3'b001;
            PCsel  = 2'b01;
        end
        else if (jal) begin
            PCsel  = 2'b10;
            A3sel  = 2'b10;
            WDsel  = 2'b11;
            GRFEn  = 1'b1;
        end
        else if (jr) begin
            PCsel  = 2'b11;
        end
        else if (j) begin
            PCsel  = 2'b10;
        end
        else if (jalr) begin
            PCsel  = 2'b11;
            A3sel  = 2'b00;
            WDsel  = 2'b11;
            GRFEn  = 1'b1;
        end
    end

endmodule