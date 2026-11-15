module origen_136485
   (clk_50MHz,
    clk_100MHz,
    clk_193MHz,
    locked);
  input clk_50MHz;
  output clk_100MHz;
  output clk_193MHz;
  output locked;

(* IBUF_LOW_PWR *)   wire clk_50MHz;
  wire clk_100MHz;
  wire clk_193MHz;
  wire locked;

  reg [1:0] counter_100MHz = 2'b00;
  reg [2:0] counter_193MHz = 3'b000;
  reg clk_100MHz_reg = 1'b0;
  reg clk_193MHz_reg = 1'b0;
  reg locked_reg = 1'b0;
  reg [7:0] lock_counter = 8'b0;

  // Generate 100MHz clock
  always @(posedge clk_50MHz) begin
    counter_100MHz <= counter_100MHz + 1;
    if (counter_100MHz == 2'b01) begin
      clk_100MHz_reg <= ~clk_100MHz_reg;
      counter_100MHz <= 2'b00;
    end
  end

  // Generate 193MHz clock
  always @(posedge clk_100MHz_reg) begin
    counter_193MHz <= counter_193MHz + 1;
    if (counter_193MHz == 3'b010) begin
      clk_193MHz_reg <= ~clk_193MHz_reg;
      counter_193MHz <= 3'b000;
    end
  end

  // Generate locked signal
  always @(posedge clk_50MHz) begin
    if (lock_counter < 8'd255) begin
      lock_counter <= lock_counter + 1;
      locked_reg <= 1'b0;
    end else begin
      locked_reg <= 1'b1;
    end
  end

  assign clk_100MHz = clk_100MHz_reg;
  assign clk_193MHz = clk_193MHz_reg;
  assign locked = locked_reg;

endmodule