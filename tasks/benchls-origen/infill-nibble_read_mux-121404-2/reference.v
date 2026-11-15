module origen_121404
(
    input [4:0] address_0,
    input [3:0] contrib_0,
    output [3:0] rdata_0,
    output [3:0] mixed
);

    wire [127:0] data_0 = {mixed, 80'h0000000000000000000, 44'h000000000000};
    reg [3:0] result_0;

    assign mixed = contrib_0 ^ 4'h0;
    assign rdata_0 = result_0;

    always @(*) begin
        case (address_0)
            5'h00: result_0 = data_0[3:0];
            5'h01: result_0 = data_0[7:4];
            5'h02: result_0 = data_0[11:8];
            5'h03: result_0 = data_0[15:12];
            5'h04: result_0 = data_0[19:16];
            5'h05: result_0 = data_0[23:20];
            5'h06: result_0 = data_0[27:24];
            5'h07: result_0 = data_0[31:28];
            5'h08: result_0 = data_0[35:32];
            5'h09: result_0 = data_0[39:36];
            5'h0A: result_0 = data_0[43:40];
            5'h0B: result_0 = data_0[47:44];
            5'h0C: result_0 = data_0[51:48];
            5'h0D: result_0 = data_0[55:52];
            5'h0E: result_0 = data_0[59:56];
            5'h0F: result_0 = data_0[63:60];
            5'h10: result_0 = data_0[67:64];
            5'h11: result_0 = data_0[71:68];
            5'h12: result_0 = data_0[75:72];
            5'h13: result_0 = data_0[79:76];
            5'h14: result_0 = data_0[83:80];
            5'h15: result_0 = data_0[87:84];
            5'h16: result_0 = data_0[91:88];
            5'h17: result_0 = data_0[95:92];
            5'h18: result_0 = data_0[99:96];
            5'h19: result_0 = data_0[103:100];
            5'h1A: result_0 = data_0[107:104];
            5'h1B: result_0 = data_0[111:108];
            5'h1C: result_0 = data_0[115:112];
            5'h1D: result_0 = data_0[119:116];
            5'h1E: result_0 = data_0[123:120];
            5'h1F: result_0 = data_0[127:124];
            default: result_0 = 4'h0;
        endcase
    end

endmodule