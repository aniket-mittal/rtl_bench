module origen_015657(
    input sysclk,
    input sysclk_bd,
    input sysclk_sam,
    input reset,
    input PC_Uart_rxd,
    input ctrl,
    input [7:0] TX_DATA,
    output PC_Uart_txd,
    output RX_STATUS,
    output [7:0] RX_DATA,
    output TX_STATUS
);

    wire TX_EN;
    assign TX_EN = ctrl;

    UART_RX receiver(
        .PC_UART_rxd(PC_Uart_rxd),
        .sam(sysclk_sam),
        .sysclk(sysclk),
        .reset(reset),
        .RX_DATA(RX_DATA),
        .RX_STATUS(RX_STATUS)
    );

    UART_TX sender(
        .TX_DATA(TX_DATA),
        .TX_EN(TX_EN),
        .sysclk_bd(sysclk_bd),
        .sysclk(sysclk),
        .reset(reset),
        .TX_STATUS(TX_STATUS),
        .PC_UART_txd(PC_Uart_txd)
    );

endmodule

module UART_RX(
    input PC_UART_rxd,
    input sam,
    input sysclk,
    input reset,
    output reg [7:0] RX_DATA,
    output reg RX_STATUS
);

    reg [1:0] state;
    reg [3:0] bit_count;
    reg [3:0] sam_count;

    localparam IDLE = 2'b00;
    localparam START = 2'b01;
    localparam DATA = 2'b10;
    localparam STOP = 2'b11;

    always @(posedge sysclk or posedge reset) begin
        if (reset) begin
            state <= IDLE;
            RX_DATA <= 8'b0;
            RX_STATUS <= 1'b0;
            bit_count <= 4'b0;
            sam_count <= 4'b0;
        end else begin
            case (state)
                IDLE: begin
                    RX_STATUS <= 1'b0;
                    if (!PC_UART_rxd) state <= START;
                end
                START: begin
                    if (sam) begin
                        sam_count <= sam_count + 1;
                        if (sam_count == 4'b0111) begin
                            state <= DATA;
                            sam_count <= 4'b0;
                            bit_count <= 4'b0;
                        end
                    end
                end
                DATA: begin
                    if (sam) begin
                        sam_count <= sam_count + 1;
                        if (sam_count == 4'b1111) begin
                            RX_DATA[bit_count] <= PC_UART_rxd;
                            sam_count <= 4'b0;
                            bit_count <= bit_count + 1;
                            if (bit_count == 4'b0111) state <= STOP;
                        end
                    end
                end
                STOP: begin
                    if (sam) begin
                        sam_count <= sam_count + 1;
                        if (sam_count == 4'b1111) begin
                            state <= IDLE;
                            RX_STATUS <= 1'b1;
                        end
                    end
                end
            endcase
        end
    end

endmodule

module UART_TX(
    input [7:0] TX_DATA,
    input TX_EN,
    input sysclk_bd,
    input sysclk,
    input reset,
    output reg TX_STATUS,
    output reg PC_UART_txd
);

    reg [1:0] state;
    reg [3:0] bit_count;

    localparam IDLE = 2'b00;
    localparam START = 2'b01;
    localparam DATA = 2'b10;
    localparam STOP = 2'b11;

    always @(posedge sysclk or posedge reset) begin
        if (reset) begin
            state <= IDLE;
            TX_STATUS <= 1'b0;
            PC_UART_txd <= 1'b1;
            bit_count <= 4'b0;
        end else begin
            case (state)
                IDLE: begin
                    PC_UART_txd <= 1'b1;
                    TX_STATUS <= 1'b0;
                    if (TX_EN) state <= START;
                end
                START: begin
                    if (sysclk_bd) begin
                        PC_UART_txd <= 1'b0;
                        state <= DATA;
                        bit_count <= 4'b0;
                    end
                end
                DATA: begin
                    if (sysclk_bd) begin
                        PC_UART_txd <= TX_DATA[bit_count];
                        bit_count <= bit_count + 1;
                        if (bit_count == 4'b0111) state <= STOP;
                    end
                end
                STOP: begin
                    if (sysclk_bd) begin
                        PC_UART_txd <= 1'b1;
                        state <= IDLE;
                        TX_STATUS <= 1'b1;
                    end
                end
            endcase
        end
    end

endmodule