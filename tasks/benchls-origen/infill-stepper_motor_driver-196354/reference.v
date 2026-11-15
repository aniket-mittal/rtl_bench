module origen_196354(
    input clk,
    input rstn,
    input en,
    input dir,
    input [2:0] speed,
    output reg [3:0] out
);

reg [3:0] motor;
reg [5:0] cnt;
reg [1:0] state, nextstate;
wire clk1;

always @(posedge clk or negedge rstn) begin
    if (!rstn) begin
        cnt <= 0;
        state <= 0;
    end
    else if (en) begin
        cnt <= (cnt == (5 * (speed + 1) - 1)) ? 0 : cnt + 1;
        state <= nextstate;
    end
end

assign clk1 = (cnt == 0);

always @(*) begin
    case (state)
        2'b00: begin
            motor = 4'b1001;
            nextstate = (dir) ? 2'b11 : 2'b01;
        end
        2'b01: begin
            motor = 4'b0011;
            nextstate = (dir) ? 2'b00 : 2'b10;
        end
        2'b10: begin
            motor = 4'b0110;
            nextstate = (dir) ? 2'b01 : 2'b11;
        end
        2'b11: begin
            motor = 4'b1100;
            nextstate = (dir) ? 2'b10 : 2'b00;
        end
    endcase
end

always @(posedge clk1 or negedge rstn) begin
    if (!rstn)
        out <= 0;
    else if (en)
        out <= motor;
end

endmodule