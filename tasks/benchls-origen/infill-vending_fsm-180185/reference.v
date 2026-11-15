module origen_180185(
    input N, D, item1, item2, push, clk,
    output reg [3:0] Q
);

localparam s0 = 4'b0001, s5 = 4'b0010, s10 = 4'b0100, s15 = 4'b1000;
reg [3:0] current_state, next_state;

always @(posedge clk) begin
    current_state <= next_state;
end

always @(*) begin
    case (current_state)
        s0: begin
            if (N) next_state = s5;
            else if (D) next_state = s10;
            else if (push) next_state = s0;
            else next_state = s0;
        end
        s5: begin
            if (N) next_state = s10;
            else if (D) next_state = s15;
            else if (push) next_state = s0;
            else next_state = s5;
        end
        s10: begin
            if (N) next_state = s15;
            else if (item2) next_state = s0;
            else if (push) next_state = s0;
            else next_state = s10;
        end
        s15: begin
            if (item1) next_state = s0;
            else if (item2) next_state = s5;
            else if (push) next_state = s0;
            else next_state = s15;
        end
        default: next_state = s0;
    endcase
end

always @(*) begin
    Q = 4'b0000;
    case (current_state)
        s0: Q = 4'b0001;
        s5: Q = 4'b0010;
        s10: Q = 4'b0100;
        s15: Q = 4'b1000;
    endcase
end

endmodule