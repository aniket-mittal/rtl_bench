// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 78;
  localparam OW = 134;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_152760 dut (
    .HCLK(clk),
    .HRESETn(in_vec[77:77]),
    .HSEL(in_vec[76:76]),
    .HADDR(in_vec[75:44]),
    .HTRANS(in_vec[43:42]),
    .HSIZE(in_vec[41:39]),
    .HPROT(in_vec[38:35]),
    .HWRITE(in_vec[34:34]),
    .HWDATA(in_vec[33:2]),
    .HREADY(in_vec[1:1]),
    .SLEEPing(in_vec[0:0]),
    .HREADYOUT(out_vec[133:133]),
    .HRDATA(out_vec[132:101]),
    .HRESP(out_vec[100:99]),
    .DMAstart(out_vec[98:98]),
    .DMAsrc(out_vec[97:66]),
    .DMAdst(out_vec[65:34]),
    .DMAsize(out_vec[33:32]),
    .DMAlen(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 78'h1837d75f037870ea3721;
    stim[1] = 78'h162f9de7f015825aa0f7;
    stim[2] = 78'h30eb8bf8108ac917ed3c;
    stim[3] = 78'h21eebeb01803ed0ac680;
    stim[4] = 78'h2149527a8a1f628bad9e;
    stim[5] = 78'h335dbafdd64ba4cdfbc8;
    stim[6] = 78'h3fe2bd5c282af08cfdd8;
    stim[7] = 78'h3f949258f949e5b98238;
    stim[8] = 78'h385b4f08c04d18e2e114;
    stim[9] = 78'h29d64f822f374e294a00;
    stim[10] = 78'h3dadc00dd8e0360f1739;
    stim[11] = 78'h3eb724b6e2185ae783b9;
    stim[12] = 78'h3e1c034076957990efa1;
    stim[13] = 78'h343d60e4b24695b9e05e;
    stim[14] = 78'h356823a4cd2344f569e5;
    stim[15] = 78'h2c7774f3640ccc73a6f2;
    stim[16] = 78'h3aad8adafb9511092435;
    stim[17] = 78'h28598aaa72fd0a7fba4d;
    stim[18] = 78'h21030104cd75ab5adf2a;
    stim[19] = 78'h3cf230a8f5a164133920;
    stim[20] = 78'h3401770b5379f82bdff4;
    stim[21] = 78'h2285008c84ef601080c2;
    stim[22] = 78'h2d00d6bb4fcd3a13bda2;
    stim[23] = 78'h2f2687c2c25fac4b472f;
    stim[24] = 78'h2026462c730295c8cbf5;
    stim[25] = 78'h2d0524c3b9e88cffe696;
    stim[26] = 78'h31c90ec7edf67503f7a1;
    stim[27] = 78'h21865d1ccc8ebab20e69;
    stim[28] = 78'h38cfc2afa096dab824cf;
    stim[29] = 78'h368ee45bc5e159837b31;
    stim[30] = 78'h3f698d221174002f162f;
    stim[31] = 78'h35199ff9fb2b4b5774fd;
    stim[32] = 78'h2d46ced564548982a8dc;
    stim[33] = 78'h3bcf85df98c2dd985f58;
    stim[34] = 78'h388ada79ca6b22e3a6a7;
    stim[35] = 78'h3e3e01f796bc4619bed1;
    stim[36] = 78'h2f0c6ffc8a44cfefea8c;
    stim[37] = 78'h07fc03422e68a6355cea;
    stim[38] = 78'h38b787731e91362edead;
    stim[39] = 78'h28884b2f9ade502096a7;
    stim[40] = 78'h306bddf130905484524f;
    stim[41] = 78'h3709c618c2d4914f4020;
    stim[42] = 78'h24a5bc041a58d6d993de;
    stim[43] = 78'h3d494b3a70f7d806ee17;
    stim[44] = 78'h2b06637815264ac6d1e7;
    stim[45] = 78'h28a1c68d0223e245e9d4;
    stim[46] = 78'h3b890189db9003606f79;
    stim[47] = 78'h355a46cdbacae0ccdb2d;
    stim[48] = 78'h2f0b50bb652bea8b77ea;
    stim[49] = 78'h2d71c75e11cc5a91c206;
    stim[50] = 78'h28034aa641dc6a6ffe3d;
    stim[51] = 78'h3b2ac4adeaeda1ba669c;
    stim[52] = 78'h3761cc351d7dc7c8bed8;
    stim[53] = 78'h36251779e1242e639cfb;
    stim[54] = 78'h2bee3d1ceeacf0bfa1c4;
    stim[55] = 78'h24ac061af885c219ca9e;
    stim[56] = 78'h3dc2f010c02ca3ed7eae;
    stim[57] = 78'h30ec54f919a8882de76d;
    stim[58] = 78'h3ff0d71eea3ff8c94122;
    stim[59] = 78'h31187661fc16ad75cb64;
    stim[60] = 78'h308b670cd19faa413025;
    stim[61] = 78'h26b9c39bec8ee7eac582;
    stim[62] = 78'h25f6fb6047dbab3a3dfd;
    stim[63] = 78'h2ce7cdd87731b0a1b7e4;
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
      expv[0] = 134'h200000000xxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 134'h200000000xxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[2] = 134'h200000000xxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[3] = 134'h200000000xxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[4] = 134'h200000000xxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[5] = 134'h200000000xxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[6] = 134'h200000000xxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[7] = 134'h200000000xxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[8] = 134'h200000000xxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[9] = 134'h200000000xxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[10] = 134'h200000000xxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[11] = 134'h200000000xxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[12] = 134'h200000000xxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[13] = 134'h200000000xxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[14] = 134'h200000000xxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[15] = 134'h200000000xxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[16] = 134'h200000000xxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[17] = 134'h200000000xxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[18] = 134'h200000000xxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[19] = 134'h200000000xxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[20] = 134'h200000000xxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[21] = 134'h200000000xxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[22] = 134'h200000000xxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[23] = 134'h200000000xxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[24] = 134'h200000000xxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[25] = 134'h200000000xxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[26] = 134'h200000000xxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[27] = 134'h200000000xxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[28] = 134'h200000000xxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[29] = 134'h200000000xxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[30] = 134'h200000000xxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[31] = 134'h200000000xxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[32] = 134'h200000000xxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[33] = 134'h200000000xxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[34] = 134'h200000000xxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[35] = 134'h200000000xxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[36] = 134'h200000000xxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[37] = 134'h200000000xxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[38] = 134'h200000000xxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[39] = 134'h200000000xxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[40] = 134'h200000000xxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[41] = 134'h200000000xxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[42] = 134'h200000000xxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[43] = 134'h200000000xxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[44] = 134'h200000000xxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[45] = 134'h200000000xxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[46] = 134'h200000000xxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[47] = 134'h200000000xxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[48] = 134'h200000000xxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[49] = 134'h200000000xxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[50] = 134'h200000000xxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[51] = 134'h200000000xxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[52] = 134'h200000000xxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[53] = 134'h200000000xxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[54] = 134'h200000000xxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[55] = 134'h200000000xxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[56] = 134'h200000000xxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[57] = 134'h200000000xxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[58] = 134'h2000000004000000000000000028fb5fab;
      expv[59] = 134'h2000000000000000000000000028fb5fab;
      expv[60] = 134'h2000000000000000000000000028fb5fab;
      expv[61] = 134'h2000000000000000000000000028fb5fab;
      expv[62] = 134'h2000000000000000000000000028fb5fab;
      expv[63] = 134'h2000000000000000000000000028fb5fab;
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
