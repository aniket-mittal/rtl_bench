module rtlpp_02700 (next_pc, cur_pc, rst, clk);

    output reg [31:0] next_pc;
    input [31:0] cur_pc;
    input clk;
    input rst;

    always @(posedge clk)
    begin
        if (rst)
        begin
            next_pc <= 32'd0;
        end
        else
        begin
            next_pc <= cur_pc + 32'd4;
        end
    end

endmodule