module dec3to8(q, e, f);
input [2:0] q;
input e;
output [7:0] f;
reg [7:0] f;
integer k;
always @(q or e) // Added "e" to sensitivity list
begin
  f = 8'b00000000; // Initialize f to 0
  if (e == 1)
    for (k = 0; k < 8; k = k + 1)
      if (q == k)
        f[k] = 1;
end
endmodule