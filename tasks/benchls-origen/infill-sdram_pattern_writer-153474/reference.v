module origen_153474 #(
    parameter PATTERN_LENGTH = 16 // Length of the sample pattern
) (
    input clk,
    input resetn,
    input enable,
    input write_allowed,
    input read_allowed,
    input reads_pending,
    input writes_pending,
    output reg write_req,
    output reg read_req,
    output reg [127:0] write_data,
    output reg [31:0] address,
    output reg mode
);

  // Internal registers
  reg [3:0] sample_num;
  reg [15:0] w0, w1, w2, w3, w4, w5, w6, w7;

  // State machine states
  localparam IDLE = 2'b00, WRITING = 2'b01, RST_CNTR = 2'b10, READING = 2'b11;
  reg [1:0] state;

  // Sample pattern generation
  always @(posedge clk or negedge resetn) begin
    if (!resetn) begin
      w0 <= 16'h0123;
      w1 <= 16'h4567;
      w2 <= 16'h89ab;
      w3 <= 16'hcdef;
      w4 <= 16'h0fed;
      w5 <= 16'hcba9;
      w6 <= 16'h8765;
      w7 <= 16'h4321;
    end
    else begin
      if (sample_num == PATTERN_LENGTH - 1)
        sample_num <= 0;
      else
        sample_num <= sample_num + 1;

      w0 <= w0 + 1;
      w1 <= w1 + 1;
      w2 <= w2 + 1;
      w3 <= w3 + 1;
      w4 <= w4 + 1;
      w5 <= w5 + 1;
      w6 <= w6 + 1;
      w7 <= w7 + 1;
    end
  end

  // State machine
  always @(posedge clk or negedge resetn) begin
    if (!resetn) begin
      state <= IDLE;
      write_req <= 0;
      read_req <= 0;
      write_data <= 0;
      address <= 0;
      mode <= 0;
    end
    else begin
      case (state)
        IDLE: begin
          if (enable) state <= WRITING;
        end
        WRITING: begin
          if (write_allowed && !writes_pending) begin
            write_req <= 1;
            write_data <= {w0, w1, w2, w3, w4, w5, w6, w7};
            address <= sample_num * 8;
            mode <= 0;
          end
          else begin
            write_req <= 0;
          end
          if (sample_num == PATTERN_LENGTH - 1 && !writes_pending) begin
            state <= RST_CNTR;
          end
        end
        RST_CNTR: begin
          sample_num <= 0;
          state <= READING;
        end
        READING: begin
          if (read_allowed && !reads_pending) begin
            read_req <= 1;
            address <= sample_num * 8;
            mode <= 1;
          end
          else begin
            read_req <= 0;
          end
          if (sample_num == PATTERN_LENGTH - 1 && !reads_pending) begin
            state <= IDLE;
          end
        end
      endcase
    end
  end

endmodule