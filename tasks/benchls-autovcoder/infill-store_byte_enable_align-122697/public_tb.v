// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 36;
  localparam OW = 36;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_122697 dut (
    .write_data(in_vec[35:4]),
    .d_address(in_vec[3:2]),
    .store_size(in_vec[1:0]),
    .d_byteena(out_vec[35:32]),
    .d_writedataout(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 36'h934affda9;
    stim[1] = 36'h5142bcf4b;
    stim[2] = 36'hc0d6c89c6;
    stim[3] = 36'h0b5b36881;
    stim[4] = 36'h3c9f0ad17;
    stim[5] = 36'h58fd545ea;
    stim[6] = 36'hbe1c88d91;
    stim[7] = 36'h6e1a0fe20;
    stim[8] = 36'h79fb8acb9;
    stim[9] = 36'h1f6385ad9;
    stim[10] = 36'hc27bbec52;
    stim[11] = 36'hce5ece046;
    stim[12] = 36'h859a5edd4;
    stim[13] = 36'hffe1275bf;
    stim[14] = 36'h89b6b4122;
    stim[15] = 36'h8b028f17d;
    stim[16] = 36'h6137af00d;
    stim[17] = 36'h75b1ee3bd;
    stim[18] = 36'hcfc274d9d;
    stim[19] = 36'hbb769889f;
    stim[20] = 36'h1d6a729fe;
    stim[21] = 36'hc1363a269;
    stim[22] = 36'h704d8facd;
    stim[23] = 36'hd3d443efe;
    stim[24] = 36'h0a5f5c3c9;
    stim[25] = 36'h906473b54;
    stim[26] = 36'h8117fcae4;
    stim[27] = 36'h71a02e277;
    stim[28] = 36'hc10d9665f;
    stim[29] = 36'he6c1eebb1;
    stim[30] = 36'h12e913a65;
    stim[31] = 36'hb06d48bb3;
    stim[32] = 36'h9c40dcc98;
    stim[33] = 36'h45b82fd2d;
    stim[34] = 36'hc4b1bf8f1;
    stim[35] = 36'hb0efc45b3;
    stim[36] = 36'h126a9cbc1;
    stim[37] = 36'hdbcfbec56;
    stim[38] = 36'h6d5cc3791;
    stim[39] = 36'hc1684d5e4;
    stim[40] = 36'hb1ec9d912;
    stim[41] = 36'ha665ba917;
    stim[42] = 36'h26fbd850e;
    stim[43] = 36'h060063cb3;
    stim[44] = 36'h7b407d4f8;
    stim[45] = 36'hf7450e5bd;
    stim[46] = 36'h3fab42700;
    stim[47] = 36'hf2c22c83d;
    stim[48] = 36'h7df854bfe;
    stim[49] = 36'h13064a5db;
    stim[50] = 36'h2fe0787b4;
    stim[51] = 36'h41a4086cf;
    stim[52] = 36'h0aa072fc4;
    stim[53] = 36'hf881de6b1;
    stim[54] = 36'h11518285b;
    stim[55] = 36'h2c8410e1e;
    stim[56] = 36'h84234c4ba;
    stim[57] = 36'h999302c04;
    stim[58] = 36'h6699f326f;
    stim[59] = 36'hdd74b1d67;
    stim[60] = 36'ha33005350;
    stim[61] = 36'hcb79e81f2;
    stim[62] = 36'he5a6adb95;
    stim[63] = 36'h9bec7fae0;
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
      expv[0] = 36'h30000ffda;
      expv[1] = 36'hf5142bcf4;
      expv[2] = 36'hfc0d6c89c;
      expv[3] = 36'hc36880000;
      expv[4] = 36'hf3c9f0ad1;
      expv[5] = 36'hf58fd545e;
      expv[6] = 36'hc88d90000;
      expv[7] = 36'h8e2000000;
      expv[8] = 36'h300008acb;
      expv[9] = 36'h3000085ad;
      expv[10] = 36'hfc27bbec5;
      expv[11] = 36'hfce5ece04;
      expv[12] = 36'h400dd0000;
      expv[13] = 36'hfffe1275b;
      expv[14] = 36'hf89b6b412;
      expv[15] = 36'h300008f17;
      expv[16] = 36'h30000af00;
      expv[17] = 36'h30000ee3b;
      expv[18] = 36'h3000074d9;
      expv[19] = 36'hfbb769889;
      expv[20] = 36'hf1d6a729f;
      expv[21] = 36'h300003a26;
      expv[22] = 36'h300008fac;
      expv[23] = 36'hfd3d443ef;
      expv[24] = 36'h300005c3c;
      expv[25] = 36'h400b50000;
      expv[26] = 36'h400ae0000;
      expv[27] = 36'hf71a02e27;
      expv[28] = 36'hfc10d9665;
      expv[29] = 36'hceebb0000;
      expv[30] = 36'hc13a60000;
      expv[31] = 36'hfb06d48bb;
      expv[32] = 36'h20000c900;
      expv[33] = 36'h300002fd2;
      expv[34] = 36'hcbf8f0000;
      expv[35] = 36'hfb0efc45b;
      expv[36] = 36'hc9cbc0000;
      expv[37] = 36'hfdbcfbec5;
      expv[38] = 36'hcc3790000;
      expv[39] = 36'h4005e0000;
      expv[40] = 36'hfb1ec9d91;
      expv[41] = 36'hfa665ba91;
      expv[42] = 36'hf26fbd850;
      expv[43] = 36'hf060063cb;
      expv[44] = 36'h200004f00;
      expv[45] = 36'h300000e5b;
      expv[46] = 36'h870000000;
      expv[47] = 36'h300002c83;
      expv[48] = 36'hf7df854bf;
      expv[49] = 36'hf13064a5d;
      expv[50] = 36'h4007b0000;
      expv[51] = 36'hf41a4086c;
      expv[52] = 36'h400fc0000;
      expv[53] = 36'hcde6b0000;
      expv[54] = 36'hf11518285;
      expv[55] = 36'hf2c8410e1;
      expv[56] = 36'hf84234c4b;
      expv[57] = 36'h400c00000;
      expv[58] = 36'hf6699f326;
      expv[59] = 36'hfdd74b1d6;
      expv[60] = 36'h835000000;
      expv[61] = 36'hfcb79e81f;
      expv[62] = 36'hcadb90000;
      expv[63] = 36'h8ae000000;
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
