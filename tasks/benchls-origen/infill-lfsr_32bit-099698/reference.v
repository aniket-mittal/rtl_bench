module origen_099698 #(
    parameter INITIAL_VALUE = 32'h14d6
)(
    input wire clk,
    input wire reset_n,
    input wire en,
    input wire [31:0] new_data,
    output reg [31:0] value
);

    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            value <= INITIAL_VALUE;
        end else if (en) begin
            value[31] <= new_data[31] ^ value[30];
            value[30] <= new_data[30] ^ value[29];
            value[29] <= new_data[29] ^ value[28];
            value[28] <= new_data[28] ^ value[27];
            value[27] <= new_data[27] ^ value[26];
            value[26] <= new_data[26] ^ value[25];
            value[25] <= new_data[25] ^ value[24];
            value[24] <= new_data[24] ^ value[23];
            value[23] <= new_data[23] ^ value[22];
            value[22] <= new_data[22] ^ value[21];
            value[21] <= new_data[21] ^ value[20];
            value[20] <= new_data[20] ^ value[19];
            value[19] <= new_data[19] ^ value[18];
            value[18] <= new_data[18] ^ value[17];
            value[17] <= new_data[17] ^ value[16];
            value[16] <= new_data[16] ^ value[15];
            value[15] <= new_data[15] ^ value[14];
            value[14] <= new_data[14] ^ value[13];
            value[13] <= new_data[13] ^ value[12];
            value[12] <= new_data[12] ^ value[11];
            value[11] <= new_data[11] ^ value[10];
            value[10] <= new_data[10] ^ value[9];
            value[9] <= new_data[9] ^ value[8];
            value[8] <= new_data[8] ^ value[7];
            value[7] <= new_data[7] ^ value[6];
            value[6] <= new_data[6] ^ value[5] ^ value[0];
            value[5] <= new_data[5] ^ value[4];
            value[4] <= new_data[4] ^ value[3] ^ value[0];
            value[3] <= new_data[3] ^ value[2];
            value[2] <= new_data[2] ^ value[1] ^ value[0];
            value[1] <= new_data[1] ^ value[0] ^ value[0];
            value[0] <= new_data[0] ^ value[31] ^ value[0];
        end
    end

endmodule