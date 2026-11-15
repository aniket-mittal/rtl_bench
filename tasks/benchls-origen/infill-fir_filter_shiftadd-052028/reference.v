module origen_052028 (
    input wire axis_rstn,
    input wire axis_aclk,
    input wire valid_in,
    input wire signed [31:0] sample_in,
    output reg valid_out,
    output reg signed [31:0] sample_out
);

    reg signed [31:0] m0 [14:0];
    reg signed [31:0] m1 [14:0];
    reg signed [31:0] m3 [14:0];
    reg signed [31:0] m5 [14:0];
    reg signed [31:0] m7 [14:0];

    function signed [31:0] runmult;
        input signed [31:0] a, b;
        begin
            runmult = (a << 16) - (a << b);
        end
    endfunction

    function signed [31:0] coeff0;
        input signed [31:0] x;
        begin
            coeff0 = runmult(x, 4);
        end
    endfunction

    function signed [31:0] coeff1;
        input signed [31:0] x;
        begin
            coeff1 = runmult(x, 3) - (x << 3);
        end
    endfunction

    function signed [31:0] coeff3;
        input signed [31:0] x;
        begin
            coeff3 = runmult(x, 2) - (x << 4);
        end
    endfunction

    function signed [31:0] coeff5;
        input signed [31:0] x;
        begin
            coeff5 = runmult(x, 1) - (x << 5);
        end
    endfunction

    function signed [31:0] coeff7;
        input signed [31:0] x;
        begin
            coeff7 = x - (x << 6);
        end
    endfunction

    integer i;
    reg signed [31:0] sum;

    always @(posedge axis_aclk or negedge axis_rstn) begin
        if (!axis_rstn) begin
            for (i = 0; i < 15; i = i + 1) begin
                m0[i] <= 32'b0;
                m1[i] <= 32'b0;
                m3[i] <= 32'b0;
                m5[i] <= 32'b0;
                m7[i] <= 32'b0;
            end
            valid_out <= 1'b0;
            sample_out <= 32'b0;
        end else begin
            valid_out <= valid_in;

            if (valid_in) begin
                // Shift delay lines
                for (i = 14; i > 0; i = i - 1) begin
                    m0[i] <= m0[i-1];
                    m1[i] <= m1[i-1];
                    m3[i] <= m3[i-1];
                    m5[i] <= m5[i-1];
                    m7[i] <= m7[i-1];
                end

                // Apply coefficients and store in first stage
                m0[0] <= coeff0(sample_in);
                m1[0] <= coeff1(sample_in);
                m3[0] <= coeff3(sample_in);
                m5[0] <= coeff5(sample_in);
                m7[0] <= coeff7(sample_in);

                // Compute output
                sum = m7[0] + m5[2] + m3[4] + m1[6] + m0[7] + m1[8] + m3[10] + m5[12] + m7[14];
                sample_out <= {{16{sum[31]}}, sum[31:16]};
            end
        end
    end

endmodule