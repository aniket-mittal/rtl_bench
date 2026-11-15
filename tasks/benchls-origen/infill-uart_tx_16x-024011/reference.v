module origen_024011 (
    input wire [7:0] tdin,
    output reg tbuf,
    input wire txrst,
    input wire clk16x,
    input wire wrn,
    output reg txd,
    output reg parity
);

    reg [7:0] tbr, tsr;
    reg [3:0] clkdiv;
    reg clk1x_en;
    reg [3:0] no_bits_sent;
    reg tx_active;
    reg wrn_sync1, wrn_sync2;
    reg parity_bit;

    // Clock divider
    always @(posedge clk16x or posedge txrst) begin
        if (txrst) begin
            clkdiv <= 4'b0000;
            clk1x_en <= 1'b0;
        end else begin
            clkdiv <= clkdiv + 1;
            clk1x_en <= (clkdiv == 4'b1111);
        end
    end

    // Double-flop synchronizer for wrn
    always @(posedge clk16x) begin
        wrn_sync1 <= wrn;
        wrn_sync2 <= wrn_sync1;
    end

    // Transmit buffer and control logic
    always @(posedge clk16x or posedge txrst) begin
        if (txrst) begin
            tbr <= 8'b0;
            tbuf <= 1'b0;
            tx_active <= 1'b0;
        end else if (~wrn_sync2 && wrn_sync1) begin
            tbr <= tdin;
            tbuf <= 1'b1;
            tx_active <= 1'b1;
        end else if (clk1x_en && no_bits_sent == 4'd10) begin
            tbuf <= 1'b0;
            tx_active <= 1'b0;
        end
    end

    // Transmit shift register and bit counter
    always @(posedge clk16x or posedge txrst) begin
        if (txrst) begin
            tsr <= 8'b0;
            no_bits_sent <= 4'd0;
            parity_bit <= 1'b0;
        end else if (clk1x_en) begin
            if (tx_active) begin
                if (no_bits_sent == 4'd0) begin
                    tsr <= tbr;
                    no_bits_sent <= no_bits_sent + 1;
                    parity_bit <= ^tbr; // Calculate odd parity
                end else if (no_bits_sent < 4'd10) begin
                    tsr <= {1'b0, tsr[7:1]};
                    no_bits_sent <= no_bits_sent + 1;
                end else begin
                    no_bits_sent <= 4'd0;
                end
            end
        end
    end

    // Transmit and parity output logic
    always @(negedge clk16x or posedge txrst) begin
        if (txrst) begin
            txd <= 1'b1;
            parity <= 1'b1;
        end else if (clk1x_en) begin
            if (tx_active) begin
                case (no_bits_sent)
                    4'd0: txd <= 1'b0; // Start bit
                    4'd9: txd <= parity_bit; // Parity bit
                    4'd10: txd <= 1'b1; // Stop bit
                    default: txd <= tsr[0]; // Data bits
                endcase
                parity <= parity_bit;
            end else begin
                txd <= 1'b1;
                parity <= 1'b1;
            end
        end
    end

endmodule