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

    [MASKED]

endmodule