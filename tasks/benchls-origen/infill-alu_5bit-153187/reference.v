module origen_153187(
    input [4:0] A,
    input [4:0] B,
    input [1:0] Op,
    input Cin,
    output reg [4:0] R,
    output reg C
);

    reg [5:0] Reg1, Reg2, Reg3;
    reg [4:0] temp;

    always @(*) begin
        case (Op)
            2'b00: begin
                if (A <= B) begin
                    R = 5'b0;
                    C = 1'b1;
                end else begin
                    R = 5'b0;
                    C = 1'b0;
                end
            end
            2'b01: begin
                Reg1 = {1'b0, A};
                Reg2 = {1'b0, B};
                Reg3 = Reg1 * Reg2;
                R = Reg3[4:0];
                C = 1'b0;
            end
            2'b10: begin
                Reg1 = {3'b0, A[4:2]};
                Reg2 = {3'b0, B[2:0]};
                Reg3 = Reg1 * Reg2;
                R = Reg3[4:0];
                C = 1'b0;
            end
            2'b11: begin
                temp = B;
                Reg3 = {1'b0, A} - {1'b0, temp} + Cin;
                R = Reg3[4:0];
                C = Reg3[5];
            end
            default: begin
                R = 5'b0;
                C = 1'b0;
            end
        endcase
    end

endmodule