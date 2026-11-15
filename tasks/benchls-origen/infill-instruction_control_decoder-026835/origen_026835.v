module origen_026835 (
    input [31:0] ins,
    output reg store_imm,
    output reg ALU_src,
    output reg mem2reg,
    output reg reg_write,
    output reg mem_read,
    output reg mem_write,
    output reg [1:0] ALU_op0,
    output reg [1:0] ALU_op1
);

    wire [5:0] opcode;
    assign opcode = ins[5:0];

    [MASKED]

endmodule

module testbench;
    reg [31:0] ins;
    wire store_imm, ALU_src, mem2reg, reg_write, mem_read, mem_write;
    wire [1:0] ALU_op0, ALU_op1;

    control_unit dut (
        .ins(ins),
        .store_imm(store_imm),
        .ALU_src(ALU_src),
        .mem2reg(mem2reg),
        .reg_write(reg_write),
        .mem_read(mem_read),
        .mem_write(mem_write),
        .ALU_op0(ALU_op0),
        .ALU_op1(ALU_op1)
    );

    initial begin
        // Test Load instruction
        ins = 32'b00000000000000000000000000000011;
        #10;
        
        // Test Store instruction
        ins = 32'b00000000000000000000000000100011;
        #10;
        
        // Test Immediate arithmetic instruction
        ins = 32'b00000000000000000000000000010011;
        #10;
        
        // Test Register-type arithmetic instruction
        ins = 32'b00000000000000000000000000110011;
        #10;
        
        ;
    end

    initial begin
        $monitor("Time=%0t ins=%b store_imm=%b ALU_src=%b mem2reg=%b reg_write=%b mem_read=%b mem_write=%b ALU_op0=%b ALU_op1=%b",
                 $time, ins, store_imm, ALU_src, mem2reg, reg_write, mem_read, mem_write, ALU_op0, ALU_op1);
    end
endmodule