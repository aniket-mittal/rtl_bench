module origen_033681(
    input [5:0] OperationCode,
    output reg RegisterDestination,
    output reg ALUSource,
    output reg MemoryToRegister,
    output reg RegisterWrite,
    output reg MemoryRead,
    output reg MemoryWrite,
    output reg Branch,
    output reg Jump,
    output reg [1:0] ALUOperation,
    output reg SignZero
);

    always @(*) begin
        casex(OperationCode)
            6'b000000: begin // R-type
                RegisterDestination = 1'b1;
                ALUSource = 1'b0;
                MemoryToRegister = 1'b0;
                RegisterWrite = 1'b1;
                MemoryRead = 1'b0;
                MemoryWrite = 1'b0;
                Branch = 1'b0;
                Jump = 1'b0;
                ALUOperation = 2'b10;
                SignZero = 1'b0;
            end
            6'b100011: begin // Load word
                RegisterDestination = 1'b0;
                ALUSource = 1'b1;
                MemoryToRegister = 1'b1;
                RegisterWrite = 1'b1;
                MemoryRead = 1'b1;
                MemoryWrite = 1'b0;
                Branch = 1'b0;
                Jump = 1'b0;
                ALUOperation = 2'b00;
                SignZero = 1'b1;
            end
            6'b101011: begin // Store word
                RegisterDestination = 1'bx;
                ALUSource = 1'b1;
                MemoryToRegister = 1'bx;
                RegisterWrite = 1'b0;
                MemoryRead = 1'b0;
                MemoryWrite = 1'b1;
                Branch = 1'b0;
                Jump = 1'b0;
                ALUOperation = 2'b00;
                SignZero = 1'b1;
            end
            6'b000101: begin // Branch on not equal
                RegisterDestination = 1'bx;
                ALUSource = 1'b0;
                MemoryToRegister = 1'bx;
                RegisterWrite = 1'b0;
                MemoryRead = 1'b0;
                MemoryWrite = 1'b0;
                Branch = 1'b1;
                Jump = 1'b0;
                ALUOperation = 2'b01;
                SignZero = 1'b1;
            end
            6'b001110: begin // XORI
                RegisterDestination = 1'b0;
                ALUSource = 1'b1;
                MemoryToRegister = 1'b0;
                RegisterWrite = 1'b1;
                MemoryRead = 1'b0;
                MemoryWrite = 1'b0;
                Branch = 1'b0;
                Jump = 1'b0;
                ALUOperation = 2'b11;
                SignZero = 1'b0;
            end
            6'b000010: begin // Jump
                RegisterDestination = 1'bx;
                ALUSource = 1'bx;
                MemoryToRegister = 1'bx;
                RegisterWrite = 1'b0;
                MemoryRead = 1'b0;
                MemoryWrite = 1'b0;
                Branch = 1'b0;
                Jump = 1'b1;
                ALUOperation = 2'bxx;
                SignZero = 1'bx;
            end
            default: begin
                RegisterDestination = 1'b0;
                ALUSource = 1'b0;
                MemoryToRegister = 1'b0;
                RegisterWrite = 1'b0;
                MemoryRead = 1'b0;
                MemoryWrite = 1'b0;
                Branch = 1'b0;
                Jump = 1'b0;
                ALUOperation = 2'b00;
                SignZero = 1'b0;
            end
        endcase
    end

endmodule