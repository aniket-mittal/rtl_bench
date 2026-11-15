module origen_034222(
    input wire clk,
    input wire w_enable,
    input wire reset,
    input wire rx_ready,
    input wire [5:0] row,
    input wire [5:0] col,
    input wire [7:0] pixel_in,
    output reg flag,
    output reg [7:0] pixel_out,
    output reg [5:0] out_row,
    output reg [5:0] out_col,
    output reg [23:0] three_rows
);

    reg [7:0] memory [0:4095];
    reg [7:0] row_buffer [0:2];
    reg [5:0] prev_row;

    always @(posedge clk) begin
        if (reset) begin
            flag <= 0;
            prev_row <= 6'b111111;
        end else begin
            if (w_enable && rx_ready) begin
                memory[{row, col}] <= pixel_in;
                pixel_out <= pixel_in;
                out_row <= row;
                out_col <= col;

                // Update row buffer
                row_buffer[2] <= row_buffer[1];
                row_buffer[1] <= row_buffer[0];
                row_buffer[0] <= pixel_in;

                // Update three_rows output
                three_rows <= {row_buffer[2], row_buffer[1], pixel_in};

                // Flag control logic
                if (row == 0 && prev_row != 0) begin
                    flag <= 0;
                end else if (row == 2) begin
                    flag <= 1;
                end else if (row == 63) begin
                    flag <= 0;
                end

                prev_row <= row;
            end else begin
                pixel_out <= memory[{row, col}];
                out_row <= row;
                out_col <= col;
            end
        end
    end

endmodule