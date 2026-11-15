module origen_107790 (
    input wire clk,
    input wire reset,
    input wire dr,
    input wire ir,
    output reg [3:0] rightscoreLeft,
    output reg [3:0] rightscoreRight
);

reg prev_dr, cur_dr, prev_ir, cur_ir;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        rightscoreLeft <= 4'b0000;
        rightscoreRight <= 4'b0000;
        prev_dr <= 1'b0;
        cur_dr <= 1'b0;
        prev_ir <= 1'b0;
        cur_ir <= 1'b0;
    end else begin
        prev_dr <= cur_dr;
        cur_dr <= dr;
        prev_ir <= cur_ir;
        cur_ir <= ir;

        if (~prev_dr && cur_dr) begin
            if (rightscoreLeft == 4'b0000 && rightscoreRight == 4'b0000) begin
                rightscoreLeft <= 4'b1001;
                rightscoreRight <= 4'b1001;
            end else if (rightscoreRight == 4'b0000) begin
                rightscoreLeft <= rightscoreLeft - 1;
                rightscoreRight <= 4'b1001;
            end else begin
                rightscoreRight <= rightscoreRight - 1;
            end
        end

        if (~prev_ir && cur_ir) begin
            if (rightscoreRight == 4'b1001) begin
                rightscoreRight <= 4'b0000;
                if (rightscoreLeft == 4'b1001) begin
                    rightscoreLeft <= 4'b0000;
                end else begin
                    rightscoreLeft <= rightscoreLeft + 1;
                end
            end else begin
                rightscoreRight <= rightscoreRight + 1;
            end
        end
    end
end

endmodule