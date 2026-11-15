module adrv9001_pack #(
  parameter WIDTH = 8
) (
  input                      clk,    // Input clock
  input                      rst,
  input                      sof,    // Start of frame indicator marking the MS Beat
  input       [WIDTH-1:0]    idata,  // Input data beat
  input                      ivalid, // Input data qualifier
  output reg  [WIDTH*2-1:0]  odata,  // Output data beat
  output reg                 ovalid, // Output data qualifier
  output reg                 osof    // Output Start of frame indicator
);

  reg  [WIDTH-1:0] idata_d = {WIDTH{1'b0}};
  always @(posedge clk) begin
    if (ivalid) begin
      idata_d <= idata;
    end
  end

  // Single clock mode:
  reg [6:0] sof_d = 7'b000;
  // Use sof_d[2] for frame size of 4 beats
  // Use sof_d[4,6] for frame size of 8 beats
  always @(posedge clk) begin
    if (rst) begin
      sof_d <= 7'b0;
    end else if (ivalid) begin
      sof_d <= {sof_d[5:0],sof};
    end
    if (ivalid &(sof_d[0] | sof_d[2] | sof_d[4] | sof_d[6])) begin
      odata <= {idata_d,idata};
    end
    ovalid <= ivalid & (sof_d[0] | sof_d[2] | sof_d[4] | sof_d[6]);
    osof <= ivalid & sof_d[0];
  end

endmodule