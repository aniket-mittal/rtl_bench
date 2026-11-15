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

    [MASKED]

endmodule