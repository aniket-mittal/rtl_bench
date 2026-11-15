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

    always @(*) begin
        case (state)
            START: begin
                xmsel = 1'b0;
                ymsel = 1'b0;
                xld = 1'b0;
                yld = 1'b0;
                gld = 1'b0;
                next_state = (go) ? INP : START;
            end
            INP: begin
                xmsel = 1'b0;
                ymsel = 1'b1;
                xld = 1'b1;
                yld = 1'b1;
                gld = 1'b0;
                next_state = TEST1;
            end
            TEST1: begin
                xmsel = 1'b1;
                ymsel = 1'b1;
                xld = 1'b0;
                yld = 1'b0;
                gld = 1'b0;
                next_state = (eqflg) ? DONE : TEST2;
            end
            TEST2: begin
                xmsel = 1'b1;
                ymsel = 1'b1;
                xld = 1'b0;
                yld = 1'b0;
                gld = 1'b0;
                next_state = (ltflg) ? UPDATE1 : UPDATE2;
            end
            UPDATE1: begin
                xmsel = 1'b1;
                ymsel = 1'b0;
                xld = 1'b0;
                yld = 1'b1;
                gld = 1'b0;
                next_state = TEST1;
            end
            UPDATE2: begin
                xmsel = 1'b0;
                ymsel = 1'b1;
                xld = 1'b1;
                yld = 1'b0;
                gld = 1'b0;
                next_state = TEST1;
            end
            DONE: begin
                xmsel = 1'b1;
                ymsel = 1'b1;
                xld = 1'b0;
                yld = 1'b0;
                gld = 1'b1;
                next_state = (clr) ? START : DONE;
            end
            default: begin
                xmsel = 1'b0;
                ymsel = 1'b0;
                xld = 1'b0;
                yld = 1'b0;
                gld = 1'b0;
                next_state = START;
            end
        endcase
    end
endmodule