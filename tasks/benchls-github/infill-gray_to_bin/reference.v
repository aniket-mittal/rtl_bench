module gray_to_bin (gray,bin);

parameter WIDTH = 8;

input [WIDTH-1:0] gray;
output [WIDTH-1:0] bin;
wire [WIDTH-1:0] bin;

assign bin[WIDTH-1] = gray[WIDTH-1];
genvar i;
generate
for (i=WIDTH-2; i>=0; i=i-1)
  begin: gry_to_bin
    assign bin[i] = bin[i+1] ^ gray[i];
  end
endgenerate

endmodule