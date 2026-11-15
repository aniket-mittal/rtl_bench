module dff_cell (
    input clk,
    input d,
    output q,
    output notq
    );

    reg q_reg; 

    assign q = q_reg;
    assign notq = !q_reg;

    always @(posedge clk) begin
        q_reg <= d;
    end

endmodule