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

    [MASKED]

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