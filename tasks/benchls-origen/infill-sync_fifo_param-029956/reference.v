module origen_029956 #(
    parameter WIDTH = 8,
    parameter DEPTH = 16
) (
    input wire CLK,
    input wire RSTN,
    input wire RD_ENB,
    input wire WR_ENB,
    input wire [WIDTH-1:0] DATA_IN,
    output reg [WIDTH-1:0] DATA_OUT,
    output wire EMPTY,
    output wire FULL
);

    function integer logb2;
        input integer depth;
        integer i;
        begin
            for (i = 0; depth > 0; i = i + 1)
                depth = depth >> 1;
            logb2 = i - 1;
        end
    endfunction

    localparam ADDR_WIDTH = logb2(DEPTH);

    reg [ADDR_WIDTH-1:0] rd_counter;
    reg [ADDR_WIDTH-1:0] wr_counter;
    reg [ADDR_WIDTH:0] ele_count;
    reg [WIDTH-1:0] memory [0:DEPTH-1];

    assign EMPTY = (ele_count == 0);
    assign FULL = (ele_count == DEPTH);

    always @(posedge CLK or negedge RSTN) begin
        if (!RSTN) begin
            rd_counter <= 0;
            wr_counter <= 0;
            ele_count <= 0;
            DATA_OUT <= 0;
        end else begin
            if (WR_ENB && !FULL) begin
                memory[wr_counter] <= DATA_IN;
                wr_counter <= wr_counter + 1;
                ele_count <= ele_count + 1;
            end

            if (RD_ENB && !EMPTY) begin
                DATA_OUT <= memory[rd_counter];
                rd_counter <= rd_counter + 1;
                ele_count <= ele_count - 1;
            end
        end
    end

endmodule