module mg_02461 (byte_access,hw,word,write_address,write_byteenable);
output [ 3: 0] write_byteenable; 
  input byte_access; 
  input hw; 
  input word; 
  input [ 10: 0] write_address; 
  wire wa_1_is_0; 
  wire wa_1_is_1; 
  wire wa_1_to_0_is_0; 
  wire wa_1_to_0_is_1; 
  wire wa_1_to_0_is_2; 
  wire wa_1_to_0_is_3; 
  wire [ 3: 0] write_byteenable; 
  assign wa_1_to_0_is_3 = write_address[1 : 0] == 2'h3; 
  assign wa_1_to_0_is_2 = write_address[1 : 0] == 2'h2; 
  assign wa_1_to_0_is_1 = write_address[1 : 0] == 2'h1; 
  assign wa_1_to_0_is_0 = write_address[1 : 0] == 2'h0; 
  assign wa_1_is_1 = write_address[1] == 1'h1; 
  assign wa_1_is_0 = write_address[1] == 1'h0; 
  [MASKED] 
 endmodule