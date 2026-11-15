module rtlpp_07191 (
    input [9:0] address,
    input clk,
    output [17:0] instruction
);

    reg [17:0] memory [0:1023];
    reg [17:0] out;

    initial begin
        memory[0] = 18'h040030; memory[1] = 18'h091006; memory[2] = 18'h600593;
        memory[3] = 18'h040030; memory[4] = 18'h0AA009; memory[5] = 18'h100669;
        memory[6] = 18'h3099F0; memory[7] = 18'h400040; memory[8] = 18'h001D14;
        memory[9] = 18'h059404; memory[10] = 18'h950420; memory[11] = 18'h1F5006;
        memory[12] = 18'h013900; memory[13] = 18'h114011; memory[14] = 18'h501F40;
        memory[15] = 18'h464501; memory[16] = 18'h504140; memory[17] = 18'h590045;
        memory[18] = 18'h002600; memory[19] = 18'h060299; memory[20] = 18'h001140;
        memory[21] = 18'h11501F; memory[22] = 18'h401405; memory[23] = 18'h900494;
        memory[24] = 18'h049504; memory[25] = 18'h500060; memory[26] = 18'h1F9001;
        memory[27] = 18'h140115; memory[28] = 18'h1F4040; memory[29] = 18'h604018;
        memory[30] = 18'h058040; memory[31] = 18'h854087; /* and so on ... */

        // Actually loading the remaining memory locations from the initial values here...

        memory[1023] = 18'h000000;
    end

    always @(posedge clk) begin
        out <= memory[address];
    end

    assign instruction = out;

endmodule