module origen_132269(
    input [3:0] in,
    output reg [1:0] out
);
    always @(*) begin
        casez(in)
            4'b1???: out = 2'b11;
            4'b01??: out = 2'b10;
            4'b001?: out = 2'b01;
            4'b0001: out = 2'b00;
            default: out = 2'b00;
        endcase
    end
endmodule

module odd_parity_generator(
    input [7:0] in,
    output [8:0] out
);
    assign out[7:0] = in;
    assign out[8] = ^in;
endmodule

module final_output(
    input [1:0] priority_out,
    input [8:0] parity_out,
    output [8:0] final_out
);
    assign final_out = {1'b0, parity_out[7:0]} + {7'b0, priority_out};
endmodule

module system(
    input [3:0] priority_in,
    input [7:0] parity_in,
    output [8:0] system_out
);
    wire [1:0] priority_result;
    wire [8:0] parity_result;

    priority_encoder pe(
        .in(priority_in),
        .out(priority_result)
    );

    odd_parity_generator opg(
        .in(parity_in),
        .out(parity_result)
    );

    final_output fo(
        .priority_out(priority_result),
        .parity_out(parity_result),
        .final_out(system_out)
    );
endmodule