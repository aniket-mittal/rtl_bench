module rtlpp_00033(clk, rst, enable, data_in, data_out, enable_out);
input       clk;
input       rst;
input       enable;
input       [23:0]  data_in;
output      reg [23:0] data_out;
output      reg enable_out;

// Constants
parameter [13:0] Y1 = 14'd4899;
parameter [13:0] Y2 = 14'd9617;
parameter [13:0] Y3 = 14'd1868;
parameter [13:0] CB1 = 14'd2764;
parameter [13:0] CB2 = 14'd5428;
parameter [13:0] CB3 = 14'd8192;
parameter [13:0] CR1 = 14'd8192;
parameter [13:0] CR2 = 14'd6860;
parameter [13:0] CR3 = 14'd1332;

// Intermediate and final signals
reg [21:0] Y_temp, CB_temp, CR_temp;
reg [21:0] Y1_product, Y2_product, Y3_product;
reg [21:0] CB1_product, CB2_product, CB3_product;
reg [21:0] CR1_product, CR2_product, CR3_product;
reg [7:0] Y, CB, CR;
reg enable_1, enable_2;

always @(posedge clk) begin
    if (rst) begin
        Y1_product <= 0;
        Y2_product <= 0;
        Y3_product <= 0;
        CB1_product <= 0;
        CB2_product <= 0;
        CB3_product <= 0;
        CR1_product <= 0;
        CR2_product <= 0;
        CR3_product <= 0;
        Y_temp <= 0;
        CB_temp <= 0;
        CR_temp <= 0;
    end else if (enable) begin
        Y1_product <= Y1 * data_in[7:0];
        Y2_product <= Y2 * data_in[15:8];
        Y3_product <= Y3 * data_in[23:16];
        CB1_product <= CB1 * data_in[7:0];
        CB2_product <= CB2 * data_in[15:8];
        CB3_product <= CB3 * data_in[23:16];
        CR1_product <= CR1 * data_in[7:0];
        CR2_product <= CR2 * data_in[15:8];
        CR3_product <= CR3 * data_in[23:16];
        Y_temp <= Y1_product + Y2_product + Y3_product;
        CB_temp <= 22'd2097152 - CB1_product - CB2_product + CB3_product;
        CR_temp <= 22'd2097152 + CR1_product - CR2_product - CR3_product;
    end
end

always @(posedge clk) begin
    if (rst) begin
        Y <= 0;
        CB <= 0;
        CR <= 0;
    end else if (enable) begin
        Y <= (Y_temp[13] ? Y_temp[21:14] + 1 : Y_temp[21:14]);
        CB <= (CB_temp[13] & (CB_temp[21:14] != 8'd255) ? CB_temp[21:14] + 1 : CB_temp[21:14]);
        CR <= (CR_temp[13] & (CR_temp[21:14] != 8'd255) ? CR_temp[21:14] + 1 : CR_temp[21:14]);
    end
end

always @(posedge clk) begin
    if (rst) begin
        enable_1 <= 0;
        enable_2 <= 0;
        enable_out <= 0;
    end else begin
        enable_1 <= enable;
        enable_2 <= enable_1;
        enable_out <= enable_2;
    end
end

always @(posedge clk) begin
    data_out <= {CR, CB, Y};
end

endmodule