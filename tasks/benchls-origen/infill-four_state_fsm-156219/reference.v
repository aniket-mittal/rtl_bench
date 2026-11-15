module origen_156219(
    input clk,
    input in,
    input areset,
    output reg out
);

parameter A = 2'b00, B = 2'b01, C = 2'b10, D = 2'b11;
reg [1:0] state, next_state;

always @(*) begin
    case(state)
        A: begin
            if(in == 1'b0)
                next_state = A;
            else
                next_state = B;
        end
        B: begin
            if(in == 1'b0)
                next_state = C;
            else
                next_state = B;
        end
        C: begin
            if(in == 1'b0)
                next_state = A;
            else
                next_state = D;
        end
        D: begin
            if(in == 1'b0)
                next_state = C;
            else
                next_state = B;
        end
    endcase
end

always @(posedge clk or posedge areset) begin
    if(areset)
        state <= A;
    else
        state <= next_state;
end

always @(*) begin
    if(state == D)
        out = 1'b1;
    else
        out = 1'b0;
end

endmodule