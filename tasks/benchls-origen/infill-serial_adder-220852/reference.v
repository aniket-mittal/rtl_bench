module origen_220852(
    input clk,
    input en_i,
    input ina,
    input inb,
    output reg en_o,
    output reg [1:0] out
);

    reg [1:0] counter;
    reg [1:0] state;
    reg [1:0] temp_a, temp_b;
    reg [1:0] temp_out;

    initial begin
        counter = 2'b00;
        state = 2'b00;
        temp_a = 2'b00;
        temp_b = 2'b00;
        temp_out = 2'b00;
        out = 2'b00;
        en_o = 1'b0;
    end

    always @(posedge clk) begin
        if (en_i) begin
            case (state)
                2'b00: begin
                    temp_a <= {temp_a[0], ina};
                    temp_b <= {temp_b[0], inb};
                    counter <= counter + 1'b1;
                    if (counter == 2'b10)
                        state <= 2'b01;
                end
                2'b01: begin
                    out <= temp_out[1:0];
                    temp_out <= {temp_a[0] + temp_b[0], temp_a[0] + temp_b[0]};
                    counter <= counter + 1'b1;
                    if (counter == 3'b011)
                        en_o <= 1'b1;
                    if (counter == 3'b100)
                        en_o <= 1'b0;
                    if (counter == 3'b110) begin
                        counter <= 2'b00;
                        state <= 2'b00;
                    end
                end
            endcase
        end
    end

endmodule