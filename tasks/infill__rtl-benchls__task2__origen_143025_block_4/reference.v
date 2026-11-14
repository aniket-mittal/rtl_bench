module origen_143025 #(
    parameter DATA_WIDTH = 64,
    parameter FPGA_FAMILY = "7SERIES",
    parameter ROOT_PORT = 0,
    parameter DISABLE_TX_PACKET_BOUNDARY_THROTTLING = 0,
    parameter TCQ = 1
) (
    // PCIe Block Interface
    input [DATA_WIDTH-1:0] trn_rd,
    input trn_rsof,
    input trn_reof,
    input trn_rsrc_rdy,
    input trn_rsrc_dsc,
    input [(DATA_WIDTH/8)-1:0] trn_rrem,
    input trn_rerrfwd,
    input [6:0] trn_rbar_hit,
    input trn_recrc_err,
    input user_clk,
    input user_rst,

    // AXI Stream Interface
    output reg [DATA_WIDTH-1:0] m_axis_rx_tdata,
    output reg m_axis_rx_tvalid,
    input m_axis_rx_tready,
    output reg [(DATA_WIDTH/8)-1:0] m_axis_rx_tkeep,
    output reg m_axis_rx_tlast,
    output reg [21:0] m_axis_rx_tuser,

    // PCIe Block Control Signals
    output reg trn_rdst_rdy,
    output reg [7:0] np_counter
);

    // Internal signals
    reg [2:0] state;
    reg [7:0] np_counter_reg;

    // State machine states
    localparam IDLE = 3'b000;
    localparam TRANSFER = 3'b001;
    localparam LAST = 3'b010;

    // State machine
    always @(posedge user_clk) begin
        if (user_rst) begin
            state <= IDLE;
            m_axis_rx_tvalid <= 1'b0;
            m_axis_rx_tlast <= 1'b0;
            trn_rdst_rdy <= 1'b1;
            np_counter_reg <= 8'd0;
        end else begin
            case (state)
                IDLE: begin
                    if (trn_rsrc_rdy && trn_rsof) begin
                        state <= TRANSFER;
                        m_axis_rx_tvalid <= 1'b1;
                        m_axis_rx_tdata <= trn_rd;
                        m_axis_rx_tkeep <= {(DATA_WIDTH/8){1'b1}};
                        m_axis_rx_tuser <= {trn_rerrfwd, trn_rbar_hit, trn_recrc_err, 13'd0};
                    end
                end
                TRANSFER: begin
                    if (trn_rsrc_rdy && trn_reof) begin
                        state <= LAST;
                        m_axis_rx_tlast <= 1'b1;
                        m_axis_rx_tkeep <= trn_rrem;
                    end else if (!trn_rsrc_rdy) begin
                        m_axis_rx_tvalid <= 1'b0;
                    end else begin
                        m_axis_rx_tdata <= trn_rd;
                    end
                end
                LAST: begin
                    if (m_axis_rx_tready) begin
                        state <= IDLE;
                        m_axis_rx_tvalid <= 1'b0;
                        m_axis_rx_tlast <= 1'b0;
                    end
                end
            endcase

            // Update non-posted counter
            if (trn_rsrc_rdy && trn_rsof && !trn_rsrc_dsc) begin
                np_counter_reg <= np_counter_reg + 1;
            end
        end
    end

    // Assign outputs
    assign np_counter = np_counter_reg;

    // Generate block for FPGA family-specific logic
    generate
        if (FPGA_FAMILY == "7SERIES") begin
            // 7 Series specific logic here
        end else if (FPGA_FAMILY == "ULTRASCALE") begin
            // UltraScale specific logic here
        end
    endgenerate

    // Root port mode specific logic
    generate
        if (ROOT_PORT == 1) begin
            // Root port specific logic here
        end
    endgenerate

    // TX packet boundary throttling
    generate
        if (DISABLE_TX_PACKET_BOUNDARY_THROTTLING == 1) begin
            // Logic to disable TX packet boundary throttling
        end
    endgenerate

endmodule