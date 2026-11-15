module autovcoder_093834 (
    input clk,
    input reset_n,
    input start,
    output cal_mul,
    add,
    end_add,
    mul,
    end_mul,
    output reg done
);
  localparam IDLE = 0, CALMUL = 1, ADD = 2, END_ADD = 3, MUL = 4, END_MUL = 5;

  reg [2:0] current_state, next_state;

  assign cal_mul = (current_state == CALMUL);
  assign add = (current_state == ADD);
  assign end_add = (current_state == END_ADD);
  assign mul = (current_state == MUL);
  assign end_mul = (current_state == END_MUL);

  reg done_reg;
  always @(*) begin
    done_reg = 0;
    case (current_state)
      IDLE: next_state = start ? CALMUL : IDLE;
      CALMUL: next_state = ADD;
      ADD: next_state = END_ADD;
      END_ADD: next_state = MUL;
      MUL: next_state = END_MUL;
      END_MUL: begin
        done_reg   = 1;
        next_state = IDLE;
      end
      default: next_state = IDLE;
    endcase
  end
  always @(posedge clk, negedge reset_n) begin
    if (~reset_n) begin
      current_state <= IDLE;
      done <= 0;
    end else begin
      current_state <= next_state;
      done <= done_reg;
    end
  end
endmodule

