module origen_061535(
    input [5:0] funct,
    input [2:0] aluop,
    output reg [4:0] alucontrol,
    output reg ret,
    output reg double
);

always @(*) begin
    case(aluop)
        3'b000: begin
            alucontrol = 5'b00010;
            ret = 1'b0;
            double = 1'b0;
        end
        3'b001: begin
            alucontrol = 5'b00110;
            ret = 1'b0;
            double = 1'b0;
        end
        3'b011: begin
            alucontrol = 5'b00000;
            ret = 1'b0;
            double = 1'b0;
        end
        3'b100: begin
            alucontrol = 5'b00001;
            ret = 1'b0;
            double = 1'b0;
        end
        3'b101: begin
            alucontrol = 5'b00111;
            ret = 1'b0;
            double = 1'b0;
        end
        default: begin
            case(funct)
                6'b100000: begin
                    alucontrol = 5'b00010;
                    ret = 1'b0;
                    double = 1'b0;
                end
                6'b100010: begin
                    alucontrol = 5'b00110;
                    ret = 1'b0;
                    double = 1'b0;
                end
                6'b100100: begin
                    alucontrol = 5'b00000;
                    ret = 1'b0;
                    double = 1'b0;
                end
                6'b100101: begin
                    alucontrol = 5'b00001;
                    ret = 1'b0;
                    double = 1'b0;
                end
                6'b101010: begin
                    alucontrol = 5'b00111;
                    ret = 1'b0;
                    double = 1'b0;
                end
                6'b001000: begin
                    alucontrol = 5'b01000;
                    ret = 1'b1;
                    double = 1'b0;
                end
                6'b011000: begin
                    alucontrol = 5'b01001;
                    ret = 1'b0;
                    double = 1'b1;
                end
                6'b000000: begin
                    alucontrol = 5'b01010;
                    ret = 1'b0;
                    double = 1'b0;
                end
                6'b000010: begin
                    alucontrol = 5'b01011;
                    ret = 1'b0;
                    double = 1'b0;
                end
                6'b000011: begin
                    alucontrol = 5'b10000;
                    ret = 1'b0;
                    double = 1'b0;
                end
                default: begin
                    alucontrol = 5'bxxxxx;
                    ret = 1'b0;
                    double = 1'b0;
                end
            endcase
        end
    endcase
end

endmodule