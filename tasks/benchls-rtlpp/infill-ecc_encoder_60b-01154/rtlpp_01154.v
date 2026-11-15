module rtlpp_01154 (din, dout);

input  [59:0] din;
output [67:0] dout;

reg [7:0] chk;

[MASKED]

assign dout = {chk, din};

endmodule