module origen_033602 (
    input wire iClk,
    input wire [16:0] iF,
    input wire [16:0] iG0,
    input wire [16:0] iG1,
    output wire [15:0] oX0,
    output wire [15:0] oX1,
    output wire rValid
);

    reg [16:0] rG0_1, rG0_2, rG0_3, rG0_4, rG0_5, rG0_6, rG0_7, rG0_8, rG0_9;
    reg [16:0] rG1_1, rG1_2, rG1_3, rG1_4, rG1_5, rG1_6, rG1_7, rG1_8, rG1_9;
    reg [31:0] rX0, rX1;
    reg rG0_s, rG1_s;

    always @(posedge iClk) begin
        // Pipeline stages for G0
        rG0_1 <= iG0;
        rG0_2 <= rG0_1;
        rG0_3 <= rG0_2;
        rG0_4 <= rG0_3;
        rG0_5 <= rG0_4;
        rG0_6 <= rG0_5;
        rG0_7 <= rG0_6;
        rG0_8 <= rG0_7;
        rG0_9 <= rG0_8;

        // Pipeline stages for G1
        rG1_1 <= iG1;
        rG1_2 <= rG1_1;
        rG1_3 <= rG1_2;
        rG1_4 <= rG1_3;
        rG1_5 <= rG1_4;
        rG1_6 <= rG1_5;
        rG1_7 <= rG1_6;
        rG1_8 <= rG1_7;
        rG1_9 <= rG1_8;

        // Multiplication
        rX0 <= iF * rG0_8[14:0];
        rX1 <= iF * rG1_8[14:0];

        // Store sign bits
        rG0_s <= rG0_8[16];
        rG1_s <= rG1_8[16];
    end

    // Output formation
    assign oX0 = {rG0_s, rX0[30:16]};
    assign oX1 = {rG1_s, rX1[30:16]};

    // Validity flag
    assign rValid = (rX0 != 32'b0) || (rX1 != 32'b0);

endmodule