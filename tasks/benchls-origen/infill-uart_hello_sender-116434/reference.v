module origen_116434(
    input wire clk,
    input wire divClk,
    input wire TxD_busy,
    output reg TxD_start,
    output reg [7:0] TxD_data
);

    reg [7:0] data [0:4];
    reg [2:0] char;
    reg [3:0] state;
    reg [19:0] div;

    initial begin
        data[0] = "h";
        data[1] = "e";
        data[2] = "l";
        data[3] = "l";
        data[4] = "o";
        char = 0;
        state = 0;
        div = 0;
        TxD_start = 0;
        TxD_data = 0;
    end

    always @(posedge clk) begin
        if (divClk) begin
            case (state)
                4'd0, 4'd2, 4'd4, 4'd6, 4'd8: begin
                    if (!TxD_busy) begin
                        TxD_start <= 1;
                        TxD_data <= data[char];
                        char <= (char == 4) ? 0 : char + 1;
                        state <= state + 1;
                    end
                end
                4'd1, 4'd3, 4'd5, 4'd7, 4'd9: begin
                    TxD_start <= 0;
                    if (!TxD_busy) begin
                        if (div == 20'd999999) begin
                            div <= 0;
                            state <= state + 1;
                        end else begin
                            div <= div + 1;
                        end
                    end
                end
                default: state <= 0;
            endcase
        end
    end

endmodule