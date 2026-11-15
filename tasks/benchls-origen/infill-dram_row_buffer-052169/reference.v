module origen_052169 (
    input wire clk,
    input wire [3:0] row_no,
    input wire input_valid,
    output reg [31:0] out,
    output reg output_valid
);

    reg [31:0] r [0:15];
    reg [3:0] open_row;
    reg row_open;
    reg [1:0] cycle_count;

    integer i;
    initial begin
        for (i = 0; i < 16; i = i + 1) begin
            r[i] = i;
        end
        row_open = 0;
        output_valid = 0;
        cycle_count = 0;
    end

    always @(posedge clk) begin
        if (input_valid) begin
            if (!row_open) begin
                output_valid <= 0;
                cycle_count <= 2;
                row_open <= 1;
                open_row <= row_no;
            end else if (row_no == open_row) begin
                out <= r[row_no];
                output_valid <= 1;
            end else begin
                cycle_count <= 2;
                output_valid <= 0;
                open_row <= row_no;
            end
        end else begin
            output_valid <= 0;
        end

        if (cycle_count > 0) begin
            if (cycle_count == 1) begin
                out <= r[open_row];
                output_valid <= 1;
            end
            cycle_count <= cycle_count - 1;
        end
    end

endmodule