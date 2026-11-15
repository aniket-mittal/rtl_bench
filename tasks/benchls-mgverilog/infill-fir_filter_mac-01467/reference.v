module mg_01467 (CLK ,ARST ,filterCoef ,InData ,input_Valid ,initialize ,OutData ,output_Valid);
parameter IWIDTH = 16; 
  parameter OWIDTH = 32; 
  parameter AWIDTH = 32; 
  parameter NTAPS = 15; 
  parameter NTAPSr = 15; 
  parameter CNTWIDTH = 4 ; 
  parameter NMULT = 1 ; 
  input CLK ; 
  input ARST ; 
  input input_Valid ; 
  input initialize ; 
  input signed [(IWIDTH-1):0] InData, filterCoef ; 
  output signed [(OWIDTH-1):0] OutData ; 
  output output_Valid ; 
  reg signed [(AWIDTH-1):0] mult, accum ; 
  reg input_Valid0 ; 
  reg initialize1 ; 
  reg output_Valid_1 ; 
  wire output_Valid ; 
  reg [CNTWIDTH-1:0] count ; 
  wire signed [(AWIDTH-1):0] accum_tmp ; 
  wire [CNTWIDTH-1:0] taps ; 
  assign taps = (NTAPS == NTAPSr) ? 0: (NTAPS - NTAPS + NTAPSr) ; 
  always @(posedge CLK or posedge ARST) 
  if (ARST) input_Valid0 <= 1'b0 ; 
  else input_Valid0 <= input_Valid ; 
  always @(posedge CLK or posedge ARST) 
  if (ARST) initialize1 <= 1'b0 ; 
  else initialize1 <= initialize ; 
  always @(posedge CLK or posedge ARST) 
  if (ARST) mult[(AWIDTH-1):0] <= {(AWIDTH-1){1'b0}} ; 
  else mult[(AWIDTH-1):0] <= filterCoef*InData ; 
  assign accum_tmp[(AWIDTH-1):0] = mult[(AWIDTH-1):0] + accum[(AWIDTH-1):0]; 
  always @(posedge CLK or posedge ARST) 
  if (ARST) accum[(OWIDTH-1):0] <= {(OWIDTH){1'b0}} ; 
  else accum[(OWIDTH-1):0] <= (initialize1) ? 
  mult[(AWIDTH-1):0] : 
 (input_Valid0 ? accum_tmp[(AWIDTH-1):0]: accum[(AWIDTH-1):0]) ; 
  always @ (posedge CLK or posedge ARST) 
  if (ARST) count[CNTWIDTH-1:0] <= {(CNTWIDTH){1'b0}} ; 
  else count[CNTWIDTH-1:0] <= initialize ? 
  0 : 
  input_Valid0 + count[CNTWIDTH-1:0] ; 
  always @(posedge CLK or posedge ARST) 
  if (ARST) output_Valid_1 <= 1'b0 ; 
  else output_Valid_1 <= (count[CNTWIDTH-1:0]==(NTAPSr-1+NMULT-1)) ; 
  assign output_Valid = output_Valid_1 & (count[CNTWIDTH-1:0]==taps) ; 
  assign OutData[(OWIDTH-1):0] = accum[(OWIDTH-1):0] ; 
 endmodule