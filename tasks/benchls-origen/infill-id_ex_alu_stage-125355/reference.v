module origen_125355 (
    input wire clk,
    input wire rstn,
    input wire id_ex_rdy,
    input wire [31:0] id_ex_op1,
    input wire [31:0] id_ex_op2,
    input wire [5:0] id_ex_funct,
    input wire [31:0] id_ex_mem_st_data,
    input wire [2:0] id_ex_mem_st_funct,
    input wire [2:0] id_ex_mem_ld_funct,
    input wire ex_mem_ack,
    output reg id_ex_ack,
    output reg ex_mem_rdy,
    output reg ex_mem_alu_op,
    output reg [31:0] ex_mem_st_data,
    output reg [2:0] ex_mem_st_funct,
    output reg [2:0] ex_mem_ld_funct,
    output reg [31:0] ex_mem_data
);

    // Function codes
    localparam ADD  = 6'b000000;
    localparam SUB  = 6'b000001;
    localparam OR   = 6'b000010;
    localparam XOR  = 6'b000011;
    localparam AND  = 6'b000100;
    localparam STL  = 6'b000101;
    localparam STLU = 6'b000110;
    localparam SLL  = 6'b000111;
    localparam SRL  = 6'b001000;
    localparam SRA  = 6'b001001;

    // Memory operation codes
    localparam ST_NOP = 3'b000;
    localparam LD_NOP = 3'b000;

    reg [31:0] result;
    reg alu_op;

    always @(posedge clk or negedge rstn) begin
        if (!rstn) begin
            id_ex_ack <= 1'b0;
            ex_mem_rdy <= 1'b0;
            ex_mem_alu_op <= 1'b0;
            ex_mem_st_data <= 32'b0;
            ex_mem_st_funct <= 3'b0;
            ex_mem_ld_funct <= 3'b0;
            ex_mem_data <= 32'b0;
        end else begin
            if (id_ex_rdy && !id_ex_ack) begin
                // Perform ALU operation
                case (id_ex_funct)
                    ADD:  result <= id_ex_op1 + id_ex_op2;
                    SUB:  result <= id_ex_op1 - id_ex_op2;
                    OR:   result <= id_ex_op1 | id_ex_op2;
                    XOR:  result <= id_ex_op1 ^ id_ex_op2;
                    AND:  result <= id_ex_op1 & id_ex_op2;
                    STL:  result <= $signed(id_ex_op1) < $signed(id_ex_op2) ? 32'b1 : 32'b0;
                    STLU: result <= id_ex_op1 < id_ex_op2 ? 32'b1 : 32'b0;
                    SLL:  result <= id_ex_op1 << id_ex_op2[4:0];
                    SRL:  result <= id_ex_op1 >> id_ex_op2[4:0];
                    SRA:  result <= $signed(id_ex_op1) >>> id_ex_op2[4:0];
                    default: result <= 32'b0;
                endcase

                alu_op <= 1'b1;
                id_ex_ack <= 1'b1;
                ex_mem_rdy <= 1'b1;
                ex_mem_alu_op <= 1'b1;
                ex_mem_data <= result;

                // Handle memory operations
                if (id_ex_mem_st_funct != ST_NOP) begin
                    ex_mem_st_data <= id_ex_mem_st_data;
                    ex_mem_st_funct <= id_ex_mem_st_funct;
                end else begin
                    ex_mem_st_funct <= ST_NOP;
                end

                if (id_ex_mem_ld_funct != LD_NOP) begin
                    ex_mem_ld_funct <= id_ex_mem_ld_funct;
                end else begin
                    ex_mem_ld_funct <= LD_NOP;
                end
            end else if (ex_mem_ack) begin
                id_ex_ack <= 1'b0;
                ex_mem_rdy <= 1'b0;
                ex_mem_alu_op <= 1'b0;
                ex_mem_st_funct <= ST_NOP;
                ex_mem_ld_funct <= LD_NOP;
            end
        end
    end

endmodule