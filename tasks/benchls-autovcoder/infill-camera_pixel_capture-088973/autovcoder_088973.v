module autovcoder_088973 (
    input wire RESETn,
    input wire PCLK,
    input wire VSYNC,
    input wire HREF,
    input wire [7:0] D,
    output wire [7:0] dout,
    output wire valid,
    input wire block,
    input wire wr_delay,
    output wire frame_done,
    input wire init_done
);

  localparam IDLE = 0;
  localparam READING = 1;
  //localparam WAIT = 2;

  reg [1:0] exec_state = IDLE;
  reg [7:0] data = 0, data_delay = 0;
  reg write = 0, write_delay = 0;
  reg done = 0, done_delay = 0;

  reg toggle = 0;
  wire [4:0] r, b;
  wire [2:0] g1, g2;

  /*
    assign r = D[7:3];
    assign g1 = D[2:0];
    assign g2 = D[7:5];
    assign b = D[4:0];
    */

  assign dout = data_delay;
  assign valid = write_delay;
  assign frame_done = done;

  initial begin
    write = 0;
    data = 0;
    data_delay = 0;
    write_delay = 0;
    done = 0;
    done_delay = 0;
    exec_state = IDLE;
  end

  reg ready = 0;

  //start collecting only after initialization
  always @(posedge PCLK) begin
    if (~RESETn) ready <= 0;
    else if (VSYNC & init_done & ~wr_delay) ready <= 1;
    else if (~init_done) ready <= 0;
  end

  /////////////////////////////FSM/////////////////////////////////
  [MASKED]
  /////////////////////////////////////////////////////////////////

  always @(posedge PCLK) begin
    if (~RESETn) begin
      data_delay  <= 8'b0;
      write_delay <= 0;
      done_delay  <= 0;
    end else begin
      data_delay  <= data;
      write_delay <= write;
      done_delay  <= done;
    end
  end

  /*
    always @(posedge PCLK) begin
        if(VSYNC) toggle <= 0;
        else if(HREF) toggle <= ~toggle;
    end
    */

endmodule

