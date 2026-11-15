module origen_091131(
    input [1:0] s,
    input clk,
    input res,
    output reg [1:0] state
);

    parameter st0 = 2'b00, st1 = 2'b01, st2 = 2'b10, st3 = 2'b11;

    always @(posedge clk or negedge res) begin
        if (!res)
            state <= st0;
        else
            case (state)
                st0: state <= (s == 2'b01) ? st1 : ((s == 2'b10 || s == 2'b11) ? st2 : st0);
                st1: state <= (s == 2'b11) ? st3 : ((s == 2'b01 || s == 2'b10) ? st2 : st1);
                st2: state <= (s != 2'b00) ? st3 : st2;
                st3: state <= st0;
                default: state <= st0;
            endcase
    end
endmodule

