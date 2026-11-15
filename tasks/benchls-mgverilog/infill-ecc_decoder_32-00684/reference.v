module mg_00684 (input [31:0] i_data,input [7:0] i_syndrome,output [31:0] o_data,output o_error_detected,output o_uncorrected_error);
wire [7:0] decoder_matrix[0:39]; 
 wire [39:0] error_vector; 
 generate 
  assign decoder_matrix[39] = 8'b10101000; 
  assign decoder_matrix[38] = 8'b01101000; 
  assign decoder_matrix[37] = 8'b10100100; 
  assign decoder_matrix[36] = 8'b01100100; 
  assign decoder_matrix[35] = 8'b10100010; 
  assign decoder_matrix[34] = 8'b01100010; 
  assign decoder_matrix[33] = 8'b10100001; 
  assign decoder_matrix[32] = 8'b01100001; 
  assign decoder_matrix[31] = 8'b10011000; 
  assign decoder_matrix[30] = 8'b01011000; 
  assign decoder_matrix[29] = 8'b10010100; 
  assign decoder_matrix[28] = 8'b01010100; 
  assign decoder_matrix[27] = 8'b10010010; 
  assign decoder_matrix[26] = 8'b01010010; 
  assign decoder_matrix[25] = 8'b10010001; 
  assign decoder_matrix[24] = 8'b01010001; 
  assign decoder_matrix[23] = 8'b10001010; 
  assign decoder_matrix[22] = 8'b10001001; 
  assign decoder_matrix[21] = 8'b01001010; 
  assign decoder_matrix[20] = 8'b01001001; 
  assign decoder_matrix[19] = 8'b00101010; 
  assign decoder_matrix[18] = 8'b00101001; 
  assign decoder_matrix[17] = 8'b00011010; 
  assign decoder_matrix[16] = 8'b00011001; 
  assign decoder_matrix[15] = 8'b10000110; 
  assign decoder_matrix[14] = 8'b10000101; 
  assign decoder_matrix[13] = 8'b01000110; 
  assign decoder_matrix[12] = 8'b01000101; 
  assign decoder_matrix[11] = 8'b00100110; 
  assign decoder_matrix[10] = 8'b00100101; 
  assign decoder_matrix[9] = 8'b00010110; 
  assign decoder_matrix[8] = 8'b00010101; 
  assign decoder_matrix[7] = 8'b10000000; 
  assign decoder_matrix[6] = 8'b01000000; 
  assign decoder_matrix[5] = 8'b00100000; 
  assign decoder_matrix[4] = 8'b00010000; 
  assign decoder_matrix[3] = 8'b00001000; 
  assign decoder_matrix[2] = 8'b00000100; 
  assign decoder_matrix[1] = 8'b00000010; 
  assign decoder_matrix[0] = 8'b00000001; 
 endgenerate 
 genvar c; 
 generate 
  for (c=0; c<40; c=c+1) begin 
  assign error_vector[c] = decoder_matrix[c] == i_syndrome; 
  end 
 endgenerate 
 assign o_error_detected = | i_syndrome; 
 assign o_uncorrected_error = o_error_detected & (~| error_vector); 
 assign o_data = error_vector[39:8] ^ i_data; 
 endmodule