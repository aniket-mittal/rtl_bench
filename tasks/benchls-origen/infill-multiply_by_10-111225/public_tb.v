// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 18;
  localparam OW = 34;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_111225 dut (
    .ap_clk(clk),
    .ap_rst(in_vec[17:17]),
    .ap_start(in_vec[16:16]),
    .n(in_vec[15:0]),
    .ap_ready(out_vec[33:33]),
    .ap_done(out_vec[32:32]),
    .ap_return(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 18'h2f49e;
    stim[1] = 18'h2f2b6;
    stim[2] = 18'h1ea11;
    stim[3] = 18'h0875a;
    stim[4] = 18'h077bf;
    stim[5] = 18'h06937;
    stim[6] = 18'h0daf5;
    stim[7] = 18'h02097;
    stim[8] = 18'h22b7c;
    stim[9] = 18'h002f9;
    stim[10] = 18'h0af7c;
    stim[11] = 18'h188e9;
    stim[12] = 18'h10f09;
    stim[13] = 18'h05bb8;
    stim[14] = 18'h1936c;
    stim[15] = 18'h03790;
    stim[16] = 18'h1f54c;
    stim[17] = 18'h1cb13;
    stim[18] = 18'h1d3c0;
    stim[19] = 18'h1805c;
    stim[20] = 18'h1fd78;
    stim[21] = 18'h1b3b0;
    stim[22] = 18'h05ad0;
    stim[23] = 18'h07950;
    stim[24] = 18'h1d46f;
    stim[25] = 18'h0a220;
    stim[26] = 18'h0807f;
    stim[27] = 18'h0c16a;
    stim[28] = 18'h19c63;
    stim[29] = 18'h120a1;
    stim[30] = 18'h15b9b;
    stim[31] = 18'h0aaae;
    stim[32] = 18'h07156;
    stim[33] = 18'h0023f;
    stim[34] = 18'h035fd;
    stim[35] = 18'h16486;
    stim[36] = 18'h12e09;
    stim[37] = 18'h1d928;
    stim[38] = 18'h00eed;
    stim[39] = 18'h1593b;
    stim[40] = 18'h09a69;
    stim[41] = 18'h12f4e;
    stim[42] = 18'h00f3f;
    stim[43] = 18'h0e209;
    stim[44] = 18'h1ddb8;
    stim[45] = 18'h12c8d;
    stim[46] = 18'h11df6;
    stim[47] = 18'h1b9b6;
    stim[48] = 18'h0f9f6;
    stim[49] = 18'h18856;
    stim[50] = 18'h183a6;
    stim[51] = 18'h149d1;
    stim[52] = 18'h0ccab;
    stim[53] = 18'h06f94;
    stim[54] = 18'h19d05;
    stim[55] = 18'h1d3c6;
    stim[56] = 18'h010cf;
    stim[57] = 18'h092f5;
    stim[58] = 18'h15cd5;
    stim[59] = 18'h03c6a;
    stim[60] = 18'h1a9a7;
    stim[61] = 18'h10758;
    stim[62] = 18'h03d7b;
    stim[63] = 18'h11ca5;
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
      expv[0] = 34'h000000000;
      expv[1] = 34'h000000000;
      expv[2] = 34'h000000000;
      expv[3] = 34'h000000000;
      expv[4] = 34'h0000924aa;
      expv[5] = 34'h1000924aa;
      expv[6] = 34'h2000924aa;
      expv[7] = 34'h2000924aa;
      expv[8] = 34'h000000000;
      expv[9] = 34'h000000000;
      expv[10] = 34'h200000000;
      expv[11] = 34'h200000000;
      expv[12] = 34'h000000000;
      expv[13] = 34'h00005591a;
      expv[14] = 34'h10005591a;
      expv[15] = 34'h00005591a;
      expv[16] = 34'h00005c238;
      expv[17] = 34'h10005c238;
      expv[18] = 34'h10005c238;
      expv[19] = 34'h10005c238;
      expv[20] = 34'h10005c238;
      expv[21] = 34'h10005c238;
      expv[22] = 34'h10005c238;
      expv[23] = 34'h10005c238;
      expv[24] = 34'h20005c238;
      expv[25] = 34'h00005c238;
      expv[26] = 34'h000084c56;
      expv[27] = 34'h100084c56;
      expv[28] = 34'h200084c56;
      expv[29] = 34'h000084c56;
      expv[30] = 34'h000061bde;
      expv[31] = 34'h100061bde;
      expv[32] = 34'h100061bde;
      expv[33] = 34'h200061bde;
      expv[34] = 34'h200061bde;
      expv[35] = 34'h200061bde;
      expv[36] = 34'h000061bde;
      expv[37] = 34'h00003ed3c;
      expv[38] = 34'h10003ed3c;
      expv[39] = 34'h10003ed3c;
      expv[40] = 34'h00003ed3c;
      expv[41] = 34'h000037c4e;
      expv[42] = 34'h100037c4e;
      expv[43] = 34'h100037c4e;
      expv[44] = 34'h200037c4e;
      expv[45] = 34'h000037c4e;
      expv[46] = 34'h00008a930;
      expv[47] = 34'h10008a930;
      expv[48] = 34'h10008a930;
      expv[49] = 34'h10008a930;
      expv[50] = 34'h00008a930;
      expv[51] = 34'h00005535c;
      expv[52] = 34'h10005535c;
      expv[53] = 34'h10005535c;
      expv[54] = 34'h20005535c;
      expv[55] = 34'h00005535c;
      expv[56] = 34'h000062232;
      expv[57] = 34'h100062232;
      expv[58] = 34'h200062232;
      expv[59] = 34'h000062232;
      expv[60] = 34'h00003a052;
      expv[61] = 34'h10003a052;
      expv[62] = 34'h10003a052;
      expv[63] = 34'h10003a052;
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
