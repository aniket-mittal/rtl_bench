module origen_109548 (
    input wire clk_i,
    input wire [7:0] dt_i,
    input wire restart_flag_i,
    input wire mux_ctrl1_i,
    input wire [1:0] mux_ctrl2_i,
    input wire d_en_i,
    input wire s_en_i,
    input wire r_en_i,
    input wire op_en_i,
    output wire [8:0] s_o,
    output wire [7:0] x_o,
    output wire [7:0] dt_o
);

    reg [4:0] d_r;
    reg [8:0] s_r;
    reg [7:0] x_r;
    reg [3:0] r_r;
    reg [8:0] operand1_r, operand2_r;

    wire [8:0] sum_result_w;
    wire [8:0] mux_output1_w;
    wire [8:0] mux_output2_w;

    always @(posedge clk_i) begin
        if (restart_flag_i) begin
            d_r <= 5'd2;
            s_r <= 9'd4;
            x_r <= dt_i;
            r_r <= 4'd0;
        end else begin
            if (d_en_i) d_r <= sum_result_w[4:0];
            if (s_en_i) s_r <= sum_result_w;
            if (r_en_i) r_r <= d_r[4:1];
        end
    end

    assign mux_output1_w = mux_ctrl1_i ? s_r : {4'b0, d_r};
    
    assign mux_output2_w = (mux_ctrl2_i == 2'b00) ? {4'b0, d_r} :
                           (mux_ctrl2_i == 2'b01) ? 9'd1 :
                           (mux_ctrl2_i == 2'b10) ? 9'd2 : 9'd0;

    always @(posedge clk_i) begin
        if (op_en_i) begin
            operand1_r <= mux_output1_w;
            operand2_r <= mux_output2_w;
        end
    end

    assign sum_result_w = operand1_r + operand2_r;

    assign s_o = s_r;
    assign x_o = x_r;
    assign dt_o = (x_r == 8'd0) ? 8'd0 : {4'b0, r_r};

endmodule