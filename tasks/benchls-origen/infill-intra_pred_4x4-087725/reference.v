module origen_087725 #(
    parameter BIT_WIDTH = 8,
    parameter BLOCK_SIZE = 4
)(
    input [BIT_WIDTH-1:0] top_left,
    input [BIT_WIDTH*BLOCK_SIZE-1:0] top,
    input [BIT_WIDTH*(BLOCK_SIZE-1)-1:0] left,
    output [BIT_WIDTH*BLOCK_SIZE*BLOCK_SIZE-1:0] dst
);

    wire [BIT_WIDTH-1:0] top_pixels [0:BLOCK_SIZE-1];
    wire [BIT_WIDTH-1:0] left_pixels [0:BLOCK_SIZE-2];
    reg [BIT_WIDTH-1:0] vals [0:9];
    reg [BIT_WIDTH-1:0] dst_block [0:BLOCK_SIZE-1][0:BLOCK_SIZE-1];

    genvar i;
    generate
        for (i = 0; i < BLOCK_SIZE; i = i + 1) begin : gen_top
            assign top_pixels[i] = top[BIT_WIDTH*(i+1)-1 : BIT_WIDTH*i];
        end
        for (i = 0; i < BLOCK_SIZE-1; i = i + 1) begin : gen_left
            assign left_pixels[i] = left[BIT_WIDTH*(i+1)-1 : BIT_WIDTH*i];
        end
    endgenerate

    always @(*) begin
        // Calculate intermediate values
        vals[0] = (top_pixels[0] + top_pixels[1] + 1) >> 1;
        vals[1] = (top_pixels[1] + top_pixels[2] + 1) >> 1;
        vals[2] = (top_pixels[2] + top_pixels[3] + 1) >> 1;
        vals[3] = (top_pixels[3] + top_pixels[3] + 1) >> 1;
        vals[4] = (left_pixels[2] + 2*left_pixels[1] + left_pixels[0] + 2) >> 2;
        vals[5] = (left_pixels[1] + 2*left_pixels[0] + top_left + 2) >> 2;
        vals[6] = (left_pixels[0] + 2*top_left + top_pixels[0] + 2) >> 2;
        vals[7] = (top_left + 2*top_pixels[0] + top_pixels[1] + 2) >> 2;
        vals[8] = (top_pixels[0] + 2*top_pixels[1] + top_pixels[2] + 2) >> 2;
        vals[9] = (top_pixels[1] + 2*top_pixels[2] + top_pixels[3] + 2) >> 2;

        // Assign values to output block
        dst_block[0][0] = vals[0]; dst_block[0][1] = vals[1]; dst_block[0][2] = vals[2]; dst_block[0][3] = vals[3];
        dst_block[1][0] = vals[6]; dst_block[1][1] = vals[7]; dst_block[1][2] = vals[8]; dst_block[1][3] = vals[9];
        dst_block[2][0] = vals[5]; dst_block[2][1] = vals[0]; dst_block[2][2] = vals[1]; dst_block[2][3] = vals[2];
        dst_block[3][0] = vals[4]; dst_block[3][1] = vals[6]; dst_block[3][2] = vals[7]; dst_block[3][3] = vals[8];
    end

    genvar j, k;
    generate
        for (j = 0; j < BLOCK_SIZE; j = j + 1) begin : gen_row
            for (k = 0; k < BLOCK_SIZE; k = k + 1) begin : gen_col
                assign dst[BIT_WIDTH*(j*BLOCK_SIZE+k+1)-1 : BIT_WIDTH*(j*BLOCK_SIZE+k)] = dst_block[j][k];
            end
        end
    endgenerate

endmodule