module autovcoder_017668 (
    clock,
    reset,
    data,
    out0,
    out1,
    out2,
    out3,
    out4,
    out5,
    ledr
);

  // inputs
  input clock;
  input reset;
  input [3:0] data;

  // outputs
  output reg [3:0] out0;
  output reg [3:0] out1;
  output reg [3:0] out2;
  output reg [3:0] out3;
  output reg [3:0] out4;
  output reg [3:0] out5;
  output [2:0] ledr;

  // regs
  reg [3:0] shift_reg                       [5:0];  // for shift numbers
  reg [3:0] memory;  // for save input data
  reg [3:0] state;  // for save the states
  reg [2:0] counter;  // for counting tackts

  // assigns
  assign ledr = counter;

  // states
  parameter RESET = 0;  // start program
  parameter WAIT = 1;  // wait to input data
  parameter OUTPUT = 2;  // display numbers
  parameter READ = 3;  // reads numbers on switchers
  parameter SHIFT = 4;  // shift numbers

  // block of transitions
  always @(posedge clock or negedge reset) begin
    if (!reset) begin
      state <= RESET;  // state: 0
    end else begin
      case (state)
        RESET: state <= WAIT;  // state: 1

        WAIT:
        if (counter == 3'd2) begin
          state <= OUTPUT;  // state: 2
        end

        OUTPUT:
        if (counter == 3'd4) begin
          state <= READ;  // state: 3
        end

        READ:
        if (counter == 3'd6) begin
          state <= SHIFT;  // state: 4
        end

        SHIFT:
        if (counter == 3'd7) begin
          state <= WAIT;  // state: 2
        end
      endcase
    end
  end

  // block of states
  [MASKED]
endmodule

