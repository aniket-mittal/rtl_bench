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

    always @(posedge clk) begin
        if (rst) begin
            i_data_reg <= 0;
            q_data_reg <= 0;
            i_valid_reg <= 0;
            q_valid_reg <= 0;
        end
        else begin
            if (input_i_tvalid & input_i_tready) begin
                i_data_reg <= input_i;
                i_valid_reg <= 1'b1;
            end
            if (input_q_tvalid & input_q_tready) begin
                q_data_reg <= input_q;
                q_valid_reg <= 1'b1;
            end
            if (output_tvalid & output_tready) begin
                i_valid_reg <= 1'b0;
                q_valid_reg <= 1'b0;
            end
        end
    end

endmodule