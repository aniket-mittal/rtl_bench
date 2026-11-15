module origen_169723 #(
    parameter BITS_DEPTH = 4,
    parameter BITS_WIDTH = 8
) (
    input i_clk,
    input i_rst,
    input [BITS_WIDTH-1:0] din,
    input wr_en,
    output reg [BITS_WIDTH-1:0] dout,
    input rd_en,
    output full,
    output empty,
    output half_full
);

    reg [BITS_DEPTH-1:0] read_ptr, write_ptr;
    reg [BITS_DEPTH:0] counter;
    reg [BITS_WIDTH-1:0] mem [0:(1<<BITS_DEPTH)-1];

    always @(posedge i_clk or posedge i_rst) begin
        if (i_rst) begin
            read_ptr <= 0;
            write_ptr <= 0;
            counter <= 0;
        end
        else begin
            if (wr_en && rd_en && counter == 0) begin
                mem[write_ptr] <= din;
                read_ptr <= read_ptr + 1'b1;
                write_ptr <= write_ptr + 1'b1;
                counter <= counter + 1'b1;
            end
            else begin
                if (wr_en) begin
                    mem[write_ptr] <= din;
                    write_ptr <= write_ptr + 1'b1;
                    counter <= counter + 1'b1;
                end
                if (rd_en) begin
                    dout <= mem[read_ptr];
                    read_ptr <= read_ptr + 1'b1;
                    counter <= counter - 1'b1;
                end
            end
        end
    end

    assign full = (read_ptr[BITS_DEPTH-1] != write_ptr[BITS_DEPTH-1]) && (read_ptr[BITS_DEPTH-2:0] == write_ptr[BITS_DEPTH-2:0]);
    assign empty = (counter == 0);
    assign half_full = counter[BITS_DEPTH];

endmodule