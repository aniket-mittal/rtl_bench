// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_03288 dut (
    .clk(clk),
    .rst_n(in_vec[9:9]),
    .data(in_vec[8:1]),
    .crc_en(in_vec[0:0]),
    .crc32(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h0cd;
    stim[1] = 10'h02f;
    stim[2] = 10'h2dd;
    stim[3] = 10'h2e3;
    stim[4] = 10'h22b;
    stim[5] = 10'h27d;
    stim[6] = 10'h322;
    stim[7] = 10'h3cd;
    stim[8] = 10'h209;
    stim[9] = 10'h311;
    stim[10] = 10'h1b4;
    stim[11] = 10'h2c6;
    stim[12] = 10'h211;
    stim[13] = 10'h207;
    stim[14] = 10'h32a;
    stim[15] = 10'h288;
    stim[16] = 10'h2b6;
    stim[17] = 10'h26d;
    stim[18] = 10'h3cd;
    stim[19] = 10'h223;
    stim[20] = 10'h320;
    stim[21] = 10'h3cc;
    stim[22] = 10'h2c0;
    stim[23] = 10'h2a6;
    stim[24] = 10'h241;
    stim[25] = 10'h218;
    stim[26] = 10'h388;
    stim[27] = 10'h319;
    stim[28] = 10'h24c;
    stim[29] = 10'h33f;
    stim[30] = 10'h37c;
    stim[31] = 10'h222;
    stim[32] = 10'h3dd;
    stim[33] = 10'h2e4;
    stim[34] = 10'h15a;
    stim[35] = 10'h3f8;
    stim[36] = 10'h32c;
    stim[37] = 10'h300;
    stim[38] = 10'h27d;
    stim[39] = 10'h2e0;
    stim[40] = 10'h3fd;
    stim[41] = 10'h2ca;
    stim[42] = 10'h384;
    stim[43] = 10'h22a;
    stim[44] = 10'h330;
    stim[45] = 10'h3fa;
    stim[46] = 10'h396;
    stim[47] = 10'h297;
    stim[48] = 10'h2e8;
    stim[49] = 10'h3ef;
    stim[50] = 10'h264;
    stim[51] = 10'h3aa;
    stim[52] = 10'h2d8;
    stim[53] = 10'h321;
    stim[54] = 10'h37d;
    stim[55] = 10'h3b0;
    stim[56] = 10'h376;
    stim[57] = 10'h3ea;
    stim[58] = 10'h2c2;
    stim[59] = 10'h332;
    stim[60] = 10'h2b0;
    stim[61] = 10'h300;
    stim[62] = 10'h35d;
    stim[63] = 10'h2bf;
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
      expv[0] = 32'hffffffff;
      expv[1] = 32'hffffffff;
      expv[2] = 32'hffffffff;
      expv[3] = 32'hde2c2679;
      expv[4] = 32'he54b81c3;
      expv[5] = 32'hc2324b59;
      expv[6] = 32'h8ef4db7d;
      expv[7] = 32'h8ef4db7d;
      expv[8] = 32'h7e72219f;
      expv[9] = 32'hbd1ad8e1;
      expv[10] = 32'hffffffff;
      expv[11] = 32'hffffffff;
      expv[12] = 32'hffffffff;
      expv[13] = 32'h680b73cc;
      expv[14] = 32'h8c999216;
      expv[15] = 32'h8c999216;
      expv[16] = 32'h8c999216;
      expv[17] = 32'h8c999216;
      expv[18] = 32'h0b2af128;
      expv[19] = 32'hde9fb38a;
      expv[20] = 32'hfa7f2264;
      expv[21] = 32'hfa7f2264;
      expv[22] = 32'hfa7f2264;
      expv[23] = 32'hfa7f2264;
      expv[24] = 32'hfa7f2264;
      expv[25] = 32'h413bd38f;
      expv[26] = 32'h413bd38f;
      expv[27] = 32'h413bd38f;
      expv[28] = 32'h579d246a;
      expv[29] = 32'h579d246a;
      expv[30] = 32'he6afc6f1;
      expv[31] = 32'he6afc6f1;
      expv[32] = 32'he6afc6f1;
      expv[33] = 32'h89cefd38;
      expv[34] = 32'hffffffff;
      expv[35] = 32'hffffffff;
      expv[36] = 32'hffffffff;
      expv[37] = 32'hffffffff;
      expv[38] = 32'hffffffff;
      expv[39] = 32'ha6bd5e4e;
      expv[40] = 32'ha6bd5e4e;
      expv[41] = 32'he3c73a0f;
      expv[42] = 32'he3c73a0f;
      expv[43] = 32'he3c73a0f;
      expv[44] = 32'he3c73a0f;
      expv[45] = 32'he3c73a0f;
      expv[46] = 32'he3c73a0f;
      expv[47] = 32'he3c73a0f;
      expv[48] = 32'h1010f356;
      expv[49] = 32'h1010f356;
      expv[50] = 32'hcb17c2bc;
      expv[51] = 32'hcb17c2bc;
      expv[52] = 32'hcb17c2bc;
      expv[53] = 32'hcb17c2bc;
      expv[54] = 32'h4418ca86;
      expv[55] = 32'hbef3016f;
      expv[56] = 32'hbef3016f;
      expv[57] = 32'hbef3016f;
      expv[58] = 32'hbef3016f;
      expv[59] = 32'hbef3016f;
      expv[60] = 32'hbef3016f;
      expv[61] = 32'hbef3016f;
      expv[62] = 32'hbef3016f;
      expv[63] = 32'hbf117770;
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
