module rtlpp_01104(

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



/*
            gmii_rxctrl_hcp functionality
*/

reg gmii_rx_dv_reg;
reg gmii_rx_er_reg;
reg [7:0] gmii_rxd_reg;

always @ (posedge gmii_rxclk or negedge rst_n) begin
    if (!rst_n) begin
        gmii_rx_dv_reg <= 1'b0;
        gmii_rx_er_reg <= 1'b0;
        gmii_rxd_reg <= 8'b0;
    end else begin
        gmii_rx_dv_reg <= gmii_rx_dv;
        gmii_rx_er_reg <= gmii_rx_er;
        gmii_rxd_reg <= gmii_rxd;
    end
end

assign gmii_rx_dv_adp2tsnchip = gmii_rx_dv_reg;
assign gmii_rx_er_adp2tsnchip = gmii_rx_er_reg;
assign gmii_rxd_adp2tsnchip = gmii_rxd_reg;

/*
            gmii_txctrl_hcp functionality
*/

reg gmii_tx_en_reg;
reg gmii_tx_er_reg;
reg [7:0] gmii_txd_reg;

always @ (posedge gmii_txclk or negedge rst_n) begin
    if (!rst_n) begin
        gmii_tx_en_reg <= 1'b0;
        gmii_tx_er_reg <= 1'b0;
        gmii_txd_reg <= 8'b0;
    end else begin
        gmii_tx_en_reg <= gmii_tx_en_tsnchip2adp;
        gmii_tx_er_reg <= gmii_tx_er_tsnchip2adp;
        gmii_txd_reg <= gmii_txd_tsnchip2adp;
    end
end

assign gmii_tx_en = gmii_tx_en_reg;
assign gmii_tx_er = gmii_tx_er_reg;
assign gmii_txd = gmii_txd_reg;

endmodule