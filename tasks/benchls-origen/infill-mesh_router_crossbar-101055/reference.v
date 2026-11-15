module origen_101055 (
    input  wire [15:0] N_data_i, S_data_i, E_data_i, W_data_i, L_data_i,
    input  wire [2:0]  N_port_select, S_port_select, E_port_select, W_port_select, L_port_select,
    output reg  [15:0] N_data_o, S_data_o, E_data_o, W_data_o, L_data_o
);

    always @* begin
        // North output
        case (N_port_select)
            3'b001:  N_data_o = S_data_i;
            3'b010:  N_data_o = E_data_i;
            3'b011:  N_data_o = W_data_i;
            3'b100:  N_data_o = L_data_i;
            default: N_data_o = 'x;
        endcase

        // South output
        case (S_port_select)
            3'b000:  S_data_o = N_data_i;
            3'b010:  S_data_o = E_data_i;
            3'b011:  S_data_o = W_data_i;
            3'b100:  S_data_o = L_data_i;
            default: S_data_o = 'x;
        endcase

        // East output
        case (E_port_select)
            3'b000:  E_data_o = N_data_i;
            3'b001:  E_data_o = S_data_i;
            3'b011:  E_data_o = W_data_i;
            3'b100:  E_data_o = L_data_i;
            default: E_data_o = 'x;
        endcase

        // West output
        case (W_port_select)
            3'b000:  W_data_o = N_data_i;
            3'b001:  W_data_o = S_data_i;
            3'b010:  W_data_o = E_data_i;
            3'b100:  W_data_o = L_data_i;
            default: W_data_o = 'x;
        endcase

        // Local output
        case (L_port_select)
            3'b000:  L_data_o = N_data_i;
            3'b001:  L_data_o = S_data_i;
            3'b010:  L_data_o = E_data_i;
            3'b011:  L_data_o = W_data_i;
            default: L_data_o = 'x;
        endcase
    end

endmodule