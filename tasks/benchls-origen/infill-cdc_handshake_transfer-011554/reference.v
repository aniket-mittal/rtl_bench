module origen_011554 #(
    parameter DW = 8
) (
    input wire reset_n,
    input wire s_reset,
    input wire mclk,
    input wire sclk,
    input wire [DW-1:0] s_data,
    output reg [DW-1:0] m_data
);

    // Master domain signals
    reg m_get;
    reg [1:0] s_put_sync;
    reg [1:0] m_state;
    localparam M_IDLE = 2'b00, M_WAIT = 2'b01;

    // Slave domain signals
    reg s_put;
    reg [1:0] m_get_sync;
    reg [1:0] s_state;
    reg [DW-1:0] s_data_reg;
    reg [1:0] s_reset_sync;
    localparam S_IDLE = 2'b00, S_ACK = 2'b01, S_END = 2'b10;

    // Master domain logic
    always @(posedge mclk or negedge reset_n) begin
        if (!reset_n) begin
            m_state <= M_IDLE;
            m_get <= 1'b0;
            m_data <= {DW{1'b0}};
        end else begin
            case (m_state)
                M_IDLE: begin
                    m_get <= 1'b1;
                    if (!s_put_sync[1]) begin
                        m_state <= M_WAIT;
                    end
                end
                M_WAIT: begin
                    if (s_put_sync[1]) begin
                        m_data <= s_data_reg;
                        m_get <= 1'b0;
                        m_state <= M_IDLE;
                    end
                end
            endcase
        end
    end

    // Slave domain logic
    always @(posedge sclk or negedge reset_n) begin
        if (!reset_n) begin
            s_state <= S_IDLE;
            s_put <= 1'b0;
            s_data_reg <= {DW{1'b0}};
            s_reset_sync <= 2'b11;
        end else begin
            s_reset_sync <= {s_reset_sync[0], s_reset};
            if (s_reset_sync[1]) begin
                s_state <= S_IDLE;
                s_put <= 1'b0;
                s_data_reg <= {DW{1'b0}};
            end else begin
                case (s_state)
                    S_IDLE: begin
                        if (m_get_sync[1]) begin
                            s_data_reg <= s_data;
                            s_put <= 1'b1;
                            s_state <= S_ACK;
                        end
                    end
                    S_ACK: begin
                        s_state <= S_END;
                    end
                    S_END: begin
                        if (!m_get_sync[1]) begin
                            s_put <= 1'b0;
                            s_state <= S_IDLE;
                        end
                    end
                endcase
            end
        end
    end

    // Synchronizers
    always @(posedge mclk or negedge reset_n) begin
        if (!reset_n) begin
            s_put_sync <= 2'b00;
        end else begin
            s_put_sync <= {s_put_sync[0], s_put};
        end
    end

    always @(posedge sclk or negedge reset_n) begin
        if (!reset_n) begin
            m_get_sync <= 2'b00;
        end else begin
            m_get_sync <= {m_get_sync[0], m_get};
        end
    end

endmodule