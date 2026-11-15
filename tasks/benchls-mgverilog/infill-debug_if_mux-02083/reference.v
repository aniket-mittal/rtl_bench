module mg_02083(input wire iCLOCK,input wire inRESET,input wire iIF_SELECT,input wire iDEBUG_UART_RXD,output wire oDEBUG_UART_TXD,input wire iDEBUG_PARA_REQ,output wire oDEBUG_PARA_BUSY,input wire [7:0] iDEBUG_PARA_CMD,input wire [31:0] iDEBUG_PARA_DATA,output wire oDEBUG_PARA_VALID,input wire iDEBUG_PARA_BUSY,output wire oDEBUG_PARA_ERROR,output wire [31:0] oDEBUG_PARA_DATA,output wire oDEBUG_COM_REQ,input wire iDEBUG_COM_BUSY,output wire [7:0] oDEBUG_COM_CMD,output wire [31:0] oDEBUG_COM_DATA,input wire iDEBUG_COM_VALID,output wire oDEBUG_COM_BUSY,input wire iDEBUG_COM_ERROR,input wire [31:0] iDEBUG_COM_DATA);
reg debug_if2ctrl_req; 
  reg [7:0] debug_if2ctrl_cmd; 
  reg [31:0] debug_if2ctrl_data; 
  reg debug_if2ctrl_busy; 
  always @* begin 
  debug_if2ctrl_req = iDEBUG_PARA_REQ; 
  debug_if2ctrl_cmd = iDEBUG_PARA_CMD; 
  debug_if2ctrl_data = iDEBUG_PARA_DATA; 
  debug_if2ctrl_busy = iDEBUG_PARA_BUSY; 
  end 
  reg debug_ctrl2para_busy; 
  reg debug_ctrl2para_valid; 
  reg debug_ctrl2para_error; 
  reg [31:0] debug_ctrl2para_data; 
  reg debug_ctrl2uart_busy; 
  reg debug_ctrl2uart_valid; 
  reg debug_ctrl2uart_error; 
  reg [31:0] debug_ctrl2uart_data; 
  always @* begin 
  if(!iIF_SELECT)begin 
  debug_ctrl2para_busy = 1'b0; 
  debug_ctrl2para_valid = 1'b0; 
  debug_ctrl2para_error = 1'b0; 
  debug_ctrl2para_data = 32'h0; 
  debug_ctrl2uart_busy = iDEBUG_COM_BUSY; 
  debug_ctrl2uart_valid = iDEBUG_COM_VALID; 
  debug_ctrl2uart_error = iDEBUG_COM_ERROR; 
  debug_ctrl2uart_data = iDEBUG_COM_DATA; 
  end 
  else begin 
  debug_ctrl2para_busy = iDEBUG_COM_BUSY; 
  debug_ctrl2para_valid = iDEBUG_COM_VALID; 
  debug_ctrl2para_error = iDEBUG_COM_ERROR; 
  debug_ctrl2para_data = iDEBUG_COM_DATA; 
  debug_ctrl2uart_busy = 1'b0; 
  debug_ctrl2uart_valid = 1'b0; 
  debug_ctrl2uart_error = 1'b0; 
  debug_ctrl2uart_data = 32'h0; 
  end 
  end 
  assign oDEBUG_COM_REQ = debug_if2ctrl_req; 
  assign oDEBUG_COM_CMD = debug_if2ctrl_cmd; 
  assign oDEBUG_COM_DATA = debug_if2ctrl_data; 
  assign oDEBUG_COM_BUSY = debug_if2ctrl_busy; 
  assign oDEBUG_PARA_BUSY = debug_ctrl2para_busy; 
  assign oDEBUG_PARA_VALID = debug_ctrl2para_valid; 
  assign oDEBUG_PARA_ERROR = debug_ctrl2para_error; 
  assign oDEBUG_PARA_DATA = debug_ctrl2para_data; 
  assign oDEBUG_UART_TXD = 1'b1; 
 endmodule