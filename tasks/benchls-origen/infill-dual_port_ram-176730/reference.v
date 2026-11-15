module origen_176730 #(
  parameter DATA_WIDTH = 8,
  parameter ADDR_WIDTH = 9,
  parameter OUTPUT_REG = "TRUE",
  parameter RAM_INIT_FILE = "",
  parameter RAM_INIT_RADIX = "HEX"
) (
  input wire [DATA_WIDTH-1:0] wdata,
  input wire [ADDR_WIDTH-1:0] waddr,
  input wire [ADDR_WIDTH-1:0] raddr,
  input wire we,
  input wire wclk,
  input wire re,
  input wire rclk,
  output reg [DATA_WIDTH-1:0] rdata
);

  // Declare the RAM
  reg [DATA_WIDTH-1:0] ram [0:(1<<ADDR_WIDTH)-1];

  // Initialize the RAM from a file, if specified
  initial begin
    if (RAM_INIT_FILE != "") begin
      $readmemh(RAM_INIT_FILE, ram, 0, (1<<ADDR_WIDTH)-1);
    end
  end

  // Write operation
  always @(posedge wclk) begin
    if (we) begin
      ram[waddr] <= wdata;
    end
  end

  // Read operation
  generate
    if (OUTPUT_REG == "TRUE") begin
      always @(posedge rclk) begin
        if (re) begin
          rdata <= ram[raddr];
        end
      end
    end else begin
      always @(*) begin
        if (re) begin
          rdata = ram[raddr];
        end else begin
          rdata = {DATA_WIDTH{1'b0}};
        end
      end
    end
  endgenerate

endmodule