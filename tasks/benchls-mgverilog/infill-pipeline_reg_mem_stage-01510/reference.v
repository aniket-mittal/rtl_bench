module mg_01510(input clk, rst,input RegWrite_In, MemWrite_In, MemRead_In,input [31:0] PC_In, ALUOut_In, DataBusB_In,input [4:0] AddrC_In,input [1:0] MemtoReg_In,output reg RegWrite_Out, MemWrite_Out, MemRead_Out,output reg [31:0] PC_Out, ALUOut_Out, DataBusB_Out,output reg [4:0] AddrC_Out,output reg [1:0] MemtoReg_Out);
always @(posedge clk or posedge rst) begin 
  if (rst) begin 
  RegWrite_Out <= 0; 
  MemWrite_Out <= 0; 
  MemRead_Out <= 0; 
  PC_Out <= 0; 
  ALUOut_Out <= 0; 
  AddrC_Out <= 0; 
  MemtoReg_Out <= 0; 
  DataBusB_Out <= 0; 
  end else begin 
  RegWrite_Out <= RegWrite_In; 
  MemWrite_Out <= MemWrite_In; 
  MemRead_Out <= MemRead_In; 
  PC_Out <= PC_In; 
  ALUOut_Out <= ALUOut_In; 
  AddrC_Out <= AddrC_In; 
  MemtoReg_Out <= MemtoReg_In; 
  DataBusB_Out <= DataBusB_In; 
  end 
  end 
 endmodule