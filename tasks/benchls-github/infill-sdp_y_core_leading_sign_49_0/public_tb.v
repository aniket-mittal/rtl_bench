// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 49;
  localparam OW = 6;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  SDP_Y_CORE_leading_sign_49_0 dut (
    .mantissa(in_vec[48:0]),
    .rtn(out_vec[5:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 49'h11593c5a37dc7;
    stim[1] = 49'h08ada08c25a58;
    stim[2] = 49'h0b9e95eeaa99a;
    stim[3] = 49'h1488f99e637e5;
    stim[4] = 49'h1779f7e811965;
    stim[5] = 49'h0b94950869dcf;
    stim[6] = 49'h0ddcd60d3f959;
    stim[7] = 49'h0dbc41f103aa4;
    stim[8] = 49'h015acfd12ae44;
    stim[9] = 49'h12b77004d7abf;
    stim[10] = 49'h0a56b90154d01;
    stim[11] = 49'h1e66f13dbf644;
    stim[12] = 49'h12b20d79c5a5c;
    stim[13] = 49'h094a040ff8f89;
    stim[14] = 49'h196678c48f235;
    stim[15] = 49'h0a56d50870841;
    stim[16] = 49'h0a98fad2483fb;
    stim[17] = 49'h14608085219a3;
    stim[18] = 49'h1db7789638fbf;
    stim[19] = 49'h07e29c002c677;
    stim[20] = 49'h14eae6516415b;
    stim[21] = 49'h035dbb5bdf7d8;
    stim[22] = 49'h122966d77e23b;
    stim[23] = 49'h124ee5b2b77cf;
    stim[24] = 49'h1da59980a189c;
    stim[25] = 49'h111e812d7478f;
    stim[26] = 49'h0f1bd4be88954;
    stim[27] = 49'h0cb93b67caaf2;
    stim[28] = 49'h0db49ec915b22;
    stim[29] = 49'h016091c6fc5c1;
    stim[30] = 49'h0caa4bb687107;
    stim[31] = 49'h099666638f8b6;
    stim[32] = 49'h0984eddc46917;
    stim[33] = 49'h0dcf6fa56729a;
    stim[34] = 49'h01fe5faec93b0;
    stim[35] = 49'h02e2fc57fb17b;
    stim[36] = 49'h119301b5ec5e5;
    stim[37] = 49'h1eea9727cd9fb;
    stim[38] = 49'h015c952df0d30;
    stim[39] = 49'h197fea53465aa;
    stim[40] = 49'h18bf3684343e9;
    stim[41] = 49'h117c6e393e3be;
    stim[42] = 49'h14358965567a3;
    stim[43] = 49'h1e42f689b3a3b;
    stim[44] = 49'h1a87d5059d6e0;
    stim[45] = 49'h173b2da455e3d;
    stim[46] = 49'h100ac9ec1922f;
    stim[47] = 49'h048675510b063;
    stim[48] = 49'h054669ec2748c;
    stim[49] = 49'h021a558918e06;
    stim[50] = 49'h1d15653a37dd4;
    stim[51] = 49'h0c9bd1fc44129;
    stim[52] = 49'h069540a41b16f;
    stim[53] = 49'h13ab89397adaa;
    stim[54] = 49'h0710727ad7b78;
    stim[55] = 49'h0b81434208b1a;
    stim[56] = 49'h1c07e2cb29eea;
    stim[57] = 49'h084e709048179;
    stim[58] = 49'h15f1756f848db;
    stim[59] = 49'h110f958d9eb36;
    stim[60] = 49'h038403df21ce1;
    stim[61] = 49'h1f7a315174c92;
    stim[62] = 49'h01d6068a61793;
    stim[63] = 49'h03a1f50ba9877;
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
      expv[0] = 6'h00;
      expv[1] = 6'h01;
      expv[2] = 6'h01;
      expv[3] = 6'h00;
      expv[4] = 6'h00;
      expv[5] = 6'h01;
      expv[6] = 6'h01;
      expv[7] = 6'h01;
      expv[8] = 6'h04;
      expv[9] = 6'h00;
      expv[10] = 6'h01;
      expv[11] = 6'h00;
      expv[12] = 6'h00;
      expv[13] = 6'h01;
      expv[14] = 6'h00;
      expv[15] = 6'h01;
      expv[16] = 6'h01;
      expv[17] = 6'h00;
      expv[18] = 6'h00;
      expv[19] = 6'h02;
      expv[20] = 6'h00;
      expv[21] = 6'h03;
      expv[22] = 6'h00;
      expv[23] = 6'h00;
      expv[24] = 6'h00;
      expv[25] = 6'h00;
      expv[26] = 6'h01;
      expv[27] = 6'h01;
      expv[28] = 6'h01;
      expv[29] = 6'h04;
      expv[30] = 6'h01;
      expv[31] = 6'h01;
      expv[32] = 6'h01;
      expv[33] = 6'h01;
      expv[34] = 6'h04;
      expv[35] = 6'h03;
      expv[36] = 6'h00;
      expv[37] = 6'h00;
      expv[38] = 6'h04;
      expv[39] = 6'h00;
      expv[40] = 6'h00;
      expv[41] = 6'h00;
      expv[42] = 6'h00;
      expv[43] = 6'h00;
      expv[44] = 6'h00;
      expv[45] = 6'h00;
      expv[46] = 6'h00;
      expv[47] = 6'h02;
      expv[48] = 6'h02;
      expv[49] = 6'h03;
      expv[50] = 6'h00;
      expv[51] = 6'h01;
      expv[52] = 6'h02;
      expv[53] = 6'h00;
      expv[54] = 6'h02;
      expv[55] = 6'h01;
      expv[56] = 6'h00;
      expv[57] = 6'h01;
      expv[58] = 6'h00;
      expv[59] = 6'h00;
      expv[60] = 6'h03;
      expv[61] = 6'h00;
      expv[62] = 6'h04;
      expv[63] = 6'h03;
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
