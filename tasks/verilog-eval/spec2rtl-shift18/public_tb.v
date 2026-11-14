// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 68;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  TopModule dut (
    .clk(clk),
    .load(in_vec[67:67]),
    .ena(in_vec[66:66]),
    .amount(in_vec[65:64]),
    .data(in_vec[63:0]),
    .q(out_vec[63:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 68'h30c4126b401e343fd;
    stim[1] = 68'h6dc5fb6d9dac4797d;
    stim[2] = 68'h9ae824f4a623153ec;
    stim[3] = 68'h928f3803ef4331689;
    stim[4] = 68'hbd232775aecdcd6d9;
    stim[5] = 68'h39af0c7852204000d;
    stim[6] = 68'h69eaf195db3beb799;
    stim[7] = 68'h46752538063c2c107;
    stim[8] = 68'hcbe6b384d0ee4380f;
    stim[9] = 68'he52220d69c7e3763a;
    stim[10] = 68'h6f175fbcaaf263649;
    stim[11] = 68'heaf7e1f5cce71d0d6;
    stim[12] = 68'hc75578936fcc95952;
    stim[13] = 68'hb1b19f06d70bd82c9;
    stim[14] = 68'h497fb7bf1da27869e;
    stim[15] = 68'h5666c99ab2d4541c4;
    stim[16] = 68'h9d4404ff04f257b4a;
    stim[17] = 68'h86f6b838253ae80b8;
    stim[18] = 68'h414fb6a0a9fabd5f3;
    stim[19] = 68'h142bef02755b72069;
    stim[20] = 68'hb9c1cd7601a429f42;
    stim[21] = 68'hade54c11666c31a17;
    stim[22] = 68'he9109aa8882d77ec5;
    stim[23] = 68'h7661ad23ddd9eb8fe;
    stim[24] = 68'hbeed53e20d177ca8b;
    stim[25] = 68'h6c669024914e5eaf5;
    stim[26] = 68'h673c7cd038fe34e11;
    stim[27] = 68'h43c2e7d4cc2cf9493;
    stim[28] = 68'h581a4d258498c73bd;
    stim[29] = 68'hbc9bb710be5dbf410;
    stim[30] = 68'hd5d42fe62e06b5cca;
    stim[31] = 68'h1ba9fb059c6318657;
    stim[32] = 68'h56249ab2551edaebc;
    stim[33] = 68'h73161b717b1bc88ad;
    stim[34] = 68'hd23227095696b95a7;
    stim[35] = 68'h0c7fe68b1f6395462;
    stim[36] = 68'h861b32b97d0550b5c;
    stim[37] = 68'hd1fec567a84fa1009;
    stim[38] = 68'h86220145773ca2947;
    stim[39] = 68'hc76e18afae17e483a;
    stim[40] = 68'h465e3eb132299af42;
    stim[41] = 68'h0117840ca8a38f4c1;
    stim[42] = 68'h13fc18191415c8517;
    stim[43] = 68'hd30ac07c7d1481198;
    stim[44] = 68'h0055a70e4154ae7cb;
    stim[45] = 68'h077e21e2222ee9ba4;
    stim[46] = 68'hf4f8480e32e4e7f79;
    stim[47] = 68'h4ea88c1ec5b8d1f77;
    stim[48] = 68'h748d59819cbb27ec5;
    stim[49] = 68'h51076adadd7abe896;
    stim[50] = 68'h599d11df2639561d4;
    stim[51] = 68'h6d09f9b65c347d397;
    stim[52] = 68'h133c24a8561c34d1a;
    stim[53] = 68'h4ae78865edad2985c;
    stim[54] = 68'h691a2b0b1ef255df5;
    stim[55] = 68'h249f562a649f052b2;
    stim[56] = 68'h8aa4a0c673a3bb426;
    stim[57] = 68'h7617ba43766f69ef5;
    stim[58] = 68'h861d996bcb25922b1;
    stim[59] = 68'hcfabf7a8b74d64f1d;
    stim[60] = 68'h0433c5bb1d0b8b703;
    stim[61] = 68'h3f647a5d611935069;
    stim[62] = 68'h8efd77cc491ff312e;
    stim[63] = 68'hda732e77c11cd3723;
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
      expv[0] = 64'hxxxxxxxxxxxxxxxx;
      expv[1] = 64'hxxxxxxxxxxxxxxxx;
      expv[2] = 64'hxxxxxxxxxxxxxxxx;
      expv[3] = 64'hae824f4a623153ec;
      expv[4] = 64'h28f3803ef4331689;
      expv[5] = 64'hd232775aecdcd6d9;
      expv[6] = 64'hd232775aecdcd6d9;
      expv[7] = 64'he9193bad766e6b6c;
      expv[8] = 64'hd232775aecdcd6d8;
      expv[9] = 64'hbe6b384d0ee4380f;
      expv[10] = 64'h52220d69c7e3763a;
      expv[11] = 64'h291106b4e3f1bb1d;
      expv[12] = 64'haf7e1f5cce71d0d6;
      expv[13] = 64'h75578936fcc95952;
      expv[14] = 64'h1b19f06d70bd82c9;
      expv[15] = 64'h3633e0dae17b0592;
      expv[16] = 64'h33e0dae17b059200;
      expv[17] = 64'hd4404ff04f257b4a;
      expv[18] = 64'h6f6b838253ae80b8;
      expv[19] = 64'hded70704a75d0170;
      expv[20] = 64'hded70704a75d0170;
      expv[21] = 64'h9c1cd7601a429f42;
      expv[22] = 64'hde54c11666c31a17;
      expv[23] = 64'h9109aa8882d77ec5;
      expv[24] = 64'hff9109aa8882d77e;
      expv[25] = 64'heed53e20d177ca8b;
      expv[26] = 64'hf76a9f1068bbe545;
      expv[27] = 64'hfbb54f88345df2a2;
      expv[28] = 64'hf76a9f1068bbe544;
      expv[29] = 64'h6a9f1068bbe54400;
      expv[30] = 64'hc9bb710be5dbf410;
      expv[31] = 64'h5d42fe62e06b5cca;
      expv[32] = 64'h5d42fe62e06b5cca;
      expv[33] = 64'h42fe62e06b5cca00;
      expv[34] = 64'h0042fe62e06b5cca;
      expv[35] = 64'h23227095696b95a7;
      expv[36] = 64'h23227095696b95a7;
      expv[37] = 64'h61b32b97d0550b5c;
      expv[38] = 64'h1fec567a84fa1009;
      expv[39] = 64'h6220145773ca2947;
      expv[40] = 64'h76e18afae17e483a;
      expv[41] = 64'hedc315f5c2fc9074;
      expv[42] = 64'hedc315f5c2fc9074;
      expv[43] = 64'hedc315f5c2fc9074;
      expv[44] = 64'h30ac07c7d1481198;
      expv[45] = 64'h30ac07c7d1481198;
      expv[46] = 64'h30ac07c7d1481198;
      expv[47] = 64'h4f8480e32e4e7f79;
      expv[48] = 64'h9f0901c65c9cfef2;
      expv[49] = 64'hff9f0901c65c9cfe;
      expv[50] = 64'h9f0901c65c9cfe00;
      expv[51] = 64'h0901c65c9cfe0000;
      expv[52] = 64'h0480e32e4e7f0000;
      expv[53] = 64'h0480e32e4e7f0000;
      expv[54] = 64'h0901c65c9cfe0000;
      expv[55] = 64'h0480e32e4e7f0000;
      expv[56] = 64'h0480e32e4e7f0000;
      expv[57] = 64'haa4a0c673a3bb426;
      expv[58] = 64'hffaa4a0c673a3bb4;
      expv[59] = 64'h61d996bcb25922b1;
      expv[60] = 64'hfabf7a8b74d64f1d;
      expv[61] = 64'hfabf7a8b74d64f1d;
      expv[62] = 64'hfabf7a8b74d64f1d;
      expv[63] = 64'hefd77cc491ff312e;
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
