module origen_156239(
    input [4:0] D1_Ad, D2_Ad, E1_Ad, E2_Ad, M2_Ad,
    input [4:0] E_Ad2, M_Ad2, W_Ad2, F_Ad2, G_Ad2,
    input E_we, M_we, W_we, F_we, G_we,
    input [31:0] D1_default, D2_default, E1_default, E2_default, M2_default,
    input [31:0] E_Wd1, M_Wd1, W_Wd1, F_Wd1, G_Wd1,
    input [1:0] E_delay, M_delay,
    output reg [31:0] D1, D2, E1, E2, M2
);

    always @(*) begin
        // D1 forwarding
        if (E_we && (E1_Ad == D1_Ad) && (E_delay == 0))
            D1 <= E_Wd1;
        else if (M_we && (M2_Ad == D1_Ad) && (M_delay == 0))
            D1 <= M_Wd1;
        else if (W_we && (W_Ad2 == D1_Ad))
            D1 <= W_Wd1;
        else
            D1 <= D1_default;

        // D2 forwarding
        if (E_we && (E1_Ad == D2_Ad) && (E_delay == 0))
            D2 <= E_Wd1;
        else if (M_we && (M2_Ad == D2_Ad) && (M_delay == 0))
            D2 <= M_Wd1;
        else if (W_we && (W_Ad2 == D2_Ad))
            D2 <= W_Wd1;
        else
            D2 <= D2_default;

        // E1 forwarding
        if (M_we && (M2_Ad == E1_Ad) && (M_delay == 0))
            E1 <= M_Wd1;
        else if (W_we && (W_Ad2 == E1_Ad))
            E1 <= W_Wd1;
        else
            E1 <= E1_default;

        // E2 forwarding
        if (M_we && (M2_Ad == E2_Ad) && (M_delay == 0))
            E2 <= M_Wd1;
        else if (W_we && (W_Ad2 == E2_Ad))
            E2 <= W_Wd1;
        else
            E2 <= E2_default;

        // M2 forwarding
        if (W_we && (W_Ad2 == M2_Ad))
            M2 <= W_Wd1;
        else
            M2 <= M2_default;
    end

endmodule