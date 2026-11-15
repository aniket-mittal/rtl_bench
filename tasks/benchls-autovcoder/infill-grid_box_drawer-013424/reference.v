module autovcoder_013424 (
    clk,
    done,
    load_p,
    reset,
    start_x,
    start_y,
    bg_colour,
    fg_colour,
    x_pos,
    y_pos,
    colour_out,
    draw
);
  // this module can draw a box of any size based on input. Largest box we may need is 25x25,
  // so the pixel counter size never needs more than 6 bits

  input clk;
  input load_p;
  input reset;

  input [7:0] start_x;
  input [6:0] start_y;
  input [2:0] bg_colour;
  input [2:0] fg_colour;

  // this is passed into the module which draws the pixel on the screen
  output reg [7:0] x_pos;
  output reg [6:0] y_pos;
  output reg [2:0] colour_out;
  output reg draw;

  // this signals when the module finished drawing the current grid to the screen
  output reg done = 1'b0;

  // registers we will use for internal computations:
  reg [4:0] x_incr;
  reg [4:0] y_incr;

  reg [1:0] curr_state = WAIT;
  reg [1:0] next_state = WAIT;
  reg wait_one_cycle;
  parameter WAIT = 2'b00, INCREMENT = 2'b01, DONE = 2'b11;

  // this determines the next state
  always @(*) begin
    case (curr_state)
      WAIT: next_state = load_p ? INCREMENT : WAIT;
      // if both x and y counter reached 0, we are done drawing the grid
      INCREMENT: next_state = ((x_incr == 5'b00000) && (y_incr == 5'b00000)) ? DONE : INCREMENT;
      DONE: next_state = WAIT;
    endcase
  end

  // what to do at each state
  always @(posedge clk) begin : state_table
    case (curr_state)

      WAIT: begin
        done   <= 1'b0;
        // each counter starts at 25: each grid is 25x25 pixels
        x_incr <= 5'b11001;
        y_incr <= 5'b11001;
      end

      INCREMENT: begin
        done  <= 1'b0;
        x_pos <= start_x + {3'b000, x_incr[4:0]};
        y_pos <= start_y + {2'b00, y_incr[4:0]};

        if (wait_one_cycle == 1'b1) begin
          wait_one_cycle = 1'b0;
          draw <= 1'b0;
        end else begin
          // go through first row of x, then second row, ... etc
          if (x_incr == 5'b00000) begin
            x_incr <= 5'b11001;
            y_incr <= y_incr - 5'b0001;
          end else x_incr <= x_incr - 5'b0001;
        end

        // logic for colour_out: if 5<= x,y <= 19 => drawing fg, else drawing bg
        if ((x_incr >= 5'b00101) && (x_incr <= 5'b10011) && (y_incr >= 5'b00101) && (y_incr <= 5'b10011))
          colour_out <= fg_colour;
        //colour_out <= 3'b100;
        else
          colour_out <= bg_colour;
        //colour_out <= 3'b010;
        draw <= 1'b1;
      end

      DONE: done <= 1'b1;

    endcase
  end

  always @(posedge clk) begin
    curr_state = next_state;
  end

endmodule

