module origen_134707(
    input [63:0] in,
    input [3:0] sel,
    output [3:0] out
);
    assign out = in[sel*4 +: 4];
endmodule

module mux256to1(
    input [1023:0] in,
    input [7:0] sel,
    output [3:0] out
);
    wire [63:0] mux_out;
    
    genvar i;
    generate
        for (i = 0; i < 16; i = i + 1) begin : mux16_inst
            mux16to1 mux16 (
                .in(in[i*64 +: 64]),
                .sel(sel[3:0]),
                .out(mux_out[i*4 +: 4])
            );
        end
    endgenerate
    
    mux16to1 final_mux (
        .in(mux_out),
        .sel(sel[7:4]),
        .out(out)
    );
endmodule

module xor_gate(
    input a,
    input b,
    output reg out
);
    always @(*) begin
        out = a ^ b;
    end
endmodule

module functional_module(
    input [3:0] mux_out,
    input xor_out,
    output [3:0] result
);
    assign result = mux_out ^ {4{xor_out}};
endmodule

module control_logic(
    input [3:0] mux_result,
    input xor_result,
    input select,
    output [3:0] final_out
);
    assign final_out = select ? {3'b000, xor_result} : mux_result;
endmodule

module combined_system(
    input [1023:0] mux_in,
    input [7:0] mux_sel,
    input xor_a,
    input xor_b,
    input control_select,
    output [3:0] system_out
);
    wire [3:0] mux_out;
    wire xor_out;
    wire [3:0] func_out;
    
    mux256to1 mux (
        .in(mux_in),
        .sel(mux_sel),
        .out(mux_out)
    );
    
    xor_gate xor_g (
        .a(xor_a),
        .b(xor_b),
        .out(xor_out)
    );
    
    functional_module func_mod (
        .mux_out(mux_out),
        .xor_out(xor_out),
        .result(func_out)
    );
    
    control_logic ctrl_logic (
        .mux_result(func_out),
        .xor_result(xor_out),
        .select(control_select),
        .final_out(system_out)
    );
endmodule