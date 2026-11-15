// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 36;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_006038 dut (
    .clr(in_vec[35:35]),
    .sel(in_vec[34:32]),
    .data1(in_vec[31:24]),
    .data10(in_vec[23:16]),
    .data100(in_vec[15:8]),
    .data1000(in_vec[7:0]),
    .de(out_vec[15:8]),
    .ledout(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 36'h7745dda45;
    stim[1] = 36'h31f1021a4;
    stim[2] = 36'h1541fc137;
    stim[3] = 36'h46a97d34b;
    stim[4] = 36'h6028f0237;
    stim[5] = 36'ha83e2eba9;
    stim[6] = 36'hb98b62d1d;
    stim[7] = 36'h641da816e;
    stim[8] = 36'hb391c838b;
    stim[9] = 36'hfa1b1fb1e;
    stim[10] = 36'h53a520845;
    stim[11] = 36'h15c428250;
    stim[12] = 36'ha7cc20216;
    stim[13] = 36'h117e63b52;
    stim[14] = 36'h74c3b3826;
    stim[15] = 36'h7bd9e0d20;
    stim[16] = 36'h9d036d5cd;
    stim[17] = 36'h0ca3239ba;
    stim[18] = 36'h935f5cbe5;
    stim[19] = 36'hdee0d2eb4;
    stim[20] = 36'hd068c4fc5;
    stim[21] = 36'h691c68bac;
    stim[22] = 36'hc55ed646a;
    stim[23] = 36'hacb8564b7;
    stim[24] = 36'hc4b46611b;
    stim[25] = 36'h43e0bae32;
    stim[26] = 36'ha17eeba19;
    stim[27] = 36'h6e475411b;
    stim[28] = 36'hdf7e6ab31;
    stim[29] = 36'h5a08bc756;
    stim[30] = 36'h6d5b22168;
    stim[31] = 36'h0202096c9;
    stim[32] = 36'h2ea6d0888;
    stim[33] = 36'hdc627048c;
    stim[34] = 36'h64ae85af0;
    stim[35] = 36'ha079ff297;
    stim[36] = 36'h1b5a65905;
    stim[37] = 36'h2d9392150;
    stim[38] = 36'h2c9269ea1;
    stim[39] = 36'hace34ef2f;
    stim[40] = 36'h106990276;
    stim[41] = 36'h08171a3b6;
    stim[42] = 36'hd13a80b41;
    stim[43] = 36'h75afd74f3;
    stim[44] = 36'hf786effcb;
    stim[45] = 36'h84d468a96;
    stim[46] = 36'hd15c31e91;
    stim[47] = 36'h980cb8521;
    stim[48] = 36'h51b00d9d2;
    stim[49] = 36'haeaa86816;
    stim[50] = 36'h4f281ceda;
    stim[51] = 36'h82ed3cab0;
    stim[52] = 36'haddc154c9;
    stim[53] = 36'h747cd0e94;
    stim[54] = 36'hf4aca815c;
    stim[55] = 36'h6379a8bd0;
    stim[56] = 36'h2806c806b;
    stim[57] = 36'hfcccca9af;
    stim[58] = 36'h30ec36e33;
    stim[59] = 36'hb76b12471;
    stim[60] = 36'hb67ec7519;
    stim[61] = 36'hc0a6503e7;
    stim[62] = 36'h42eb6c32e;
    stim[63] = 36'h62a35be92;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 16'hffff;
      expv[1] = 16'hf7a4;
      expv[2] = 16'hfd1f;
      expv[3] = 16'hfeff;
      expv[4] = 16'hffff;
      expv[5] = 16'hffff;
      expv[6] = 16'hffff;
      expv[7] = 16'hffff;
      expv[8] = 16'hffff;
      expv[9] = 16'hffff;
      expv[10] = 16'hfdff;
      expv[11] = 16'hfd42;
      expv[12] = 16'hffff;
      expv[13] = 16'hfde6;
      expv[14] = 16'hffff;
      expv[15] = 16'hffff;
      expv[16] = 16'hffff;
      expv[17] = 16'hfeca;
      expv[18] = 16'hffff;
      expv[19] = 16'hffff;
      expv[20] = 16'hffff;
      expv[21] = 16'hffff;
      expv[22] = 16'hffff;
      expv[23] = 16'hffff;
      expv[24] = 16'hffff;
      expv[25] = 16'hfeff;
      expv[26] = 16'hffff;
      expv[27] = 16'hffff;
      expv[28] = 16'hffff;
      expv[29] = 16'hfdff;
      expv[30] = 16'hffff;
      expv[31] = 16'hfe20;
      expv[32] = 16'hfb08;
      expv[33] = 16'hffff;
      expv[34] = 16'hffff;
      expv[35] = 16'hffff;
      expv[36] = 16'hfda6;
      expv[37] = 16'hfb21;
      expv[38] = 16'hfb9e;
      expv[39] = 16'hffff;
      expv[40] = 16'hfd99;
      expv[41] = 16'hfe81;
      expv[42] = 16'hffff;
      expv[43] = 16'hffff;
      expv[44] = 16'hffff;
      expv[45] = 16'hffff;
      expv[46] = 16'hffff;
      expv[47] = 16'hffff;
      expv[48] = 16'hfdff;
      expv[49] = 16'hffff;
      expv[50] = 16'hfeff;
      expv[51] = 16'hffff;
      expv[52] = 16'hffff;
      expv[53] = 16'hffff;
      expv[54] = 16'hffff;
      expv[55] = 16'hffff;
      expv[56] = 16'hfb80;
      expv[57] = 16'hffff;
      expv[58] = 16'hf733;
      expv[59] = 16'hffff;
      expv[60] = 16'hffff;
      expv[61] = 16'hffff;
      expv[62] = 16'hfeff;
      expv[63] = 16'hffff;
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
