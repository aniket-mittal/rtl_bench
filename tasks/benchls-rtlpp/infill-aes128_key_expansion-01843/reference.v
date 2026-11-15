module rtlpp_01843 (
    input clk,
    input reset,
    input start_i,
    input [3:0] round_i,
    input [127:0] last_key_i,
    output reg [127:0] new_key_o,
    output reg ready_o,
    output reg sbox_access_o,
    output reg [7:0] sbox_data_o,
    input [7:0] sbox_data_i,
    output reg sbox_decrypt_o
);

reg [2:0] next_state;
reg [2:0] state;
reg [7:0] rcon_o;
reg [31:0] next_col;
reg [31:0] col;
reg [127:0] key_reg;
reg [127:0] next_key_reg;
reg next_ready_o;
reg [127:0] K_var;
reg [127:0] W_var;
reg [31:0] col_t;
reg [23:0] zero;

always @(round_i) begin
    case (round_i)
        1: rcon_o = 8'h01;
        2: rcon_o = 8'h02;
        3: rcon_o = 8'h04;
        4: rcon_o = 8'h08;
        5: rcon_o = 8'h10;
        6: rcon_o = 8'h20;
        7: rcon_o = 8'h40;
        8: rcon_o = 8'h80;
        9: rcon_o = 8'h1B;
       10: rcon_o = 8'h36;
       default: rcon_o = 8'h00;
    endcase
end

always @(posedge clk or negedge reset) begin
    if (!reset) begin
        state <= 0;
        col <= 0;
        key_reg <= 0;
        ready_o <= 0;
    end else begin
        state <= next_state;
        col <= next_col;
        key_reg <= next_key_reg;
        ready_o <= next_ready_o;
    end
end

always @(*) begin
    zero = 0;
    col_t = col;
    W_var = 0;

    next_state = state;
    next_col = col;
    next_ready_o = 0;
    next_key_reg = key_reg;
    new_key_o = key_reg;
    sbox_decrypt_o = 0;
    sbox_access_o = 0;
    sbox_data_o = 0;
    K_var = last_key_i;

    case (state)
        0: begin
            if (start_i) begin
                col_t = 0;
                sbox_access_o = 1;
                sbox_data_o = K_var[31:24];
                next_state = 1;
            end
        end
        1: begin
            sbox_access_o = 1;
            sbox_data_o = K_var[23:16];
            col_t[7:0] = sbox_data_i;
            next_col = col_t;
            next_state = 2;
        end
        2: begin
            sbox_access_o = 1;
            sbox_data_o = K_var[15:8];
            col_t[31:24] = sbox_data_i;
            next_col = col_t;
            next_state = 3;
        end
        3: begin
            sbox_access_o = 1;
            sbox_data_o = K_var[7:0];
            col_t[23:16] = sbox_data_i;
            next_col = col_t;
            next_state = 4;
        end
        4: begin
            sbox_access_o = 1;
            col_t[15:8] = sbox_data_i;
            next_col = col_t;
            W_var[127:96] = col_t ^ K_var[127:96] ^ {rcon_o, zero};        
            W_var[95:64] = W_var[127:96] ^ K_var[95:64];
            W_var[63:32] = W_var[95:64] ^ K_var[63:32];
            W_var[31:0] = W_var[63:32] ^ K_var[31:0];
            next_ready_o = 1;
            next_key_reg = W_var;
            next_state = 0;
        end
        default: begin
            next_state = 0;
        end
    endcase
end

endmodule