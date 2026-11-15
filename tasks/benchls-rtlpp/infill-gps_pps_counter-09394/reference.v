module rtlpp_09394 (
  input                 clk,
  input                 rst,
  input                 gps_pps,

  input                 up_clk,
  input                 up_rstn,
  output  reg [31:0]    up_pps_rcounter,
  output  reg           up_pps_status,
  input                 up_irq_mask,
  output  reg           up_irq
);

  reg [2:0] gps_pps_m;
  reg [2:0] up_pps_m;
  reg up_pps_status_m;
  reg pps_toggle;
  reg [31:0] free_rcounter;
  reg [31:0] pps_rcounter;
  reg pps_status;

  wire pps_posedge_s;
  wire up_pps_posedge_s;

  // Initialize registers
  initial begin
    gps_pps_m = 3'b0;
    up_pps_m = 3'b0;
    up_pps_status_m = 1'b0;
    pps_toggle = 1'b0;
    free_rcounter = 32'b0;
    pps_rcounter = 32'b0;
    pps_status = 1'b0;
    up_pps_rcounter = 32'b0;
    up_pps_status = 1'b0;
    up_irq = 1'b0;
  end

  // Detect GPS PPS rising edge
  always @(posedge clk) begin
    if (rst) begin
      gps_pps_m <= 3'b0;
    end else begin
      gps_pps_m <= {gps_pps_m[1:0], gps_pps};
    end
  end
  assign pps_posedge_s = ~gps_pps_m[2] & gps_pps_m[1];

  // Free running counter and PPS counter capture
  always @(posedge clk) begin
    if (rst) begin
      free_rcounter <= 32'b0;
      pps_rcounter <= 32'b0;
      pps_status <= 1'b1;
    end else if (pps_posedge_s) begin
      free_rcounter <= 32'b0;
      pps_rcounter <= free_rcounter;
      pps_status <= 1'b0;
    end else begin
      free_rcounter <= free_rcounter + 1;
      if (free_rcounter[28]) begin
        pps_status <= 1'b1;
      end
    end
  end

  // Toggle PPS signal
  always @(posedge clk) begin
    if (rst) begin
      pps_toggle <= 1'b0;
    end else if (pps_posedge_s) begin
      pps_toggle <= ~pps_toggle;
    end
  end

  // Up clock operations
  always @(posedge up_clk) begin
    if (!up_rstn) begin
      up_pps_m <= 3'b0;
      up_pps_rcounter <= 32'b0;
      up_pps_status_m <= 1'b1;
      up_pps_status <= 1'b1;
    end else begin
      up_pps_m <= {up_pps_m[1:0], pps_toggle};
      up_pps_status_m <= pps_status;
      up_pps_status <= up_pps_status_m;
      if (up_pps_m[2] ^ up_pps_m[1]) begin
        up_pps_rcounter <= pps_rcounter;
      end
    end
  end
  assign up_pps_posedge_s = ~up_pps_m[2] & up_pps_m[1];

  // IRQ generation
  always @(posedge up_clk) begin
    if (!up_rstn) begin
      up_irq <= 1'b0;
    end else begin
      up_irq <= up_pps_posedge_s & ~up_irq_mask;
    end
  end

endmodule