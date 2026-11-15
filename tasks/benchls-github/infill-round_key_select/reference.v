module round_key_select (in,out);
input [55:0] in;
output [47:0] out;

wire [47:0] out;

assign out = {
    in[42],in[39],in[45],in[32],in[55],in[51],in[53],in[28],
    in[41],in[50],in[35],in[46],in[33],in[37],in[44],in[52],
    in[30],in[48],in[40],in[49],in[29],in[36],in[43],in[54],
    in[15],in[4],in[25],in[19],in[9],in[1],in[26],in[16],
    in[5],in[11],in[23],in[8],in[12],in[7],in[17],in[0],
    in[22],in[3],in[10],in[14],in[6],in[20],in[27],in[24]
};
endmodule