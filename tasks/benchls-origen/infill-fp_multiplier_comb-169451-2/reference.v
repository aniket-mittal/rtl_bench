module origen_169451(
    input  [31:0] afl,
    input  [31:0] bfl,
    output [31:0] fl
);

    // Mantissa Calculation
    reg [47:0] mfl_0;
    always @(*) begin
        mfl_0 = afl[22:0] * bfl[22:0];
    end

    // Sign and Exponent Calculation
    reg sfl_0;
    reg [7:0] efl_0;
    always @(*) begin
        sfl_0 = afl[31] ^ bfl[31];
        efl_0 = afl[30:23] + bfl[30:23] - 8'h7E;
    end

    // Zero Detection
    reg zero_out_0;
    always @(*) begin
        zero_out_0 = (afl[30:0] == 31'h0) || (bfl[30:0] == 31'h0);
    end

    // Normalization
    reg [47:0] mfl47_1;
    reg [24:0] nmfl_1;
    reg not_mfl_47;
    always @(*) begin
        if (mfl_0[47]) begin
            mfl47_1 = mfl_0;
            nmfl_1 = mfl_0[47:23];
            not_mfl_47 = 1'b0;
        end else begin
            mfl47_1 = {1'b0, mfl_0[46:0]};
            nmfl_1 = {1'b1, mfl_0[46:23]};
            not_mfl_47 = 1'b1;
        end
    end

    // Output Assignment
    reg sfl_1;
    reg [7:0] efl_1;
    reg zero_out_1;
    always @(*) begin
        sfl_1 = sfl_0;
        efl_1 = efl_0;
        zero_out_1 = zero_out_0;
    end

    assign fl = zero_out_1 ? 32'h0 : {sfl_1, efl_1 - not_mfl_47, nmfl_1[22:0]};

endmodule