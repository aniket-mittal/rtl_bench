module permute (in,out);
input [31:0] in;
output [31:0] out;

wire [31:0] out;

assign out = {
    in[16],in[25],in[12],in[11],in[3],in[20],in[4],in[15],
    in[31],in[17],in[9],in[6],in[27],in[14],in[1],in[22],
    in[30],in[24],in[8],in[18],in[0],in[5],in[29],in[23],
    in[13],in[19],in[2],in[26],in[10],in[21],in[28],in[7]
};
endmodule