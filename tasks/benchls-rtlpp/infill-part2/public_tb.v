// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  part2 dut (
    .SW(in_vec[16:0]),
    .LEDR(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h05fcd;
    stim[1] = 17'h1d93c;
    stim[2] = 17'h087b5;
    stim[3] = 17'h0b3f9;
    stim[4] = 17'h096f7;
    stim[5] = 17'h0caa0;
    stim[6] = 17'h0bd92;
    stim[7] = 17'h1a1e8;
    stim[8] = 17'h07446;
    stim[9] = 17'h00349;
    stim[10] = 17'h09a7f;
    stim[11] = 17'h091e5;
    stim[12] = 17'h11bb8;
    stim[13] = 17'h14d6c;
    stim[14] = 17'h05f3e;
    stim[15] = 17'h0b20b;
    stim[16] = 17'h189e5;
    stim[17] = 17'h0fbb7;
    stim[18] = 17'h13725;
    stim[19] = 17'h1347c;
    stim[20] = 17'h1100c;
    stim[21] = 17'h10e7a;
    stim[22] = 17'h07ffd;
    stim[23] = 17'h09f1f;
    stim[24] = 17'h1525b;
    stim[25] = 17'h132dc;
    stim[26] = 17'h0d5a5;
    stim[27] = 17'h0c8e3;
    stim[28] = 17'h0f1c0;
    stim[29] = 17'h02c3d;
    stim[30] = 17'h12382;
    stim[31] = 17'h1d227;
    stim[32] = 17'h1e0be;
    stim[33] = 17'h175c6;
    stim[34] = 17'h178d4;
    stim[35] = 17'h1d737;
    stim[36] = 17'h0f0cf;
    stim[37] = 17'h04dca;
    stim[38] = 17'h1c2a4;
    stim[39] = 17'h0613c;
    stim[40] = 17'h0a421;
    stim[41] = 17'h00587;
    stim[42] = 17'h0de37;
    stim[43] = 17'h0b477;
    stim[44] = 17'h1566c;
    stim[45] = 17'h1586d;
    stim[46] = 17'h15af8;
    stim[47] = 17'h0cd42;
    stim[48] = 17'h14597;
    stim[49] = 17'h0a849;
    stim[50] = 17'h0790c;
    stim[51] = 17'h0b123;
    stim[52] = 17'h01473;
    stim[53] = 17'h0bd3d;
    stim[54] = 17'h07931;
    stim[55] = 17'h02337;
    stim[56] = 17'h06761;
    stim[57] = 17'h1ad46;
    stim[58] = 17'h161f5;
    stim[59] = 17'h05b64;
    stim[60] = 17'h128d3;
    stim[61] = 17'h03421;
    stim[62] = 17'h1a96f;
    stim[63] = 17'h0eb01;
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
      expv[0] = 8'hcd;
      expv[1] = 8'h02;
      expv[2] = 8'h48;
      expv[3] = 8'h04;
      expv[4] = 8'h08;
      expv[5] = 8'h15;
      expv[6] = 8'h40;
      expv[7] = 8'h16;
      expv[8] = 8'h46;
      expv[9] = 8'h49;
      expv[10] = 8'h00;
      expv[11] = 8'h0a;
      expv[12] = 8'hb8;
      expv[13] = 8'h6c;
      expv[14] = 8'h3e;
      expv[15] = 8'h44;
      expv[16] = 8'h12;
      expv[17] = 8'h00;
      expv[18] = 8'h25;
      expv[19] = 8'h7c;
      expv[20] = 8'h0c;
      expv[21] = 8'h7a;
      expv[22] = 8'hfd;
      expv[23] = 8'h60;
      expv[24] = 8'h5b;
      expv[25] = 8'hdc;
      expv[26] = 8'h0a;
      expv[27] = 8'h14;
      expv[28] = 8'h0e;
      expv[29] = 8'h3d;
      expv[30] = 8'h82;
      expv[31] = 8'h08;
      expv[32] = 8'h01;
      expv[33] = 8'hc6;
      expv[34] = 8'hd4;
      expv[35] = 8'h08;
      expv[36] = 8'h00;
      expv[37] = 8'hca;
      expv[38] = 8'h19;
      expv[39] = 8'h3c;
      expv[40] = 8'h5a;
      expv[41] = 8'h87;
      expv[42] = 8'h00;
      expv[43] = 8'h08;
      expv[44] = 8'h6c;
      expv[45] = 8'h6d;
      expv[46] = 8'hf8;
      expv[47] = 8'h30;
      expv[48] = 8'h97;
      expv[49] = 8'h16;
      expv[50] = 8'h0c;
      expv[51] = 8'h4c;
      expv[52] = 8'h73;
      expv[53] = 8'h42;
      expv[54] = 8'h31;
      expv[55] = 8'h37;
      expv[56] = 8'h61;
      expv[57] = 8'h10;
      expv[58] = 8'hf5;
      expv[59] = 8'h64;
      expv[60] = 8'hd3;
      expv[61] = 8'h21;
      expv[62] = 8'h10;
      expv[63] = 8'h14;
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
