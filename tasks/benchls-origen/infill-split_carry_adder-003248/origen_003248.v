module origen_003248 #(
    parameter LS_WIDTH = 10,
    parameter MS_WIDTH = 10,
    parameter WIDTH = LS_WIDTH + MS_WIDTH
) (
    input [WIDTH-1:0] a,
    input [WIDTH-1:0] b,
    output [WIDTH-1:0] o
);

    wire [LS_WIDTH:0] ls_sum;
    wire [MS_WIDTH:0] ms_sum;
    wire cross_carry;

    assign ls_sum = a[LS_WIDTH-1:0] + b[LS_WIDTH-1:0];
    assign cross_carry = ls_sum[LS_WIDTH];
    assign ms_sum = a[WIDTH-1:LS_WIDTH] + b[WIDTH-1:LS_WIDTH] + cross_carry;

    [MASKED]

endmodule

module split_add_tb;
    parameter LS_WIDTH = 15;
    parameter MS_WIDTH = 20;
    parameter WIDTH = LS_WIDTH + MS_WIDTH;

    reg [WIDTH-1:0] a, b;
    wire [WIDTH-1:0] oa, ob;

    split_add #(
        .LS_WIDTH(LS_WIDTH),
        .MS_WIDTH(MS_WIDTH)
    ) dut (
        .a(a),
        .b(b),
        .o(oa)
    );

    assign ob = a + b;

    initial begin
        a = 0;
        b = 0;
        #1000000;
        $display("PASS");
        ;
    end

    always #100 begin
        a = $random;
        b = $random;
        #1;
        if (oa !== ob) begin
            ;
            ;
        end
    end

endmodule