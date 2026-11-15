module origen_188865 #(
    parameter WIDTH = 16
)(
    input  wire                 clk,
    input  wire                 rst,

    input  wire [WIDTH-1:0]     input_i,
    input  wire                 input_i_tvalid,
    output wire                 input_i_tready,

    input  wire [WIDTH-1:0]     input_q,
    input  wire                 input_q_tvalid,
    output wire                 input_q_tready,

    output wire [WIDTH-1:0]     output_i,
    output wire [WIDTH-1:0]     output_q,
    output wire                 output_tvalid,
    input  wire                 output_tready
);

    reg [WIDTH-1:0] i_data_reg;
    reg [WIDTH-1:0] q_data_reg;
    reg             i_valid_reg;
    reg             q_valid_reg;

    assign input_i_tready = ~i_valid_reg | (output_tready & output_tvalid);
    assign input_q_tready = ~q_valid_reg | (output_tready & output_tvalid);

    assign output_tvalid = i_valid_reg & q_valid_reg;
    assign output_i = i_data_reg;
    assign output_q = q_data_reg;

    [MASKED]

endmodule