module autovcoder_072477 #(
    parameter N = 8  // data width
) (
    // system signals
    input  wire         sclk,
    input  wire         reset,
    // slave side
    input  wire [N-1:0] s_data,
    input  wire         s_valid,
    output wire         s_ready,
    // master side
    output wire [N-1:0] m_data,
    output wire         m_valid,
    input  wire         m_ready,
    output reg  [  1:0] num_data_valid
);
  //------------------------Parameter----------------------
  // state
  localparam [1:0] ZERO = 2'b10, ONE = 2'b11, TWO = 2'b01;
  //------------------------Local signal-------------------
  reg  [N-1:0] data_p1;
  reg  [N-1:0] data_p2;
  wire         load_p1;
  wire         load_p2;
  wire         load_p1_from_p2;
  reg          s_ready_t;
  reg  [  1:0] state;
  reg  [  1:0] next;
  //------------------------Body---------------------------
  assign s_ready = s_ready_t;
  assign m_data = data_p1;
  assign m_valid = state[0];

  assign load_p1 = (state == ZERO && s_valid) ||
                 (state == ONE && s_valid && m_ready) ||
                 (state == TWO && m_ready);
  assign load_p2 = s_valid & s_ready;
  assign load_p1_from_p2 = (state == TWO);

  // data_p1
  always @(posedge sclk) begin
    if (load_p1) begin
      if (load_p1_from_p2) data_p1 <= data_p2;
      else data_p1 <= s_data;
    end
  end

  // data_p2
  always @(posedge sclk) begin
    if (load_p2) data_p2 <= s_data;
  end

  // num_data_valid
  always @(posedge sclk) begin
    if (reset) num_data_valid <= 2'b00;
    else if (next == ONE) num_data_valid <= 2'b01;
    else if (next == TWO) num_data_valid <= 2'b10;
    else num_data_valid <= 2'b00;
  end

  // s_ready_t
  always @(posedge sclk) begin
    if (reset) s_ready_t <= 1'b0;
    else if (state == ZERO) s_ready_t <= 1'b1;
    else if (state == ONE && next == TWO) s_ready_t <= 1'b0;
    else if (state == TWO && next == ONE) s_ready_t <= 1'b1;
  end

  // state
  always @(posedge sclk) begin
    if (reset) state <= ZERO;
    else state <= next;
  end

  // next
  always @(*) begin
    case (state)
      ZERO:
      if (s_valid & s_ready) next = ONE;
      else next = ZERO;
      ONE:
      if (~s_valid & m_ready) next = ZERO;
      else if (s_valid & ~m_ready) next = TWO;
      else next = ONE;
      TWO:
      if (m_ready) next = ONE;
      else next = TWO;
      default: next = ZERO;
    endcase
  end

endmodule

