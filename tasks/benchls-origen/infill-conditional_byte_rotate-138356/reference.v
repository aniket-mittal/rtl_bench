module origen_138356 (
    input [31:0] in,
    output [31:0] out
);
    wire [31:0] shift_8, shift_16, shift_24;
    
    assign shift_8 = {in[23:0], in[31:24]};
    assign shift_16 = {in[15:0], in[31:16]};
    assign shift_24 = {in[7:0], in[31:8]};
    
    assign out = in[31] ? shift_24 :
                 in[30] ? shift_16 :
                 in[29] ? shift_8 : in;
endmodule

module not_gate (
    input in,
    output out
);
    assign out = ~in;
endmodule

module final_output (
    input [31:0] reversed_in,
    input [31:0] not_in,
    output [31:0] out
);
    assign out = ~reversed_in;
endmodule

module top_module (
    input [31:0] data_in,
    output [31:0] data_out
);
    wire [31:0] reversed_data, not_data;
    
    byte_reverser br (
        .in(data_in),
        .out(reversed_data)
    );
    
    genvar i;
    generate
        for (i = 0; i < 32; i = i + 1) begin : not_gates
            not_gate ng (
                .in(data_in[i]),
                .out(not_data[i])
            );
        end
    endgenerate
    
    final_output fo (
        .reversed_in(reversed_data),
        .not_in(not_data),
        .out(data_out)
    );
endmodule