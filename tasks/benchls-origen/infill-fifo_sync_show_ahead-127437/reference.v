module origen_127437 #(
    parameter WIDTH = 8,
    parameter DEPTH = 16
) (
    input wire clk,
    input wire reset,
    input wire [WIDTH-1:0] data_in,
    input wire data_in_start,
    input wire data_in_end,
    output reg [WIDTH-1:0] data_out,
    output reg data_out_start,
    output reg data_out_end
);

    reg [WIDTH-1:0] memory [0:DEPTH-1];
    reg [$clog2(DEPTH):0] write_ptr, read_ptr;
    reg [$clog2(DEPTH):0] count;

    wire full = (count == DEPTH);
    wire empty = (count == 0);

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            write_ptr <= 0;
            read_ptr <= 0;
            count <= 0;
            data_out <= 0;
            data_out_start <= 0;
            data_out_end <= 0;
        end else begin
            // Write operation
            if (data_in_start && !full) begin
                memory[write_ptr] <= data_in;
                write_ptr <= (write_ptr == DEPTH-1) ? 0 : write_ptr + 1;
                count <= count + 1;
            end

            // Read operation
            if (!empty) begin
                data_out <= memory[read_ptr];
                data_out_start <= (count == DEPTH);
                data_out_end <= (count == 1);
                read_ptr <= (read_ptr == DEPTH-1) ? 0 : read_ptr + 1;
                count <= count - 1;
            end else begin
                data_out <= 0;
                data_out_start <= 0;
                data_out_end <= 0;
            end
        end
    end

endmodule