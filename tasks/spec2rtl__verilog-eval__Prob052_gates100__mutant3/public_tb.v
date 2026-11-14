// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 100;
  localparam OW = 3;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  dut dut (
    .in(in_vec[99:0]),
    .out_and(out_vec[2:2]),
    .out_or(out_vec[1:1]),
    .out_xor(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 100'h56e9699d3a4ea96b7d6e7e584;
    stim[1] = 100'hfd95efbb54bcc4cb30268d256;
    stim[2] = 100'h13e85b1b847e6d1187dfe89f7;
    stim[3] = 100'h522242b71a15526d674804f22;
    stim[4] = 100'h6d27fba905e864e06b3660c27;
    stim[5] = 100'hc572041a130e6c8d1c7517e09;
    stim[6] = 100'h6707c18a142ff7781f510f0c2;
    stim[7] = 100'h54bbc4ebd9ee00d2a8953d88f;
    stim[8] = 100'h6464be55a3ae386af283bb652;
    stim[9] = 100'ha3091c814066dbd3886b00cd4;
    stim[10] = 100'h38a513faca6a3bb2dc85aa3c6;
    stim[11] = 100'hbc6f94e0fbcf7c70ecec6238c;
    stim[12] = 100'hf0cce406cd8db76d447f9044a;
    stim[13] = 100'hbba419a35089a82f31b3acbad;
    stim[14] = 100'hec9bbfe33ca9c5490701b3e8c;
    stim[15] = 100'h793b4b02fa5243dfb72098909;
    stim[16] = 100'h63d87e6837d953002ba0feaf6;
    stim[17] = 100'h8aa7efa4f1386fda51f58e160;
    stim[18] = 100'hbb2c030f25e2e6082e76ac882;
    stim[19] = 100'ha361677f538133ca43588039c;
    stim[20] = 100'he17197ee9a34c7091e07f4319;
    stim[21] = 100'h95d857b2ed9157559f7d3c885;
    stim[22] = 100'hf2d0270012dc2e6648e471712;
    stim[23] = 100'hf46559495e939563adfa38bc5;
    stim[24] = 100'hdbaaac22d42b167d0d9043181;
    stim[25] = 100'h5f0982c05b28bb6d9d2ebe051;
    stim[26] = 100'ha750496cea8e0682a9f001593;
    stim[27] = 100'hb21efc61c4275609e65bc6e50;
    stim[28] = 100'hfae6eb3a5c802b49a9b89b574;
    stim[29] = 100'h443dd65b409845c315714c138;
    stim[30] = 100'h2de5ccdee172ba78992898b93;
    stim[31] = 100'h2a55da5ff1cface56e236832a;
    stim[32] = 100'h1c01627599a049c54946494e7;
    stim[33] = 100'h56270907d554ee0409315289e;
    stim[34] = 100'hf80de19336ddc39d54f95abcc;
    stim[35] = 100'hadcb20f7b1e11dfa5b90f52bb;
    stim[36] = 100'haa1cddb3ea3aeeef84b8008c5;
    stim[37] = 100'h8c75fa5c179f2c0e7a51619bd;
    stim[38] = 100'hab2c1187b8eca27584e29d2e2;
    stim[39] = 100'h54c0a07c0241392c679345278;
    stim[40] = 100'hf271da60d9f12ab466aadb4ed;
    stim[41] = 100'hb66c85245a4d9529cf73160bd;
    stim[42] = 100'h2e989267c5940ece0db0d257f;
    stim[43] = 100'h3741d2e29227a16d031555052;
    stim[44] = 100'hf82b464cfe32e98b491e21591;
    stim[45] = 100'h87d0d6bf203fde17ee494fef6;
    stim[46] = 100'hf31b0759a9390d042ffdbbabb;
    stim[47] = 100'h929ef8640c5a82f117466783b;
    stim[48] = 100'hbbe5fc63ad4d43b6b5d7bbb7d;
    stim[49] = 100'h4790442c1dde8039254396de0;
    stim[50] = 100'h6ce157787f1ec709bbd6e5aab;
    stim[51] = 100'ha591f1f1709337e0694bff2f2;
    stim[52] = 100'h0bf7143762c24538dea034191;
    stim[53] = 100'h2e0f2e881bf39ea3a55bad761;
    stim[54] = 100'heb99a7c80698dad776dc1797a;
    stim[55] = 100'hd8442c8e033b3b321ddb99c2b;
    stim[56] = 100'hc357f1b84d7930ee0413f9f41;
    stim[57] = 100'h91457df79163e7e97bd6dd166;
    stim[58] = 100'he82743bd5c658a384e62bfc69;
    stim[59] = 100'h833127e3f5e708af2dfceb64b;
    stim[60] = 100'ha8ff8d04ff0cafbff68c2839e;
    stim[61] = 100'ha23b0d5fefae0e76d7d230484;
    stim[62] = 100'h6ba7f0581deacb2bc7c908d06;
    stim[63] = 100'h75c14e7a38fa6c4de19c5585c;
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
      expv[0] = 3'h4;
      expv[1] = 3'h4;
      expv[2] = 3'h5;
      expv[3] = 3'h5;
      expv[4] = 3'h5;
      expv[5] = 3'h5;
      expv[6] = 3'h5;
      expv[7] = 3'h5;
      expv[8] = 3'h5;
      expv[9] = 3'h4;
      expv[10] = 3'h5;
      expv[11] = 3'h4;
      expv[12] = 3'h5;
      expv[13] = 3'h5;
      expv[14] = 3'h4;
      expv[15] = 3'h4;
      expv[16] = 3'h4;
      expv[17] = 3'h5;
      expv[18] = 3'h4;
      expv[19] = 3'h4;
      expv[20] = 3'h4;
      expv[21] = 3'h5;
      expv[22] = 3'h4;
      expv[23] = 3'h4;
      expv[24] = 3'h4;
      expv[25] = 3'h4;
      expv[26] = 3'h4;
      expv[27] = 3'h5;
      expv[28] = 3'h4;
      expv[29] = 3'h4;
      expv[30] = 3'h4;
      expv[31] = 3'h4;
      expv[32] = 3'h5;
      expv[33] = 3'h4;
      expv[34] = 3'h5;
      expv[35] = 3'h4;
      expv[36] = 3'h5;
      expv[37] = 3'h5;
      expv[38] = 3'h5;
      expv[39] = 3'h5;
      expv[40] = 3'h4;
      expv[41] = 3'h5;
      expv[42] = 3'h5;
      expv[43] = 3'h4;
      expv[44] = 3'h4;
      expv[45] = 3'h5;
      expv[46] = 3'h5;
      expv[47] = 3'h5;
      expv[48] = 3'h4;
      expv[49] = 3'h4;
      expv[50] = 3'h4;
      expv[51] = 3'h4;
      expv[52] = 3'h4;
      expv[53] = 3'h5;
      expv[54] = 3'h5;
      expv[55] = 3'h4;
      expv[56] = 3'h5;
      expv[57] = 3'h5;
      expv[58] = 3'h5;
      expv[59] = 3'h4;
      expv[60] = 3'h5;
      expv[61] = 3'h4;
      expv[62] = 3'h4;
      expv[63] = 3'h5;
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
