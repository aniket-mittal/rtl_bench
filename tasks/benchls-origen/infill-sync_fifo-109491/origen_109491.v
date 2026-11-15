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

    [MASKED]

    always @(*) begin
        head = fifo_data[read_ptr];
    end

endmodule