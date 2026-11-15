module origen_068174 #(
    parameter DATA_WIDTH = 32,
    parameter FORWARD_REGISTERED = 1,
    parameter BACKWARD_REGISTERED = 1
)(
    input wire clk,
    input wire resetn,
    
    // Slave interface
    input wire s_axi_valid,
    output wire s_axi_ready,
    input wire [DATA_WIDTH-1:0] s_axi_data,
    
    // Master interface
    output wire m_axi_valid,
    input wire m_axi_ready,
    output wire [DATA_WIDTH-1:0] m_axi_data
);

    wire fwd_valid_s, fwd_ready_s;
    wire [DATA_WIDTH-1:0] fwd_data_s;
    wire bwd_ready_s;
    reg [DATA_WIDTH-1:0] bwd_data_s;

    // Forward path
    generate
    if (FORWARD_REGISTERED) begin : gen_forward_registered
        reg [1:0] fwd_state;
        reg [DATA_WIDTH-1:0] fwd_data_r;
        reg fwd_valid_r;

        localparam FWD_EMPTY = 2'b00;
        localparam FWD_VALID = 2'b01;
        localparam FWD_TRANSFER = 2'b10;

        always @(posedge clk or negedge resetn) begin
            if (!resetn) begin
                fwd_state <= FWD_EMPTY;
                fwd_data_r <= {DATA_WIDTH{1'b0}};
                fwd_valid_r <= 1'b0;
            end else begin
                case (fwd_state)
                    FWD_EMPTY: begin
                        if (s_axi_valid) begin
                            fwd_state <= FWD_VALID;
                            fwd_data_r <= s_axi_data;
                            fwd_valid_r <= 1'b1;
                        end
                    end
                    FWD_VALID: begin
                        if (fwd_ready_s) begin
                            if (s_axi_valid) begin
                                fwd_state <= FWD_TRANSFER;
                                fwd_data_r <= s_axi_data;
                            end else begin
                                fwd_state <= FWD_EMPTY;
                                fwd_valid_r <= 1'b0;
                            end
                        end
                    end
                    FWD_TRANSFER: begin
                        if (!s_axi_valid) begin
                            fwd_state <= FWD_VALID;
                        end
                    end
                endcase
            end
        end

        assign fwd_valid_s = fwd_valid_r;
        assign fwd_data_s = fwd_data_r;
        assign s_axi_ready = (fwd_state == FWD_EMPTY) || (fwd_state == FWD_TRANSFER && fwd_ready_s);
    end else begin : gen_forward_passthrough
        assign fwd_valid_s = s_axi_valid;
        assign fwd_data_s = s_axi_data;
        assign s_axi_ready = fwd_ready_s;
    end
    endgenerate

    // Backward path
    generate
    if (BACKWARD_REGISTERED) begin : gen_backward_registered
        reg bwd_ready_r;

        always @(posedge clk or negedge resetn) begin
            if (!resetn) begin
                bwd_ready_r <= 1'b0;
                bwd_data_s <= {DATA_WIDTH{1'b0}};
            end else begin
                bwd_ready_r <= m_axi_ready;
                if (fwd_valid_s && fwd_ready_s) begin
                    bwd_data_s <= fwd_data_s;
                end
            end
        end

        assign bwd_ready_s = bwd_ready_r;
    end else begin : gen_backward_passthrough
        assign bwd_ready_s = m_axi_ready;
        always @(*) bwd_data_s = fwd_data_s;
    end
    endgenerate

    // Connect signals
    assign fwd_ready_s = bwd_ready_s;
    assign m_axi_valid = fwd_valid_s;
    assign m_axi_data = bwd_data_s;

endmodule