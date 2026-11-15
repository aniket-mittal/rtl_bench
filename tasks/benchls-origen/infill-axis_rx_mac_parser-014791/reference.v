module origen_014791 (
    input wire user_clk,
    input wire reset,
    
    // Router interface
    input wire [127:0] router_axis_rxd_tdata,
    input wire [15:0] router_axis_rxd_tkeep,
    input wire router_axis_rxd_tvalid,
    input wire router_axis_rxd_tlast,
    output reg router_axis_rxd_tready,
    
    // Transceiver interface
    output reg [127:0] trans_axis_rxd_tdata,
    output reg [15:0] trans_axis_rxd_tkeep,
    output reg trans_axis_rxd_tvalid,
    output reg trans_axis_rxd_tlast,
    output reg [3:0] trans_axis_rxd_tuser,
    input wire trans_axis_rxd_tready,
    
    // Additional inputs
    input wire [3:0] router_axis_rxd_tuser,
    
    // Output
    output reg [47:0] rx_dst_mac_addr
);

    // FSM states
    localparam [1:0] READ_MAC_HEADER = 2'b01;
    localparam [1:0] BEGIN_READ = 2'b10;

    reg [1:0] state, next_state;
    reg pkt_firstbeat;
    reg [3:0] stored_tuser;

    // State transition logic
    always @(posedge user_clk or posedge reset) begin
        if (reset)
            state <= READ_MAC_HEADER;
        else
            state <= next_state;
    end

    // Next state logic
    always @(*) begin
        case (state)
            READ_MAC_HEADER:
                next_state = (router_axis_rxd_tvalid) ? BEGIN_READ : READ_MAC_HEADER;
            BEGIN_READ:
                next_state = (router_axis_rxd_tvalid && router_axis_rxd_tlast) ? READ_MAC_HEADER : BEGIN_READ;
            default:
                next_state = READ_MAC_HEADER;
        endcase
    end

    // Output logic
    always @(posedge user_clk or posedge reset) begin
        if (reset) begin
            rx_dst_mac_addr <= 48'h0;
            trans_axis_rxd_tdata <= 128'h0;
            trans_axis_rxd_tkeep <= 16'h0;
            trans_axis_rxd_tvalid <= 1'b0;
            trans_axis_rxd_tlast <= 1'b0;
            trans_axis_rxd_tuser <= 4'h0;
            router_axis_rxd_tready <= 1'b0;
            pkt_firstbeat <= 1'b1;
            stored_tuser <= 4'h0;
        end else begin
            case (state)
                READ_MAC_HEADER: begin
                    if (router_axis_rxd_tvalid) begin
                        rx_dst_mac_addr <= router_axis_rxd_tdata[47:0];
                        pkt_firstbeat <= 1'b1;
                    end
                    router_axis_rxd_tready <= trans_axis_rxd_tready;
                end
                BEGIN_READ: begin
                    if (router_axis_rxd_tvalid && trans_axis_rxd_tready) begin
                        if (router_axis_rxd_tuser[2]) begin
                            trans_axis_rxd_tdata <= 128'h0;
                            trans_axis_rxd_tkeep <= 16'h0;
                            trans_axis_rxd_tvalid <= 1'b0;
                            trans_axis_rxd_tlast <= 1'b0;
                            trans_axis_rxd_tuser <= 4'h0;
                        end else begin
                            trans_axis_rxd_tdata <= router_axis_rxd_tdata;
                            trans_axis_rxd_tkeep <= router_axis_rxd_tkeep;
                            trans_axis_rxd_tvalid <= router_axis_rxd_tvalid;
                            trans_axis_rxd_tlast <= router_axis_rxd_tlast;
                            trans_axis_rxd_tuser <= pkt_firstbeat ? router_axis_rxd_tuser : stored_tuser;
                        end
                        
                        if (pkt_firstbeat)
                            stored_tuser <= router_axis_rxd_tuser;
                        
                        pkt_firstbeat <= router_axis_rxd_tlast;
                    end
                    router_axis_rxd_tready <= trans_axis_rxd_tready;
                end
            endcase
        end
    end

endmodule