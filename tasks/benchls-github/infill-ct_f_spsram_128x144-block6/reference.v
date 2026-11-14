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

module ct_f_spsram_128x144(
  A,
  CEN,
  CLK,
  D,
  GWEN,
  Q,
  WEN
);

parameter ADDR_WIDTH = 7;
parameter DATA_WIDTH = 144;
parameter WRAP_SIZE  = 1;

input  [ADDR_WIDTH-1:0]   A;
input                     CEN;
input                     CLK;
input  [DATA_WIDTH-1:0]   D;
input                     GWEN;
input  [DATA_WIDTH-1:0]   WEN;
output [DATA_WIDTH-1:0]   Q;

reg    [ADDR_WIDTH-1:0]   addr_holding;

wire  [ADDR_WIDTH-1:0]   A;
wire                     CEN;
wire                     CLK;
wire  [DATA_WIDTH-1:0]   D;
wire                     GWEN;
wire  [DATA_WIDTH-1:0]   WEN;
wire  [DATA_WIDTH-1:0]   Q;
wire  [ADDR_WIDTH-1:0]   addr;

always@(posedge CLK)
begin
  if(!CEN) begin
    addr_holding[ADDR_WIDTH-1:0] <= A[ADDR_WIDTH-1:0];
  end
end

assign addr[ADDR_WIDTH-1:0] = CEN ? addr_holding[ADDR_WIDTH-1:0]
                                  : A[ADDR_WIDTH-1:0];

wire [DATA_WIDTH-1:0] ram_wen_vec;
genvar i;
generate
  for(i=0; i<DATA_WIDTH; i=i+1) begin: RAM_DIN_VEC
    assign ram_wen_vec[i] = !CEN & !WEN[i]  & !GWEN;
    fpga_ram #(WRAP_SIZE,ADDR_WIDTH) ram_instance(
      .PortAClk (CLK),
      .PortAAddr(addr),
      .PortADataIn (D[i]),
      .PortAWriteEnable(ram_wen_vec[i]),
      .PortADataOut(Q[i]));
  end
endgenerate

endmodule