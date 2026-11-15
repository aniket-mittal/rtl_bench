module origen_091590 (
    input wire i_clk,
    input wire i_wr,
    input wire [7:0] i_data,
    output wire o_busy,
    output wire o_uart_tx
);

    parameter CLOCKS_PER_BAUD = 139;

    reg [3:0] state;
    reg [8:0] lcl_data;
    reg [7:0] counter;
    reg baud_stb;

    localparam IDLE = 4'd0;
    localparam START = 4'd1;
    localparam BIT_ZERO = 4'd2;
    localparam BIT_SEVEN = 4'd9;
    localparam LAST = 4'd10;

    initial begin
        state = IDLE;
        lcl_data = 9'h1ff;
        counter = 0;
        baud_stb = 0;
    end

    always @(posedge i_clk) begin
        if (counter == CLOCKS_PER_BAUD - 1) begin
            counter <= 0;
            baud_stb <= 1;
        end else begin
            counter <= counter + 1;
            baud_stb <= 0;
        end
    end

    always @(posedge i_clk) begin
        if (state == IDLE) begin
            if (i_wr) begin
                state <= START;
                lcl_data <= {i_data, 1'b0};
            end
        end else if (baud_stb) begin
            if (state == LAST) begin
                state <= IDLE;
            end else begin
                state <= state + 1;
                lcl_data <= {1'b1, lcl_data[8:1]};
            end
        end
    end

    assign o_uart_tx = lcl_data[0];
    assign o_busy = (state != IDLE);

endmodule