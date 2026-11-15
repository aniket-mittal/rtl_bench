module mg_06559(inputA, Bse,control,outputBS,N, Zero, C);
input [31:0] inputA, Bse; 
  input [3:0] control; 
  output reg N, Zero, C; 
  output reg [31:0] outputBS; 
  reg [31:0] aux1, aux3; 
  reg aux2; 
  wire zer; 
  assign zer = (outputBS == 0); 
  always @ ( * ) begin 
  N=0; Zero=0; C=0; 
  outputBS=0; 
  aux1=0; aux2=0; aux3=0; 
  case (control) 
  1:begin 
  {aux2,outputBS}=Bse<<1; 
  C=aux2; 
  Zero=zer; 
  N=outputBS[31]; 
  end 
  2:begin 
  aux2=inputA[31]; 
  if (Bse<31) begin 
  aux3=inputA>>Bse; 
  aux1 = (aux2)? 32'hffffffff : 32'h0; 
  aux1=aux1<<32-Bse; 
  outputBS= aux3|aux1; 
  C=|inputA; 
  Zero=zer; 
  N=aux2; 
  end else begin 
  C=|inputA; 
  outputBS = (aux2) ? 32'hffffffff : 32'h0; 
  Zero=!aux2; 
  N=aux2; 
  end 
  end 
  3:begin 
  if (Bse<32) begin 
  outputBS=inputA<<Bse; 
  aux1=inputA>>32-Bse; 
  C=|aux1; 
  Zero=zer; 
  N=outputBS[31]; 
  end else begin 
  C=|inputA; 
  outputBS=0; 
  Zero=1; 
  N=0; 
  end 
  end 
  4:begin 
  if (Bse<32) begin 
  outputBS=inputA>>Bse; 
  aux1=inputA<<32-Bse; 
  C=|aux1; 
  Zero=zer; 
  N=outputBS[31]; 
  end else begin 
  C=|inputA; 
  outputBS=0; 
  Zero=1; 
  N=0; 
  end 
  end 
  5:begin 
  outputBS=inputA>>Bse%32; 
  aux1=inputA<<32-(Bse % 32); 
  outputBS=outputBS | aux1; 
  C=aux1[31]; 
  Zero=zer; 
  N=outputBS[31]; 
  end 
  6:begin 
  outputBS[31:24]=inputA[7:0]; 
  outputBS[23:16]=inputA[15:8]; 
  outputBS[15:8]=inputA[23:16]; 
  outputBS[7:0]=inputA[31:24]; 
  end 
  7:begin 
  outputBS[31:24]=inputA[23:16]; 
  outputBS[23:16]=inputA[31:24]; 
  outputBS[15:8]=inputA[7:0]; 
  outputBS[7:0]=inputA[15:8]; 
  end 
  8:begin 
  outputBS[31:16]=(inputA[7]) ? 16'hFFFF :16'h0; 
  outputBS[15:8]=inputA[7:0]; 
  outputBS[7:0]=inputA[15:8]; 
  end 
  default:begin 
  outputBS=Bse; 
  end 
  endcase 
  end 
 endmodule