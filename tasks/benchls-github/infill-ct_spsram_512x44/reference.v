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

module ct_f_spsram_512x44(
  A,
  CEN,
  CLK,
  D,
  GWEN,
  Q,
  WEN
);

// &Ports; @26
input   [8 :0]  A;           
input           CEN;         
input           CLK;         
input   [43:0]  D;           
input           GWEN;        
input   [43:0]  WEN;         
output  [43:0]  Q;           

// &Regs; @27
reg     [8 :0]  addr_holding; 

// &Wires; @28
wire    [8 :0]  A;           
wire            CEN;         
wire            CLK;         
wire    [43:0]  D;           
wire            GWEN;        
wire    [43:0]  Q;           
wire    [43:0]  WEN;         
wire    [8 :0]  addr;        
wire    [21:0]  ram0_din;    
wire    [21:0]  ram0_dout;   
wire            ram0_wen;    
wire    [21:0]  ram1_din;    
wire    [21:0]  ram1_dout;   
wire            ram1_wen;    


parameter ADDR_WIDTH = 9;
parameter WRAP_SIZE  = 22;

//write enable
// &Force("nonport","ram0_wen"); @34
// &Force("nonport","ram1_wen"); @35
// &Force("bus","WEN",43,0); @36
assign ram0_wen = !CEN && !WEN[21] && !GWEN;
assign ram1_wen = !CEN && !WEN[43] && !GWEN;

//din
// &Force("nonport","ram0_din"); @41
// &Force("nonport","ram1_din"); @42
// &Force("bus","D",2*WRAP_SIZE-1,0); @43
assign ram0_din[WRAP_SIZE-1:0] = D[WRAP_SIZE-1:0];
assign ram1_din[WRAP_SIZE-1:0] = D[2*WRAP_SIZE-1:WRAP_SIZE];
//address
// &Force("nonport","addr"); @47
always@(posedge CLK)
begin
  if(!CEN) begin
    addr_holding[ADDR_WIDTH-1:0] <= A[ADDR_WIDTH-1:0];
  end
end

assign addr[ADDR_WIDTH-1:0] = CEN ? addr_holding[ADDR_WIDTH-1:0]
                                  : A[ADDR_WIDTH-1:0];
//dout
// &Force("nonport","ram0_dout"); @58
// &Force("nonport","ram1_dout"); @59

assign Q[WRAP_SIZE-1:0]             = ram0_dout[WRAP_SIZE-1:0];
assign Q[2*WRAP_SIZE-1:WRAP_SIZE]   = ram1_dout[WRAP_SIZE-1:0];

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

// &ModuleEnd; @78
endmodule

module ct_spsram_512x44(
  A,
  CEN,
  CLK,
  D,
  GWEN,
  Q,
  WEN
);

// &Ports; @23
input   [8 :0]  A;   
input           CEN; 
input           CLK; 
input   [43:0]  D;   
input           GWEN; 
input   [43:0]  WEN; 
output  [43:0]  Q;   

// &Regs; @24

// &Wires; @25
wire    [8 :0]  A;   
wire            CEN; 
wire            CLK; 
wire    [43:0]  D;   
wire            GWEN; 
wire    [43:0]  Q;   
wire    [43:0]  WEN; 


//**********************************************************
//                  Parameter Definition
//**********************************************************
parameter ADDR_WIDTH = 9;
parameter DATA_WIDTH = 44;
parameter WE_WIDTH   = 44;

// &Force("bus","Q",DATA_WIDTH-1,0); @34
// &Force("bus","WEN",WE_WIDTH-1,0); @35
// &Force("bus","A",ADDR_WIDTH-1,0); @36
// &Force("bus","D",DATA_WIDTH-1,0); @37

  //********************************************************
  //*                        FPGA memory                   *
  //********************************************************
  //{WEN[43,22],WEN[21:0}}
//   &Instance("ct_f_spsram_512x44"); @44
ct_f_spsram_512x44  x_ct_f_spsram_512x44 (
  .A    (A   ),
  .CEN  (CEN ),
  .CLK  (CLK ),
  .D    (D   ),
  .GWEN (GWEN),
  .Q    (Q   ),
  .WEN  (WEN )
);

//   &Instance("ct_tsmc_spsram_512x44"); @50

// &ModuleEnd; @66
endmodule