module mg_06602 (input [3:0] io_apb_PADDR,input [0:0] io_apb_PSEL,input io_apb_PENABLE,output io_apb_PREADY,input io_apb_PWRITE,input [31:0] io_apb_PWDATA,output reg [31:0] io_apb_PRDATA,output io_apb_PSLVERROR,input [31:0] io_gpio_read,output [31:0] io_gpio_write,output [31:0] io_gpio_writeEnable,input io_mainClk,input resetCtrl_systemReset);
wire _zz_3; 
  wire ctrl_askWrite; 
  wire ctrl_askRead; 
  wire ctrl_doWrite; 
  wire ctrl_doRead; 
  reg [31:0] _zz_1; 
  reg [31:0] _zz_2; 
  assign io_apb_PREADY = _zz_3; 
  assign _zz_3 = 1'b1; 
  always @ (*) begin 
  io_apb_PRDATA = (32'b00000000000000000000000000000000); 
  case(io_apb_PADDR) 
  4'b0000 : begin 
  io_apb_PRDATA[31 : 0] = io_gpio_read; 
  end 
  4'b0100 : begin 
  io_apb_PRDATA[31 : 0] = _zz_1; 
  end 
  4'b1000 : begin 
  io_apb_PRDATA[31 : 0] = _zz_2; 
  end 
  default : begin 
  end 
  endcase 
  end 
  assign io_apb_PSLVERROR = 1'b0; 
  assign ctrl_askWrite = ((io_apb_PSEL[0] && io_apb_PENABLE) && io_apb_PWRITE); 
  assign ctrl_askRead = ((io_apb_PSEL[0] && io_apb_PENABLE) && (! io_apb_PWRITE)); 
  assign ctrl_doWrite = (((io_apb_PSEL[0] && io_apb_PENABLE) && _zz_3) && io_apb_PWRITE); 
  assign ctrl_doRead = (((io_apb_PSEL[0] && io_apb_PENABLE) && _zz_3) && (! io_apb_PWRITE)); 
  assign io_gpio_write = _zz_1; 
  assign io_gpio_writeEnable = _zz_2; 
  always @ (posedge io_mainClk or posedge resetCtrl_systemReset) begin 
  if (resetCtrl_systemReset) begin 
  _zz_2 <= (32'b00000000000000000000000000000000); 
  end else begin 
  case(io_apb_PADDR) 
  4'b0000 : begin 
  end 
  4'b0100 : begin 
  end 
  4'b1000 : begin 
  if(ctrl_doWrite)begin 
  _zz_2 <= io_apb_PWDATA[31 : 0]; 
  end 
  end 
  default : begin 
  end 
  endcase 
  end 
  end 
  always @ (posedge io_mainClk) begin 
  case(io_apb_PADDR) 
  4'b0000 : begin 
  end 
  4'b0100 : begin 
  if(ctrl_doWrite)begin 
  _zz_1 <= io_apb_PWDATA[31 : 0]; 
  end 
  end 
  4'b1000 : begin 
  end 
  default : begin 
  end 
  endcase 
  end 
 endmodule