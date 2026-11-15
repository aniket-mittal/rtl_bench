module rtlpp_02730(branch, br_ins, inc_ins, ins_out);
    input branch;
    input [8:0] br_ins;
    input [8:0] inc_ins;
    output [8:0] ins_out;
   
    wire [8:0] temp;
   
    assign temp[8] = (branch & br_ins[8]) | (~branch & inc_ins[8]);
    assign temp[7] = (branch & br_ins[7]) | (~branch & inc_ins[7]);
    assign temp[6] = (branch & br_ins[6]) | (~branch & inc_ins[6]);
    assign temp[5] = (branch & br_ins[5]) | (~branch & inc_ins[5]);
    assign temp[4] = (branch & br_ins[4]) | (~branch & inc_ins[4]);
    assign temp[3] = (branch & br_ins[3]) | (~branch & inc_ins[3]);
    assign temp[2] = (branch & br_ins[2]) | (~branch & inc_ins[2]);
    assign temp[1] = (branch & br_ins[1]) | (~branch & inc_ins[1]);
    assign temp[0] = (branch & br_ins[0]) | (~branch & inc_ins[0]);

    assign ins_out = temp;

endmodule