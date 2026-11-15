module rtlpp_07778(
    input [15:0] A,
    input AVALID,
    input [15:0] B,
    input BVALID,
    input CLK,
    output [15:0] AND_OUT,
    output [15:0] OR_OUT,
    output [15:0] XOR_OUT,
    output [15:0] D,
    output [15:0] S,
    output [31:0] P,
    output [31:0] Q,
    output QVALID
);

// Internal Signals
wire [15:0] and16_Y;
wire [15:0] c_addsub_0_S;
wire [15:0] c_addsub_1_S;
reg [31:0] div_gen_0_m_axis_dout_tdata;
reg div_gen_0_m_axis_dout_tvalid;
reg [31:0] mult_gen_0_P;
wire [15:0] or16_Y;
wire [15:0] xor2_Y;

// AND operation
assign and16_Y = A & B;

// Addition Operation 1
assign c_addsub_0_S = A + B;

// Addition Operation 2
assign c_addsub_1_S = A + B;

// OR operation
assign or16_Y = A | B;

// XOR operation
assign xor2_Y = A ^ B;

// Multiplication
always @(posedge CLK) begin
    mult_gen_0_P <= A * B;
end

// Division
always @(posedge CLK) begin
    if (BVALID && B != 0) begin
        div_gen_0_m_axis_dout_tdata <= A / B;
        div_gen_0_m_axis_dout_tvalid <= 1'b1;
    end else begin
        div_gen_0_m_axis_dout_tdata <= 32'b0;
        div_gen_0_m_axis_dout_tvalid <= 1'b0;
    end
end

// Output assignments
assign AND_OUT = and16_Y;
assign OR_OUT = or16_Y;
assign XOR_OUT = xor2_Y;
assign D = c_addsub_1_S;
assign S = c_addsub_0_S;
assign P = mult_gen_0_P;
assign Q = div_gen_0_m_axis_dout_tdata;
assign QVALID = div_gen_0_m_axis_dout_tvalid;

endmodule