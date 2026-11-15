module origen_140454 (
    input wire clk,
    input wire reset,
    input wire data_in,
    output wire out,
    input wire in,
    output wire data_out
);

// Parameters
parameter CLK_FREQ = 1_000_000; // 1MHz clock
parameter BT_FREQ = 2_402_000_000; // 2.402GHz Bluetooth frequency
parameter MOD_INDEX = 0.32; // GFSK modulation index

// Internal signals
reg [7:0] tx_shift_reg;
reg [7:0] rx_shift_reg;
reg [15:0] phase_acc;
wire [15:0] phase_inc;

// GFSK modulator
assign phase_inc = (tx_shift_reg[7] ? 16'd2621 : 16'd2458); // Frequency deviation

always @(posedge clk or posedge reset) begin
    if (reset) begin
        tx_shift_reg <= 8'b0;
        phase_acc <= 16'b0;
    end else begin
        tx_shift_reg <= {tx_shift_reg[6:0], data_in};
        phase_acc <= phase_acc + phase_inc;
    end
end

// GFSK output
assign out = phase_acc[15];

// GFSK demodulator (simplified matched filter)
reg [15:0] rx_phase_acc;
wire [15:0] rx_phase_inc;

assign rx_phase_inc = (in ? 16'd2621 : 16'd2458);

always @(posedge clk or posedge reset) begin
    if (reset) begin
        rx_phase_acc <= 16'b0;
        rx_shift_reg <= 8'b0;
    end else begin
        rx_phase_acc <= rx_phase_acc + rx_phase_inc;
        if (rx_phase_acc[15] != rx_phase_acc[14]) begin
            rx_shift_reg <= {rx_shift_reg[6:0], rx_phase_acc[15]};
        end
    end
end

// Output recovered data
assign data_out = rx_shift_reg[7];

endmodule