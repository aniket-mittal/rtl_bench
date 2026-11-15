module autovcoder_020725 (
    clock,  // Clock
    reset,  // Active high reset
    req_0,  // Active high request from agent 0
    req_1,  // Active high request from agent 1
    req_2,  // Active high request from agent 2
    req_3,  // Active high request from agent 3
    gnt_0,  // Active high grant to agent 0
    gnt_1,  // Active high grant to agent 1
    gnt_2,  // Active high grant to agent 2
    gnt_3  // Active high grant to agent 3
);
  // Port declaration here
  input clock;  // Clock
  input reset;  // Active high reset
  input req_0;  // Active high request from agent 0
  input req_1;  // Active high request from agent 1
  input req_2;  // Active high request from agent 2
  input req_3;  // Active high request from agent 3
  output gnt_0;  // Active high grant to agent 0
  output gnt_1;  // Active high grant to agent 1
  output gnt_2;  // Active high grant to agent 2
  output gnt_3;  // Active high grant to agent 

  // Internal Variables
  reg gnt_0;  // Active high grant to agent 0
  reg gnt_1;  // Active high grant to agent 1
  reg gnt_2;  // Active high grant to agent 2
  reg gnt_3;  // Active high grant to agent 

  parameter [2:0] IDLE = 3'b000;
  parameter [2:0] GNT0 = 3'b001;
  parameter [2:0] GNT1 = 3'b010;
  parameter [2:0] GNT2 = 3'b011;
  parameter [2:0] GNT3 = 3'b100;

  reg [2:0] state, next_state;

  [MASKED]

  always @(posedge clock) begin : OUTPUT_LOGIC
    if (reset) begin
      gnt_0 <= 1'b0;
      gnt_1 <= 1'b0;
      gnt_2 <= 1'b0;
      gnt_3 <= 1'b0;
      state <= IDLE;
    end else begin
      state <= next_state;
      case (state)
        IDLE: begin
          gnt_0 <= 1'b0;
          gnt_1 <= 1'b0;
          gnt_2 <= 1'b0;
          gnt_3 <= 1'b0;
        end
        GNT0: begin
          gnt_0 <= 1'b1;
        end
        GNT1: begin
          gnt_1 <= 1'b1;
        end
        GNT2: begin
          gnt_2 <= 1'b1;
        end
        GNT3: begin
          gnt_3 <= 1'b1;
        end
        default: begin
          state <= IDLE;
        end
      endcase
    end
  end

endmodule

