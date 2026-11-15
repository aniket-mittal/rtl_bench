module origen_014050(
    input [15:0] A_Data,
    input [15:0] B_Data,
    input [1:0] opcode,
    output reg OF,
    output reg [15:0] ALU_result
);

reg [31:0] temp;

always @(*) begin
    OF = 0;
    ALU_result = 0;
    temp = 0;

    case(opcode)
        2'b00: begin // Addition
            temp = A_Data + B_Data;
            if(temp > 16'hFFFF) begin
                OF = 1;
                ALU_result = 0;
            end else begin
                ALU_result = temp[15:0];
            end
        end

        2'b01: begin // Subtraction
            if(B_Data > A_Data) begin
                OF = 1;
            end else begin
                ALU_result = A_Data - B_Data;
            end
        end

        2'b10: begin // Multiplication
            temp = A_Data * B_Data;
            if(temp > 16'hFFFF) begin
                OF = 1;
                ALU_result = 0;
            end else begin
                ALU_result = temp[15:0];
            end
        end

        2'b11: begin // Division
            if(B_Data == 0) begin
                OF = 1;
                ALU_result = 0;
            end else begin
                ALU_result = A_Data / B_Data;
            end
        end
    endcase
end

endmodule