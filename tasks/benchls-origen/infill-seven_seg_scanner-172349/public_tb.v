// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 27;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_172349 dut (
    .ck(clk),
    .reset(in_vec[26:26]),
    .hz512(in_vec[25:25]),
    .dig4(in_vec[24:21]),
    .dig3(in_vec[20:17]),
    .dig2(in_vec[16:13]),
    .dig1(in_vec[12:9]),
    .dig0(in_vec[8:5]),
    .dispen(in_vec[4:0]),
    .common(out_vec[11:7]),
    .segment(out_vec[6:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 27'h5a484c7;
    stim[1] = 27'h4d4d147;
    stim[2] = 27'h105504b;
    stim[3] = 27'h273a2c3;
    stim[4] = 27'h11d9247;
    stim[5] = 27'h1cd0186;
    stim[6] = 27'h11ef95f;
    stim[7] = 27'h3b0cc19;
    stim[8] = 27'h2b40ca0;
    stim[9] = 27'h3f0fab1;
    stim[10] = 27'h0e4c40f;
    stim[11] = 27'h2584fed;
    stim[12] = 27'h3c59075;
    stim[13] = 27'h2c9c797;
    stim[14] = 27'h12924ec;
    stim[15] = 27'h3236a2e;
    stim[16] = 27'h1eadb18;
    stim[17] = 27'h337f0aa;
    stim[18] = 27'h08fffac;
    stim[19] = 27'h372e4e7;
    stim[20] = 27'h006d34d;
    stim[21] = 27'h0f8b716;
    stim[22] = 27'h2b322fc;
    stim[23] = 27'h09f48af;
    stim[24] = 27'h2f4785a;
    stim[25] = 27'h1a8a99d;
    stim[26] = 27'h2f09ee4;
    stim[27] = 27'h017fb6d;
    stim[28] = 27'h3707998;
    stim[29] = 27'h12a484e;
    stim[30] = 27'h095eeb8;
    stim[31] = 27'h2e4aae3;
    stim[32] = 27'h06473db;
    stim[33] = 27'h1bde69d;
    stim[34] = 27'h351423f;
    stim[35] = 27'h0e2ddd6;
    stim[36] = 27'h0215723;
    stim[37] = 27'h006760a;
    stim[38] = 27'h083b051;
    stim[39] = 27'h1f3524c;
    stim[40] = 27'h1cb91af;
    stim[41] = 27'h10bea3d;
    stim[42] = 27'h01b9e7b;
    stim[43] = 27'h27bf655;
    stim[44] = 27'h3396d13;
    stim[45] = 27'h1d5af0a;
    stim[46] = 27'h57c77fb;
    stim[47] = 27'h049b49a;
    stim[48] = 27'h279bbde;
    stim[49] = 27'h349c773;
    stim[50] = 27'h2de5ca1;
    stim[51] = 27'h4381cb6;
    stim[52] = 27'h0b5492f;
    stim[53] = 27'h164657f;
    stim[54] = 27'h17cd68f;
    stim[55] = 27'h0659387;
    stim[56] = 27'h2883fb6;
    stim[57] = 27'h6a2cc67;
    stim[58] = 27'h36e8e94;
    stim[59] = 27'h1b909f8;
    stim[60] = 27'h065bba3;
    stim[61] = 27'h0d1a1f8;
    stim[62] = 27'h18938a8;
    stim[63] = 27'h0bf33f3;
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
      expv[0] = 12'h082;
      expv[1] = 12'h0ff;
      expv[2] = 12'h0a4;
      expv[3] = 12'h179;
      expv[4] = 12'h27f;
      expv[5] = 12'h002;
      expv[6] = 12'h800;
      expv[7] = 12'h07f;
      expv[8] = 12'h07f;
      expv[9] = 12'h07f;
      expv[10] = 12'h07f;
      expv[11] = 12'h07f;
      expv[12] = 12'h07f;
      expv[13] = 12'h07f;
      expv[14] = 12'h07f;
      expv[15] = 12'h07f;
      expv[16] = 12'h07f;
      expv[17] = 12'h07f;
      expv[18] = 12'h07f;
      expv[19] = 12'h124;
      expv[20] = 12'h202;
      expv[21] = 12'h07f;
      expv[22] = 12'h812;
      expv[23] = 12'h07f;
      expv[24] = 12'h07f;
      expv[25] = 12'h07f;
      expv[26] = 12'h07f;
      expv[27] = 12'h07f;
      expv[28] = 12'h07f;
      expv[29] = 12'h07f;
      expv[30] = 12'h07f;
      expv[31] = 12'h07f;
      expv[32] = 12'h07f;
      expv[33] = 12'h07f;
      expv[34] = 12'h0f9;
      expv[35] = 12'h17f;
      expv[36] = 12'h07f;
      expv[37] = 12'h430;
      expv[38] = 12'h819;
      expv[39] = 12'h07f;
      expv[40] = 12'h07f;
      expv[41] = 12'h07f;
      expv[42] = 12'h07f;
      expv[43] = 12'h07f;
      expv[44] = 12'h07f;
      expv[45] = 12'h07f;
      expv[46] = 12'h0ff;
      expv[47] = 12'h019;
      expv[48] = 12'h17f;
      expv[49] = 12'h07f;
      expv[50] = 12'h07f;
      expv[51] = 12'h012;
      expv[52] = 12'h090;
      expv[53] = 12'h124;
      expv[54] = 12'h202;
      expv[55] = 12'h024;
      expv[56] = 12'h819;
      expv[57] = 12'h0b0;
      expv[58] = 12'h019;
      expv[59] = 12'h019;
      expv[60] = 12'h07f;
      expv[61] = 12'h400;
      expv[62] = 12'h07f;
      expv[63] = 12'h07f;
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
