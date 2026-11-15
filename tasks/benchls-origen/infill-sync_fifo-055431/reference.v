module origen_055431 #(
    parameter width = 4,
    parameter height = 8,
    parameter ptr_width = 3
)(
    input wire clk,
    input wire rst,
    input wire [width-1:0] data_in,
    input wire write,
    input wire read,
    output reg [width-1:0] data_out,
    output wire full,
    output wire empty
);

    reg [width-1:0] memory [0:height-1];
    reg [ptr_width-1:0] read_ptr, write_ptr;
    reg [ptr_width:0] diff;
    reg empty_r, empty_r_r, full_r, full_r_r;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            read_ptr <= 0;
            write_ptr <= 0;
            diff <= 0;
            empty_r <= 1'b1;
            empty_r_r <= 1'b1;
            full_r <= 1'b0;
            full_r_r <= 1'b0;
        end else begin
            empty_r_r <= empty_r;
            full_r_r <= full_r;

            if (write && !full && (!read || empty)) begin
                memory[write_ptr] <= data_in;
                write_ptr <= (write_ptr + 1) % height;
                diff <= diff + 1;
            end

            if (read && !empty && (!write || full)) begin
                data_out <= memory[read_ptr];
                read_ptr <= (read_ptr + 1) % height;
                diff <= diff - 1;
            end

            empty_r <= (diff == 0);
            full_r <= (diff == height - 1);
        end
    end

    assign empty = empty_r && empty_r_r;
    assign full = full_r && full_r_r;

endmodule