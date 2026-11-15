module autovcoder_032051 (
    input wire clk,
    input wire reset,
    input wire enable,
    input wire [31:0] din,
    output reg power_select
);

  reg [31:0] counter;

  // state machine
  parameter [2:0] STATE_IDLE = 2'd0;
  parameter [2:0] STATE_RUNNING = 2'd1;
  parameter [2:0] STATE_DONE = 2'd2;

  reg [2:0] state = STATE_IDLE;


  always @(posedge clk) begin
    state <= state;
    counter <= counter;
    power_select <= 1'b0;

    if (reset) begin
      state <= STATE_IDLE;
    end

    case (state)
      // IDLE state
      STATE_IDLE: begin
        if (enable) begin
          // reset counter to duration counter value
          counter <= din;
          state   <= STATE_RUNNING;
        end
      end

      // RUNNING state
      STATE_RUNNING: begin
        // activate power selection line
        power_select <= 1'b1;

        // decrease counter
        counter <= counter - 1'b1;

        if (counter == 1) begin
          state <= STATE_DONE;
        end
      end

      // DONE_STATE
      STATE_DONE: begin
        state <= STATE_IDLE;
      end
    endcase
  end

endmodule

