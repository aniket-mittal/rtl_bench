// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 65;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_143568 dut (
    .clk(clk),
    .rstn(in_vec[64:64]),
    .afl(in_vec[63:32]),
    .bfl(in_vec[31:0]),
    .fl(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 65'h01aaf810bd4331395;
    stim[1] = 65'h05d3c20deadaaedb3;
    stim[2] = 65'h16be133d627ab44e6;
    stim[3] = 65'h1919adf098049812d;
    stim[4] = 65'h12ffd8a6fae23b17a;
    stim[5] = 65'h1b7544771948a1e28;
    stim[6] = 65'h1d9ee5e18fda79ab4;
    stim[7] = 65'h18f26256cbd188bb6;
    stim[8] = 65'h153e1cd55016d36ab;
    stim[9] = 65'h1a4812e78c2d470d1;
    stim[10] = 65'h1369794d74f20f86f;
    stim[11] = 65'h13ed5ae5df53b5bdb;
    stim[12] = 65'h1a97b9fb6599c06bc;
    stim[13] = 65'h1d3c85c79c363312d;
    stim[14] = 65'h1520c4f93bbc072cc;
    stim[15] = 65'h1e7c50c07c6276284;
    stim[16] = 65'h17868c85d4ac6351c;
    stim[17] = 65'h11a5e78a80bbdbca5;
    stim[18] = 65'h1a54c951b1fbf7d06;
    stim[19] = 65'h1f0882c02bd947f5a;
    stim[20] = 65'h1424625a89c353a02;
    stim[21] = 65'h13f54a66b8484e13b;
    stim[22] = 65'h1c26278ea833c4e83;
    stim[23] = 65'h191ccd5ed97591400;
    stim[24] = 65'h15ada520e38c672c4;
    stim[25] = 65'h1059519e78f0592c9;
    stim[26] = 65'h12f2742358948e97a;
    stim[27] = 65'h1d6a491fddbdd4d2d;
    stim[28] = 65'h1897b37e760fd37ba;
    stim[29] = 65'h1860cd1b23d78cbc9;
    stim[30] = 65'h1b1680426ac25aa00;
    stim[31] = 65'h1d83de5b54f0a7b55;
    stim[32] = 65'h103cb53de78273ef6;
    stim[33] = 65'h1791760c5e29e664c;
    stim[34] = 65'h1d7f5b990498f0ef3;
    stim[35] = 65'h1cee83a509c5806aa;
    stim[36] = 65'h12f6460fdd45cee9d;
    stim[37] = 65'h10d5cf94f552c06c5;
    stim[38] = 65'h14ffc1cb216662852;
    stim[39] = 65'h1c2f40c16755856b8;
    stim[40] = 65'h124e4c2b088761ca6;
    stim[41] = 65'h156014fe1e1eefb5c;
    stim[42] = 65'h1f82df4756af4f2f5;
    stim[43] = 65'h14e90c8064f99db77;
    stim[44] = 65'h1114bbda4d8815f65;
    stim[45] = 65'h1bd47ad1f199afd4d;
    stim[46] = 65'h190bbb298fbd2069f;
    stim[47] = 65'h15b44853b8f9da01d;
    stim[48] = 65'h1c82ef7468213ced6;
    stim[49] = 65'h1e663d59c0d02216a;
    stim[50] = 65'h1f7f4a420cec4e6e2;
    stim[51] = 65'h10eb9ab432997808f;
    stim[52] = 65'h1898b8bb38b12c7da;
    stim[53] = 65'h16252c4c8b12a5642;
    stim[54] = 65'h1c796f30c0fa7d474;
    stim[55] = 65'h10fcf14f9137a6938;
    stim[56] = 65'h14ee2e399683752ed;
    stim[57] = 65'h1c150c161443f6595;
    stim[58] = 65'h137075ce6f9b49a65;
    stim[59] = 65'h17882ae2c99976e82;
    stim[60] = 65'h19397906a811358d4;
    stim[61] = 65'h1c3f155b12fbd56c5;
    stim[62] = 65'h106ec00fda30bf795;
    stim[63] = 65'h191740cdd7e266edd;
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
      expv[0] = 32'h00000000;
      expv[1] = 32'h00000000;
      expv[2] = 32'h00000000;
      expv[3] = 32'h00800000;
      expv[4] = 32'h00800000;
      expv[5] = 32'h552d5478;
      expv[6] = 32'h5379e743;
      expv[7] = 32'h9fc43dd4;
      expv[8] = 32'h0d728784;
      expv[9] = 32'h19381edb;
      expv[10] = 32'h0de300e4;
      expv[11] = 32'h16a2769f;
      expv[12] = 32'h28eb3369;
      expv[13] = 32'h473ea040;
      expv[14] = 32'hf5b8c613;
      expv[15] = 32'hc4995bf1;
      expv[16] = 32'h58b1d07c;
      expv[17] = 32'hcf697a99;
      expv[18] = 32'h6f81ad59;
      expv[19] = 32'h04b43b42;
      expv[20] = 32'h67a4e304;
      expv[21] = 32'h86990728;
      expv[22] = 32'h6fcefd2e;
      expv[23] = 32'ha0188b0b;
      expv[24] = 32'h856e60e6;
      expv[25] = 32'h074d2c81;
      expv[26] = 32'h6aadb156;
      expv[27] = 32'h55293d56;
      expv[28] = 32'hd64dcbf2;
      expv[29] = 32'hfa068888;
      expv[30] = 32'h740e43a4;
      expv[31] = 32'habf87cee;
      expv[32] = 32'h8508db3d;
      expv[33] = 32'h1f1624bf;
      expv[34] = 32'he8e6b94f;
      expv[35] = 32'h3d89ab6f;
      expv[36] = 32'h9d5daa37;
      expv[37] = 32'he312a201;
      expv[38] = 32'h2cc3f73f;
      expv[39] = 32'hc5451837;
      expv[40] = 32'h24147d58;
      expv[41] = 32'h27e2a97d;
      expv[42] = 32'hf9ce3cde;
      expv[43] = 32'heedbecae;
      expv[44] = 32'hf978b73a;
      expv[45] = 32'ha4cce42e;
      expv[46] = 32'h5fd703aa;
      expv[47] = 32'hab4decf6;
      expv[48] = 32'h9871c76d;
      expv[49] = 32'h4e33fab6;
      expv[50] = 32'hac79009e;
      expv[51] = 32'h0bca0ab4;
      expv[52] = 32'hb4e7a06c;
      expv[53] = 32'h08785497;
      expv[54] = 32'h79ede141;
      expv[55] = 32'h56200539;
      expv[56] = 32'hd5187b62;
      expv[57] = 32'h98e2f5d2;
      expv[58] = 32'h64951f30;
      expv[59] = 32'h78a27a31;
      expv[60] = 32'hc71c131d;
      expv[61] = 32'hf25f7ef5;
      expv[62] = 32'hd39a9a4a;
      expv[63] = 32'h562e7908;
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
