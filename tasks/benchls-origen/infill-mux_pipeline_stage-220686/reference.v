module origen_220686 #(
    parameter ID = 0,
    parameter NUM_STAGE = 1,
    parameter din0_WIDTH = 16,
    parameter din1_WIDTH = 16,
    parameter din2_WIDTH = 16,
    parameter din3_WIDTH = 2,
    parameter dout_WIDTH = 16
)(
    input clk,
    input reset,
    input ce,
    input [din0_WIDTH-1:0] din0,
    input [din1_WIDTH-1:0] din1,
    input [din2_WIDTH-1:0] din2,
    input [din3_WIDTH-1:0] din3,
    output [dout_WIDTH-1:0] dout
);

    reg [din0_WIDTH-1:0] mux_1_0_reg;
    reg [din2_WIDTH-1:0] mux_1_1_reg;
    reg sel1;
    wire [dout_WIDTH-1:0] mux_2_0;

    wire [1:0] sel;

    assign sel = din3;

    always @(posedge clk) begin
        if (reset) begin
            sel1 <= 1'b0;
        end else if (ce) begin
            sel1 <= sel[1];
        end
    end

    always @(posedge clk) begin
        if (reset) begin
            mux_1_0_reg <= {din0_WIDTH{1'b0}};
        end else if (ce) begin
            mux_1_0_reg <= (sel[0] == 1'b0) ? din0 : din1;
        end
    end

    always @(posedge clk) begin
        if (reset) begin
            mux_1_1_reg <= {din2_WIDTH{1'b0}};
        end else if (ce) begin
            mux_1_1_reg <= din2;
        end
    end

    assign mux_2_0 = (sel1 == 1'b0) ? mux_1_0_reg : mux_1_1_reg;

    assign dout = mux_2_0;

endmodule