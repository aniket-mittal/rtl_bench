module origen_126834(
    input [3:0] A, B,
    input clk, reset,
    input [1:0] select,
    output [15:0] result
);

    wire [3:0] sum;
    wire [15:0] count;
    wire [2:0] enable;

    // 4-bit ripple carry adder
    ripple_carry_adder adder(
        .A(A),
        .B(B),
        .S(sum)
    );

    // Enable signal generator
    enable_generator en_gen(
        .select(select),
        .enable(enable)
    );

    // 4-digit binary counter
    counter counter_inst(
        .clk(clk),
        .reset(reset),
        .enable(enable),
        .count(count)
    );

    // Bitwise XOR module
    xor_module xor_inst(
        .adder_out({12'b0, sum}),
        .counter_out(count),
        .result(result)
    );

endmodule

module ripple_carry_adder(
    input [3:0] A, B,
    output [3:0] S
);
    wire [4:0] C;
    assign C[0] = 1'b0;

    genvar i;
    generate
        for (i = 0; i < 4; i = i + 1) begin : fa_loop
            full_adder fa(
                .A(A[i]),
                .B(B[i]),
                .Cin(C[i]),
                .S(S[i]),
                .Cout(C[i+1])
            );
        end
    endgenerate
endmodule

module full_adder(
    input A, B, Cin,
    output S, Cout
);
    assign S = A ^ B ^ Cin;
    assign Cout = (A & B) | (Cin & (A ^ B));
endmodule

module enable_generator(
    input [1:0] select,
    output reg [2:0] enable
);
    always @(*) begin
        case(select)
            2'b00: enable = 3'b001;
            2'b01: enable = 3'b010;
            2'b10: enable = 3'b100;
            2'b11: enable = 3'b000;
        endcase
    end
endmodule

module counter(
    input clk, reset,
    input [2:0] enable,
    output reg [15:0] count
);
    always @(posedge clk or posedge reset) begin
        if (reset)
            count <= 16'b0;
        else begin
            count[3:0] <= count[3:0] + 1;
            if (count[3:0] == 4'b1111) begin
                if (enable[0])
                    count[7:4] <= count[7:4] + 1;
                if (count[7:4] == 4'b1111 && enable[1])
                    count[11:8] <= count[11:8] + 1;
                if (count[11:8] == 4'b1111 && enable[2])
                    count[15:12] <= count[15:12] + 1;
            end
        end
    end
endmodule

module xor_module(
    input [15:0] adder_out, counter_out,
    output [15:0] result
);
    assign result = adder_out ^ counter_out;
endmodule