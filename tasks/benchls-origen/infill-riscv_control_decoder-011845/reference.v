module origen_011845(
    input [6:0] Op_i,
    output reg [7:0] Control_o
);

    reg [2:0] Ex;
    reg [2:0] Mem;
    reg [1:0] Wb;

    always @(*) begin
        case(Op_i)
            7'b0110011: begin // R-type arithmetic instruction
                Ex = 3'b100;
                Mem = 3'b000;
                Wb = 2'b10;
            end
            7'b0000011: begin // Load instruction
                Ex = 3'b001;
                Mem = 3'b010;
                Wb = 2'b11;
            end
            7'b0010011: begin // I-type arithmetic or logical instruction
                Ex = 3'b001;
                Mem = 3'b000;
                Wb = 2'b10;
            end
            7'b0100011: begin // Store instruction
                Ex = 3'b001;
                Mem = 3'b001;
                Wb = 2'b00;
            end
            7'b1100011: begin // Branch instruction
                Ex = 3'b010;
                Mem = 3'b100;
                Wb = 2'b00;
            end
            7'b0000000: begin // No operation or system call
                Ex = 3'b000;
                Mem = 3'b000;
                Wb = 2'b00;
            end
            default: begin // Default case
                Ex = 3'b000;
                Mem = 3'b000;
                Wb = 2'b00;
            end
        endcase

        Control_o = {Ex, Mem, Wb};
    end

endmodule