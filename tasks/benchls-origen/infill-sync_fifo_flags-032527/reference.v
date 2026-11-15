module origen_032527 #(
    parameter stack_width = 64,
    parameter stack_height = 8,
    parameter stack_ptr_width = 3,
    parameter AE_level = 1,
    parameter AF_level = 6,
    parameter HF_level = 4
)(
    input wire clk,
    input wire rst,
    input wire [stack_width-1:0] Data_in,
    input wire write_to_WD_fifo,
    input wire read_from_WD_fifo,
    output reg [stack_width-1:0] Data_out,
    output wire Full,
    output wire Almost_Full,
    output wire Half_Full,
    output wire Almost_Empty,
    output wire Empty
);

reg [stack_ptr_width-1:0] read_ptr, write_ptr;
reg [stack_ptr_width:0] ptr_gap;
reg [stack_width-1:0] stack [0:stack_height-1];

always @(posedge clk or posedge rst) begin
    if (rst) begin
        read_ptr <= 0;
        write_ptr <= 0;
        ptr_gap <= 0;
        Data_out <= 0;
    end else begin
        if (write_to_WD_fifo && !Full) begin
            stack[write_ptr] <= Data_in;
            write_ptr <= write_ptr + 1;
            if (!read_from_WD_fifo || Empty)
                ptr_gap <= ptr_gap + 1;
        end

        if (read_from_WD_fifo && !Empty) begin
            Data_out <= stack[read_ptr];
            read_ptr <= read_ptr + 1;
            if (!write_to_WD_fifo || Full)
                ptr_gap <= ptr_gap - 1;
        end
    end
end

assign Full = (ptr_gap == stack_height);
assign Almost_Full = (ptr_gap >= AF_level);
assign Half_Full = (ptr_gap >= HF_level);
assign Almost_Empty = (ptr_gap <= AE_level);
assign Empty = (ptr_gap == 0);

endmodule