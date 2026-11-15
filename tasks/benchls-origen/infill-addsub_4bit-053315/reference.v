module origen_053315(
    input [3:0] a,
    input [3:0] b,
    input c_in,
    input z,
    output reg [3:0] d,
    output reg c_out,
    output [4:0] x
);

    always @(z) begin
        if (z) begin
            {c_out, d} = a + b + c_in;
        end else begin
            {c_out, d} = a - b + c_in;
        end
    end

    assign x = {c_out, d};

endmodule

