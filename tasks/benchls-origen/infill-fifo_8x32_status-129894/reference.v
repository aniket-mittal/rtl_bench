module origen_129894 (
    input wire clk,
    input wire rst,
    input wire [31:0] Data_in,
    input wire write_to_stack,
    input wire read_from_stack,
    output reg [31:0] Data_out,
    output wire stack_full,
    output wire stack_almost_full,
    output wire stack_half_full,
    output wire stack_almost_empty,
    output wire stack_empty
);

    // Buffer and pointers
    reg [31:0] buffer [0:7];
    reg [2:0] read_ptr, write_ptr;
    reg [3:0] fill_level;

    // Status signals
    assign stack_full = (fill_level == 4'd8);
    assign stack_almost_full = (fill_level >= 4'd6);
    assign stack_half_full = (fill_level >= 4'd4);
    assign stack_almost_empty = (fill_level <= 4'd2);
    assign stack_empty = (fill_level == 4'd0);

    // FIFO operations
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            read_ptr <= 3'd0;
            write_ptr <= 3'd0;
            fill_level <= 4'd0;
            Data_out <= 32'd0;
        end else begin
            if (write_to_stack && !stack_full) begin
                buffer[write_ptr] <= Data_in;
                write_ptr <= write_ptr + 1;
                fill_level <= fill_level + 1;
            end

            if (read_from_stack && !stack_empty) begin
                Data_out <= buffer[read_ptr];
                read_ptr <= read_ptr + 1;
                fill_level <= fill_level - 1;
            end

            if (write_to_stack && read_from_stack && !stack_empty && !stack_full) begin
                buffer[write_ptr] <= Data_in;
                Data_out <= buffer[read_ptr];
                read_ptr <= read_ptr + 1;
                write_ptr <= write_ptr + 1;
            end
        end
    end

endmodule