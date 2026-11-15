module origen_157600(
    input clk,
    input clr,
    input go,
    input eqflg,
    input ltflg,
    output reg xmsel,
    output reg ymsel,
    output reg xld,
    output reg yld,
    output reg gld
);

    parameter START = 3'b000, INP = 3'b001, TEST1 = 3'b010, TEST2 = 3'b011, UPDATE1 = 3'b100, UPDATE2 = 3'b101, DONE = 3'b110;
    reg [2:0] state, next_state;

    always @(posedge clk or posedge clr) begin
        if (clr) begin
            state <= START;
        end else begin
            state <= next_state;
        end
    end

    [MASKED]
endmodule