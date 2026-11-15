module origen_205618(
    input [1:0] keys,
    input clk,
    output reg [6:0] display,
    output reg [3:0] grounds,
    output reg [7:0] leds
);

reg [1:0] state;
reg [3:0] data;

initial begin
    state <= 2'b00;
    data <= 'h8;
end

always @(posedge clk) begin
    case (state)
        2'b00: begin
            data <= {data[2:0], data[3]};
            state <= (keys == 2'b01) ? 2'b01 : (keys == 2'b10) ? 2'b10 : state;
        end
        2'b01: begin
            grounds <= 4'b1110;
            leds <= 8'b00000001;
            state <= (keys == 2'b00) ? 2'b00 : state;
        end
        2'b10: begin
            grounds <= 4'b1101;
            leds <= 8'b00000010;
            state <= (keys == 2'b00) ? 2'b00 : state;
        end
    endcase
end

[MASKED]

endmodule