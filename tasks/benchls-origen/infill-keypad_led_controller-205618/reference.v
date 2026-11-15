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

assign display = (data == 4'h0) ? 7'b1000000 :
                 (data == 4'h1) ? 7'b1111001 :
                 (data == 4'h2) ? 7'b0100100 :
                 (data == 4'h3) ? 7'b0110000 :
                 (data == 4'h4) ? 7'b0011001 :
                 (data == 4'h5) ? 7'b0010010 :
                 (data == 4'h6) ? 7'b0000010 :
                 (data == 4'h7) ? 7'b1111000 :
                 (data == 4'h8) ? 7'b0000000 :
                 (data == 4'h9) ? 7'b0010000 :
                 (data == 4'hA) ? 7'b0001000 :
                 (data == 4'hB) ? 7'b0000011 :
                 (data == 4'hC) ? 7'b1000110 :
                 (data == 4'hD) ? 7'b0100001 :
                 (data == 4'hE) ? 7'b0000110 :
                 (data == 4'hF) ? 7'b0001110 :
                 7'b0000000;

endmodule