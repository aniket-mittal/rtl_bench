module origen_098644(
    input wire clk,
    input wire reset,
    input wire p1_scored,
    input wire p2_scored,
    output reg [31:0] p1_score,
    output reg [31:0] p2_score
);

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            p1_score <= 32'b0;
            p2_score <= 32'b0;
        end
        else begin
            if (p1_scored)
                p1_score <= p1_score + 1;
            else if (p2_scored)
                p2_score <= p2_score + 1;
        end
    end

endmodule

