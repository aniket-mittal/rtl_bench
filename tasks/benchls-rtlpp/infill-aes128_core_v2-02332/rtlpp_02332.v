module rtlpp_02332(clk, reset, start_i, decrypt_i, data_i, ready_o, data_o, sbox_data_o, sbox_data_i, sbox_decrypt_o);
input clk;
input reset;
input start_i;
input decrypt_i;
input [127:0] data_i;
output ready_o;
output [127:0] data_o;
output [7:0] sbox_data_o;
input [7:0] sbox_data_i;
output sbox_decrypt_o;

reg ready_o;
reg [127:0] data_o;
reg [7:0] sbox_data_o;
reg sbox_decrypt_o;

reg [4:0] state;
reg [4:0] next_state;
reg [127:0] data_reg;
reg [127:0] next_data_reg;
reg next_ready_o;

reg [127:0] data_i_var, data_reg_128;
reg [7:0] data_array[15:0], data_reg_var[15:0];

always @(posedge clk or negedge reset) begin
    if (!reset) begin
        data_reg <= 0;
        state <= 0;
        ready_o <= 0;
    end else begin
        data_reg <= next_data_reg;
        state <= next_state;
        ready_o <= next_ready_o;
    end
end

[MASKED]

endmodule