module mg_01806(input [11:0] cadr_i,output cvalid_o,output [63:0] cdat_o,input [63:0] cdat_i,input coe_i,input cwe_i,input clk_i);
wire csrv_output = (cadr_i == 12'h0FF); 
  assign cvalid_o = csrv_output; 
  wire [63:0] csrd_output = {64'h0000_0000_0000_0004}; 
  assign cdat_o = (csrv_output ? csrd_output : 0); 
  wire write = csrv_output & cwe_i; 
  wire startBit_mux = write ? cdat_i[11] : 1'b0; 
  wire [7:0] charByte_mux = write ? cdat_i[10:3] : 8'b0000_0000; 
  wire stopBit_mux = write ? cdat_i[2] : 1'b0; 
  wire exitBit_mux = write ? cdat_i[1] : 1'b0; 
  wire failBit_mux = write ? cdat_i[0] : 1'b0; 
  [MASKED] 
 endmodule