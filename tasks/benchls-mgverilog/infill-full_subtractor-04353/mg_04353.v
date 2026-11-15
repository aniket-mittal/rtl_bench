module mg_04353 (input Xin,input Yin,input BorrowIn,output Diff,output BorrowOut);
assign Diff = Xin ^ Yin ^ BorrowIn; 
  [MASKED] 
 endmodule