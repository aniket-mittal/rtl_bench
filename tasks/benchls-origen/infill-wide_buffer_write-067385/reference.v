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
    always @(posedge clk or negedge resetn) begin
        if (!resetn) begin
            for (k = 0; k < buf_length; k = k + 1) begin
                buffer[k] <= {DATA_WIDTH{1'b0}};
            end
            buf_ptr <= {buf_length_bits{1'b0}};
        end else if (valid) begin
            if (wptr_valid) begin
                for (k = 0; k < DATA_SELECT; k = k + 1) begin
                    if (wtrb[k]) begin
                        buffer[wptr][k*(DATA_WIDTH/DATA_SELECT) +: DATA_WIDTH/DATA_SELECT] <= 
                            data[k*(DATA_WIDTH/DATA_SELECT) +: DATA_WIDTH/DATA_SELECT];
                    end
                end
            end else begin
                for (k = 0; k < DATA_SELECT; k = k + 1) begin
                    if (wtrb[k]) begin
                        buffer[buf_ptr][k*(DATA_WIDTH/DATA_SELECT) +: DATA_WIDTH/DATA_SELECT] <= 
                            data[k*(DATA_WIDTH/DATA_SELECT) +: DATA_WIDTH/DATA_SELECT];
                    end
                end
                buf_ptr <= (buf_ptr == buf_length - 1) ? {buf_length_bits{1'b0}} : buf_ptr + 1'b1;
            end
        end
    end

endmodule