// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 37;
  localparam OW = 56;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_06616 dut (
    .clk(clk),
    .address(in_vec[36:35]),
    .chipselect(in_vec[34:34]),
    .reset_n(in_vec[33:33]),
    .write_n(in_vec[32:32]),
    .writedata(in_vec[31:0]),
    .out_port(out_vec[55:32]),
    .readdata(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 37'h1d4de9fafd;
    stim[1] = 37'h0055b15297;
    stim[2] = 37'h0becfd509c;
    stim[3] = 37'h1f54f7c2ef;
    stim[4] = 37'h17b3efa801;
    stim[5] = 37'h07cea953fc;
    stim[6] = 37'h168cb581ad;
    stim[7] = 37'h1a56d79e33;
    stim[8] = 37'h1b3f17ce64;
    stim[9] = 37'h0f49f31ec5;
    stim[10] = 37'h1ea5a118c1;
    stim[11] = 37'h1f1c224d61;
    stim[12] = 37'h071aa2002f;
    stim[13] = 37'h135d83f4ce;
    stim[14] = 37'h1efd190bf5;
    stim[15] = 37'h02fa527e84;
    stim[16] = 37'h1e1eb37d08;
    stim[17] = 37'h06d5a93a46;
    stim[18] = 37'h031016787e;
    stim[19] = 37'h0bec6a7b32;
    stim[20] = 37'h0aff7fd510;
    stim[21] = 37'h0baa86f9bf;
    stim[22] = 37'h06d00ff93e;
    stim[23] = 37'h1faad144b6;
    stim[24] = 37'h0f0eacd557;
    stim[25] = 37'h133ac59c3d;
    stim[26] = 37'h1af156a713;
    stim[27] = 37'h02bb17a776;
    stim[28] = 37'h0251490a59;
    stim[29] = 37'h1eb819cb84;
    stim[30] = 37'h076bb03ca9;
    stim[31] = 37'h1e0071aa66;
    stim[32] = 37'h16569765ad;
    stim[33] = 37'h034bb180c0;
    stim[34] = 37'h0646f6d987;
    stim[35] = 37'h06ea628b97;
    stim[36] = 37'h1293e8e0e7;
    stim[37] = 37'h0f1f327e50;
    stim[38] = 37'h1be012379d;
    stim[39] = 37'h16bc7c1b09;
    stim[40] = 37'h0757743119;
    stim[41] = 37'h07d9d081ed;
    stim[42] = 37'h1242995762;
    stim[43] = 37'h1a5bad602f;
    stim[44] = 37'h1f2eb039ab;
    stim[45] = 37'h1bdd42d1fc;
    stim[46] = 37'h1fa76be70c;
    stim[47] = 37'h13918b2424;
    stim[48] = 37'h1ab00d6503;
    stim[49] = 37'h0ecc788c41;
    stim[50] = 37'h06865366fc;
    stim[51] = 37'h03b8e2de33;
    stim[52] = 37'h0a46fe862d;
    stim[53] = 37'h0b8cca8ee1;
    stim[54] = 37'h07b8eb15b1;
    stim[55] = 37'h0261528c75;
    stim[56] = 37'h0ea2491fd7;
    stim[57] = 37'h1b24c91bc3;
    stim[58] = 37'h130dcd87e9;
    stim[59] = 37'h0eb58d34cc;
    stim[60] = 37'h1e0f95b1ac;
    stim[61] = 37'h06387151af;
    stim[62] = 37'h13ea8374ed;
    stim[63] = 37'h1b797e6bfe;
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
      expv[0] = 56'h00000000000000;
      expv[1] = 56'h00000000000000;
      expv[2] = 56'h00000000000000;
      expv[3] = 56'h00000000000000;
      expv[4] = 56'h00000000000000;
      expv[5] = 56'h00000000000000;
      expv[6] = 56'h00000000000000;
      expv[7] = 56'h00000000000000;
      expv[8] = 56'h00000000000000;
      expv[9] = 56'h00000000000000;
      expv[10] = 56'h00000000000000;
      expv[11] = 56'h00000000000000;
      expv[12] = 56'h00000000000000;
      expv[13] = 56'h00000000000000;
      expv[14] = 56'h00000000000000;
      expv[15] = 56'h00000000000000;
      expv[16] = 56'h00000000000000;
      expv[17] = 56'h00000000000000;
      expv[18] = 56'ha93a4600a93a46;
      expv[19] = 56'ha93a4600000000;
      expv[20] = 56'ha93a4600000000;
      expv[21] = 56'ha93a4600000000;
      expv[22] = 56'ha93a4600a93a46;
      expv[23] = 56'h0ff93e00000000;
      expv[24] = 56'h0ff93e00000000;
      expv[25] = 56'h0ff93e00000000;
      expv[26] = 56'h0ff93e00000000;
      expv[27] = 56'h0ff93e000ff93e;
      expv[28] = 56'h0ff93e000ff93e;
      expv[29] = 56'h0ff93e00000000;
      expv[30] = 56'h0ff93e000ff93e;
      expv[31] = 56'h0ff93e00000000;
      expv[32] = 56'h0ff93e00000000;
      expv[33] = 56'h0ff93e000ff93e;
      expv[34] = 56'h0ff93e000ff93e;
      expv[35] = 56'hf6d98700f6d987;
      expv[36] = 56'h628b9700000000;
      expv[37] = 56'h628b9700000000;
      expv[38] = 56'h628b9700000000;
      expv[39] = 56'h628b9700000000;
      expv[40] = 56'h628b9700628b97;
      expv[41] = 56'h628b9700628b97;
      expv[42] = 56'h628b9700000000;
      expv[43] = 56'h628b9700000000;
      expv[44] = 56'h628b9700000000;
      expv[45] = 56'h628b9700000000;
      expv[46] = 56'h628b9700000000;
      expv[47] = 56'h628b9700000000;
      expv[48] = 56'h628b9700000000;
      expv[49] = 56'h628b9700000000;
      expv[50] = 56'h628b9700628b97;
      expv[51] = 56'h5366fc005366fc;
      expv[52] = 56'h5366fc00000000;
      expv[53] = 56'h5366fc00000000;
      expv[54] = 56'h5366fc005366fc;
      expv[55] = 56'h5366fc005366fc;
      expv[56] = 56'h5366fc00000000;
      expv[57] = 56'h5366fc00000000;
      expv[58] = 56'h5366fc00000000;
      expv[59] = 56'h5366fc00000000;
      expv[60] = 56'h5366fc00000000;
      expv[61] = 56'h5366fc005366fc;
      expv[62] = 56'h7151af00000000;
      expv[63] = 56'h7151af00000000;
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
