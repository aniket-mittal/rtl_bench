module origen_143568 (
    input wire clk,
    input wire rstn,
    input wire [31:0] afl,
    input wire [31:0] bfl,
    output reg [31:0] fl
);

    reg [47:0] mfl_0;
    reg sfl_0, sfl_1;
    reg [7:0] efl_0, efl_1;
    reg zero_out_0, zero_out_1;
    reg mfl47_1;
    reg [24:0] nmfl_1;

    always @(posedge clk or negedge rstn) begin
        if (!rstn) begin
            mfl_0 <= 48'b0;
            sfl_0 <= 1'b0;
            efl_0 <= 8'b0;
            zero_out_0 <= 1'b0;
            sfl_1 <= 1'b0;
            efl_1 <= 8'b0;
            zero_out_1 <= 1'b0;
            mfl47_1 <= 1'b0;
            nmfl_1 <= 25'b0;
            fl <= 32'b0;
        end else begin
            // Step 1: Multiply mantissas
            mfl_0 <= {1'b1, afl[22:0]} * {1'b1, bfl[22:0]};

            // Step 2: Calculate sign
            sfl_0 <= afl[31] ^ bfl[31];

            // Step 3: Calculate exponent
            efl_0 <= afl[30:23] + bfl[30:23] - 8'd127;

            // Step 4: Check for zero
            zero_out_0 <= (afl[30:0] == 31'b0) || (bfl[30:0] == 31'b0);

            // Step 5: Register transfer
            efl_1 <= efl_0;
            sfl_1 <= sfl_0;
            zero_out_1 <= zero_out_0;

            // Step 6: Set mfl47_1
            mfl47_1 <= mfl_0[47];

            // Step 7: Set nmfl_1
            nmfl_1 <= mfl47_1 ? {mfl_0[47:24], |mfl_0[23:0]} : {mfl_0[46:23], |mfl_0[22:0]};

            // Step 8: Set output
            if (zero_out_1)
                fl <= 32'b0;
            else
                fl <= {sfl_1, efl_1 + mfl47_1 - ~nmfl_1[0], nmfl_1[23:1]};
        end
    end

endmodule