module mg_07633(oe, en,en_);
output oe; 
 input en, en_; 
  assign oe = (en && (~en_)); 
 endmodule