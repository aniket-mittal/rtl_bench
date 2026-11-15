module rtlpp_05815 (
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

  reg   [ 2:0]    gps_pps_m = 3'b000;
  reg   [ 2:0]    up_pps_m = 3'b000;
  reg             up_pps_status_m = 1'b0;
  reg             pps_toggle = 1'b0;
  reg   [31:0]    free_rcounter = 32'b0;
  reg   [31:0]    pps_rcounter = 32'b0;
  reg             pps_status = 1'b0;

  wire            pps_posedge_s;
  wire            up_pps_posedge_s;

  always @(posedge clk) begin
    if (rst == 1'b1) begin
      gps_pps_m <= 3'b0;
    end else begin
      gps_pps_m <= {gps_pps_m[1:0], gps_pps};
    end
  end
  assign pps_posedge_s = ~gps_pps_m[2] & gps_pps_m[1];

  always @(posedge clk) begin
    if (rst == 1'b1) begin
      free_rcounter <= 32'b0;
      pps_rcounter <= 32'b0;
      pps_status <= 1'b1;
    end else if (pps_posedge_s == 1'b1) begin
      free_rcounter <= 32'b0;
      pps_rcounter <= free_rcounter;
      pps_status <= 1'b0;
    end else begin
      free_rcounter <= free_rcounter + 32'b1;
      if (free_rcounter[28] == 1'b1) begin
        pps_status <= 1'b1;
      end
    end
  end

  always @(posedge clk) begin
    if (rst == 1'b1) begin
      pps_toggle <= 1'b0;
    end else if (pps_posedge_s == 1'b1) begin
      pps_toggle <= ~pps_toggle;
    end
  end

  always @(posedge up_clk) begin
    if (up_rstn == 1'b0) begin
      up_pps_m <= 3'b0;
      up_pps_rcounter <= 32'b0;
      up_pps_status_m <= 1'b1;
      up_pps_status <= 1'b1;
    end else begin
      up_pps_m <= {up_pps_m[1:0], pps_toggle};
      up_pps_status_m <= pps_status;
      up_pps_status <= up_pps_status_m;
      if ((up_pps_m[2] ^ up_pps_m[1]) == 1'b1) begin
        up_pps_rcounter <= pps_rcounter;
      end
    end
  end
  assign up_pps_posedge_s = ~up_pps_m[2] & up_pps_m[1];

  always @(posedge up_clk) begin
    if (up_rstn == 1'b0) begin
      up_irq <= 1'b0;
    end else begin
      up_irq <= up_pps_posedge_s & ~up_irq_mask;
    end
  end

endmodule