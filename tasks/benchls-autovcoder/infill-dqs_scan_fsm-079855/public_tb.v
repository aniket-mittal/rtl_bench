// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 29;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_079855 dut (
    .clk(clk),
    .samp_done(in_vec[11:11]),
    .phy_rddata_en_2(in_vec[10:10]),
    .reset_scan(in_vec[9:9]),
    .scanning_right(in_vec[8:8]),
    .samp_result(in_vec[7:6]),
    .stg3(in_vec[5:0]),
    .scan_right(out_vec[28:28]),
    .z2f(out_vec[27:27]),
    .f2z(out_vec[26:26]),
    .o2f(out_vec[25:25]),
    .f2o(out_vec[24:24]),
    .zero2fuzz(out_vec[23:18]),
    .fuzz2zero(out_vec[17:12]),
    .oneeighty2fuzz(out_vec[11:6]),
    .fuzz2oneeighty(out_vec[5:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'hda9;
    stim[1] = 12'hd27;
    stim[2] = 12'h71d;
    stim[3] = 12'h6bf;
    stim[4] = 12'hee4;
    stim[5] = 12'he56;
    stim[6] = 12'h2c0;
    stim[7] = 12'h31b;
    stim[8] = 12'ha1c;
    stim[9] = 12'h6f5;
    stim[10] = 12'hf8c;
    stim[11] = 12'h3ef;
    stim[12] = 12'hcd0;
    stim[13] = 12'haa8;
    stim[14] = 12'h711;
    stim[15] = 12'ha30;
    stim[16] = 12'h295;
    stim[17] = 12'he58;
    stim[18] = 12'hbf9;
    stim[19] = 12'hfa8;
    stim[20] = 12'h769;
    stim[21] = 12'ha3d;
    stim[22] = 12'h61e;
    stim[23] = 12'ha66;
    stim[24] = 12'h21e;
    stim[25] = 12'hf88;
    stim[26] = 12'h276;
    stim[27] = 12'hbe5;
    stim[28] = 12'he35;
    stim[29] = 12'heef;
    stim[30] = 12'h680;
    stim[31] = 12'he25;
    stim[32] = 12'h609;
    stim[33] = 12'h249;
    stim[34] = 12'h72e;
    stim[35] = 12'he42;
    stim[36] = 12'h3f0;
    stim[37] = 12'ha23;
    stim[38] = 12'h237;
    stim[39] = 12'h386;
    stim[40] = 12'h74b;
    stim[41] = 12'h3b6;
    stim[42] = 12'hbe0;
    stim[43] = 12'hc15;
    stim[44] = 12'hb61;
    stim[45] = 12'hff7;
    stim[46] = 12'ha34;
    stim[47] = 12'h3c1;
    stim[48] = 12'hfdc;
    stim[49] = 12'h3e4;
    stim[50] = 12'he79;
    stim[51] = 12'hbcb;
    stim[52] = 12'h373;
    stim[53] = 12'h20a;
    stim[54] = 12'h6e6;
    stim[55] = 12'h7c6;
    stim[56] = 12'h3d1;
    stim[57] = 12'ha53;
    stim[58] = 12'h233;
    stim[59] = 12'hb82;
    stim[60] = 12'ha11;
    stim[61] = 12'hacc;
    stim[62] = 12'h302;
    stim[63] = 12'h7b5;
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
      expv[0] = 29'hxxxxxxxx;
      expv[1] = 29'hxxxxxxxx;
      expv[2] = 29'hxxxxxxxx;
      expv[3] = 29'hxxxxxxxx;
      expv[4] = 29'hxxxxxxxx;
      expv[5] = 29'hxxxxxxxx;
      expv[6] = 29'hxxxxxxxx;
      expv[7] = 29'hxxxxxxxx;
      expv[8] = 29'hxxxxxxxx;
      expv[9] = 29'hxxxxxxxx;
      expv[10] = 29'hxxxxxxxx;
      expv[11] = 29'h0xxxxxxx;
      expv[12] = 29'h0xxxxxxx;
      expv[13] = 29'h00xxxxxx;
      expv[14] = 29'h00xxxxxx;
      expv[15] = 29'h00xxxxxx;
      expv[16] = 29'h00xxxxxx;
      expv[17] = 29'h00xxxxxx;
      expv[18] = 29'h00xxxxxx;
      expv[19] = 29'h00xxxxxx;
      expv[20] = 29'h00xxxxxx;
      expv[21] = 29'h00xxxxxx;
      expv[22] = 29'h00xxxxxx;
      expv[23] = 29'h0xxxxxxx;
      expv[24] = 29'h00xxxxxx;
      expv[25] = 29'h00xxxxxx;
      expv[26] = 29'h00xxxxxx;
      expv[27] = 29'h00xxxxxx;
      expv[28] = 29'h00xxxxxx;
      expv[29] = 29'h00xxxxxx;
      expv[30] = 29'h00xxxxxx;
      expv[31] = 29'h00xxxxxx;
      expv[32] = 29'h00xxxxxx;
      expv[33] = 29'h00xxxxxx;
      expv[34] = 29'h00xxxxxx;
      expv[35] = 29'h00xxxxxx;
      expv[36] = 29'h00xxxxxx;
      expv[37] = 29'h00xxxxxx;
      expv[38] = 29'h00xxxxxx;
      expv[39] = 29'h00xxxxxx;
      expv[40] = 29'h00xxxxxx;
      expv[41] = 29'h00xxxxxx;
      expv[42] = 29'h00xxxxxx;
      expv[43] = 29'h00xxxxxx;
      expv[44] = 29'h00xxxxxx;
      expv[45] = 29'h00xxxxxx;
      expv[46] = 29'h00xxxxxx;
      expv[47] = 29'h00xxxxxx;
      expv[48] = 29'h00xxxxxx;
      expv[49] = 29'h00xxxxxx;
      expv[50] = 29'h00xxxxxx;
      expv[51] = 29'h00xxxxxx;
      expv[52] = 29'h00xxxxxx;
      expv[53] = 29'h00xxxxxx;
      expv[54] = 29'h00xxxxxx;
      expv[55] = 29'h00xxxxxx;
      expv[56] = 29'h00xxxxxx;
      expv[57] = 29'h00xxxxxx;
      expv[58] = 29'h00xxxxxx;
      expv[59] = 29'h00xxxxxx;
      expv[60] = 29'h00xxxxxx;
      expv[61] = 29'h00xxxxxx;
      expv[62] = 29'h00xxxxxx;
      expv[63] = 29'h00xxxxxx;
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
