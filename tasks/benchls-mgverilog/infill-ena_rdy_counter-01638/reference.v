module mg_01638 (input wire CLK, input wire nRST,input wire request$say__ENA,input wire [31:0]request$say$va,output wire request$say__RDY);
reg [31:0]a; 
  reg [31:0]offset; 
  reg [31:0]outA; 
  reg [31:0]outB; 
  reg running; 
  assign request$say__RDY = !running; 
  always @( posedge CLK) begin 
  if (!nRST) begin 
  a <= 0; 
  offset <= 0; 
  outA <= 0; 
  outB <= 0; 
  running <= 0; 
  end 
  else begin 
  if (request$say__ENA == 0) begin 
  outA <= a + offset; 
  if (running != 0) 
  a <= a + 1; 
  end; 
  if (request$say__ENA == 0) begin 
  outB <= a + offset; 
  if (running == 0) 
  a <= 1; 
  end; 
  if (request$say__ENA == 0) begin 
  offset <= offset + 1; 
  end; 
  if (!( running | ( !request$say__ENA ) )) begin 
  a <= request$say$va; 
  offset <= 1; 
  running <= 1; 
  end; 
  end 
  end 
 endmodule