// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 21;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_103973 dut (
    .x(in_vec[20:5]),
    .b(in_vec[4:1]),
    .alufn(in_vec[0:0]),
    .shiftOutput(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 21'h044dd7;
    stim[1] = 21'h0ca3f4;
    stim[2] = 21'h15c06e;
    stim[3] = 21'h114719;
    stim[4] = 21'h124e72;
    stim[5] = 21'h1b2974;
    stim[6] = 21'h071aae;
    stim[7] = 21'h1c4017;
    stim[8] = 21'h0adaf6;
    stim[9] = 21'h0900f2;
    stim[10] = 21'h121fcc;
    stim[11] = 21'h137f6e;
    stim[12] = 21'h1c26ae;
    stim[13] = 21'h0a96b3;
    stim[14] = 21'h1233b6;
    stim[15] = 21'h09c0a5;
    stim[16] = 21'h145b20;
    stim[17] = 21'h168371;
    stim[18] = 21'h13888d;
    stim[19] = 21'h0c3a5e;
    stim[20] = 21'h065250;
    stim[21] = 21'h0de64b;
    stim[22] = 21'h013e51;
    stim[23] = 21'h1fce6f;
    stim[24] = 21'h175f43;
    stim[25] = 21'h0be08d;
    stim[26] = 21'h09e915;
    stim[27] = 21'h1b35c8;
    stim[28] = 21'h02dbce;
    stim[29] = 21'h07532a;
    stim[30] = 21'h0caca0;
    stim[31] = 21'h16f9f7;
    stim[32] = 21'h1739c3;
    stim[33] = 21'h02e94c;
    stim[34] = 21'h05e548;
    stim[35] = 21'h0896d6;
    stim[36] = 21'h15c16e;
    stim[37] = 21'h1c64aa;
    stim[38] = 21'h1e2c97;
    stim[39] = 21'h090ae3;
    stim[40] = 21'h00f31c;
    stim[41] = 21'h12ac01;
    stim[42] = 21'h099124;
    stim[43] = 21'h14ce59;
    stim[44] = 21'h0eb907;
    stim[45] = 21'h023b6d;
    stim[46] = 21'h168250;
    stim[47] = 21'h151bcc;
    stim[48] = 21'h0dbf8d;
    stim[49] = 21'h04f1fc;
    stim[50] = 21'h1ace1d;
    stim[51] = 21'h1da5d6;
    stim[52] = 21'h0501ed;
    stim[53] = 21'h119b48;
    stim[54] = 21'h156e07;
    stim[55] = 21'h0dbbee;
    stim[56] = 21'h06111f;
    stim[57] = 21'h16efa3;
    stim[58] = 21'h06f2a4;
    stim[59] = 21'h0cc44d;
    stim[60] = 21'h021a62;
    stim[61] = 21'h1c194c;
    stim[62] = 21'h112c9e;
    stim[63] = 21'h025c3c;
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
      expv[0] = 16'h7000;
      expv[1] = 16'h7c00;
      expv[2] = 16'h0180;
      expv[3] = 16'h8000;
      expv[4] = 16'he600;
      expv[5] = 16'h2c00;
      expv[6] = 16'h6a80;
      expv[7] = 16'h0000;
      expv[8] = 16'hb800;
      expv[9] = 16'h0e00;
      expv[10] = 16'h3f80;
      expv[11] = 16'hfd80;
      expv[12] = 16'h9a80;
      expv[13] = 16'h6bff;
      expv[14] = 16'he800;
      expv[15] = 16'h3817;
      expv[16] = 16'ha2d9;
      expv[17] = 16'h1bff;
      expv[18] = 16'h1100;
      expv[19] = 16'h0000;
      expv[20] = 16'h9200;
      expv[21] = 16'he640;
      expv[22] = 16'hf200;
      expv[23] = 16'h39ff;
      expv[24] = 16'h75f4;
      expv[25] = 16'hc100;
      expv[26] = 16'h2000;
      expv[27] = 16'h9ae0;
      expv[28] = 16'h6f00;
      expv[29] = 16'h5320;
      expv[30] = 16'h6565;
      expv[31] = 16'h7fff;
      expv[32] = 16'h739c;
      expv[33] = 16'hd280;
      expv[34] = 16'hf2a0;
      expv[35] = 16'hb000;
      expv[36] = 16'h0580;
      expv[37] = 16'h64a0;
      expv[38] = 16'h2000;
      expv[39] = 16'h90af;
      expv[40] = 16'h0000;
      expv[41] = 16'h9560;
      expv[42] = 16'h3224;
      expv[43] = 16'h2000;
      expv[44] = 16'hae40;
      expv[45] = 16'h76ff;
      expv[46] = 16'h1200;
      expv[47] = 16'h3780;
      expv[48] = 16'h7f00;
      expv[49] = 16'hc000;
      expv[50] = 16'h0000;
      expv[51] = 16'h7000;
      expv[52] = 16'h03ff;
      expv[53] = 16'hcda0;
      expv[54] = 16'h5b80;
      expv[55] = 16'hef80;
      expv[56] = 16'h0000;
      expv[57] = 16'h6efb;
      expv[58] = 16'hde54;
      expv[59] = 16'h8880;
      expv[60] = 16'h21a6;
      expv[61] = 16'h3280;
      expv[62] = 16'h0000;
      expv[63] = 16'h4000;
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
