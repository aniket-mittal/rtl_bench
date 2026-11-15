module autovcoder_121703 (
    // global signals
    clk,
    rst_n,
    // input signals
    in_valid,
    in_data,
    curr_mode,
    // output signals
    out_valid,
    out_dist
);

  //================================================================
  //  Parameter and Integer                 
  //================================================================
  parameter IDLE = 4'd0;
  parameter FILL = 4'd1;
  parameter OP = 4'd2;
  parameter DONE = 4'd3;
  integer i;
  //================================================================
  //  INPUT AND OUTPUT DECLARATION                         
  //================================================================
  input clk;
  input rst_n;
  input in_valid;
  input [15:0] in_data;
  input [1:0] curr_mode;
  output reg out_valid;
  output reg [7:0] out_dist;
  //================================================================
  //  Reg and Wire                   
  //================================================================
  reg [3:0] state_cs, state_ns;
  reg [8:0] counter;
  reg [10:0] win_val;
  reg [10:0] max_win_val;
  reg [4:0] shift_reg[0:3];
  wire fill_done;
  wire op_done;
  assign fill_done = counter == 5;
  assign op_done   = counter == 256;
  //================================================================
  //  FSM                      
  //================================================================
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) state_cs <= IDLE;
    else state_cs <= state_ns;
  end

  always @(*) begin
    case (state_cs)
      IDLE: state_ns = in_valid ? FILL : IDLE;
      FILL: state_ns = fill_done ? OP : FILL;
      OP: state_ns = op_done ? DONE : OP;
      DONE: state_ns = IDLE;
      default: state_ns = state_cs;
    endcase
  end
  //================================================================
  //  Design                     
  //================================================================
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) counter <= 0;
    else if (state_ns == IDLE) counter <= 0;
    else if (state_ns == FILL || state_ns == OP) counter <= counter + 1;
  end

  reg [3:0] in_data_reg[0:3];
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) for (i = 0; i < 4; i = i + 1) in_data_reg[i] <= 0;
    else if (state_ns == FILL || state_ns == OP) begin
      in_data_reg[0] <= in_data[3:0];
      in_data_reg[1] <= in_data[7:4];
      in_data_reg[2] <= in_data[11:8];
      in_data_reg[3] <= in_data[15:12];
    end
  end

  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) for (i = 0; i < 4; i = i + 1) shift_reg[i] <= 0;
    else if (state_ns == IDLE) for (i = 0; i < 4; i = i + 1) shift_reg[i] <= 0;
    else if (state_ns == FILL || state_ns == OP) begin
      shift_reg[0] <= shift_reg[1];
      shift_reg[1] <= shift_reg[2];
      shift_reg[2] <= shift_reg[3];
      shift_reg[3] <= in_data_reg[0] + in_data_reg[1] + in_data_reg[2] + in_data_reg[3];
    end
  end
  always @(*) begin
    if (state_ns == FILL || state_ns == OP) begin
      if (curr_mode == 0 || curr_mode == 1)
        win_val = shift_reg[0]+shift_reg[2]+in_data_reg[0]+in_data_reg[1]+in_data_reg[2]+in_data_reg[3];
      else
        win_val = shift_reg[0]+shift_reg[1]*16+shift_reg[2]*9+shift_reg[3]*4+in_data_reg[0]+in_data_reg[1]+in_data_reg[2]+in_data_reg[3];
    end else win_val = 0;
  end

  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) max_win_val <= 0;
    else if (state_ns == IDLE) max_win_val <= 0;
    else if (state_ns == OP && win_val > max_win_val) max_win_val <= win_val;
  end

  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) out_dist <= 1;
    else if (state_ns == IDLE) out_dist <= 1;

    else if (state_ns == OP && win_val > max_win_val) out_dist <= counter - 4;
    // to avoid large distribute
    else if (state_ns == OP && win_val == max_win_val) out_dist <= (out_dist + counter - 4) / 2;

  end

  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) out_valid <= 0;
    else if (state_ns == IDLE) out_valid <= 0;
    else if (state_ns == DONE) out_valid <= 1;
  end

endmodule

