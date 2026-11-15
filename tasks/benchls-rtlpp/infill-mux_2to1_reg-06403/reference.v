module rtlpp_06403(
    input wire in0, in1, sel, clk,
    output reg z
);
    wire not_sel;
    wire and_out1, and_out2;
    
    assign not_sel = ~sel;
    assign and_out1 = not_sel & in0;
    assign and_out2 = sel & in1;
    
    always @(posedge clk) begin
        z <= and_out1 | and_out2;
    end
endmodule