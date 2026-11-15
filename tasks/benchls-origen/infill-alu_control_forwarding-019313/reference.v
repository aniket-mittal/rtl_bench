module origen_019313(
    input [5:0] funct_i,
    input [2:0] ALUOp_i,
    output reg [3:0] ALU_operation_o,
    output reg [1:0] FURslt_o,
    output reg jr
);

    always @(*) begin
        // Default values
        ALU_operation_o = 4'b0000;
        FURslt_o = 2'b00;
        jr = 1'b0;

        // ALU operation logic
        casez({ALUOp_i, funct_i})
            9'b010_100000: ALU_operation_o = 4'b0010; // add
            9'b010_100010: ALU_operation_o = 4'b0110; // sub
            9'b010_100100: ALU_operation_o = 4'b0000; // and
            9'b010_100101: ALU_operation_o = 4'b0001; // or
            9'b010_100110: ALU_operation_o = 4'b0011; // xor
            9'b010_000000: ALU_operation_o = 4'b0100; // sll
            9'b010_000010: ALU_operation_o = 4'b0101; // srl
            9'b010_101010: ALU_operation_o = 4'b0111; // slt
            9'b000_??????: ALU_operation_o = 4'b0010; // add for lw/sw
            9'b001_??????: ALU_operation_o = 4'b0110; // sub for beq
            9'b011_??????: ALU_operation_o = 4'b0000; // and for andi
            9'b100_??????: ALU_operation_o = 4'b0001; // or for ori
            9'b101_??????: ALU_operation_o = 4'b0111; // slt for slti
            default: ALU_operation_o = 4'b0000;
        endcase

        // FURslt_o logic
        case(ALUOp_i)
            3'b101: FURslt_o = 2'b10;
            3'b010: begin
                if (funct_i == 6'b000000 || funct_i == 6'b000010)
                    FURslt_o = 2'b01;
                else
                    FURslt_o = 2'b00;
            end
            default: FURslt_o = 2'b00;
        endcase

        // jr logic
        if (ALUOp_i == 3'b010 && funct_i == 6'b001000)
            jr = 1'b1;
        else
            jr = 1'b0;
    end

endmodule