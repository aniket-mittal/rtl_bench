module mg_06251(input clk, rst,input RegWrite_In,input [31:0] PC_In, ALUOut_In, rdata_In,input [4:0] AddrC_In,input [1:0] MemtoReg_In,output reg RegWrite_Out,output reg [31:0] PC_Out, ALUOut_Out, rdata_Out,output reg [4:0] AddrC_Out,output reg [1:0] MemtoReg_Out);
always @(posedge clk or posedge rst) begin 
  if (rst) begin 
  RegWrite_Out <= 0; 
  PC_Out <= 0; 
  ALUOut_Out <= 0; 
  AddrC_Out <= 0; 
  MemtoReg_Out <= 0; 
  rdata_Out <= 0; 
  end else begin 
  RegWrite_Out <= RegWrite_In; 
  PC_Out <= PC_In; 
  ALUOut_Out <= ALUOut_In; 
  AddrC_Out <= AddrC_In; 
  MemtoReg_Out <= MemtoReg_In; 
  rdata_Out <= rdata_In; 
  end 
  end 
 endmodule