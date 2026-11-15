module autovcoder_005807 (
      input  wire        HRESETn
    , input  wire        HCLK
    , input  wire        HREADY
    , input  wire [ 3:0] HMASTER
    , output reg  [31:0] HADDR
    , output reg  [ 3:0] HPROT
    , output reg  [ 1:0] HTRANS
    , output reg         HWRITE
    , output reg  [ 2:0] HSIZE
    , output reg  [ 2:0] HBURST
    , output reg  [31:0] HWDATA
    , input  wire [31:0] HADDR0
    , input  wire [ 3:0] HPROT0
    , input  wire [ 1:0] HTRANS0
    , input  wire        HWRITE0
    , input  wire [ 2:0] HSIZE0
    , input  wire [ 2:0] HBURST0
    , input  wire [31:0] HWDATA0
    , input  wire [31:0] HADDR1
    , input  wire [ 3:0] HPROT1
    , input  wire [ 1:0] HTRANS1
    , input  wire        HWRITE1
    , input  wire [ 2:0] HSIZE1
    , input  wire [ 2:0] HBURST1
    , input  wire [31:0] HWDATA1
);
  reg [3:0] hmaster_delay = 4'h0;
  always @(posedge HCLK or negedge HRESETn) begin
    if (HRESETn == 1'b0) begin
      hmaster_delay <= 4'b0;
    end else begin
      if (HREADY) begin
        hmaster_delay <= HMASTER;
      end
    end
  end
  always @(HMASTER or HADDR0 or HADDR1) begin
    case (HMASTER)
      4'h0: HADDR = HADDR0;
      4'h1: HADDR = HADDR1;
      default: HADDR = ~32'b0;
    endcase
  end
  always @(HMASTER or HPROT0 or HPROT1) begin
    case (HMASTER)
      4'h0: HPROT = HPROT0;
      4'h1: HPROT = HPROT1;
      default: HPROT = 4'b0;
    endcase
  end
  always @(HMASTER or HTRANS0 or HTRANS1) begin
    case (HMASTER)
      4'h0: HTRANS = HTRANS0;
      4'h1: HTRANS = HTRANS1;
      default: HTRANS = 2'b0;
    endcase
  end
  always @(HMASTER or HWRITE0 or HWRITE1) begin
    case (HMASTER)
      4'h0: HWRITE = HWRITE0;
      4'h1: HWRITE = HWRITE1;
      default: HWRITE = 1'b0;
    endcase
  end
  always @(HMASTER or HSIZE0 or HSIZE1) begin
    case (HMASTER)
      4'h0: HSIZE = HSIZE0;
      4'h1: HSIZE = HSIZE1;
      default: HSIZE = 3'b0;
    endcase
  end
  always @(HMASTER or HBURST0 or HBURST1) begin
    case (HMASTER)
      4'h0: HBURST = HBURST0;
      4'h1: HBURST = HBURST1;
      default: HBURST = 3'b0;
    endcase
  end
  always @(hmaster_delay or HWDATA0 or HWDATA1) begin
    case (hmaster_delay)
      4'h0: HWDATA = HWDATA0;
      4'h1: HWDATA = HWDATA1;
      default: HWDATA = 3'b0;
    endcase
  end
endmodule

