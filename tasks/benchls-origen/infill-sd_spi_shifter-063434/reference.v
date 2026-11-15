module origen_063434 (
    input wire CLOCK,
    input wire nRESET,
    input wire CLKEN,
    input wire ENABLE,
    input wire nWR,
    input wire [7:0] DI,
    output reg [7:0] DO,
    input wire DUMMY,
    output reg DONE,
    output wire SD_CS,
    output wire SD_CLK,
    output wire SD_MOSI,
    input wire SD_MISO
);

    reg [4:0] counter;
    reg [8:0] shift_reg;
    reg [7:0] input_reg;

    assign SD_CS = ~(nRESET == 1'b0);
    assign SD_CLK = counter[0];
    assign SD_MOSI = shift_reg[8];

    always @(posedge CLOCK or negedge nRESET) begin
        if (!nRESET) begin
            counter <= 5'b01111;
            shift_reg <= 9'b111111111;
            input_reg <= 8'b11111111;
            DO <= 8'b11111111;
            DONE <= 1'b0;
        end else if (CLKEN) begin
            if (ENABLE) begin
                counter <= counter + 1'b1;
                
                if (counter == 5'b00000 && !nWR) begin
                    input_reg <= DI;
                    shift_reg <= {DI, 1'b1};
                end else begin
                    shift_reg <= {shift_reg[7:0], SD_MISO};
                end

                if ((counter == 5'b01111 && !DUMMY) || (counter == 5'b10001 && DUMMY)) begin
                    DO <= shift_reg[7:0];
                    DONE <= 1'b1;
                end else begin
                    DONE <= 1'b0;
                end
            end else begin
                counter <= 5'b01111;
                DONE <= 1'b0;
            end
        end
    end

endmodule