module origen_119730 (
    input  logic        clk_i,
    input  logic        rst_n_i,
    input  logic        enb_i,
    input  logic        restart_flag_i,
    input  logic        pre_sum_flag_i,
    input  logic        output_flag_i,
    input  logic        busy_i,
    input  logic [7:0]  dta_i,
    input  logic [7:0]  dtb_i,
    output logic [7:0]  index_o,
    output logic [31:0] dt_o
);

    logic [7:0]  diff;
    logic [7:0]  abs_diff;
    logic [7:0]  latched_abs_diff;
    logic [31:0] sum_r;

    // Calculate difference and absolute value
    assign diff = dta_i - dtb_i;
    assign abs_diff = (diff[7]) ? (~diff + 1'b1) : diff;

    // Latch absolute difference
    always_ff @(posedge clk_i or negedge rst_n_i) begin
        if (~rst_n_i) begin
            latched_abs_diff <= 8'b0;
        end else if (pre_sum_flag_i) begin
            latched_abs_diff <= abs_diff;
        end
    end

    // Accumulate SAD and increment index
    always_ff @(posedge clk_i or negedge rst_n_i) begin
        if (~rst_n_i) begin
            sum_r   <= 32'b0;
            index_o <= 8'b0;
        end else if (restart_flag_i) begin
            sum_r   <= 32'b0;
            index_o <= 8'b0;
        end else if (busy_i) begin
            sum_r   <= sum_r + latched_abs_diff;
            index_o <= index_o + 1'b1;
        end
    end

    // Output final result and handle reset
    always_ff @(posedge clk_i or negedge rst_n_i) begin
        if (~rst_n_i) begin
            dt_o <= 32'b0;
        end else if (output_flag_i) begin
            dt_o <= sum_r;
        end
    end

endmodule