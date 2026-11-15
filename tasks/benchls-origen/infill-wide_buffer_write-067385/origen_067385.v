module origen_067385 #(
    parameter buf_length = 16,
    parameter DATA_WIDTH = 32,
    parameter DATA_SELECT = 4
) (
    input wire clk,
    input wire resetn,
    input wire [DATA_WIDTH-1:0] data,
    input wire [$clog2(buf_length)-1:0] wptr,
    input wire wptr_valid,
    input wire [DATA_SELECT-1:0] wtrb,
    input wire valid,
    output wire [DATA_WIDTH*buf_length-1:0] data_pack
);

    localparam buf_length_bits = $clog2(buf_length);
    
    reg [DATA_WIDTH-1:0] buffer [0:buf_length-1];
    reg [buf_length_bits-1:0] buf_ptr;

    genvar i;
    generate
        for (i = 0; i < buf_length; i = i + 1) begin : data_pack_gen
            assign data_pack[DATA_WIDTH*i +: DATA_WIDTH] = buffer[i];
        end
    endgenerate

    integer k;
    [MASKED]

endmodule