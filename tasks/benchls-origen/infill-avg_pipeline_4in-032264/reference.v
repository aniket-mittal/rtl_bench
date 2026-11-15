module origen_032264(
    input wire Clk, Rst, Start,
    input wire signed [31:0] a, b, c, d, e, f, g, h,
    input wire signed [31:0] sa, one, two, four,
    output reg Done,
    output reg signed [31:0] avg
);

    reg [3:0] state;
    reg signed [31:0] t1, t2, t3, t4, t5, t6, t7, t7div2, t7div4;
    reg csa1, csa2, csa3;

    always @(posedge Clk or posedge Rst) begin
        if (Rst) begin
            state <= 4'd0;
            Done <= 1'b0;
            avg <= 32'd0;
            t1 <= 32'd0; t2 <= 32'd0; t3 <= 32'd0; t4 <= 32'd0;
            t5 <= 32'd0; t6 <= 32'd0; t7 <= 32'd0;
            t7div2 <= 32'd0; t7div4 <= 32'd0;
            csa1 <= 1'b0; csa2 <= 1'b0; csa3 <= 1'b0;
        end else begin
            case (state)
                4'd0: if (Start) state <= 4'd2;
                4'd2: begin t1 <= a + b; state <= 4'd3; end
                4'd3: begin t2 <= t1 + c; state <= 4'd4; end
                4'd4: begin t3 <= t2 + d; state <= 4'd5; end
                4'd5: begin t4 <= t3 + e; state <= 4'd6; end
                4'd6: begin t5 <= t4 + f; state <= 4'd7; end
                4'd7: begin t6 <= t5 + g; state <= 4'd8; end
                4'd8: begin
                    t7 <= t6 + h;
                    csa1 <= (sa < one);
                    csa2 <= (sa < two);
                    csa3 <= (sa < four);
                    state <= 4'd9;
                end
                4'd9: begin t7div2 <= t7 >>> 1; state <= 4'd10; end
                4'd10: begin t7div4 <= t7 >>> 2; state <= 4'd11; end
                4'd11: begin
                    if (csa1) avg <= t7;
                    else if (csa2) avg <= t7div2;
                    else if (csa3) avg <= t7div4;
                    else avg <= 32'd0;
                    state <= 4'd1;
                end
                4'd1: begin Done <= 1'b1; state <= 4'd0; end
                default: state <= 4'd0;
            endcase
        end
    end

endmodule