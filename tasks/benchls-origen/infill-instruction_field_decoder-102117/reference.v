module origen_102117 (
    input [63:0] instruction,
    output reg [5:0] opcode,
    output reg [9:0] func,
    output reg [21:0] Store_or_load_address,
    output reg [21:0] Data_register_or_address,
    output reg [21:0] Image_Buffer_Register,
    output reg [10:0] Resize_Reg_1,
    output reg [10:0] Resize_Reg_2
);

    always @(*) begin
        if (instruction[63:60] == 4'b1111) begin
            opcode = instruction[59:54];
            func = instruction[53:44];
            
            case (opcode)
                6'b000000: begin // Memory operations
                    Store_or_load_address = instruction[43:22];
                    Data_register_or_address = instruction[21:0];
                    Image_Buffer_Register = 22'bx;
                    Resize_Reg_1 = 11'bx;
                    Resize_Reg_2 = 11'bx;
                end
                
                6'b000001: begin // Image operations
                    Store_or_load_address = 22'bx;
                    Data_register_or_address = 22'bx;
                    Image_Buffer_Register = instruction[43:22];
                    Resize_Reg_1 = instruction[21:11];
                    Resize_Reg_2 = instruction[10:0];
                end
                
                default: begin // Other opcodes
                    Store_or_load_address = 22'bx;
                    Data_register_or_address = 22'bx;
                    Image_Buffer_Register = 22'bx;
                    Resize_Reg_1 = 11'bx;
                    Resize_Reg_2 = 11'bx;
                end
            endcase
        end
        else begin
            opcode = 6'bx;
            func = 10'bx;
            Store_or_load_address = 22'bx;
            Data_register_or_address = 22'bx;
            Image_Buffer_Register = 22'bx;
            Resize_Reg_1 = 11'bx;
            Resize_Reg_2 = 11'bx;
        end
    end

endmodule