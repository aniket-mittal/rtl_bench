module rtlpp_06902 (
    input clk,
    input rst,
    input read_req,
    input [90:0] write_data,
    input write_enable,
    input rollover_write,
    output reg [90:0] read_data,
    output fifo_empty,
    output reg rdata_valid
);
    reg [4:0] read_ptr;
    reg [4:0] write_ptr;
    reg [90:0] mem [0:15];
    wire [3:0] write_addr = write_ptr[3:0];
    wire [3:0] read_addr = read_ptr[3:0];
    wire read_enable = read_req && (~fifo_empty);
    
    assign fifo_empty = (read_ptr == write_ptr);

    always @(posedge clk) begin
        if (rst)
            write_ptr <= 5'b00000;
        else if (write_enable & !rollover_write)
            write_ptr <= write_ptr + 5'b00001;
        else if (write_enable & rollover_write)
            write_ptr <= write_ptr + 5'b00010;
    end

    always @(posedge clk) begin
        if (rst)
            rdata_valid <= 1'b0;
        else if (read_enable)
            rdata_valid <= 1'b1;
        else
            rdata_valid <= 1'b0;
    end

    always @(posedge clk) begin
        if (rst)
            read_ptr <= 5'b00000;
        else if (read_enable)
            read_ptr <= read_ptr + 5'b00001;
    end

    always @(posedge clk) begin
        if (write_enable)
            mem[write_addr] <= write_data;
    end

    always @(posedge clk) begin
        if (read_enable)
            read_data <= mem[read_addr];
    end

endmodule