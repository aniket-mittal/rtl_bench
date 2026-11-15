module rtlpp_07732(
    input wire clk,
    input wire reset,
    input wire usb_dif,
    input wire usb_dp,
    input wire usb_dn,
    output wire [1:0] linestate,
    output wire clk_recovered,
    output wire clk_recovered_edge,
    output wire rawdata,
    input wire rx_en,
    output wire rx_active,
    output wire rx_error,
    output wire valid,
    output wire [7:0] data
);

parameter [31:0] C_clk_input_hz = 6000000;
parameter [31:0] C_clk_bit_hz = 1500000;
parameter [31:0] C_PA_bits = 8;

parameter C_PA_inc = (2 ** (C_PA_bits - 1)) * C_clk_bit_hz / C_clk_input_hz;
parameter C_PA_compensate = C_PA_inc[C_PA_bits - 2:0] + C_PA_inc[C_PA_bits - 2:0] + C_PA_inc[C_PA_bits - 2:0];
parameter C_PA_init = C_PA_compensate;
parameter C_valid_init = 8'h80;  
parameter C_idlecnt_init = 7'b1000000;  

reg [C_PA_bits - 1:0] R_PA;
reg [1:0] R_dif_shift;
reg [1:0] R_clk_recovered_shift;
wire S_clk_recovered;
wire S_linebit; 
reg R_linebit_prev; 
wire S_bit;
reg R_frame;
reg [7:0] R_data; 
reg [7:0] R_data_latch;
reg [7:0] R_valid = C_valid_init;
reg [1:0] R_linestate; 
reg [1:0] R_linestate_sync;
reg [1:0] R_linestate_prev;
reg [6:0] R_idlecnt = C_idlecnt_init;
reg R_preamble;
reg R_rxactive;
reg R_rx_en;
reg R_valid_prev;

always @(posedge clk) begin
    if((usb_dn == 1'b1 || usb_dp == 1'b1) && rx_en == 1'b1) begin
        R_dif_shift <= {usb_dif, R_dif_shift[1]};
    end
    R_clk_recovered_shift <= {S_clk_recovered, R_clk_recovered_shift[1]};
    R_linestate <= {usb_dn, usb_dp};
    R_linestate_prev <= R_linestate;
    R_rx_en <= rx_en;
end

always @(posedge clk) begin
    if(R_dif_shift[1] != R_dif_shift[0]) begin
        R_PA <= C_PA_init;
    end else begin
        R_PA <= R_PA + C_PA_inc;
    end
end

assign S_clk_recovered = R_PA[C_PA_bits - 1];
assign clk_recovered = S_clk_recovered;
assign clk_recovered_edge = (R_clk_recovered_shift[1] != S_clk_recovered) ? 1'b1 : 1'b0;

assign S_linebit = R_dif_shift[0];
assign S_bit = ~(S_linebit ^ R_linebit_prev);

always @(posedge clk) begin
    if(R_rx_en == 1'b1 && reset == 1'b0) begin
        if(R_clk_recovered_shift[1] != S_clk_recovered) begin
            if(R_linebit_prev == S_linebit) begin
                R_idlecnt <= {R_idlecnt[0], R_idlecnt[6:1]};
            end else begin
                R_idlecnt <= C_idlecnt_init;
            end
            R_linebit_prev <= S_linebit;

            if((R_idlecnt[0] == 1'b0 && R_frame == 1'b1) || R_frame == 1'b0) begin
                if(R_linestate_sync == 2'b00) begin
                    R_data <= 8'b0;
                end else begin
                    R_data <= {S_bit, R_data[7:1]};
                end
            end

            if(R_frame == 1'b1 && R_valid[1] == 1'b1) begin
                R_data_latch <= R_data;
            end
        end
    end
end

always @(posedge clk) begin
    if(R_rx_en == 1'b1 && reset == 1'b0) begin
        if(R_clk_recovered_shift[1] != S_clk_recovered) begin
            if(R_linestate_sync == 2'b00) begin
                R_frame <= 1'b0;
                R_valid <= 8'b0;
                R_preamble <= 1'b0;
                R_rxactive <= 1'b0;
            end else begin
                if(R_frame == 1'b1) begin
                    if(R_preamble == 1'b1) begin
                        if(R_data[6:1] == 6'b100000) begin
                            R_preamble <= 1'b0;
                            R_valid <= C_valid_init;
                            R_rxactive <= 1'b1;
                        end
                    end else begin
                        if(R_idlecnt[0] == 1'b0) begin
                            R_valid <= {R_valid[0], R_valid[7:1]};
                        end else begin
                            if(S_bit == 1'b1) begin
                                R_valid <= 8'b0;
                                R_frame <= 1'b0;
                                R_rxactive <= 1'b0;
                            end
                        end
                    end
                end else begin
                    if(R_data[7:2] == 6'b000111) begin
                        R_frame <= 1'b1;
                        R_preamble <= 1'b1;
                        R_valid <= 8'b0;
                        R_rxactive <= 1'b0;
                    end
                end
            end
            R_linestate_sync <= R_linestate;
        end
    end else begin
        R_valid <= 8'b0;
        R_frame <= 1'b0;
        R_rxactive <= 1'b0;
    end
end

assign data = R_data_latch;
assign rawdata = R_linebit_prev;
assign linestate = R_linestate;
assign rx_active = R_frame;
assign rx_error = 1'b0;

always @(posedge clk) begin
    R_valid_prev <= R_valid[0];
end

assign valid = R_valid[0] & ~R_valid_prev;

endmodule