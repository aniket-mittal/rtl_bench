module mg_04725(input clock, reset,input [7:0] multiplicand, multiplier,input Load_regs, Add_dec,output reg [15:0] PR,output Zero);
reg [7:0] AR, BR; 
 [MASKED] 
 assign Zero = AR == 8'b0; 
 endmodule