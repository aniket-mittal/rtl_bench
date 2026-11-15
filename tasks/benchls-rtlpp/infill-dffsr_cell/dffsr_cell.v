module dffsr_cell (
    input clk,
    input d,
    input s,
    input r,
    output q,
    output notq
    );

    reg q_reg; 

    assign q = q_reg;
    assign notq = !q_reg;

    [MASKED]
endmodule