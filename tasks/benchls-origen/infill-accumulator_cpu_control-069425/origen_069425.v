module origen_069425(
    input wire clk, reset, start,
    input wire [7:0] instr,
    input wire zero, pos,
    output reg PCSrc, PCWrite, IorD, MemWrite, IRWrite, OutWrite,
    output reg [1:0] AccSrc,
    output reg [2:0] ALUControl,
    output reg AccWrite
);

    // State parameters
    parameter S0 = 5'b00000, S1 = 5'b00001, S2 = 5'b00010, S3 = 5'b00011,
              S4 = 5'b00100, S5 = 5'b00101, S6 = 5'b00110, S7 = 5'b00111,
              S8 = 5'b01000, S9 = 5'b01001, S10 = 5'b01010, S11 = 5'b01011;

    reg [4:0] state, nextstate;
    reg branch, ZorP;

    // State register
    always @(posedge clk or posedge reset) begin
        if (reset)
            state <= S0;
        else
            state <= nextstate;
    end

    // Next state logic
    [MASKED]

    // Output logic
    always @(*) begin
        // Default output values
        PCSrc = 0; PCWrite = 0; IorD = 0; MemWrite = 0; IRWrite = 0;
        OutWrite = 0; AccSrc = 2'b00; ALUControl = 3'b000; AccWrite = 0;
        branch = 0; ZorP = 0;

        case (state)
            S0: begin
                PCWrite = start;
                IRWrite = start;
            end
            S1: ; // Decode state, no outputs
            S2: begin // Load
                IorD = 1;
                AccSrc = 2'b01;
                AccWrite = 1;
            end
            S3: begin // Store
                IorD = 1;
                MemWrite = 1;
            end
            S4: begin // Add
                ALUControl = 3'b000;
                AccSrc = 2'b10;
                AccWrite = 1;
            end
            S5: begin // Subtract
                ALUControl = 3'b001;
                AccSrc = 2'b10;
                AccWrite = 1;
            end
            S6: begin // AND
                ALUControl = 3'b010;
                AccSrc = 2'b10;
                AccWrite = 1;
            end
            S7: begin // Branch if Zero
                branch = 1;
                ZorP = 1;
            end
            S8: begin // Branch if Positive
                branch = 1;
                ZorP = 0;
            end
            S9: begin // Load Immediate
                AccSrc = 2'b11;
                AccWrite = 1;
            end
            S10: begin // Output
                OutWrite = 1;
            end
            S11: ; // Halt, no outputs
        endcase
    end

    // PCSrc logic
    always @(*) begin
        PCSrc = branch & ((ZorP & zero) | (~ZorP & pos));
    end

endmodule