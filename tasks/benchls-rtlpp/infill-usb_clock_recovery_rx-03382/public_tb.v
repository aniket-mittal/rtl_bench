// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 5;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_03382 dut (
    .clk(clk),
    .reset(in_vec[4:4]),
    .usb_dif(in_vec[3:3]),
    .usb_dp(in_vec[2:2]),
    .usb_dn(in_vec[1:1]),
    .rx_en(in_vec[0:0]),
    .linestate(out_vec[15:14]),
    .clk_recovered(out_vec[13:13]),
    .clk_recovered_edge(out_vec[12:12]),
    .rawdata(out_vec[11:11]),
    .rx_active(out_vec[10:10]),
    .rx_error(out_vec[9:9]),
    .valid(out_vec[8:8]),
    .data(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 5'h1b;
    stim[1] = 5'h1f;
    stim[2] = 5'h08;
    stim[3] = 5'h0d;
    stim[4] = 5'h00;
    stim[5] = 5'h07;
    stim[6] = 5'h08;
    stim[7] = 5'h08;
    stim[8] = 5'h06;
    stim[9] = 5'h07;
    stim[10] = 5'h09;
    stim[11] = 5'h0c;
    stim[12] = 5'h04;
    stim[13] = 5'h07;
    stim[14] = 5'h05;
    stim[15] = 5'h0c;
    stim[16] = 5'h04;
    stim[17] = 5'h00;
    stim[18] = 5'h0d;
    stim[19] = 5'h0c;
    stim[20] = 5'h04;
    stim[21] = 5'h0a;
    stim[22] = 5'h0c;
    stim[23] = 5'h02;
    stim[24] = 5'h08;
    stim[25] = 5'h01;
    stim[26] = 5'h09;
    stim[27] = 5'h08;
    stim[28] = 5'h0a;
    stim[29] = 5'h1e;
    stim[30] = 5'h03;
    stim[31] = 5'h02;
    stim[32] = 5'h07;
    stim[33] = 5'h0d;
    stim[34] = 5'h08;
    stim[35] = 5'h0b;
    stim[36] = 5'h08;
    stim[37] = 5'h0d;
    stim[38] = 5'h02;
    stim[39] = 5'h05;
    stim[40] = 5'h03;
    stim[41] = 5'h09;
    stim[42] = 5'h0e;
    stim[43] = 5'h0c;
    stim[44] = 5'h0e;
    stim[45] = 5'h08;
    stim[46] = 5'h04;
    stim[47] = 5'h0b;
    stim[48] = 5'h01;
    stim[49] = 5'h01;
    stim[50] = 5'h08;
    stim[51] = 5'h09;
    stim[52] = 5'h0b;
    stim[53] = 5'h0c;
    stim[54] = 5'h0d;
    stim[55] = 5'h05;
    stim[56] = 5'h0e;
    stim[57] = 5'h00;
    stim[58] = 5'h09;
    stim[59] = 5'h07;
    stim[60] = 5'h03;
    stim[61] = 5'h04;
    stim[62] = 5'h07;
    stim[63] = 5'h0f;
    for (c = 0; c < N; c = c + 1) begin
      #1 in_vec = stim[c];
      #3 sample;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 16'hxxxx;
      expv[1] = 16'hxxxx;
      expv[2] = 16'hxxxx;
      expv[3] = 16'hxxxx;
      expv[4] = 16'hxxxx;
      expv[5] = 16'hxxxx;
      expv[6] = 16'hxxxx;
      expv[7] = 16'hxxxx;
      expv[8] = 16'h0xxx;
      expv[9] = 16'hcxxx;
      expv[10] = 16'hcxxx;
      expv[11] = 16'h3xxx;
      expv[12] = 16'h60xx;
      expv[13] = 16'h60xx;
      expv[14] = 16'he0xx;
      expv[15] = 16'h50xx;
      expv[16] = 16'h40xx;
      expv[17] = 16'h40xx;
      expv[18] = 16'h00xx;
      expv[19] = 16'h70xx;
      expv[20] = 16'h50xx;
      expv[21] = 16'h40xx;
      expv[22] = 16'h80xx;
      expv[23] = 16'h40xx;
      expv[24] = 16'h80xx;
      expv[25] = 16'h00xx;
      expv[26] = 16'h00xx;
      expv[27] = 16'h00xx;
      expv[28] = 16'h00xx;
      expv[29] = 16'h80xx;
      expv[30] = 16'hc0xx;
      expv[31] = 16'h80xx;
      expv[32] = 16'h80xx;
      expv[33] = 16'hc0xx;
      expv[34] = 16'h70xx;
      expv[35] = 16'h10xx;
      expv[36] = 16'h80xx;
      expv[37] = 16'h30xx;
      expv[38] = 16'h60xx;
      expv[39] = 16'ha0xx;
      expv[40] = 16'h60xx;
      expv[41] = 16'h90xx;
      expv[42] = 16'h30xx;
      expv[43] = 16'he0xx;
      expv[44] = 16'h60xx;
      expv[45] = 16'he0xx;
      expv[46] = 16'h10xx;
      expv[47] = 16'h40xx;
      expv[48] = 16'h80xx;
      expv[49] = 16'h00xx;
      expv[50] = 16'h00xx;
      expv[51] = 16'h00xx;
      expv[52] = 16'h00xx;
      expv[53] = 16'h80xx;
      expv[54] = 16'h70xx;
      expv[55] = 16'h60xx;
      expv[56] = 16'h60xx;
      expv[57] = 16'hd0xx;
      expv[58] = 16'h00xx;
      expv[59] = 16'h00xx;
      expv[60] = 16'hc0xx;
      expv[61] = 16'hb0xx;
      expv[62] = 16'h60xx;
      expv[63] = 16'he0xx;
      mismatches = 0;
      shown = 0;
      for (c = 0; c < N; c = c + 1) begin
        bad = 0;
        for (b = 0; b < OW; b = b + 1)
          if (expv[c][b] !== 1'bx && act[c][b] !== expv[c][b]) bad = 1;
        if (bad) begin
          mismatches = mismatches + 1;
          if (shown < 10) begin
            $display("MISMATCH cycle %0d: inputs=%h expected=%h got=%h", c, stim[c], expv[c], act[c]);
            shown = shown + 1;
          end
        end
      end
      if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
      else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    end
    $finish;
  end
endmodule
