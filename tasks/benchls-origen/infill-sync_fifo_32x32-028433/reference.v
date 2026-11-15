module origen_028433 (
    input wire clk_i,
    input wire rst_n_i,
    input wire [31:0] data_i,
    input wire rd_i,
    input wire wr_i,
    output wire full_o,
    output wire empty_o,
    output wire overflow_o,
    output wire [31:0] data_o,
    output wire [5:0] freeslot_o
);

    localparam DEPTH_C = 32;
    localparam ADDR_WIDTH_C = 5;

    reg [31:0] mem [DEPTH_C-1:0];
    reg [ADDR_WIDTH_C-1:0] wr_p_r, rd_p_r;
    reg [5:0] freeslot_r;
    reg overflow_r;

    wire [ADDR_WIDTH_C-1:0] wr_p_next, rd_p_next;

    assign wr_p_next = wr_p_r + 1'b1;
    assign rd_p_next = rd_p_r + 1'b1;

    assign full_o = (freeslot_r == 6'd0);
    assign empty_o = (freeslot_r == DEPTH_C);
    assign overflow_o = overflow_r;
    assign freeslot_o = freeslot_r;
    assign data_o = mem[rd_p_r];

    always @(posedge clk_i or negedge rst_n_i) begin
        if (!rst_n_i) begin
            wr_p_r <= {ADDR_WIDTH_C{1'b0}};
            rd_p_r <= {ADDR_WIDTH_C{1'b0}};
            freeslot_r <= DEPTH_C;
            overflow_r <= 1'b0;
        end else begin
            if (wr_i && !full_o) begin
                mem[wr_p_r] <= data_i;
                wr_p_r <= wr_p_next;
                freeslot_r <= freeslot_r - 1'b1;
            end

            if (rd_i && !empty_o) begin
                rd_p_r <= rd_p_next;
                freeslot_r <= freeslot_r + 1'b1;
            end

            if (wr_i && full_o) begin
                overflow_r <= 1'b1;
            end else if (!full_o) begin
                overflow_r <= 1'b0;
            end
        end
    end

endmodule