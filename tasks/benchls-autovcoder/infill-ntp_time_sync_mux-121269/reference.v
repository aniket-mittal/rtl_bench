module autovcoder_121269 (
    input  wire        areset,
    input  wire        clk,
    input  wire        sel,
    input  wire [63:0] ntp_time_a,
    input  wire        ntp_time_upd_a,
    input  wire [63:0] ntp_time_b,
    input  wire        ntp_time_upd_b,
    output wire [63:0] ntp_time
);

  (* ASYNC_REG = "TRUE", SHIFT_EXTRACT = "NO" *)reg [2:0] time_a_sync_reg = 3'b0;
  (* ASYNC_REG = "TRUE", SHIFT_EXTRACT = "NO" *)reg [2:0] time_b_sync_reg = 3'b0;

  always @(posedge clk) time_a_sync_reg[0] <= ntp_time_upd_a;
  always @(negedge clk) time_a_sync_reg[1] <= time_a_sync_reg[0];
  always @(posedge clk) time_a_sync_reg[2] <= time_a_sync_reg[1];

  reg  [63:0] ntp_time_a_sync;
  wire        load_a_sync;
  assign load_a_sync = time_a_sync_reg[1] != time_a_sync_reg[2];
  always @(posedge clk) begin
    if (load_a_sync) begin
      ntp_time_a_sync <= ntp_time_a;
    end
  end

  always @(posedge clk) time_b_sync_reg[0] <= ntp_time_upd_b;
  always @(negedge clk) time_b_sync_reg[1] <= time_b_sync_reg[0];
  always @(posedge clk) time_b_sync_reg[2] <= time_b_sync_reg[1];

  reg  [63:0] ntp_time_b_sync;
  wire        load_b_sync;
  assign load_b_sync = time_b_sync_reg[1] != time_b_sync_reg[2];
  always @(posedge clk) begin
    if (load_b_sync) begin
      ntp_time_b_sync <= ntp_time_b;
    end
  end

  (* ASYNC_REG = "TRUE", SHIFT_EXTRACT = "NO" *) reg [1:0] sel_sync_reg = 2'b0;

  always @(posedge clk) begin
    sel_sync_reg[0] <= sel;
    sel_sync_reg[1] <= sel_sync_reg[0];
  end

  assign ntp_time = sel_sync_reg[1] == 1'b0 ? ntp_time_a_sync : ntp_time_b_sync;

  specify
    $setup(ntp_time_a, negedge load_a_sync, 5000);
    $setup(ntp_time_b, negedge load_b_sync, 5000);
    $hold(negedge load_a_sync, ntp_time_a, 2500);
    $hold(negedge load_a_sync, ntp_time_b, 2500);
  endspecify

endmodule

