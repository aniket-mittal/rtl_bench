module origen_087840 (
    input wire clk,
    input wire rst_n,
    input wire clk_bps,
    input wire [7:0] rx_data,
    input wire rx_int,
    output reg rs232_tx,
    output reg bps_start
);

reg rx_int0, rx_int1, rx_int2;
wire neg_rx_int;
reg [7:0] tx_data;
reg tx_en;
reg [3:0] num;
reg bps_start_r;

// Interrupt detection
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        rx_int0 <= 1'b0;
        rx_int1 <= 1'b0;
        rx_int2 <= 1'b0;
    end else begin
        rx_int0 <= rx_int;
        rx_int1 <= rx_int0;
        rx_int2 <= rx_int1;
    end
end

assign neg_rx_int = rx_int1 & ~rx_int2;

// Transmission control
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        bps_start_r <= 1'b0;
        tx_en <= 1'b0;
        tx_data <= 8'h00;
    end else if (neg_rx_int) begin
        bps_start_r <= 1'b1;
        tx_en <= 1'b1;
        tx_data <= rx_data;
    end else if (num == 4'd11) begin
        bps_start_r <= 1'b0;
        tx_en <= 1'b0;
    end
end

// Bit counter
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        num <= 4'd0;
    end else if (tx_en) begin
        if (clk_bps) begin
            if (num == 4'd11)
                num <= 4'd0;
            else
                num <= num + 1'b1;
        end
    end else begin
        num <= 4'd0;
    end
end

// Serial data output
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        rs232_tx <= 1'b1;
    end else if (tx_en) begin
        if (clk_bps) begin
            case (num)
                4'd0: rs232_tx <= 1'b0;
                4'd1: rs232_tx <= tx_data[0];
                4'd2: rs232_tx <= tx_data[1];
                4'd3: rs232_tx <= tx_data[2];
                4'd4: rs232_tx <= tx_data[3];
                4'd5: rs232_tx <= tx_data[4];
                4'd6: rs232_tx <= tx_data[5];
                4'd7: rs232_tx <= tx_data[6];
                4'd8: rs232_tx <= tx_data[7];
                4'd9: rs232_tx <= 1'b1;
                default: rs232_tx <= 1'b1;
            endcase
        end
    end else begin
        rs232_tx <= 1'b1;
    end
end

// Baud rate clock start signal
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        bps_start <= 1'b0;
    end else begin
        bps_start <= bps_start_r;
    end
end

endmodule