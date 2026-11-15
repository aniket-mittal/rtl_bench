module origen_168547 (
    input           clk,
    input           rst_n,
    input           start,
    input           tf_empty,
    input [NUM_PARSER-1:0] ps_finish,
    input           page_input_finish,
    input [NUM_PARSER-1:0] ps_empty,
    input [15:0]    ram_empty,
    input           cl_finish,
    output          page_finish
);

parameter NUM_PARSER = 4;
localparam PARSER_ALLONE = {NUM_PARSER{1'b1}};

reg             all_empty;
reg             page_input_finish_flag;
reg [15:0]      all_empty_delay;
reg [2:0]       state;
reg             page_finish_r;
reg             block_finish_r;

always @(posedge clk or negedge rst_n) begin
    if (~rst_n) begin
        all_empty <= 1'b0;
    end else begin
        if (ps_empty == PARSER_ALLONE && ram_empty == 16'hffff && tf_empty) begin
            all_empty <= 1'b1;
        end else begin
            all_empty <= 1'b0;
        end
    end
end

always @(posedge clk or negedge rst_n) begin
    if (~rst_n) begin
        page_input_finish_flag <= 1'b0;
    end else begin
        if (start) begin
            page_input_finish_flag <= 1'b0;
        end else if (page_input_finish) begin
            page_input_finish_flag <= 1'b1;
        end
    end
end

always @(posedge clk or negedge rst_n) begin
    if (~rst_n) begin
        all_empty_delay <= 16'b0;
    end else begin
        all_empty_delay <= {all_empty_delay[14:0], all_empty};
    end
end

[MASKED]

assign page_finish = page_finish_r;

endmodule