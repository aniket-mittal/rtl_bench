// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 39;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_149834 dut (
    .dmem_in(in_vec[38:7]),
    .load_type(in_vec[6:4]),
    .byte_en(in_vec[3:0]),
    .ext_out(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 39'h1dadfdc662;
    stim[1] = 39'h119e923735;
    stim[2] = 39'h6c01f43b1d;
    stim[3] = 39'h554bd21dc4;
    stim[4] = 39'h7fd00ecd1c;
    stim[5] = 39'h44fc1e2ecf;
    stim[6] = 39'h0efe184eca;
    stim[7] = 39'h6ba3583426;
    stim[8] = 39'h754b90211b;
    stim[9] = 39'h1c5e99384f;
    stim[10] = 39'h4944f8ca8c;
    stim[11] = 39'h220470d048;
    stim[12] = 39'h51379a504f;
    stim[13] = 39'h15b60795d0;
    stim[14] = 39'h7314f9a9d3;
    stim[15] = 39'h17b34c1896;
    stim[16] = 39'h181271b0b0;
    stim[17] = 39'h7d9ce48ce7;
    stim[18] = 39'h71c2bb0812;
    stim[19] = 39'h132130e75d;
    stim[20] = 39'h2482f322a1;
    stim[21] = 39'h03e772dfe9;
    stim[22] = 39'h1732805953;
    stim[23] = 39'h2edbad0368;
    stim[24] = 39'h57eaab02f9;
    stim[25] = 39'h3b53668595;
    stim[26] = 39'h53518640a2;
    stim[27] = 39'h247add374e;
    stim[28] = 39'h6f382ea4ed;
    stim[29] = 39'h12cdafead2;
    stim[30] = 39'h2bc50b0dd3;
    stim[31] = 39'h094d53aaeb;
    stim[32] = 39'h4b9b656d84;
    stim[33] = 39'h3309b71891;
    stim[34] = 39'h03974fcefa;
    stim[35] = 39'h303927174a;
    stim[36] = 39'h502272e421;
    stim[37] = 39'h6401c2c17e;
    stim[38] = 39'h7548d3d7e8;
    stim[39] = 39'h634a7158cb;
    stim[40] = 39'h0efd3c2715;
    stim[41] = 39'h19ba0b1fca;
    stim[42] = 39'h64898cfc3e;
    stim[43] = 39'h303df87468;
    stim[44] = 39'h6e886e26fe;
    stim[45] = 39'h39fcbc6916;
    stim[46] = 39'h41cafc9c90;
    stim[47] = 39'h26382bd94c;
    stim[48] = 39'h1bd8763c71;
    stim[49] = 39'h52fe5a073d;
    stim[50] = 39'h7ef7178922;
    stim[51] = 39'h11ccce6059;
    stim[52] = 39'h6e0a598011;
    stim[53] = 39'h4d948f0845;
    stim[54] = 39'h3ca1139eac;
    stim[55] = 39'h2f10e1c11e;
    stim[56] = 39'h36434d018d;
    stim[57] = 39'h0443c4de07;
    stim[58] = 39'h1024f33bf0;
    stim[59] = 39'h13a25bd0b4;
    stim[60] = 39'h43b4d094f4;
    stim[61] = 39'h7620d542cf;
    stim[62] = 39'h48b4a660de;
    stim[63] = 39'h4a2328727f;
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
      expv[0] = 32'h00000000;
      expv[1] = 32'h00000000;
      expv[2] = 32'h00000000;
      expv[3] = 32'haa97a43b;
      expv[4] = 32'h00000000;
      expv[5] = 32'h89f83c5d;
      expv[6] = 32'h1dfc309d;
      expv[7] = 32'h00000000;
      expv[8] = 32'h00000000;
      expv[9] = 32'h38bd3270;
      expv[10] = 32'h00000000;
      expv[11] = 32'h4408e1a0;
      expv[12] = 32'ha26f34a0;
      expv[13] = 32'h00000000;
      expv[14] = 32'h00000000;
      expv[15] = 32'h00000000;
      expv[16] = 32'h00000000;
      expv[17] = 32'h00000000;
      expv[18] = 32'h00000076;
      expv[19] = 32'h00000000;
      expv[20] = 32'h00000000;
      expv[21] = 32'h00000000;
      expv[22] = 32'h00000000;
      expv[23] = 32'h00000000;
      expv[24] = 32'h00000000;
      expv[25] = 32'h00000000;
      expv[26] = 32'h00000000;
      expv[27] = 32'h48f5ba6e;
      expv[28] = 32'h00000000;
      expv[29] = 32'h00000000;
      expv[30] = 32'h00000000;
      expv[31] = 32'h00000000;
      expv[32] = 32'h00000036;
      expv[33] = 32'h00000031;
      expv[34] = 32'h00000000;
      expv[35] = 32'h60724e2e;
      expv[36] = 32'h00000000;
      expv[37] = 32'h00000000;
      expv[38] = 32'h00000000;
      expv[39] = 32'hc694e2b1;
      expv[40] = 32'h00000000;
      expv[41] = 32'h3374163f;
      expv[42] = 32'h00000000;
      expv[43] = 32'h00000000;
      expv[44] = 32'h00000000;
      expv[45] = 32'h00000000;
      expv[46] = 32'h00000000;
      expv[47] = 32'h4c7057b2;
      expv[48] = 32'h00000000;
      expv[49] = 32'h00000000;
      expv[50] = 32'h00000000;
      expv[51] = 32'h00000000;
      expv[52] = 32'h00000000;
      expv[53] = 32'h9b291e10;
      expv[54] = 32'h00007942;
      expv[55] = 32'h00000000;
      expv[56] = 32'h00000000;
      expv[57] = 32'h00000000;
      expv[58] = 32'h00000000;
      expv[59] = 32'h00000000;
      expv[60] = 32'h00000000;
      expv[61] = 32'hec41aa85;
      expv[62] = 32'h00000000;
      expv[63] = 32'h00000000;
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
