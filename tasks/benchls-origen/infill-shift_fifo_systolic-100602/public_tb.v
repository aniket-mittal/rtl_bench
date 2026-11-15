// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 66;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_100602 dut (
    .clk(clk),
    .rst_n(in_vec[65:65]),
    .en(in_vec[64:64]),
    .d(in_vec[63:0]),
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
    stim[0] = 66'h0ae1e5fc550aaacdb;
    stim[1] = 66'h0920a324176a5094b;
    stim[2] = 66'h316672c2b6ed5e9cf;
    stim[3] = 66'h2a4bc7282af6635ce;
    stim[4] = 66'h27c7ae23b4e3fa510;
    stim[5] = 66'h3da1a2ef84d9004fa;
    stim[6] = 66'h37a05b78499a5f70e;
    stim[7] = 66'h2369adf5d3e8a4af5;
    stim[8] = 66'h2d080fafcebea0462;
    stim[9] = 66'h349e72b1387ef9063;
    stim[10] = 66'h3667732aded19c764;
    stim[11] = 66'h37acaabdba59ec043;
    stim[12] = 66'h2411d7e350fdfe2e2;
    stim[13] = 66'h151ce0abe1800767b;
    stim[14] = 66'h2ce74b9e545065354;
    stim[15] = 66'h3ea9cd40d44e75b01;
    stim[16] = 66'h30c4835020398d57b;
    stim[17] = 66'h29208e4f584396435;
    stim[18] = 66'h2721538033c29a3f5;
    stim[19] = 66'h3ce1edbd24caecffd;
    stim[20] = 66'h3dc3e52b196ac9d05;
    stim[21] = 66'h258acc432b7f1bd1c;
    stim[22] = 66'h347a276c39e93bd02;
    stim[23] = 66'h37928d17edc40ff59;
    stim[24] = 66'h21e1f7fdfec09f18c;
    stim[25] = 66'h2e928176732c937fa;
    stim[26] = 66'h2300b6c5b2645d685;
    stim[27] = 66'h20c377411be2b9d8b;
    stim[28] = 66'h32690ca930ffed082;
    stim[29] = 66'h31bb906cfa1f135d0;
    stim[30] = 66'h3f077db932f168396;
    stim[31] = 66'h28caafdd0a19308ac;
    stim[32] = 66'h280b06e9bb7d0f807;
    stim[33] = 66'h2d54fd90326187dfe;
    stim[34] = 66'h3256df6ef0119e68e;
    stim[35] = 66'h2fb69fc4ad07bc8d8;
    stim[36] = 66'h2f27ac40467b096ec;
    stim[37] = 66'h3fe083dcc5bae4c08;
    stim[38] = 66'h2d0be64d95ef3b070;
    stim[39] = 66'h2865b61afe8398cdb;
    stim[40] = 66'h3c0d482242c11d7e8;
    stim[41] = 66'h28b296f1c370ec314;
    stim[42] = 66'h2b3f70401198dd779;
    stim[43] = 66'h364e47b40fe9b16e0;
    stim[44] = 66'h3c9634807d8e62a89;
    stim[45] = 66'h322077de24512301d;
    stim[46] = 66'h213a6ec6de680f98d;
    stim[47] = 66'h3b8622671636a5e69;
    stim[48] = 66'h2d67b8fe95097b2df;
    stim[49] = 66'h22569f938ca6440bd;
    stim[50] = 66'h3074ac867e3039fd8;
    stim[51] = 66'h30f2befac18a5af3c;
    stim[52] = 66'h2589aa69b5e89fe6d;
    stim[53] = 66'h2a7818d6e89003ad3;
    stim[54] = 66'h2fc525a04d3ec6dc9;
    stim[55] = 66'h35c368c5bd4bb55ee;
    stim[56] = 66'h2375220e20b532f36;
    stim[57] = 66'h2013f864fb35c58cd;
    stim[58] = 66'h3f4fb6050eeb39d0f;
    stim[59] = 66'h3f135e692a16cc421;
    stim[60] = 66'h3aca26ab73de41747;
    stim[61] = 66'h295e564269adf34a0;
    stim[62] = 66'h27f111221ead3e351;
    stim[63] = 66'h22e855ee925507956;
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
      expv[0] = 64'h0000000000000000;
      expv[1] = 64'h0000000000000000;
      expv[2] = 64'h0000000000000000;
      expv[3] = 64'h0000000000000000;
      expv[4] = 64'h0000000000000000;
      expv[5] = 64'h0000000000000000;
      expv[6] = 64'h0000000000000000;
      expv[7] = 64'h0000000000000000;
      expv[8] = 64'h0000000000000000;
      expv[9] = 64'h0000000000000000;
      expv[10] = 64'h0000000000000000;
      expv[11] = 64'h0000000000000000;
      expv[12] = 64'h0000000000000000;
      expv[13] = 64'h0000000000000000;
      expv[14] = 64'h0000000000000000;
      expv[15] = 64'h0000000000000000;
      expv[16] = 64'h0000000000000000;
      expv[17] = 64'h0000000000000000;
      expv[18] = 64'h0000000000000000;
      expv[19] = 64'h0000000000000000;
      expv[20] = 64'h0000000000000000;
      expv[21] = 64'h0000000000000000;
      expv[22] = 64'h0000000000000000;
      expv[23] = 64'h0000000000000000;
      expv[24] = 64'h0000000000000000;
      expv[25] = 64'h0000000000000000;
      expv[26] = 64'h0000000000000000;
      expv[27] = 64'h0000000000000000;
      expv[28] = 64'h0000000000000000;
      expv[29] = 64'h0000000000000000;
      expv[30] = 64'h1bb906cfa1f135d0;
      expv[31] = 64'h1bb906cfa1f135d0;
      expv[32] = 64'h1bb906cfa1f135d0;
      expv[33] = 64'h1bb906cfa1f135d0;
      expv[34] = 64'h1bb906cfa1f135d0;
      expv[35] = 64'h1bb906cfa1f135d0;
      expv[36] = 64'h1bb906cfa1f135d0;
      expv[37] = 64'h1bb906cfa1f135d0;
      expv[38] = 64'h1bb906cfa1f135d0;
      expv[39] = 64'h1bb906cfa1f135d0;
      expv[40] = 64'h1bb906cfa1f135d0;
      expv[41] = 64'h1bb906cfa1f135d0;
      expv[42] = 64'h1bb906cfa1f135d0;
      expv[43] = 64'h1bb906cfa1f135d0;
      expv[44] = 64'h1bb906cfa1f135d0;
      expv[45] = 64'h1bb906cfa1f135d0;
      expv[46] = 64'h1bb906cfa1f135d0;
      expv[47] = 64'h1bb906cfa1f135d0;
      expv[48] = 64'h1bb906cfa1f135d0;
      expv[49] = 64'h1bb906cfa1f135d0;
      expv[50] = 64'h1bb906cfa1f135d0;
      expv[51] = 64'h1bb906cfa1f135d0;
      expv[52] = 64'h1bb906cfa1f135d0;
      expv[53] = 64'h1bb906cfa1f135d0;
      expv[54] = 64'h1bb906cfa1f135d0;
      expv[55] = 64'h1bb906cfa1f135d0;
      expv[56] = 64'h1bb906cfa1f135d0;
      expv[57] = 64'h1bb906cfa1f135d0;
      expv[58] = 64'h1bb906cfa1f135d0;
      expv[59] = 64'h1bb906cfa1f135d0;
      expv[60] = 64'h1bb906cfa1f135d0;
      expv[61] = 64'h1bb906cfa1f135d0;
      expv[62] = 64'h1bb906cfa1f135d0;
      expv[63] = 64'h1bb906cfa1f135d0;
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
