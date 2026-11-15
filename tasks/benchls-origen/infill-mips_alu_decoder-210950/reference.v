module origen_210950(
    input  [1:0] alu_op,
    input  [5:0] funct,
    output reg [2:0] alu_ctrl,
    output reg jr,
    output reg MHI,
    output reg MLO,
    output reg HILO,
    output reg MultToReg,
    output reg shift
);

always @(*) begin
    if (alu_op == 2'b00) begin
        alu_ctrl = 3'b010;
        jr = 1'b0;
        MHI = 1'b0;
        MLO = 1'b0;
        HILO = 1'b0;
        MultToReg = 1'b0;
        shift = 1'b0;
    end
    else if (alu_op == 2'b01) begin
        alu_ctrl = 3'b110;
        jr = 1'b0;
        MHI = 1'b0;
        MLO = 1'b0;
        HILO = 1'b0;
        MultToReg = 1'b0;
        shift = 1'b0;
    end
    else begin
        case (funct)
            6'b100100: begin // AND
                alu_ctrl = 3'b000;
                jr = 1'b0;
                MHI = 1'b0;
                MLO = 1'b0;
                HILO = 1'b0;
                MultToReg = 1'b0;
                shift = 1'b0;
            end
            6'b100101: begin // OR
                alu_ctrl = 3'b001;
                jr = 1'b0;
                MHI = 1'b0;
                MLO = 1'b0;
                HILO = 1'b0;
                MultToReg = 1'b0;
                shift = 1'b0;
            end
            6'b100000: begin // ADD
                alu_ctrl = 3'b010;
                jr = 1'b0;
                MHI = 1'b0;
                MLO = 1'b0;
                HILO = 1'b0;
                MultToReg = 1'b0;
                shift = 1'b0;
            end
            6'b100010: begin // SUB
                alu_ctrl = 3'b110;
                jr = 1'b0;
                MHI = 1'b0;
                MLO = 1'b0;
                HILO = 1'b0;
                MultToReg = 1'b0;
                shift = 1'b0;
            end
            6'b101010: begin // SLT
                alu_ctrl = 3'b111;
                jr = 1'b0;
                MHI = 1'b0;
                MLO = 1'b0;
                HILO = 1'b0;
                MultToReg = 1'b0;
                shift = 1'b0;
            end
            6'b000000: begin // SLL
                alu_ctrl = 3'b100;
                jr = 1'b0;
                MHI = 1'b0;
                MLO = 1'b0;
                HILO = 1'b0;
                MultToReg = 1'b0;
                shift = 1'b1;
            end
            6'b000010: begin // SRL
                alu_ctrl = 3'b101;
                jr = 1'b0;
                MHI = 1'b0;
                MLO = 1'b0;
                HILO = 1'b0;
                MultToReg = 1'b0;
                shift = 1'b1;
            end
            6'b001000: begin // JR
                alu_ctrl = 3'b000;
                jr = 1'b1;
                MHI = 1'b0;
                MLO = 1'b0;
                HILO = 1'b0;
                MultToReg = 1'b0;
                shift = 1'b0;
            end
            6'b011000: begin // MULT
                alu_ctrl = 3'b000;
                jr = 1'b0;
                MHI = 1'b1;
                MLO = 1'b1;
                HILO = 1'b1;
                MultToReg = 1'b1;
                shift = 1'b0;
            end
            6'b011010: begin // DIV
                alu_ctrl = 3'b000;
                jr = 1'b0;
                MHI = 1'b1;
                MLO = 1'b1;
                HILO = 1'b1;
                MultToReg = 1'b1;
                shift = 1'b0;
            end
            default: begin
                alu_ctrl = 3'b000;
                jr = 1'b0;
                MHI = 1'b0;
                MLO = 1'b0;
                HILO = 1'b0;
                MultToReg = 1'b0;
                shift = 1'b0;
            end
        endcase
    end
end

endmodule