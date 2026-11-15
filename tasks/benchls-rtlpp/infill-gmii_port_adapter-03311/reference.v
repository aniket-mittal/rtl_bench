module rtlpp_03311(

    input  wire        gmii_rxclk,
    input  wire        gmii_txclk,

    input  wire        rst_n,    
    input  wire        port_type,

    input  wire        gmii_rx_dv,
    input  wire        gmii_rx_er,
    input  wire [7:0]  gmii_rxd,
    
    output  wire        gmii_rx_dv_adp2tsnchip,
    output  wire        gmii_rx_er_adp2tsnchip,
    output  wire [7:0]  gmii_rxd_adp2tsnchip,
        
    output wire        gmii_tx_en,
    output wire        gmii_tx_er,
    output wire [7:0]  gmii_txd,

    input wire        gmii_tx_en_tsnchip2adp,
    input wire        gmii_tx_er_tsnchip2adp,
    input wire [7:0]  gmii_txd_tsnchip2adp

);

// Intermediate variable Declaration
reg gmii_rx_dv_r;
reg gmii_rx_er_r;
reg [7:0] gmii_rxd_r;

reg gmii_tx_en_r;
reg gmii_tx_er_r;
reg [7:0] gmii_txd_r;

// gmii_rxctrl_hcp functionality
always @(posedge gmii_rxclk or negedge rst_n) begin
    if (!rst_n) begin
        gmii_rx_dv_r  <= 1'b0;
        gmii_rx_er_r  <= 1'b0;
        gmii_rxd_r    <= 8'b0;
    end else if (port_type) begin
        gmii_rx_dv_r  <= gmii_rx_dv;
        gmii_rx_er_r  <= gmii_rx_er;
        gmii_rxd_r    <= gmii_rxd;
    end else begin
        gmii_rx_dv_r  <= 1'b0;
        gmii_rx_er_r  <= 1'b0;
        gmii_rxd_r    <= 8'b0;
    end
end

assign gmii_rx_dv_adp2tsnchip = gmii_rx_dv_r;
assign gmii_rx_er_adp2tsnchip = gmii_rx_er_r;
assign gmii_rxd_adp2tsnchip = gmii_rxd_r;

// gmii_txctrl_hcp functionality
always @(posedge gmii_txclk or negedge rst_n) begin
    if (!rst_n) begin
        gmii_tx_en_r <= 1'b0;
        gmii_tx_er_r <= 1'b0;
        gmii_txd_r   <= 8'b0;
    end else begin
        gmii_tx_en_r <= gmii_tx_en_tsnchip2adp;
        gmii_tx_er_r <= gmii_tx_er_tsnchip2adp;
        gmii_txd_r   <= gmii_txd_tsnchip2adp;
    end
end

assign gmii_tx_en = gmii_tx_en_r;
assign gmii_tx_er = gmii_tx_er_r;
assign gmii_txd = gmii_txd_r;

endmodule