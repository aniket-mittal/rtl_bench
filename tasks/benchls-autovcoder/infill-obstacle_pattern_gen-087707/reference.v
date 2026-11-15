module autovcoder_087707 (
    unit_clk,
    reset,
    gap,
    spawn_obstacle_7,
    spawn_obstacle_6,
    spawn_obstacle_5,
    spawn_obstacle_4,
    spawn_obstacle_3
    , spawn_obstacle_2,
    spawn_obstacle_1,
    spawn_obstacle_0
);

  input unit_clk;
  input reset;
  input [1:0] gap;
  output reg [1:0] spawn_obstacle_7;
  output reg [1:0] spawn_obstacle_6;
  output reg [1:0] spawn_obstacle_5;
  output reg [1:0] spawn_obstacle_4;
  output reg [1:0] spawn_obstacle_3;
  output reg [1:0] spawn_obstacle_2;
  output reg [1:0] spawn_obstacle_1;
  output reg [1:0] spawn_obstacle_0;
  reg [2:0] ran;

  always @(posedge unit_clk, negedge reset) begin
    if (!reset) begin
      spawn_obstacle_0 <= 2'b00;
      spawn_obstacle_1 <= 2'b00;
      spawn_obstacle_2 <= 2'b00;
      spawn_obstacle_3 <= 2'b00;
      spawn_obstacle_4 <= 2'b00;
      spawn_obstacle_5 <= 2'b00;
      spawn_obstacle_6 <= 2'b00;
      spawn_obstacle_7 <= 2'b00;
    end else begin
      spawn_obstacle_0 <= 2'b01;
      spawn_obstacle_1 <= 2'b01;
      spawn_obstacle_2 <= 2'b11;
      spawn_obstacle_3 <= 2'b00;
      spawn_obstacle_4 <= 2'b00;
      spawn_obstacle_5 <= 2'b11;
      spawn_obstacle_6 <= 2'b01;
      spawn_obstacle_7 <= 2'b01;
    end
  end
endmodule

