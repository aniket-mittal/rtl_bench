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

    always @(posedge clk or posedge s or posedge r) begin
        if (r)
            q_reg <= 0;
        else if (s)
            q_reg <= 1;
        else
            q_reg <= d;
    end
endmodule