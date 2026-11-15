module origen_016414 (
    input wire clk,
    input wire clr,
    input wire xmsel,
    input wire ymsel,
    input wire xld,
    input wire yld,
    input wire gld,
    input wire [3:0] xin,
    input wire [3:0] yin,
    output wire [3:0] gcd,
    output wire eqflag,
    output wire ltflag
);

    reg [3:0] x, y, x1, y1;
    wire [3:0] xmy, ymx;

    assign xmy = x - y;
    assign ymx = y - x;
    assign eqflag = (x == y);
    assign ltflag = (x < y);

    always @(posedge clk or posedge clr) begin
        if (clr) begin
            x <= 4'b0000;
            y <= 4'b0000;
        end else begin
            if (xld) x <= x1;
            if (yld) y <= y1;
        end
    end

    always @(*) begin
        x1 = xmsel ? xin : xmy;
        y1 = ymsel ? yin : ymx;
    end

    reg [3:0] gcd_reg;
    assign gcd = gcd_reg;

    always @(posedge clk or posedge clr) begin
        if (clr) begin
            gcd_reg <= 4'b0000;
        end else if (gld) begin
            if (y == 4'b0000 && x != 4'b0000)
                gcd_reg <= x;
            else if (x == 4'b0000 && y != 4'b0000)
                gcd_reg <= y;
            else if (x == 4'b0000 && y == 4'b0000)
                gcd_reg <= 4'b0000;
            else
                gcd_reg <= x;
        end
    end

endmodule