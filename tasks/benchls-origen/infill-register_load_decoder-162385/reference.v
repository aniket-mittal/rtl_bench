module origen_162385(op, c, ld, sel);
    input [3:0] op;
    input c;
    output reg [3:0] ld;
    output reg [1:0] sel;

    always @(*) begin
        case (op)
            4'b0000: begin
                ld = 4'b0001;
                sel = 2'b00;
            end
            4'b0001: begin
                ld = 4'b0010;
                sel = 2'b01;
            end
            4'b0010: begin
                ld = 4'b0100;
                sel = 2'b10;
            end
            4'b0011: begin
                ld = 4'b1000;
                sel = 2'b11;
            end
            4'b0100: begin
                ld = 4'b0000;
                sel = 2'b00;
            end
            4'b0101: begin
                ld = 4'b0000;
                sel = 2'b01;
            end
            4'b0110: begin
                ld = 4'b0000;
                sel = 2'b10;
            end
            4'b0111: begin
                ld = 4'b0000;
                sel = 2'b11;
            end
            4'b1110: begin
                ld = c ? 4'b1010 : 4'b0101;
                sel = c ? 2'b01 : 2'b10;
            end
            default: begin
                ld = 4'b0000;
                sel = 2'b00;
            end
        endcase
    end
endmodule