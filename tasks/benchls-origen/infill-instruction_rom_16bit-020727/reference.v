module origen_020727 (
    input wire clk,
    input wire rst,
    input wire [7:0] addr,
    output reg [15:0] inst_out
);

    reg [15:0] memory [0:63];

    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            memory[0]  <= 16'h1234;
            memory[2]  <= 16'h5678;
            memory[4]  <= 16'h9ABC;
            memory[6]  <= 16'hDEF0;
            memory[8]  <= 16'h2468;
            memory[10] <= 16'hACE0;
            memory[12] <= 16'h1357;
            memory[14] <= 16'h8642;
            memory[16] <= 16'hFDB9;
            memory[18] <= 16'h7531;
            memory[20] <= 16'hECA8;
            memory[22] <= 16'h6420;
            memory[24] <= 16'h9753;
            memory[26] <= 16'h1111;
            memory[28] <= 16'h2222;
            memory[30] <= 16'h3333;
            memory[32] <= 16'h4444;
            memory[34] <= 16'h5555;
            memory[36] <= 16'h6666;
            memory[38] <= 16'h7777;
            memory[40] <= 16'h8888;
            memory[42] <= 16'h9999;
            memory[44] <= 16'hAAAA;
            memory[46] <= 16'hBBBB;
            memory[48] <= 16'hCCCC;
            memory[50] <= 16'hDDDD;
            memory[52] <= 16'hEEEE;
            memory[54] <= 16'hFFFF;
            memory[56] <= 16'h0000;
            memory[58] <= 16'h1010;
            memory[60] <= 16'h0101;
            memory[62] <= 16'h2020;
        end
    end

    always @(*) begin
        inst_out = memory[addr[7:1]];
    end

endmodule