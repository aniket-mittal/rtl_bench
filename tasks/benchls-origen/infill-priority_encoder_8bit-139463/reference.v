module origen_139463(
    input [7:0] in,
    output reg [2:0] out
);

wire [3:0] upper, lower;
wire [1:0] upper_out, lower_out;
wire upper_valid, lower_valid;

assign upper = in[7:4];
assign lower = in[3:0];

priority_encoder_4bit pe_upper(
    .in(upper),
    .out(upper_out),
    .valid(upper_valid)
);

priority_encoder_4bit pe_lower(
    .in(lower),
    .out(lower_out),
    .valid(lower_valid)
);

always @* begin
    if (upper_valid)
        out = {1'b0, upper_out} + 3'd4;
    else if (lower_valid)
        out = {1'b0, lower_out};
    else
        out = 3'd7;
end

endmodule

module priority_encoder_4bit(
    input [3:0] in,
    output reg [1:0] out,
    output valid
);

wire [3:0] and_outputs;
wire [1:0] adder_sum;
wire adder_cout;

// AND gates
assign and_outputs[3] = in[3];
assign and_outputs[2] = in[2] & ~in[3];
assign and_outputs[1] = in[1] & ~in[3] & ~in[2];
assign and_outputs[0] = in[0] & ~in[3] & ~in[2] & ~in[1];

// Full adders
full_adder fa0(
    .a(and_outputs[1]),
    .b(and_outputs[3]),
    .cin(1'b0),
    .sum(adder_sum[0]),
    .cout(adder_cout)
);

full_adder fa1(
    .a(and_outputs[2]),
    .b(1'b0),
    .cin(adder_cout),
    .sum(adder_sum[1]),
    .cout()
);

// Output logic
always @* begin
    case (adder_sum)
        2'b00: out = 2'b00;
        2'b01: out = 2'b01;
        2'b10: out = 2'b10;
        2'b11: out = 2'b11;
    endcase
end

assign valid = |in;

endmodule

module full_adder(
    input a,
    input b,
    input cin,
    output sum,
    output cout
);

assign sum = a ^ b ^ cin;
assign cout = (a & b) | (cin & (a ^ b));

endmodule

module combined_priority_encoder(
    input [7:0] in_8bit,
    input [3:0] in_4bit,
    output reg [2:0] out
);

wire [2:0] out_8bit;
wire [1:0] out_4bit;
wire valid_4bit;

priority_encoder_8bit pe_8bit(
    .in(in_8bit),
    .out(out_8bit)
);

priority_encoder_4bit pe_4bit(
    .in(in_4bit),
    .out(out_4bit),
    .valid(valid_4bit)
);

always @* begin
    if (out_8bit != 3'd7)
        out = out_8bit;
    else if (valid_4bit)
        out = {1'b1, out_4bit};
    else
        out = 3'd7;
end

endmodule