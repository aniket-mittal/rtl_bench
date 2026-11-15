module origen_007150 #(
    parameter K = 1024,
    parameter Lm = 16,
    parameter La = 8,
    parameter MSEL_BITSIZE = 3
)(
    input wire start,
    input wire rst,
    input wire clk,
    output reg en,
    output reg parity_parload_en,
    output reg [1:0] f_sel,
    output reg [MSEL_BITSIZE-1:0] m_en,
    output reg sm
);

    localparam S0 = 1'b0;
    localparam S1 = 1'b1;

    reg [10:0] count1;
    reg [3:0] en_delay;
    reg p_s, n_s;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            count1 <= 11'd0;
            en_delay <= 4'd0;
            p_s <= S0;
            m_en <= {MSEL_BITSIZE{1'b0}};
            parity_parload_en <= 1'b0;
        end else begin
            count1 <= (count1 == K-1 || !start) ? 11'd0 : count1 + 11'd1;
            en_delay <= {en_delay[2:0], (count1 == K-1)};
            p_s <= n_s;
            
            if (p_s == S0 && n_s == S1) begin
                m_en <= {MSEL_BITSIZE{1'b0}};
            end else if (p_s == S1) begin
                m_en <= (m_en == (K/(Lm*La))-1) ? {MSEL_BITSIZE{1'b0}} : m_en + 1'b1;
            end

            parity_parload_en <= (p_s == S1 && n_s == S0);
        end
    end

    always @(*) begin
        en = |en_delay;
        f_sel = m_en[MSEL_BITSIZE-1:MSEL_BITSIZE-2];
        sm = (p_s == S1);

        case (p_s)
            S0: n_s = en ? S1 : S0;
            S1: n_s = (m_en == (K/(Lm*La))-1) ? S0 : S1;
            default: n_s = S0;
        endcase
    end

endmodule