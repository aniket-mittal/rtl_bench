module autovcoder_059094 #(
    parameter DATASIZE    = 8,      // Memory data word width
    parameter ADDRSIZE    = 4,      // Number of mem address bits
    parameter FALLTHROUGH = "TRUE"  // First word fall-through
) (
    input  wire                a_clk,
    input  wire [DATASIZE-1:0] a_wdata,
    output wire [DATASIZE-1:0] a_rdata,
    input  wire [ADDRSIZE-1:0] a_addr,
    input  wire                a_rinc,
    input  wire                a_winc,

    input  wire                b_clk,
    input  wire [DATASIZE-1:0] b_wdata,
    output wire [DATASIZE-1:0] b_rdata,
    input  wire [ADDRSIZE-1:0] b_addr,
    input  wire                b_rinc,
    input  wire                b_winc
);

  reg [DATASIZE-1:0] a_rdata_r;
  reg [DATASIZE-1:0] b_rdata_r;

  generate

    localparam DEPTH = 1 << ADDRSIZE;
    reg [DATASIZE-1:0] mem[0:DEPTH-1];

    if (FALLTHROUGH == "TRUE") begin : fallthrough

      always @(posedge a_clk) if (a_winc) mem[a_addr] <= a_wdata;

      assign a_rdata = mem[a_addr];

      always @(posedge b_clk) if (b_winc) mem[b_addr] <= b_wdata;

      assign b_rdata = mem[b_addr];

    end else begin : registered

      wire a_en = a_rinc | a_winc;

      always @(posedge a_clk)
        if (a_en) begin
          if (a_winc) mem[a_addr] <= a_wdata;
          a_rdata_r <= mem[a_addr];
        end

      assign a_rdata = a_rdata_r;

      wire b_en = b_rinc | b_winc;

      always @(posedge b_clk)
        if (b_en) begin
          if (b_winc) mem[b_addr] <= b_wdata;
          b_rdata_r <= mem[b_addr];
        end

      assign b_rdata = b_rdata_r;

    end  // block: registered
  endgenerate


endmodule

