// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 36;
  localparam OW = 34;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_020201 dut (
    .ACLK(clk),
    .ARESET(in_vec[35:35]),
    .SAMPLE(in_vec[34:34]),
    .S_PAYLOAD_DATA(in_vec[33:2]),
    .S_VALID(in_vec[1:1]),
    .M_READY(in_vec[0:0]),
    .S_READY(out_vec[33:33]),
    .M_PAYLOAD_DATA(out_vec[32:1]),
    .M_VALID(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 36'ha084944d6;
    stim[1] = 36'hd19ef2ef1;
    stim[2] = 36'h29a12b27c;
    stim[3] = 36'h03e3b9cf0;
    stim[4] = 36'h46c5e17fd;
    stim[5] = 36'h042d93112;
    stim[6] = 36'h01a0b4b42;
    stim[7] = 36'h6e17fe6bc;
    stim[8] = 36'h2b97f4f47;
    stim[9] = 36'h61457e847;
    stim[10] = 36'h64e80ab63;
    stim[11] = 36'h07df61882;
    stim[12] = 36'h6b16eaf8b;
    stim[13] = 36'h5f2e17bf4;
    stim[14] = 36'h2c9f915cb;
    stim[15] = 36'h00f59c53e;
    stim[16] = 36'h0bf316964;
    stim[17] = 36'h56b65b75f;
    stim[18] = 36'h038a92551;
    stim[19] = 36'h7ba6ababf;
    stim[20] = 36'h495f65df2;
    stim[21] = 36'h3a322e22d;
    stim[22] = 36'h0df0ab2c1;
    stim[23] = 36'h05a274672;
    stim[24] = 36'h40265a877;
    stim[25] = 36'h0557ae604;
    stim[26] = 36'h15953d806;
    stim[27] = 36'h3a1eb6f17;
    stim[28] = 36'h6118e6b0f;
    stim[29] = 36'h53dc017e2;
    stim[30] = 36'h6b06d3388;
    stim[31] = 36'h1fcd69f80;
    stim[32] = 36'h4ec542c35;
    stim[33] = 36'h5469b8bc8;
    stim[34] = 36'h65b35ad17;
    stim[35] = 36'h0ed80eba0;
    stim[36] = 36'h0382b8b68;
    stim[37] = 36'h29ef4a0df;
    stim[38] = 36'h71ac32c8d;
    stim[39] = 36'h14992320f;
    stim[40] = 36'h7f34eb1f9;
    stim[41] = 36'h2affbdeec;
    stim[42] = 36'h709ac366a;
    stim[43] = 36'h0e0b2bbd8;
    stim[44] = 36'h6b45ca788;
    stim[45] = 36'h626ef37e1;
    stim[46] = 36'h554a4f733;
    stim[47] = 36'h7aa6f2c96;
    stim[48] = 36'h2a3c777dc;
    stim[49] = 36'h28dfe6f89;
    stim[50] = 36'h663193983;
    stim[51] = 36'h021124e61;
    stim[52] = 36'h64999b65c;
    stim[53] = 36'h15a5126da;
    stim[54] = 36'h72ed103f2;
    stim[55] = 36'h3bc07efd0;
    stim[56] = 36'h6d425fd7f;
    stim[57] = 36'h235f238e6;
    stim[58] = 36'h2958c4528;
    stim[59] = 36'h5551112c6;
    stim[60] = 36'h388bd08b8;
    stim[61] = 36'h0fa4c2d17;
    stim[62] = 36'h3664549bf;
    stim[63] = 36'h79763c6b3;
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
      expv[0] = 34'hxxxxxxxxx;
      expv[1] = 34'hxxxxxxxxx;
      expv[2] = 34'hxxxxxxxxx;
      expv[3] = 34'hxxxxxxxxx;
      expv[4] = 34'hxxxxxxxxx;
      expv[5] = 34'hxxxxxxxxx;
      expv[6] = 34'h2216c9888;
      expv[7] = 34'h20d05a5a0;
      expv[8] = 34'h370bff35e;
      expv[9] = 34'h35cbfa7a2;
      expv[10] = 34'h10a2bf423;
      expv[11] = 34'h30a2bf422;
      expv[12] = 34'h23efb0c40;
      expv[13] = 34'h158b757c5;
      expv[14] = 34'h158b757c5;
      expv[15] = 34'h158b757c4;
      expv[16] = 34'h158b757c4;
      expv[17] = 34'h158b757c4;
      expv[18] = 34'h358b757c4;
      expv[19] = 34'h21c5492a8;
      expv[20] = 34'h1dd355d5f;
      expv[21] = 34'h1dd355d5f;
      expv[22] = 34'h1dd355d5e;
      expv[23] = 34'h1dd355d5e;
      expv[24] = 34'h1dd355d5e;
      expv[25] = 34'h3dd355d5e;
      expv[26] = 34'h22abd7302;
      expv[27] = 34'h2aca9ec02;
      expv[28] = 34'h3d0f5b78a;
      expv[29] = 34'h108c73587;
      expv[30] = 34'h108c73587;
      expv[31] = 34'h108c73587;
      expv[32] = 34'h108c73587;
      expv[33] = 34'h308c73586;
      expv[34] = 34'h2a34dc5e4;
      expv[35] = 34'h12d9ad68b;
      expv[36] = 34'h12d9ad68b;
      expv[37] = 34'h12d9ad68b;
      expv[38] = 34'h12d9ad68a;
      expv[39] = 34'h32d9ad68a;
      expv[40] = 34'h2a4c91906;
      expv[41] = 34'h3f9a758fc;
      expv[42] = 34'h357fdef76;
      expv[43] = 34'h184d61b35;
      expv[44] = 34'h184d61b35;
      expv[45] = 34'h184d61b35;
      expv[46] = 34'h384d61b34;
      expv[47] = 34'h0aa527b99;
      expv[48] = 34'h0aa527b99;
      expv[49] = 34'h0aa527b99;
      expv[50] = 34'h0aa527b98;
      expv[51] = 34'h2aa527b98;
      expv[52] = 34'h210892730;
      expv[53] = 34'h324ccdb2e;
      expv[54] = 34'h2ad28936c;
      expv[55] = 34'h1976881f9;
      expv[56] = 34'h1976881f9;
      expv[57] = 34'h3976881f8;
      expv[58] = 34'h31af91c72;
      expv[59] = 34'h34ac62294;
      expv[60] = 34'h0aa888963;
      expv[61] = 34'h0aa888963;
      expv[62] = 34'h0aa888962;
      expv[63] = 34'h0aa888962;
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
