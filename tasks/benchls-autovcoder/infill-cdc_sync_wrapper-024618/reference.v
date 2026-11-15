module autovcoder_024618 (
    clk,
    sync,
    d,
    q
);

  parameter WIDTH = 1;

  // ------------------------------------------------------
  // port declaration
  // ------------------------------------------------------
  input clk;
  input sync;
  input [WIDTH-1:0] d;
  output [WIDTH-1:0] q;

  // -------------------------------------------
  // reg/wire declarations
  // ------------------------------------------------------

`ifdef ARM_CDC_CHECK

  wire             change;
  reg  [WIDTH-1:0] d_latch;
  wire [WIDTH-1:0] out;
  reg              p1;
  reg              p2;


  //Set the appropriate output based on sync
  assign q = (sync) ? d : out;

  //Latch to detect change on incoming data 
  always @(d) d_latch <= d;

  //Create delta cycle pulse to reset pipeline on change
  assign change = (d !== d_latch);

  //Pipeline is reset to 1s on any change in data
  //Data should be corrupted until the pipeline is clear
  always @(posedge clk or posedge change) begin
    if (change) begin
      p1 <= 1'b1;
      p2 <= 1'b1;
    end else begin
      p1 <= 1'b0;
      p2 <= p1;
    end
  end

  //Corrupt data while there is something in the pipeline 
  assign out = (p2) ? {WIDTH{1'bz}} : d;

`else

  assign q = d;

`endif
endmodule

