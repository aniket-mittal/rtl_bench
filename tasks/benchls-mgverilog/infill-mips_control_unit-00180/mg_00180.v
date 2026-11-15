module mg_00180(input[5:0]OPcode,input[5:0]Fun,input wire int_code,input wire MIO_ready,input wire zero,output reg RegDst,output reg ALUSrc_B,output reg [1:0] DatatoReg,output reg Jal,output reg [1:0]Branch,output reg RegWrite,output reg mem_w,output reg [2:0]ALU_Control,output reg eret,output reg CPU_MIO);
[MASKED] 
 endmodule