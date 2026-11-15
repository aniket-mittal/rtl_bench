// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 80;
  localparam OW = 57;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_08953 dut (
    .clk_i(clk),
    .dvdnd_i(in_vec[79:30]),
    .dvsor_i(in_vec[29:3]),
    .sign_dvd_i(in_vec[2:2]),
    .sign_div_i(in_vec[1:1]),
    .start_i(in_vec[0:0]),
    .ready_o(out_vec[56:56]),
    .qutnt_o(out_vec[55:29]),
    .rmndr_o(out_vec[28:2]),
    .sign_o(out_vec[1:1]),
    .div_zero_o(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 80'h06f16925a2316a7c34d4;
    stim[1] = 80'hc480676cc7bf8f621519;
    stim[2] = 80'h169fba55a333260648f7;
    stim[3] = 80'he1bf08b089c49efd1e01;
    stim[4] = 80'hd0c7040999937c4706b7;
    stim[5] = 80'hc0de0f64ce965218b467;
    stim[6] = 80'h21762878a2986e99ed7f;
    stim[7] = 80'hb0fe737e00df27551126;
    stim[8] = 80'h3148b450aa4848a6b2af;
    stim[9] = 80'hcd878e65921f49bc51ed;
    stim[10] = 80'h9e761e8573c177524d1d;
    stim[11] = 80'hce44eda6a8a92918c24e;
    stim[12] = 80'hd92cdba6e56934ee055c;
    stim[13] = 80'hba73b754717f11dc5e01;
    stim[14] = 80'h9aeae3dea10e3f93e430;
    stim[15] = 80'h0dbc721c075d747cc50f;
    stim[16] = 80'hef2328c84a60157cc3d1;
    stim[17] = 80'hdf75469bf02f55922ad4;
    stim[18] = 80'h89103817ec2c7483fbf2;
    stim[19] = 80'h946faaf8a5567be32b6f;
    stim[20] = 80'hb0f5a3be85c3b1a528f2;
    stim[21] = 80'h11d8b8f6b345740a266e;
    stim[22] = 80'hb7cd93f262c7cc826329;
    stim[23] = 80'he8e6016d2cb62517fa2b;
    stim[24] = 80'h646bb98e2a71f1fa8fdf;
    stim[25] = 80'hc417f58f77a793c39e08;
    stim[26] = 80'h78fe60683443a15cc9db;
    stim[27] = 80'hd53fe71890fb582d4805;
    stim[28] = 80'h46d89b065bb46966b6e7;
    stim[29] = 80'hb0b817cefbf5bd0ef009;
    stim[30] = 80'h6b1b08f5036f290220e8;
    stim[31] = 80'hafef7e5ddf87f19ad935;
    stim[32] = 80'h0dc3ecab96301cdd3f5c;
    stim[33] = 80'h983368c1959f0659d863;
    stim[34] = 80'hb50617c80184016bb4c5;
    stim[35] = 80'h18121beb2912ef4b0795;
    stim[36] = 80'hdd9fc11e2f869d13173c;
    stim[37] = 80'h5a8b204976c9c316ed1c;
    stim[38] = 80'hfd7545abd72cbc7de93f;
    stim[39] = 80'h332e47ae48f4584b8b62;
    stim[40] = 80'hbca1386b73683ebd06c4;
    stim[41] = 80'hce42a390105722264d0f;
    stim[42] = 80'h3b079d5d1284efa47cd1;
    stim[43] = 80'h9a2c542e2505f81c1395;
    stim[44] = 80'h9f150ae37cf32303945d;
    stim[45] = 80'h3fc352b110070bc31f2d;
    stim[46] = 80'h052a8107c68bc99b639b;
    stim[47] = 80'hd23815b6bd9b44ccecd4;
    stim[48] = 80'h83d8fb10c8b6ca4397da;
    stim[49] = 80'h4f7f40de07e35359d005;
    stim[50] = 80'hfa1a60624123239d2bce;
    stim[51] = 80'h8d6a456680211116fa86;
    stim[52] = 80'hf4f059383abf59249ab2;
    stim[53] = 80'h0dd14a01bdfc8351431b;
    stim[54] = 80'h194fdd73eeb54eb32384;
    stim[55] = 80'hff9e4fbe36d0d68a1048;
    stim[56] = 80'h9842e3995bf95f7532df;
    stim[57] = 80'heee570e3f00110c6f8dd;
    stim[58] = 80'h74faa455f748da0bd438;
    stim[59] = 80'h2a4b53c8873e173d79ba;
    stim[60] = 80'h993aac765b2f22ea6172;
    stim[61] = 80'hf90d3f298d36fe087a76;
    stim[62] = 80'h7cb23cac8d544c150ff4;
    stim[63] = 80'h91009f1306b2881bc8ab;
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
      expv[0] = 57'hxxxxxxxxxxxxxxx;
      expv[1] = 57'h0xxxxxxxxxxxxxx;
      expv[2] = 57'h0xxxxxxxxxxxxxx;
      expv[3] = 57'h000000000000000;
      expv[4] = 57'h000000000000000;
      expv[5] = 57'h000000000000000;
      expv[6] = 57'h000000000000000;
      expv[7] = 57'h000000000000000;
      expv[8] = 57'h000000000000000;
      expv[9] = 57'h0400000xxxxxxxx;
      expv[10] = 57'h000000000000002;
      expv[11] = 57'h000000000000000;
      expv[12] = 57'h000000000000002;
      expv[13] = 57'h0400000xxxxxxxx;
      expv[14] = 57'h0600000xxxxxxxx;
      expv[15] = 57'h000000000000000;
      expv[16] = 57'h0400000xxxxxxxx;
      expv[17] = 57'h000000000000002;
      expv[18] = 57'h000000000000002;
      expv[19] = 57'h0400000xxxxxxxx;
      expv[20] = 57'h0600000xxxxxxxx;
      expv[21] = 57'h000000000000000;
      expv[22] = 57'h0400000xxxxxxxx;
      expv[23] = 57'h0600000xxxxxxxx;
      expv[24] = 57'h000000000000000;
      expv[25] = 57'h000000000000000;
      expv[26] = 57'h000000000000002;
      expv[27] = 57'h0400000xxxxxxxx;
      expv[28] = 57'h000000000000000;
      expv[29] = 57'h000000000000000;
      expv[30] = 57'h000000000000000;
      expv[31] = 57'h000000000000002;
      expv[32] = 57'h0400000xxxxxxxx;
      expv[33] = 57'h000000000000002;
      expv[34] = 57'h0400000xxxxxxxx;
      expv[35] = 57'h000000000000002;
      expv[36] = 57'h000000000000002;
      expv[37] = 57'h000000000000002;
      expv[38] = 57'h0400000xxxxxxxx;
      expv[39] = 57'h0600000xxxxxxxx;
      expv[40] = 57'h000000000000002;
      expv[41] = 57'h0400000xxxxxxxx;
      expv[42] = 57'h0600000xxxxxxxx;
      expv[43] = 57'h000000000000002;
      expv[44] = 57'h000000000000002;
      expv[45] = 57'h000000000000002;
      expv[46] = 57'h000000000000002;
      expv[47] = 57'h000000000000002;
      expv[48] = 57'h000000000000002;
      expv[49] = 57'h0400000xxxxxxxx;
      expv[50] = 57'h0600000xxxxxxxx;
      expv[51] = 57'h000000000000000;
      expv[52] = 57'h0400000xxxxxxxx;
      expv[53] = 57'h0600000xxxxxxxx;
      expv[54] = 57'h0700000xxxxxxxx;
      expv[55] = 57'h000000000000000;
      expv[56] = 57'h0400000xxxxxxxx;
      expv[57] = 57'h0600000xxxxxxxx;
      expv[58] = 57'h000000000000000;
      expv[59] = 57'h000000000000002;
      expv[60] = 57'h0400000xxxxxxxx;
      expv[61] = 57'h0600000xxxxxxxx;
      expv[62] = 57'h0700000xxxxxxxx;
      expv[63] = 57'h0780000xxxxxxxx;
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
