module autovcoder_064900 #(
    parameter I_BITS = 8,
    parameter ALPHA = 15,
    parameter II_BITS = 21,
    parameter SIGI_BITS = 18,
    parameter NUMOFROWS = 1095,
    parameter NUMOFCOLS = 180
)  //S = 2*alpha+1
(
    clk,
    rst_n,
    Iq,
    Is,
    valid_in,
    SigIi,
    valid_out,
    wen,
    ren1,
    ren2,
    waddr,
    raddr1,
    raddr2,
    wdata,
    rdata1,
    rdata2
);

  //parameter II_BITS 	= $clog2((2*ALPHA+1)*(STRIPEWIDTH+4*ALPHA))+I_BITS;	//21
  //parameter SIGI_BITS	= $clog2((2*ALPHA+1)*(2*ALPHA+1))+I_BITS;	//18
  parameter WINDOW_S = (2 * ALPHA + 1);

  //parameter NUMOFROWS = 1080+ALPHA;	//1080p :^)
  //parameter NUMOFCOLS = STRIPEWIDTH+4*ALPHA;	//ex: 180

  parameter ROWBITS = $clog2(NUMOFROWS);
  parameter COLBITS = $clog2(NUMOFCOLS);

  input clk;
  input rst_n;
  input valid_in;
  input signed [I_BITS-1:0] Iq;
  input signed [I_BITS-1:0] Is;

  output reg signed [SIGI_BITS-1:0] SigIi;
  output reg valid_out;
  reg [SIGI_BITS-1:0] SigIi_nxt;

  output reg wen, ren1, ren2;
  output reg [COLBITS-1:0] waddr, raddr1, raddr2;
  output reg [II_BITS-1:0] wdata;
  input signed [II_BITS-1:0] rdata1, rdata2;


  reg [ROWBITS-1:0] row_count, row_count_nxt;
  reg [COLBITS-1:0] col_count, col_count_nxt;

  reg signed [II_BITS-1:0] IId_apos, IId_apos_nxt;
  reg signed [II_BITS-1:0] IIs;  //IId <= IIs
  reg signed [II_BITS-1:0] IId;
  reg signed [II_BITS-1:0] IIa_pip, IIa_pip_nxt;


  reg valid_in_pip, valid_in_pip_nxt;

  always @(*) begin
    row_count_nxt = row_count;
    col_count_nxt = col_count;
    wen = 0;
    ren1 = 1;
    ren2 = 1;
    raddr1 = col_count;
    raddr2 = col_count - (WINDOW_S);
    IIs 		= ((col_count==0)?0:IId)+((row_count==0)?0:rdata1)-((row_count==0||col_count==0)?0:IId_apos)-((row_count<WINDOW_S)?0:Iq)+((row_count>=1080)?0:Is);
    IIa_pip_nxt = ((col_count < WINDOW_S) ? 0 : rdata2);
    SigIi_nxt = IId - IIa_pip;  //(pipelined)IIs-IIa
    IId_apos_nxt = rdata1;
    waddr = col_count;
    wdata = IIs;
    valid_in_pip_nxt = (row_count >= ALPHA && col_count >= (2 * ALPHA)) ? valid_in : 0;
    if (valid_in) begin
      row_count_nxt = (col_count==(NUMOFCOLS-1))?((row_count==(NUMOFROWS-1))?0:row_count+1):row_count;
      col_count_nxt = (col_count == (NUMOFCOLS - 1)) ? 0 : col_count + 1;
      raddr1 = col_count_nxt;  // rdata1 : IIs_apos
      raddr2 = col_count_nxt - (WINDOW_S);  // rdata2 : IIa
      wen = 1;
    end
  end

  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      row_count <= 0;
      col_count <= 0;
      IId_apos  <= 0;
      IId    <= 0;
      valid_out <= 0;
      valid_in_pip <= 0;
      SigIi   <= 0;
      IIa_pip   <= 0;
    end else begin
      row_count <= row_count_nxt;
      col_count <= col_count_nxt;
      IId_apos  <= IId_apos_nxt;
      IId    <= IIs;
      valid_out <= valid_in_pip;
      valid_in_pip <= valid_in_pip_nxt;
      SigIi   <= SigIi_nxt;
      IIa_pip   <= IIa_pip_nxt;
    end
  end


endmodule

