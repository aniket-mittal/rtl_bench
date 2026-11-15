module autovcoder_117451 (
    input  wire       clk_i,
    input  wire       rst_i,
    // Port 0: W
    input  wire       wen_i,
    input  wire [8:0] wadr_i,
    // Port 0: R
    output wire [8:0] data0_o,
    input  wire [8:0] radr0_i,
    // Port 1: R
    output wire [8:0] data1_o,
    input  wire [8:0] radr1_i,
    // RAM256_T0
    output wire       we0_o,
    output wire [7:0] adr0_o,
    input  wire [7:0] datao0_i,
    // RAM256_T1
    output wire       we1_o,
    output wire [7:0] adr1_o,
    input  wire [7:0] datao1_i
);
  reg  [511:0] RAM;

  wire [  7:0] tage;
  wire [  7:0] tago;

  wire [  7:0] tag_addre = wen_i ? wadr_i[8:1] : radr0_i[8:1];
  wire [  7:0] tag_addro = wen_i ? wadr_i[8:1] : radr1_i[8:1];

  always @(posedge clk_i) begin
    if (rst_i) RAM <= 0;
    else if (wen_i) RAM[wadr_i] <= 1'b1;
  end

  // Gerekli kosullar matematiksel olarak bulunmus olup gerekli ispat en altta gosterilmistir.
  wire [7:0] tag0 = (~radr0_i[0]) ? tage : tago;
  wire [7:0] tag1 = (((~radr0_i[0]) & (radr0_i == radr1_i)) || (( radr0_i[0]) & (radr0_i != radr1_i))) ? tage : tago;

  assign data0_o = {RAM[radr0_i], tag0};
  assign data1_o = {RAM[radr1_i], tag1};


  wire wee = ~wadr_i[0] ? wen_i : 1'b0;
  wire weo = wadr_i[0] ? wen_i : 1'b0;

  // even
  assign we0_o  = wee;
  assign adr0_o = tag_addre;
  assign tage   = datao0_i;

  // odd
  assign we1_o  = weo;
  assign adr1_o = tag_addro;
  assign tago   = datao1_i;

endmodule

