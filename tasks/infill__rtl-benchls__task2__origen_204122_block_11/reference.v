module origen_204122 #(
    parameter ACLK_FREQ = 125000000,  // ACLK frequency in Hz
    parameter IFG_CYCLES = 12        // Inter-frame gap in ACLK cycles
)
(
    input  wire        aclk,
    input  wire        aresetn,

    // GMII Receive Interface
    input  wire [7:0]  gmii_rxd,
    input  wire        gmii_rxdv,
    input  wire        gmii_rxer,
    output reg [7:0]   rx_tdata,
    output reg         rx_tvalid,
    output reg         rx_tlast,
    input  wire        rx_tready,

    // GMII Transmit Interface
    input  wire [7:0]  tx_tdata,
    input  wire        tx_tvalid,
    input  wire        tx_tlast,
    output reg         tx_tready,
    output wire [7:0]  gmii_txd,
    output wire        gmii_txen,
    output wire        gmii_txer
);

    // GMII Receive Path
    reg [7:0] rxd_0, rxd_1;
    reg       rxdv_0, rxdv_1;

    always @(posedge aclk or negedge aresetn) begin
        if (!aresetn) begin
            rxd_0   <= 0;
            rxdv_0  <= 0;
            rxd_1   <= 0;
            rxdv_1  <= 0;
        end else begin
            rxd_0   <= gmii_rxd;
            rxdv_0  <= gmii_rxdv;
            rxd_1   <= rxd_0;
            rxdv_1  <= rxdv_0;
        end
    end

    localparam S1_NORMAL = 2'b00, S1_OVERFLOW = 2'b01, S1_END_MARK = 2'b10, S1_RECOVER = 2'b11;
    reg [1:0] s1 = S1_NORMAL;

    always @(posedge aclk or negedge aresetn) begin
        if (!aresetn) begin
            s1 <= S1_NORMAL;
            rx_tdata <= 0;
            rx_tvalid <= 0;
            rx_tlast <= 0;
        end else begin
            case (s1)
                S1_NORMAL: begin
                    if (rxdv_1) begin
                        rx_tdata <= rxd_1;
                        rx_tvalid <= 1;
                        rx_tlast <= 0;
                        if (!rx_tready) begin
                            s1 <= S1_OVERFLOW;
                        end
                    end else begin
                        rx_tvalid <= 0;
                        rx_tlast <= 0;
                    end
                end
                S1_OVERFLOW: begin
                    if (rx_tready) begin
                        if (rxdv_1) begin
                            s1 <= S1_END_MARK;
                            rx_tlast <= 1;
                        end else begin
                            s1 <= S1_RECOVER;
                        end
                    end
                end
                S1_END_MARK: begin
                    rx_tvalid <= 0;
                    rx_tlast <= 0;
                    s1 <= S1_NORMAL;
                end
                S1_RECOVER: begin
                    if (!rxdv_1) begin
                        s1 <= S1_NORMAL;
                    end
                end
            endcase
        end
    end

    // GMII Transmit Path
    localparam S2_PASS = 1'b0, S2_IFG = 1'b1;
    reg s2 = S2_PASS;
    reg [11:0] ifg_count = 0;

    always @(posedge aclk or negedge aresetn) begin
        if (!aresetn) begin
            s2 <= S2_PASS;
            ifg_count <= 0;
            tx_tready <= 0;
        end else begin
            case (s2)
                S2_PASS: begin
                    tx_tready <= 1;
                    if (tx_tvalid) begin
                        if (tx_tlast) begin
                            s2 <= S2_IFG;
                            ifg_count <= 0;
                        end
                    end else begin
                        tx_tready <= 0;
                    end
                end
                S2_IFG: begin
                    tx_tready <= 0;
                    if (ifg_count == IFG_CYCLES - 1) begin
                        s2 <= S2_PASS;
                    end else begin
                        ifg_count <= ifg_count + 1;
                    end
                end
            endcase
        end
    end

    assign gmii_txd = tx_tdata;
    assign gmii_txen = tx_tvalid;
    assign gmii_txer = 1'b0; // Assuming no transmit errors

endmodule