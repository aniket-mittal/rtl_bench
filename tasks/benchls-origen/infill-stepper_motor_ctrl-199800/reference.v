module origen_199800(
    input step_clk,
    input clk,
    input direction,
    input rst,
    output reg sem0, sem1, sem2, sem3,
    output reg [7:0] tick_count
);

    reg [1:0] state, next_state;
    reg [3:0] outs, next_outs;
    reg previous_clk;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= 2'b00;
            outs <= 4'b0000;
            tick_count <= 8'b0;
            previous_clk <= 1'b0;
        end
        else begin
            state <= next_state;
            outs <= next_outs;
            tick_count <= tick_count + (step_clk & ~previous_clk);
            previous_clk <= step_clk;
        end
    end

    always @(*) begin
        case (state)
            2'b00: begin
                next_outs = direction ? 4'b1001 : 4'b0110;
                next_state = direction ? 2'b01 : 2'b11;
            end
            2'b01: begin
                next_outs = direction ? 4'b0011 : 4'b1100;
                next_state = direction ? 2'b10 : 2'b00;
            end
            2'b10: begin
                next_outs = direction ? 4'b0110 : 4'b1001;
                next_state = direction ? 2'b11 : 2'b01;
            end
            2'b11: begin
                next_outs = direction ? 4'b1100 : 4'b0011;
                next_state = direction ? 2'b00 : 2'b10;
            end
        endcase
    end

    assign sem0 = outs[0];
    assign sem1 = outs[1];
    assign sem2 = outs[2];
    assign sem3 = outs[3];

endmodule