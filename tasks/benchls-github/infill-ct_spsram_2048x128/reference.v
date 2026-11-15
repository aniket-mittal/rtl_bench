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

module ct_f_spsram_2048x128(
  A,
  CEN,
  CLK,
  D,
  GWEN,
  Q,
  WEN
);

// &Ports; @26
input   [10 :0]  A;           
input            CEN;         
input            CLK;         
input   [127:0]  D;           
input            GWEN;        
input   [127:0]  WEN;         
output  [127:0]  Q;           

// &Regs; @27
reg     [10 :0]  addr_holding; 

// &Wires; @28
wire    [10 :0]  A;           
wire             CEN;         
wire             CLK;         
wire    [127:0]  D;           
wire             GWEN;        
wire    [127:0]  Q;           
wire    [127:0]  WEN;         
wire    [10 :0]  addr;        
wire    [127:0]  ram_din;     
wire    [127:0]  ram_dout;    
wire             ram_wen;     


parameter ADDR_WIDTH = 11;
parameter WRAP_SIZE  = 128;

//write enable
// &Force("nonport","ram_wen"); @34
// &Force("bus","WEN",127,0); @35
assign ram_wen = !CEN && !WEN[127] && !GWEN;
//din
// &Force("nonport","ram_din"); @38
// &Force("bus","D",WRAP_SIZE-1,0); @39
assign ram_din[WRAP_SIZE-1:0] = D[WRAP_SIZE-1:0];
//address
// &Force("nonport","addr"); @42
always@(posedge CLK)
begin
  if(!CEN) begin
    addr_holding[ADDR_WIDTH-1:0] <= A[ADDR_WIDTH-1:0];
  end
end

assign addr[ADDR_WIDTH-1:0] = CEN ? addr_holding[ADDR_WIDTH-1:0]
                                  : A[ADDR_WIDTH-1:0];
//dout
// &Force("nonport","ram_dout"); @53
assign Q[WRAP_SIZE-1:0]                = ram_dout[WRAP_SIZE-1:0];
fpga_ram #(WRAP_SIZE,ADDR_WIDTH) ram(
  .PortAClk (CLK),
  .PortAAddr(addr),
  .PortADataIn (ram_din),
  .PortAWriteEnable(ram_wen),
  .PortADataOut(ram_dout));

// &ModuleEnd; @62
endmodule

module ct_spsram_2048x128(
  A,
  CEN,
  CLK,
  D,
  GWEN,
  Q,
  WEN
);

// &Ports; @23
input   [10 :0]  A;   
input            CEN; 
input            CLK; 
input   [127:0]  D;   
input            GWEN; 
input   [127:0]  WEN; 
output  [127:0]  Q;   

// &Regs; @24

// &Wires; @25
wire    [10 :0]  A;   
wire             CEN; 
wire             CLK; 
wire    [127:0]  D;   
wire             GWEN; 
wire    [127:0]  Q;   
wire    [127:0]  WEN; 


//**********************************************************
//                  Parameter Definition
//**********************************************************
parameter ADDR_WIDTH = 11;
parameter DATA_WIDTH = 128;
parameter WE_WIDTH   = 128;

// &Force("bus","Q",DATA_WIDTH-1,0); @34
// &Force("bus","WEN",WE_WIDTH-1,0); @35
// &Force("bus","A",ADDR_WIDTH-1,0); @36
// &Force("bus","D",DATA_WIDTH-1,0); @37

//  //********************************************************
//  //*                        FPGA memory                   *
//  //********************************************************
//   &Instance("ct_f_spsram_2048x128"); @43
ct_f_spsram_2048x128  x_ct_f_spsram_2048x128 (
  .A    (A   ),
  .CEN  (CEN ),
  .CLK  (CLK ),
  .D    (D   ),
  .GWEN (GWEN),
  .Q    (Q   ),
  .WEN  (WEN )
);

//   &Instance("ct_tsmc_spsram_2048x128"); @49

// &ModuleEnd; @65
endmodule