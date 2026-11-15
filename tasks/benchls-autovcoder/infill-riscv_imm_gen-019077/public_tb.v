// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 32;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_019077 dut (
    .ImmGen_instruction(in_vec[31:0]),
    .ImmGen_imm(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'h9abb03ad;
    stim[1] = 32'h75d17d3c;
    stim[2] = 32'h949ef456;
    stim[3] = 32'h5f5c87a3;
    stim[4] = 32'h575a5e40;
    stim[5] = 32'hb361dbfb;
    stim[6] = 32'h7645b4f1;
    stim[7] = 32'h5f72e163;
    stim[8] = 32'h11277b27;
    stim[9] = 32'h37d7479b;
    stim[10] = 32'hd5702f0e;
    stim[11] = 32'h9807d764;
    stim[12] = 32'h1dc1bafd;
    stim[13] = 32'h96bc80ff;
    stim[14] = 32'hc90ae19d;
    stim[15] = 32'h961b01b0;
    stim[16] = 32'h56fc0f95;
    stim[17] = 32'hea094cb3;
    stim[18] = 32'h571a92db;
    stim[19] = 32'h94b8ff1d;
    stim[20] = 32'h422f3b75;
    stim[21] = 32'h8bbaa482;
    stim[22] = 32'h72575caf;
    stim[23] = 32'h76d1192f;
    stim[24] = 32'h72880ece;
    stim[25] = 32'hf6571c0a;
    stim[26] = 32'hcaa96aef;
    stim[27] = 32'h0a3c0d24;
    stim[28] = 32'h2e99a73b;
    stim[29] = 32'h859c463a;
    stim[30] = 32'haa1b902c;
    stim[31] = 32'h6c35957c;
    stim[32] = 32'hed2b17c7;
    stim[33] = 32'h38ada913;
    stim[34] = 32'h965df4bf;
    stim[35] = 32'h915529b0;
    stim[36] = 32'h955da633;
    stim[37] = 32'hb026b807;
    stim[38] = 32'h02661dd2;
    stim[39] = 32'h958b8f8d;
    stim[40] = 32'ha427937f;
    stim[41] = 32'hc588c2da;
    stim[42] = 32'h903a573b;
    stim[43] = 32'h4198b038;
    stim[44] = 32'hc71d6318;
    stim[45] = 32'h90fddc15;
    stim[46] = 32'h4d54927d;
    stim[47] = 32'he0d64271;
    stim[48] = 32'h1fc77fd7;
    stim[49] = 32'h17573fcc;
    stim[50] = 32'h90fad145;
    stim[51] = 32'h35e0cdef;
    stim[52] = 32'ha2d56d2a;
    stim[53] = 32'hdc469238;
    stim[54] = 32'h5251ce2e;
    stim[55] = 32'h913d719d;
    stim[56] = 32'h55269aab;
    stim[57] = 32'h6a1cde8c;
    stim[58] = 32'h305351e3;
    stim[59] = 32'hb8485da0;
    stim[60] = 32'h0a9392ab;
    stim[61] = 32'he461f8a5;
    stim[62] = 32'h800a1cfa;
    stim[63] = 32'h125a77c8;
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
      expv[3] = 32'h000005ef;
      expv[4] = 32'h00000000;
      expv[5] = 32'h00000000;
      expv[6] = 32'h00000000;
      expv[7] = 32'h000005e2;
      expv[8] = 32'h00000000;
      expv[9] = 32'h00000000;
      expv[10] = 32'h00000000;
      expv[11] = 32'h00000000;
      expv[12] = 32'h00000000;
      expv[13] = 32'h00000000;
      expv[14] = 32'h00000000;
      expv[15] = 32'h00000000;
      expv[16] = 32'h00000000;
      expv[17] = 32'h00000000;
      expv[18] = 32'h00000000;
      expv[19] = 32'h00000000;
      expv[20] = 32'h00000000;
      expv[21] = 32'h00000000;
      expv[22] = 32'h00000000;
      expv[23] = 32'h00000000;
      expv[24] = 32'h00000000;
      expv[25] = 32'h00000000;
      expv[26] = 32'hfff964aa;
      expv[27] = 32'h00000000;
      expv[28] = 32'h00000000;
      expv[29] = 32'h00000000;
      expv[30] = 32'h00000000;
      expv[31] = 32'h00000000;
      expv[32] = 32'h00000000;
      expv[33] = 32'h0000038a;
      expv[34] = 32'h00000000;
      expv[35] = 32'h00000000;
      expv[36] = 32'h00000000;
      expv[37] = 32'h00000000;
      expv[38] = 32'h00000000;
      expv[39] = 32'h00000000;
      expv[40] = 32'h00000000;
      expv[41] = 32'h00000000;
      expv[42] = 32'h00000000;
      expv[43] = 32'h00000000;
      expv[44] = 32'h00000000;
      expv[45] = 32'h00000000;
      expv[46] = 32'h00000000;
      expv[47] = 32'h00000000;
      expv[48] = 32'h00000000;
      expv[49] = 32'h00000000;
      expv[50] = 32'h00000000;
      expv[51] = 32'h0000c35e;
      expv[52] = 32'h00000000;
      expv[53] = 32'h00000000;
      expv[54] = 32'h00000000;
      expv[55] = 32'h00000000;
      expv[56] = 32'h00000000;
      expv[57] = 32'h00000000;
      expv[58] = 32'h00000b02;
      expv[59] = 32'h00000000;
      expv[60] = 32'h00000000;
      expv[61] = 32'h00000000;
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
