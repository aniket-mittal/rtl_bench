module autovcoder_017688 #(
    parameter ADDR = 10,
    WIDTH = 8,
    WORDS = 1024,
    WRITETHRU = 0,
    DEFAULT = {WIDTH{1'b1}},
    INIT_FILE = "NONE",
    INSTANCE_NAME = "U1"
) (
    input  wire               clk,
    input  wire               cs,
    input  wire               rd,
    input  wire               wr,
    input  wire [ ADDR-1 : 0] addr,
    input  wire [WIDTH-1 : 0] wdata,
    output reg  [WIDTH-1 : 0] rdata
);
  // Memory Array
  reg [WIDTH-1:0] mem[0:WORDS-1];
  // If used as Rom then load a memory image at startup
  initial begin
    if (INIT_FILE == "NONE") begin
    end else begin
      $readmemh(INIT_FILE, mem);
    end
  end

  // Write function   
  always @(posedge clk) if (wr && cs) mem[addr[ADDR-1:0]] <= wdata[WIDTH-1:0];
  generate
    if (WRITETHRU) begin
      // Read function gets new data if also a write cycle
      // latch the read addr for next cycle   
      reg [ADDR-1:0] l_raddr;
      reg            l_cycle;

      always @(posedge clk) begin
        l_raddr <= addr;
        l_cycle <= rd && cs;
      end

      // Read into a wire and then pass to rdata because some synth tools can't handle a memory in a always block
      wire [WIDTH-1:0] tmp_rdata;
      assign tmp_rdata = (l_cycle) ? mem[{l_raddr[ADDR-1:0]}] : DEFAULT;
      always @(*) rdata = tmp_rdata;
    end else begin
      // Read function gets old data if also a write cycle
      always @(posedge clk)
        if (rd && cs) rdata <= mem[{addr[ADDR-1:0]}];
        else rdata <= DEFAULT;
    end
  endgenerate
endmodule

