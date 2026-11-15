module autovcoder_025557 (
    input [255:0] diff_i,

    output [255:0] bpx_o
);

  genvar i, j, row_tr, col_tr, row_xor, col_xor;

  wire [0:7] diff[0:31];
  wire [0:31] bitplane[0:7];
  wire [0:31] bitplaneXOR[0:7];

  // renaming input in byte size
  generate
    for (i = 0; i < 32; i = i + 1) begin : input_rename
      assign diff[i] = diff_i[(32-i)*8-1 : (31-i)*8];
    end
  endgenerate

  // bitplane transpose
  generate
    for (row_tr = 0; row_tr < 32; row_tr = row_tr + 1) begin : transpose_row
      for (col_tr = 0; col_tr < 8; col_tr = col_tr + 1) begin : transpose_col
        assign bitplane[col_tr][row_tr] = diff[row_tr][col_tr];
      end
    end
  endgenerate

  // xor operation
  //// consecutive-xor base (first row)
  assign bitplaneXOR[0] = bitplane[0];
  //// root (first col)
  generate
    for (j = 1; j < 8; j = j + 1) begin : move_root
      assign bitplaneXOR[j][0] = bitplane[j][0];
    end
  endgenerate

  generate
    for (row_xor = 1; row_xor < 8; row_xor = row_xor + 1) begin : xor_row
      for (col_xor = 1; col_xor < 32; col_xor = col_xor + 1) begin : xor_col
        assign bitplaneXOR[row_xor][col_xor] = bitplane[row_xor][col_xor] ^ bitplane[row_xor - 1][col_xor];
      end
    end
  endgenerate

  // assign output
  assign bpx_o = {
    bitplaneXOR[0],
    bitplaneXOR[1],
    bitplaneXOR[2],
    bitplaneXOR[3],
    bitplaneXOR[4],
    bitplaneXOR[5],
    bitplaneXOR[6],
    bitplaneXOR[7]
  };

endmodule

