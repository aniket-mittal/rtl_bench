module origen_000945(
    input [31:0] dir,
    input [31:0] data_input,
    input mem_rd,
    input mem_wd,
    input mem_rd_Result,
    input [31:0] numberOne,
    input [31:0] numberTwo,
    input [31:0] operation,
    input wd_numberOne,
    input wd_numberTwo,
    input wd_operation,
    output reg [31:0] data_output,
    output reg [31:0] result_output
);

    reg [31:0] memRegFile [0:63];
    integer i;
    
    parameter initial_value = 32'h00400000;

    initial begin
        for (i = 0; i < 64; i = i + 1)
            memRegFile[i] = 32'h0;
        
        memRegFile[3] = 32'h00000000;
        memRegFile[4] = 32'h00000000;
        memRegFile[5] = 32'h00000000;
        memRegFile[6] = 32'h00000000;
        memRegFile[7] = 32'h00000000;
        memRegFile[8] = 32'h00000000;
        memRegFile[9] = 32'h00000000;
    end

    wire [31:0] internal_address;
    assign internal_address = (dir - initial_value) >> 2;

    always @(*) begin
        if (mem_wd)
            memRegFile[internal_address] = data_input;
        
        if (wd_numberOne)
            memRegFile[0] = numberOne;
        
        if (wd_numberTwo)
            memRegFile[1] = numberTwo;
        
        if (wd_operation)
            memRegFile[2] = operation;
        
        if (mem_rd)
            data_output = memRegFile[internal_address];
        else
            data_output = 32'h0;
        
        if (mem_rd_Result)
            result_output = memRegFile[3];
        else
            result_output = 32'h0;
    end

endmodule