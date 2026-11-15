module origen_020748(
    input [28:0] mem_w0, mem_w1, mem_w2, mem_w3,
    output [17:0] out0, out1, out2, out3
);

    compute comp0 (.A_in(mem_w0), .A_out(out0));
    compute comp1 (.A_in(mem_w1), .A_out(out1));
    compute comp2 (.A_in(mem_w2), .A_out(out2));
    compute comp3 (.A_in(mem_w3), .A_out(out3));

endmodule

module compute(
    input [28:0] A_in,
    output reg [17:0] A_out
);

    reg [6:0] relaxation;

    always @(*) begin
        relaxation = {3'b000, A_in[27:24]} + A_in[13:7];

        if (A_in[28]) begin
            if (relaxation < A_in[6:0]) begin
                A_out[6:0] = relaxation;
                A_out[17] = 1'b1;
            end else begin
                A_out[6:0] = A_in[6:0];
                A_out[17] = 1'b0;
            end
        end else begin
            A_out[6:0] = A_in[6:0];
            A_out[17] = 1'b0;
        end

        A_out[11:7] = A_in[18:14];
        A_out[16:12] = A_in[23:19];
    end

endmodule

