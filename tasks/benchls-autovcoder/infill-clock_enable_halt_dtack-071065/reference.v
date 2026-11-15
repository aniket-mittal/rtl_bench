module autovcoder_071065 #(
    parameter W = 5,
    RECOVERY = 1,
    WD = 6,
    MFREQ = 48_000  // clk input frequency in kHz
) (
    input              rst,
    input              clk,
    output reg         cpu_cen,
    output reg         cpu_cenb,
    input              bus_cs,
    input              bus_busy,
    input              bus_legit,
    input              ASn,        // DTACKn set low at the next cpu_cen after ASn goes low
    input      [  1:0] DSn,        // If DSn goes high, DTACKn is reset high
    input      [W-2:0] num,        // numerator
    input      [W-1:0] den,        // denominator
    input              wait2,      // high for 2 wait states
    input              wait3,      // high for 3 wait states

    output reg        DTACKn,
    output reg [15:0] fave,    // average cpu_cen frequency in kHz
    output reg [15:0] fworst,  // average cpu_cen frequency in kHz
    input             frst
);
  /* verilator lint_off WIDTH */

  localparam CW = W + WD;

  reg  [CW-1:0] cencnt = 0;
  reg  [   2:0] wait1;
  wire          halt;
  wire [ W-1:0] num2 = {num, 1'b0};  // num x 2
  wire          over = cencnt > den - num2;
  reg  [  CW:0] cencnt_nx;
  reg           risefall = 0;

  assign halt = RECOVERY == 1 && !ASn && wait1 == 0 && (bus_cs && bus_busy && !bus_legit);

  always @(posedge clk) begin : dtack_gen
    if (rst) begin
      DTACKn <= 1;
      wait1  <= 3'b111;
    end else begin
      if (ASn | &DSn) begin  // DSn is needed for read-modify-write cycles
        // performed on the SDRAM. Just checking the DSn rising edge
        // is not enough on Rastan
        DTACKn <= 1;
        wait1  <= 3'b111;
      end else if (!ASn) begin
        if (cpu_cen) begin
          case ({
            wait3, wait2
          })
            0: wait1 <= 0;
            1: wait1 <= {2'b0, wait1[1]};
            2, 3: wait1 <= {1'b0, wait1[2:1]};
          endcase
        end
        if (wait1 == 0 && (!bus_cs || (bus_cs && !bus_busy))) begin
          DTACKn <= 0;
        end
      end
    end
  end

  always @* begin
    cencnt_nx = over && !halt ? {1'b0, cencnt} + num2 - den : {1'b0, cencnt} + num2;
  end

  always @(posedge clk) begin
    cencnt <= cencnt_nx[CW] ? {CW{1'b1}} : cencnt_nx[CW-1:0];
    if (over && !halt) begin
      cpu_cen  <= risefall;
      cpu_cenb <= ~risefall;
      risefall <= ~risefall;
    end else begin
      cpu_cen  <= 0;
      cpu_cenb <= 0;
    end
    // aux <= cpu_cen; // forces a blank after cpu_cen,
    // so the shortest sequence is cpu_cen, blank, cpu_cenb
    // note that cpu_cen can follow cpu_cenb without a blank
  end
  /* verilator lint_on WIDTH */

  // Frequency reporting
  reg [15:0] freq_cnt = 0, fout_cnt;
  initial fworst = 16'hffff;

  always @(posedge clk) begin
    freq_cnt <= freq_cnt + 1'd1;
    if (cpu_cen) fout_cnt <= fout_cnt + 1'd1;
    if (freq_cnt == MFREQ - 1) begin  // updated every 1ms
      freq_cnt <= 0;
      fout_cnt <= 0;
      fave <= fout_cnt;
      if (fworst > fout_cnt) fworst <= fout_cnt;
    end
    if (frst) fworst <= 16'hffff;
  end

endmodule

