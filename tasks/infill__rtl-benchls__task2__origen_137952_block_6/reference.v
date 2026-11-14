module origen_137952(
    input wire clk,
    input wire rst,
    input wire [7:0] a,
    input wire [7:0] b,
    input wire add_sub,
    input wire [3:0] shift_in,
    input wire control,
    output wire [8:0] final_out
);

    wire [8:0] adder_out;
    wire [3:0] shift_out;
    wire [8:0] mux_out;

    // 8-bit adder/subtractor module
    adder_subtractor as_module (
        .clk(clk),
        .rst(rst),
        .a(a),
        .b(b),
        .add_sub(add_sub),
        .result(adder_out)
    );

    // 4-bit barrel shifter module
    barrel_shifter bs_module (
        .in(shift_in),
        .out(shift_out)
    );

    // Functional module
    functional_module fm_module (
        .adder_in(adder_out),
        .shifter_in({4'b0000, shift_out}),
        .control(control),
        .result(final_out)
    );

endmodule

module adder_subtractor(
    input wire clk,
    input wire rst,
    input wire [7:0] a,
    input wire [7:0] b,
    input wire add_sub,
    output reg [8:0] result
);

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            result <= 9'b0;
        end else begin
            if (add_sub)
                result <= a + b;
            else
                result <= a - b;
        end
    end

endmodule

module barrel_shifter(
    input wire [3:0] in,
    output wire [3:0] out
);

    wire [1:0] sel;
    wire [3:0] mux_out;

    // Decoder
    assign sel = 2'b01;

    // Multiplexer
    assign mux_out[3] = (sel == 2'b00) ? in[3] :
                        (sel == 2'b01) ? in[2] :
                        (sel == 2'b10) ? in[1] : in[0];
    assign mux_out[2] = (sel == 2'b00) ? in[2] :
                        (sel == 2'b01) ? in[1] :
                        (sel == 2'b10) ? in[0] : in[3];
    assign mux_out[1] = (sel == 2'b00) ? in[1] :
                        (sel == 2'b01) ? in[0] :
                        (sel == 2'b10) ? in[3] : in[2];
    assign mux_out[0] = (sel == 2'b00) ? in[0] :
                        (sel == 2'b01) ? in[3] :
                        (sel == 2'b10) ? in[2] : in[1];

    assign out = mux_out;

endmodule

module functional_module(
    input wire [8:0] adder_in,
    input wire [8:0] shifter_in,
    input wire control,
    output wire [8:0] result
);

    wire [8:0] add_result, sub_result;

    assign add_result = adder_in + shifter_in;
    assign sub_result = adder_in - shifter_in;

    // Control unit and multiplexer
    assign result = control ? add_result : sub_result;

endmodule