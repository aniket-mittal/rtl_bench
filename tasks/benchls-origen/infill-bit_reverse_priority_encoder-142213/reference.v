module origen_142213(
    input [7:0] in,
    output [7:0] out
);
    assign out = {in[0], in[1], in[2], in[3], in[4], in[5], in[6], in[7]};
endmodule

module priority_encoder(
    input [3:0] in0, in1, in2, in3,
    output reg [2:0] out
);
    always @(*) begin
        if (in3 != 4'b0000) out = 3'b011;
        else if (in2 != 4'b0000) out = 3'b010;
        else if (in1 != 4'b0000) out = 3'b001;
        else if (in0 != 4'b0000) out = 3'b000;
        else out = 3'b000;
    end
endmodule

module functional_module(
    input [7:0] bit_reversed,
    input [2:0] priority_encoded,
    output [7:0] final_out
);
    assign final_out = (bit_reversed + {5'b00000, priority_encoded}) % 256;
endmodule

module combined_system(
    input [7:0] input_data,
    input [3:0] pe_in0, pe_in1, pe_in2, pe_in3,
    output [7:0] system_out
);
    wire [7:0] reversed_data;
    wire [2:0] encoded_data;

    bit_reversal br_inst (
        .in(input_data),
        .out(reversed_data)
    );

    priority_encoder pe_inst (
        .in0(pe_in0),
        .in1(pe_in1),
        .in2(pe_in2),
        .in3(pe_in3),
        .out(encoded_data)
    );

    functional_module fm_inst (
        .bit_reversed(reversed_data),
        .priority_encoded(encoded_data),
        .final_out(system_out)
    );
endmodule