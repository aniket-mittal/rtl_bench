module dff_se(input wire clk, input wire d, input wire se, input wire si, output reg q);
    always @(posedge clk) begin
        if (se)
            q <= si;
        else
            q <= d;
    end
endmodule