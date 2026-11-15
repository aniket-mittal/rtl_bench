module rtlpp_04628(mem_wr_data, mem_wr_addr, mem_wr_en, mem_rd_data1, mem_rd_addr1,
    mem_rd_data2, mem_rd_addr2, reset, clk);
    parameter n=8;
    output reg [n-1:0] mem_wr_data;
    output reg [n-1:0] mem_wr_addr;
    output reg mem_wr_en;
    input [n-1:0] mem_rd_data1;
    output [n-1:0] mem_rd_addr1;
    input [n-1:0] mem_rd_data2;
    output [n-1:0] mem_rd_addr2;
    input reset;
    input clk;

    reg [n-1:0] REG0, REG1, REG2, REG3, OPR0, OPR1;
    reg [2:0] instr;

    parameter [2:0]
        st_if  = 3'b000,
        st_id  = 3'b001,
        st_ex  = 3'b010,
        st_me  = 3'b011,
        st_wb  = 3'b100;

    reg [2:0] state;

    reg [n-1:0] PC; 
    reg [n-1:0] IR; 
    reg [n-1:0] REG [3:0]; 
    reg [n-1:0] OPR [1:0]; 

    assign mem_rd_addr1 = PC; 
    assign mem_rd_addr2 = REG[IR[ir_reg0_hi:ir_reg0_lo]];

    parameter ir_opcode_hi = 7;
    parameter ir_opcode_lo = 5;
    parameter ir_reg1_hi = 4;
    parameter ir_reg1_lo = 3;
    parameter ir_reg0_hi = 2;
    parameter ir_reg0_lo = 1;
    parameter ir_dst = 0;

    wire [2:0] op;
    assign op = IR[ir_opcode_hi:ir_opcode_lo];

    parameter [2:0]
        add  = 3'b000,
        addi = 3'b001,
        sub  = 3'b010,
        subi = 3'b011,
        mov  = 3'b100,
        movi = 3'b101,
        beq  = 3'b110,
        blt  = 3'b111;

    [MASKED]
endmodule