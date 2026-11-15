module origen_056280 #(
    parameter WIDTH = 8
) (
    input wire [WIDTH-1:0] DATA_IN,
    output reg [WIDTH-1:0] DATA_OUT,
    input wire ICLK,
    input wire OCLK,
    input wire RST_ICLK,
    input wire RST_OCLK
);

    reg [WIDTH-1:0] fifo_mem [3:0];
    reg [1:0] simple_fifo_ptr;
    reg [1:0] simple_fifo_ptr_CLK;
    reg [2:0] read_flag_CLK;
    reg begin_read;

    // Input clock domain
    always @(posedge ICLK) begin
        fifo_mem[simple_fifo_ptr] <= DATA_IN;
        case (simple_fifo_ptr)
            2'b00: simple_fifo_ptr <= 2'b01;
            2'b01: simple_fifo_ptr <= 2'b11;
            2'b11: simple_fifo_ptr <= 2'b10;
            2'b10: simple_fifo_ptr <= 2'b00;
        endcase
    end

    // Output clock domain
    always @(posedge OCLK or posedge RST_OCLK) begin
        if (RST_OCLK) begin
            simple_fifo_ptr_CLK <= 2'b00;
            read_flag_CLK <= 3'b000;
            begin_read <= 1'b0;
            DATA_OUT <= {WIDTH{1'b0}};
        end else begin
            read_flag_CLK <= {read_flag_CLK[1:0], simple_fifo_ptr[1]};
            
            if (read_flag_CLK[2:1] == 2'b01) begin
                begin_read <= 1'b1;
            end
            
            if (begin_read) begin
                DATA_OUT <= fifo_mem[simple_fifo_ptr_CLK];
                case (simple_fifo_ptr_CLK)
                    2'b00: simple_fifo_ptr_CLK <= 2'b01;
                    2'b01: simple_fifo_ptr_CLK <= 2'b11;
                    2'b11: simple_fifo_ptr_CLK <= 2'b10;
                    2'b10: simple_fifo_ptr_CLK <= 2'b00;
                endcase
            end
        end
    end

endmodule