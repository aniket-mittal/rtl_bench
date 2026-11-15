module autovcoder_094261 (
    // -- PS/2 input
    input ps2_clk,
    input ps2_data,

    // -- asynchronous reset
    input res,

    // -- data is valid when ready goes high
    output reg ready = 0,
    output reg error = 0,
    output reg [7:0] data
);

  `define BIT_START 0
  `define BIT_DATA_LSB 1
  `define BIT_DATA_MSB 8
  `define BIT_PARITY 9
  `define BIT_STOP 10

  reg  [10:0] buffer = 0;
  wire [10:0] buffer_next = {ps2_data, buffer[10:1]};
  reg  [ 3:0] state = 0;

  always @(negedge ps2_clk or posedge res)
    if (res) begin
      state <= 0;
      ready <= 0;
      error <= 0;
    end else begin
      if (state == 10) begin
        // We have everything include stop and parity. See if everything checks out
        if (!buffer_next[`BIT_START] && buffer_next[`BIT_STOP] && ^buffer_next[`BIT_PARITY:`BIT_DATA_LSB]) begin
          ready <= 1;
        end else begin
          error <= 1;
        end
        state <= 0;
      end else begin
        if (state == 8) begin
          // We have received all the data bits, assign them to the output register
          data <= buffer_next[10:3];
        end
        ready <= 0;
        error <= 0;
        state <= state + 1'd1;
      end
      buffer <= buffer_next;
    end

endmodule

