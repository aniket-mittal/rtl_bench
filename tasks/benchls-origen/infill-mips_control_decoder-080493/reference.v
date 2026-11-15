module origen_080493 (
    input [5:0] opcode_i,
    output reg reg_dst_o,
    output reg branch_eq_o,
    output reg branch_ne_o,
    output reg mem_read_o,
    output reg mem_write_o,
    output reg mem_to_reg_o,
    output reg alu_src_o,
    output reg reg_write_o,
    output reg jump_o,
    output reg [2:0] alu_op_o
);

    localparam R_TYPE = 6'b000000;
    localparam LUI    = 6'b001111;
    localparam ADDI   = 6'b001000;
    localparam ORI    = 6'b001101;
    localparam BEQ    = 6'b000100;
    localparam BNE    = 6'b000101;
    localparam SW     = 6'b101011;
    localparam LW     = 6'b100011;
    localparam J      = 6'b000010;
    localparam JAL    = 6'b000011;

    reg [11:0] control_values_r;

    always @(*) begin
        case (opcode_i)
            R_TYPE: control_values_r = 12'b1000_0010_0111;
            LUI:    control_values_r = 12'b0000_0011_0000;
            ADDI:   control_values_r = 12'b0000_0011_0001;
            ORI:    control_values_r = 12'b0000_0011_0010;
            BEQ:    control_values_r = 12'b0100_0000_0011;
            BNE:    control_values_r = 12'b0010_0000_0011;
            SW:     control_values_r = 12'b0000_1010_0100;
            LW:     control_values_r = 12'b0000_1111_0101;
            J:      control_values_r = 12'b0001_0000_0110;
            JAL:    control_values_r = 12'b0001_0010_0110;
            default: control_values_r = 12'b1111_1111_1111;
        endcase
    end

    assign reg_dst_o    = control_values_r[11];
    assign branch_eq_o  = control_values_r[10];
    assign branch_ne_o  = control_values_r[9];
    assign jump_o       = control_values_r[8];
    assign mem_read_o   = control_values_r[7];
    assign mem_to_reg_o = control_values_r[6];
    assign mem_write_o  = control_values_r[5];
    assign alu_src_o    = control_values_r[4];
    assign reg_write_o  = control_values_r[3];
    assign alu_op_o     = control_values_r[2:0];

endmodule