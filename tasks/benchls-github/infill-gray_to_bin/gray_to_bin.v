module gray_to_bin (gray,bin);

parameter WIDTH = 8;

input [WIDTH-1:0] gray;
output [WIDTH-1:0] bin;
wire [WIDTH-1:0] bin;

[MASKED]
genvar i;
generate
for (i=WIDTH-2; i>=0; i=i-1)
  begin: gry_to_bin
    assign bin[i] = bin[i+1] ^ gray[i];
  end
endgenerate

endmodule