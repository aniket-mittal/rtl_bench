module origen_109491 #(
    parameter ENTRIES = 4,
    parameter ENTRIES_LOG2 = $clog2(ENTRIES)
)(
    input wire clk,
    input wire rst,
    input wire in_read_ctrl,
    input wire in_write_ctrl,
    input wire [7:0] in_write_data,
    output reg [7:0] out_read_data,
    output reg out_is_full,
    output reg out_is_empty
);

    reg [ENTRIES_LOG2-1:0] write_ptr, read_ptr;
    reg [7:0] fifo_data [ENTRIES-1:0];
    reg [7:0] head;
    reg [ENTRIES_LOG2:0] number_of_current_entries;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            write_ptr <= 0;
            read_ptr <= 0;
            number_of_current_entries <= 0;
            out_is_full <= 0;
            out_is_empty <= 1;
            out_read_data <= 8'b0;
        end else begin
            if (in_write_ctrl && !out_is_full) begin
                fifo_data[write_ptr] <= in_write_data;
                write_ptr <= write_ptr + 1;
                if (number_of_current_entries == ENTRIES - 1)
                    out_is_full <= 1;
                out_is_empty <= 0;
                number_of_current_entries <= number_of_current_entries + 1;
            end

            if (in_read_ctrl && !out_is_empty) begin
                out_read_data <= head;
                read_ptr <= read_ptr + 1;
                if (number_of_current_entries == 1)
                    out_is_empty <= 1;
                out_is_full <= 0;
                number_of_current_entries <= number_of_current_entries - 1;
            end
        end
    end

    always @(*) begin
        head = fifo_data[read_ptr];
    end

endmodule