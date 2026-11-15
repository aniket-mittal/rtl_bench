module rtlpp_02145
  (input regReq, 
   output regAck, 
   input regWriteEn, 
   input [RegAddrWidth-1:0] regAddr, 
   input [31:0] regWData, 
   input [3:0] regWStrb, 
   output [31:0] regRData,
   input paramAddrValid, 
   input [31:0] paramAddr, 
   output paramAddrStop, 
   output paramDataValid, 
   output [31:0] paramData, 
   input paramDataStop,
   input clk,
   input srst);

parameter RegAddrWidth = 12;
parameter ParamAddrBase = 64;
parameter ParamAddrTop = 4095;

reg [31:0] ramArray [(ParamAddrTop-ParamAddrBase+1)/4-1:0];

reg regReq_q;
reg regReadReq_q;
reg regWriteReq_q;
reg [31:0] regWData_q;
reg [3:0] regWStrb_q;
reg [RegAddrWidth-3:0] regAddr_q;

reg regAck_q;
reg regReadDone_q;
reg regReadValid_q;
reg [31:0] regRData_q;
reg [31:0] regReadData_q;
reg [31:0] regPipeData_q;

reg paramAddrValid_q;
reg [31:0] paramAddr_q;
reg paramDataValid_q;
reg [31:0] paramData_q;

wire pmAddrStop;
wire pmReadStop;
wire pmPipeStop;

reg [RegAddrWidth-3:0] pmAddr_q;
reg [1:0] pmAddrAlign_q;
reg pmAddrValid_q;
reg [31:0] pmReadData_q;
reg [1:0] pmReadAlign_q;
reg pmReadValid_q;
reg [31:0] pmPipeData_q;
reg [1:0] pmPipeAlign_q;
reg pmPipeValid_q;
reg [31:0] pmDataAligned;

wire [RegAddrWidth-1:0] regParamAddrBase = ParamAddrBase [RegAddrWidth-1:0];
wire [RegAddrWidth-1:0] regParamAddrTop = ParamAddrTop [RegAddrWidth-1:0];
integer i;

always @(posedge clk) begin
  if (srst) begin
    regReq_q <= 1'b0;
    regReadReq_q <= 1'b0;
    regWriteReq_q <= 1'b0;
    regWData_q <= 32'b0;
    regWStrb_q <= 4'b0;
    for (i = 0; i < RegAddrWidth-2; i = i + 1)
      regAddr_q[i] <= 1'b0;
  end else begin
    regReq_q <= regReq;
    regWData_q <= regWData;
    regWStrb_q <= regWStrb;
    if ((regAddr < regParamAddrBase) || (regAddr > regParamAddrTop)) begin
      regReadReq_q <= 1'b0;
      regWriteReq_q <= 1'b0;
      for (i = 0; i < RegAddrWidth-2; i = i + 1)
        regAddr_q[i] <= 1'b0;
    end else begin
      regReadReq_q <= regReq & ~regReq_q & ~regWriteEn;
      regWriteReq_q <= regReq & ~regReq_q & regWriteEn;
      regAddr_q <= regAddr[RegAddrWidth-1:2] - (ParamAddrBase/4);
    end
  end
end

always @(posedge clk) begin
  if (srst) begin
    regAck_q <= 1'b0;
    regReadDone_q <= 1'b0;
    regReadValid_q <= 1'b0;
    regRData_q <= 32'b0;
  end else begin
    regAck_q <= regReadValid_q | regWriteReq_q;
    regReadDone_q <= regReadReq_q;
    regReadValid_q <= regReadDone_q;
    regRData_q <= regReadValid_q ? regPipeData_q : 32'b0;
  end
end

assign regAck = regAck_q;
assign regRData = regRData_q;

always @(posedge clk) begin
  if (srst) begin
    paramAddrValid_q <= 1'b0;
    paramAddr_q <= 32'b0;
  end else if (paramAddrValid_q) begin
    paramAddrValid_q <= pmAddrStop;
  end else begin
    paramAddrValid_q <= paramAddrValid;
    paramAddr_q <= paramAddr;
  end
end

assign paramAddrStop = paramAddrValid_q;

assign pmAddrStop = pmReadStop & pmAddrValid_q;
assign pmReadStop = pmPipeStop & pmReadValid_q;
assign pmPipeStop = paramDataValid_q & pmPipeValid_q;

always @(posedge clk) begin
  if (srst) begin
    for (i = 0; i < RegAddrWidth-2; i = i + 1)
      pmAddr_q[i] <= 1'b0;
    pmAddrValid_q <= 1'b0;
    pmReadValid_q <= 1'b0;
    pmPipeValid_q <= 1'b0;
  end else begin
    if (~pmAddrStop) begin
      pmAddrValid_q <= paramAddrValid_q;
      if ((paramAddr_q < ParamAddrBase) || (paramAddr_q > ParamAddrTop)) begin
        for (i = 0; i < RegAddrWidth-2; i = i + 1)
          pmAddr_q[i] <= 1'b0;
        pmAddrAlign_q <= 2'b0;
      end else begin
        pmAddr_q <= paramAddr_q[RegAddrWidth-1:2] - (ParamAddrBase/4);
        pmAddrAlign_q <= paramAddr_q[1:0];
      end
    end
    if (~pmReadStop) begin
      pmReadValid_q <= pmAddrValid_q;
      pmReadAlign_q <= pmAddrAlign_q;
    end
    if (~pmPipeStop) begin
      pmPipeValid_q <= pmReadValid_q;
      pmPipeAlign_q <= pmReadAlign_q;
    end
  end
end

always @(pmPipeAlign_q, pmPipeData_q) begin
  case (pmPipeAlign_q)
    2'b11 : pmDataAligned = {pmPipeData_q [23:0], pmPipeData_q [31:24]};
    2'b10 : pmDataAligned = {pmPipeData_q [15:0], pmPipeData_q [31:16]};
    2'b01 : pmDataAligned = {pmPipeData_q [7:0], pmPipeData_q [31:8]};
    default: pmDataAligned = pmPipeData_q;
  endcase
end

always @(posedge clk) begin
  if (srst) begin
    paramDataValid_q <= 1'b0;
    paramData_q <= 32'b0;
  end else if (paramDataValid_q) begin
    paramDataValid_q <= paramDataStop;
  end else begin
    paramDataValid_q <= pmPipeValid_q;
    paramData_q <= pmDataAligned;
  end
end

assign paramDataValid = paramDataValid_q;
assign paramData = paramData_q;

always @(posedge clk) begin
  if (~pmReadStop) begin
    pmReadData_q <= ramArray[pmAddr_q];
  end

  regReadData_q <= ramArray[regAddr_q];

  if (regWriteReq_q) begin
    if (regWStrb_q[0])
      ramArray[regAddr_q][7:0] <= regWData_q[7:0];
    if (regWStrb_q[1])
      ramArray[regAddr_q][15:8] <= regWData_q[15:8];
    if (regWStrb_q[2])
      ramArray[regAddr_q][23:16] <= regWData_q[23:16];
    if (regWStrb_q[3])
      ramArray[regAddr_q][31:24] <= regWData_q[31:24];
  end
end

always @(posedge clk) begin
  if (~pmPipeStop) begin
    pmPipeData_q <= pmReadData_q;
  end

  regPipeData_q <= regReadData_q;
end

endmodule