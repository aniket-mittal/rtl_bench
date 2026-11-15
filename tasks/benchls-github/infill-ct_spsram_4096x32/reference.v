module fpga_ram(
  PortAClk,
  PortAAddr,
  PortADataIn,
  PortAWriteEnable,
//  PortAChipEnable,
  PortADataOut
);

parameter  DATAWIDTH = 2;
parameter  ADDRWIDTH = 2;

input                     PortAClk;
input   [(ADDRWIDTH-1):0] PortAAddr;
input   [(DATAWIDTH-1):0] PortADataIn;
input                     PortAWriteEnable;
//input                     PortAChipEnable;
output  [(DATAWIDTH-1):0] PortADataOut; 

parameter  MEMDEPTH = 2**(ADDRWIDTH);

reg [(DATAWIDTH-1):0] mem [(MEMDEPTH-1):0] /* synthesis syn_ramstyle = "no_rw_check" */;
reg [(DATAWIDTH-1):0] PortADataOut;

always @(posedge PortAClk)
begin
  if(PortAWriteEnable)
  begin
    mem[PortAAddr]  <= PortADataIn;
    PortADataOut    <= PortADataIn;
  end
  else
  begin
    PortADataOut    <= mem[PortAAddr];
  end
end

//wire [(DATAWIDTH-1):0] tt;
//assign t = mem[PortAAddr];
//always @(posedge PortAClk)
//begin
//  if(PortAWriteEnable)
//  begin
//    PortADataOut    <= PortADataIn;
//  end
//  else
//  begin
//    PortADataOut    <= mem[PortAAddr];
//  end
//end

endmodule

module ct_f_spsram_4096x32(
  A,
  CEN,
  CLK,
  D,
  GWEN,
  Q,
  WEN
);

// &Ports; @26
input   [11:0]  A;           
input           CEN;         
input           CLK;         
input   [31:0]  D;           
input           GWEN;        
input   [31:0]  WEN;         
output  [31:0]  Q;           

// &Regs; @27
reg     [11:0]  addr_holding; 

// &Wires; @28
wire    [11:0]  A;           
wire            CEN;         
wire            CLK;         
wire    [31:0]  D;           
wire            GWEN;        
wire    [31:0]  Q;           
wire    [31:0]  WEN;         
wire    [11:0]  addr;        
wire    [7 :0]  ram0_din;    
wire    [7 :0]  ram0_dout;   
wire            ram0_wen;    
wire    [7 :0]  ram1_din;    
wire    [7 :0]  ram1_dout;   
wire            ram1_wen;    
wire    [7 :0]  ram2_din;    
wire    [7 :0]  ram2_dout;   
wire            ram2_wen;    
wire    [7 :0]  ram3_din;    
wire    [7 :0]  ram3_dout;   
wire            ram3_wen;    


parameter ADDR_WIDTH = 12;
parameter WRAP_SIZE  = 8;

//write enable
// &Force("nonport","ram0_wen"); @34
// &Force("nonport","ram1_wen"); @35
// &Force("nonport","ram2_wen"); @36
// &Force("nonport","ram3_wen"); @37
// &Force("bus","WEN",31,0); @38
assign ram0_wen = !CEN && !WEN[ 7] && !GWEN;
assign ram1_wen = !CEN && !WEN[15] && !GWEN;
assign ram2_wen = !CEN && !WEN[23] && !GWEN;
assign ram3_wen = !CEN && !WEN[31] && !GWEN;

//din
// &Force("nonport","ram0_din"); @45
// &Force("nonport","ram1_din"); @46
// &Force("nonport","ram2_din"); @47
// &Force("nonport","ram3_din"); @48
// &Force("bus","D",4*WRAP_SIZE-1,0); @49
assign ram0_din[WRAP_SIZE-1:0] = D[WRAP_SIZE-1:0];
assign ram1_din[WRAP_SIZE-1:0] = D[2*WRAP_SIZE-1:WRAP_SIZE];
assign ram2_din[WRAP_SIZE-1:0] = D[3*WRAP_SIZE-1:2*WRAP_SIZE];
assign ram3_din[WRAP_SIZE-1:0] = D[4*WRAP_SIZE-1:3*WRAP_SIZE];
//address
// &Force("nonport","addr"); @55
always@(posedge CLK)
begin
  if(!CEN) begin
    addr_holding[ADDR_WIDTH-1:0] <= A[ADDR_WIDTH-1:0];
  end
end

assign addr[ADDR_WIDTH-1:0] = CEN ? addr_holding[ADDR_WIDTH-1:0]
                                  : A[ADDR_WIDTH-1:0];
//dout
// &Force("nonport","ram0_dout"); @66
// &Force("nonport","ram1_dout"); @67
// &Force("nonport","ram2_dout"); @68
// &Force("nonport","ram3_dout"); @69

assign Q[WRAP_SIZE-1:0]             = ram0_dout[WRAP_SIZE-1:0];
assign Q[2*WRAP_SIZE-1:WRAP_SIZE]   = ram1_dout[WRAP_SIZE-1:0];
assign Q[3*WRAP_SIZE-1:2*WRAP_SIZE] = ram2_dout[WRAP_SIZE-1:0];
assign Q[4*WRAP_SIZE-1:3*WRAP_SIZE] = ram3_dout[WRAP_SIZE-1:0];


fpga_ram #(WRAP_SIZE,ADDR_WIDTH) ram0(
  .PortAClk (CLK),
  .PortAAddr(addr),
  .PortADataIn (ram0_din),
  .PortAWriteEnable(ram0_wen),
  .PortADataOut(ram0_dout));

fpga_ram #(WRAP_SIZE,ADDR_WIDTH) ram1(
  .PortAClk (CLK),
  .PortAAddr(addr),
  .PortADataIn (ram1_din),
  .PortAWriteEnable(ram1_wen),
  .PortADataOut(ram1_dout));

fpga_ram #(WRAP_SIZE,ADDR_WIDTH) ram2(
  .PortAClk (CLK),
  .PortAAddr(addr),
  .PortADataIn (ram2_din),
  .PortAWriteEnable(ram2_wen),
  .PortADataOut(ram2_dout));

fpga_ram #(WRAP_SIZE,ADDR_WIDTH) ram3(
  .PortAClk (CLK),
  .PortAAddr(addr),
  .PortADataIn (ram3_din),
  .PortAWriteEnable(ram3_wen),
  .PortADataOut(ram3_dout));

// &ModuleEnd; @105
endmodule

module ct_spsram_4096x32(
  A,
  CEN,
  CLK,
  D,
  GWEN,
  Q,
  WEN
);

// &Ports; @23
input   [11:0]  A;   
input           CEN; 
input           CLK; 
input   [31:0]  D;   
input           GWEN; 
input   [31:0]  WEN; 
output  [31:0]  Q;   

// &Regs; @24

// &Wires; @25
wire    [11:0]  A;   
wire            CEN; 
wire            CLK; 
wire    [31:0]  D;   
wire            GWEN; 
wire    [31:0]  Q;   
wire    [31:0]  WEN; 


//**********************************************************
//                  Parameter Definition
//**********************************************************
parameter ADDR_WIDTH = 12;
parameter DATA_WIDTH = 32;
parameter WE_WIDTH   = 32;

// &Force("bus","Q",DATA_WIDTH-1,0); @34
// &Force("bus","WEN",WE_WIDTH-1,0); @35
// &Force("bus","A",ADDR_WIDTH-1,0); @36
// &Force("bus","D",DATA_WIDTH-1,0); @37

  //********************************************************
  //*                        FPGA memory                   *
  //********************************************************
  //{WEN[31:24],WEN[23:16],WEN[15:8],WEN[7:0]}
//   &Instance("ct_f_spsram_4096x32"); @44
ct_f_spsram_4096x32  x_ct_f_spsram_4096x32 (
  .A    (A   ),
  .CEN  (CEN ),
  .CLK  (CLK ),
  .D    (D   ),
  .GWEN (GWEN),
  .Q    (Q   ),
  .WEN  (WEN )
);

//   &Instance("ct_tsmc_spsram_1024x32"); @50

// &ModuleEnd; @66
endmodule