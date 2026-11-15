module origen_046549 #(parameter DEBUG = 0) (
    input [31:0] A, B,
    input [2:0] FSEL,
    output reg [31:0] DOUT,
    output reg COUT, ZERO, NEG, OVF
);

    reg [32:0] temp;
    
    always @(*) begin
        COUT = 0;
        OVF = 0;
        
        case(FSEL)
            3'b000: begin // Addition
                temp = {1'b0, A} + {1'b0, B};
                DOUT = temp[31:0];
                COUT = temp[32];
                OVF = (A[31] == B[31]) && (DOUT[31] != A[31]);
                if (DEBUG) ;
            end
            3'b001: begin // Bitwise AND
                DOUT = A & B;
                if (DEBUG) ;
            end
            3'b010: begin // Bitwise OR
                DOUT = A | B;
                if (DEBUG) ;
            end
            3'b011: begin // Bitwise XOR
                DOUT = A ^ B;
                if (DEBUG) ;
            end
            3'b100: begin // Subtraction
                temp = {1'b0, A} - {1'b0, B};
                DOUT = temp[31:0];
                COUT = ~temp[32]; // Borrow
                OVF = (A[31] != B[31]) && (DOUT[31] != A[31]);
                if (DEBUG) ;
            end
            default: begin // Invalid FSEL
                DOUT = 32'b0;
                COUT = 1'b0;
                OVF = 1'b0;
                if (DEBUG) ;
            end
        endcase
        
        ZERO = (DOUT == 32'b0);
        NEG = DOUT[31];
    end

endmodule