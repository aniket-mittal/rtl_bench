module prio_sel(
  //input
  data_in,
  sel_in,
  //out
  data_out,
  pos_out
);
parameter DATA    = 4;
parameter SEL     = 32;
parameter SEL_BIT = 5;

input   [DATA*SEL-1:0]  data_in;
input   [SEL-1:0]       sel_in;

output  [DATA-1:0]      data_out;
output  [SEL_BIT-1:0]   pos_out;

//wire definition

wire    [SEL-1:0]             tmp_sel; 
wire    [SEL:0]               tmp_sel2; 
wire    [SEL-1:0]             onehot_sel;
wire    [(SEL+1)*DATA-1:0]    tmp_out;
wire    [(SEL+1)*SEL_BIT-1:0] tmp_pos_out;
wire    [SEL:0]               sel_in_exp;

//**************************************
//  make the select to all ones
//  01100   -> 01111
//**************************************
assign sel_in_exp[SEL:0]  = {1'b0,sel_in[SEL-1:0]};
genvar k;
generate 
  for(k=0;k<SEL;k=k+1)
  begin:ALL_ONE_SEL
  assign tmp_sel[k] = |sel_in_exp[SEL:k];
  end
endgenerate
//**************************************
//  make the select to  one hot
//  01111   -> 01000
//**************************************

assign tmp_sel2[SEL:0] = {1'b0,tmp_sel[SEL-1:0]};
genvar m;
generate 
  for(m=0;m<SEL;m=m+1)
  begin:ONE_HOT_SEL
  assign onehot_sel[m] = tmp_sel[m] && !tmp_sel2[m+1];
  end
endgenerate
assign tmp_out[DATA-1:0] = {DATA{1'b0}};
assign tmp_pos_out[SEL_BIT-1:0] = {SEL_BIT{1'b0}};
genvar n;
generate 
  for(n=0;n<SEL;n=n+1)
  begin:OUT_SEL
  assign tmp_out[(n+1)*DATA+:DATA] = ({DATA{onehot_sel[n]}} & data_in[n*DATA+:DATA])
                                    | tmp_out[n*DATA+:DATA];
  assign tmp_pos_out[(n+1)*SEL_BIT+:SEL_BIT] = ({SEL_BIT{onehot_sel[n]}} & n)
                                                | tmp_pos_out[n*SEL_BIT+:SEL_BIT];  
  end
endgenerate

assign data_out[DATA-1:0]   = tmp_out[(SEL+1)*DATA-1:SEL*DATA];
assign pos_out[SEL_BIT-1:0] = tmp_pos_out[(SEL+1)*SEL_BIT-1:SEL*SEL_BIT];
endmodule