module origen_121558 #(
    parameter KER_SIZE = 3,
    parameter BITWIDTH = 8,
    parameter STRIDE = 1,
    parameter NFMAPS = 3,
    parameter INPUT_X_DIM = 28,
    parameter PAD = 1,
    parameter AW = 5
)(
    input wire clk,
    input wire rstn,
    input wire valid,
    output reg [AW-1:0] addr,
    output reg [KER_SIZE-1:0] write_en,
    output reg [KER_SIZE-1:0] read_en,
    output reg ready,
    output reg [KER_SIZE-1:0] top_pad_mask,
    output reg bottom_pad_mask,
    output reg row_is_complete
);

    localparam PADDED_DIM = INPUT_X_DIM + 2*PAD;

    reg [3:0] row_ptr;
    reg [5:0] global_row_ptr;
    reg [5:0] col_ptr;
    reg [3:0] init_row_counter;
    reg [3:0] row_stride_counter;

    always @(posedge clk or negedge rstn) begin
        if (!rstn) begin
            addr <= 0;
            write_en <= 0;
            read_en <= 0;
            ready <= 1;
            top_pad_mask <= {KER_SIZE{1'b1}};
            bottom_pad_mask <= 0;
            row_is_complete <= 0;
            row_ptr <= 0;
            global_row_ptr <= 0;
            col_ptr <= 0;
            init_row_counter <= 0;
            row_stride_counter <= 0;
        end else if (valid) begin
            if (ready) begin
                if (col_ptr < PADDED_DIM) begin
                    addr <= (global_row_ptr + row_ptr) * PADDED_DIM + col_ptr;
                    write_en[row_ptr] <= 1;
                    
                    if (init_row_counter < KER_SIZE - 1) begin
                        init_row_counter <= init_row_counter + 1;
                    end else begin
                        read_en <= {KER_SIZE{1'b1}};
                    end

                    if (row_ptr == KER_SIZE - 1) begin
                        row_ptr <= 0;
                        if (row_stride_counter == STRIDE - 1) begin
                            global_row_ptr <= global_row_ptr + 1;
                            row_stride_counter <= 0;
                        end else begin
                            row_stride_counter <= row_stride_counter + 1;
                        end
                    end else begin
                        row_ptr <= row_ptr + 1;
                    end

                    col_ptr <= col_ptr + 1;
                    ready <= 0;
                end else begin
                    col_ptr <= 0;
                    row_is_complete <= 1;
                    ready <= 1;
                end
            end else begin
                write_en <= 0;
                ready <= 1;
                row_is_complete <= 0;
            end

            // Update padding masks
            if (global_row_ptr < PAD) begin
                top_pad_mask <= {KER_SIZE{1'b1}} >> global_row_ptr;
            end else begin
                top_pad_mask <= 0;
            end

            if (global_row_ptr >= INPUT_X_DIM) begin
                bottom_pad_mask <= 1;
            end else begin
                bottom_pad_mask <= 0;
            end
        end
    end

endmodule