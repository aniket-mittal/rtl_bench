module origen_210976 #(
    parameter WIDTH = 4,
    parameter INIT = 0
) (
    input inter_clk,
    input clr,
    input cnt,
    input ld,
    input up,
    output reg tc,
    output reg [WIDTH-1:0] c
);

always @(posedge inter_clk, negedge clr) begin
    if (~clr) begin
        c <= INIT;
        tc <= 1'b0;
    end
    else if (ld) begin
        c <= INIT;
        tc <= 1'b0;
    end
    else if (cnt) begin
        if (up) begin
            if (c == {WIDTH{1'b1}}) begin
                c <= 0;
                tc <= 1'b1;
            end
            else begin
                c <= c + 1;
                tc <= 1'b0;
            end
        end
        else begin
            if (c == 0) begin
                c <= {WIDTH{1'b1}};
                tc <= 1'b1;
            end
            else begin
                c <= c - 1;
                tc <= 1'b0;
            end
        end
    end
    else begin
        tc <= 1'b0;
    end
end

endmodule