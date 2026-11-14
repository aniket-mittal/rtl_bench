// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  dut dut (
    .do_sub(in_vec[16:16]),
    .a(in_vec[15:8]),
    .b(in_vec[7:0]),
    .out(out_vec[8:1]),
    .result_is_zero(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h0aa4a;
    stim[1] = 17'h05c1b;
    stim[2] = 17'h02e49;
    stim[3] = 17'h0f9e9;
    stim[4] = 17'h0125d;
    stim[5] = 17'h00d80;
    stim[6] = 17'h19925;
    stim[7] = 17'h0dc64;
    stim[8] = 17'h08e89;
    stim[9] = 17'h0780c;
    stim[10] = 17'h13ed8;
    stim[11] = 17'h00eb3;
    stim[12] = 17'h06c22;
    stim[13] = 17'h075c5;
    stim[14] = 17'h12e26;
    stim[15] = 17'h1c44d;
    stim[16] = 17'h0bfb2;
    stim[17] = 17'h050da;
    stim[18] = 17'h1fa38;
    stim[19] = 17'h098d2;
    stim[20] = 17'h0d8b2;
    stim[21] = 17'h1d2a3;
    stim[22] = 17'h0044c;
    stim[23] = 17'h0c0c8;
    stim[24] = 17'h14c7d;
    stim[25] = 17'h1764f;
    stim[26] = 17'h17a1d;
    stim[27] = 17'h1a2f4;
    stim[28] = 17'h02f54;
    stim[29] = 17'h0782c;
    stim[30] = 17'h1a0a0;
    stim[31] = 17'h05ab1;
    stim[32] = 17'h1027c;
    stim[33] = 17'h05fae;
    stim[34] = 17'h1a01f;
    stim[35] = 17'h1daaa;
    stim[36] = 17'h11820;
    stim[37] = 17'h15753;
    stim[38] = 17'h1367b;
    stim[39] = 17'h18347;
    stim[40] = 17'h0fd14;
    stim[41] = 17'h1d6ee;
    stim[42] = 17'h1218c;
    stim[43] = 17'h0ca10;
    stim[44] = 17'h17a07;
    stim[45] = 17'h0b90a;
    stim[46] = 17'h09c5c;
    stim[47] = 17'h1bfc3;
    stim[48] = 17'h19302;
    stim[49] = 17'h0b198;
    stim[50] = 17'h0309a;
    stim[51] = 17'h11508;
    stim[52] = 17'h029f6;
    stim[53] = 17'h060a0;
    stim[54] = 17'h1a367;
    stim[55] = 17'h14594;
    stim[56] = 17'h15995;
    stim[57] = 17'h13be3;
    stim[58] = 17'h1c18b;
    stim[59] = 17'h08d0e;
    stim[60] = 17'h1acf8;
    stim[61] = 17'h1b39c;
    stim[62] = 17'h1fb3e;
    stim[63] = 17'h1610c;
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
      expv[0] = 9'h1e8;
      expv[1] = 9'h0ee;
      expv[2] = 9'h0ee;
      expv[3] = 9'h1c4;
      expv[4] = 9'h0de;
      expv[5] = 9'h11a;
      expv[6] = 9'h0e8;
      expv[7] = 9'h081;
      expv[8] = 9'h02e;
      expv[9] = 9'h108;
      expv[10] = 9'h0cc;
      expv[11] = 9'h182;
      expv[12] = 9'h11c;
      expv[13] = 9'h074;
      expv[14] = 9'h010;
      expv[15] = 9'h0ee;
      expv[16] = 9'h0e2;
      expv[17] = 9'h054;
      expv[18] = 9'h184;
      expv[19] = 9'h0d4;
      expv[20] = 9'h114;
      expv[21] = 9'h05e;
      expv[22] = 9'h0a1;
      expv[23] = 9'h110;
      expv[24] = 9'h19e;
      expv[25] = 9'h04e;
      expv[26] = 9'h0ba;
      expv[27] = 9'h15c;
      expv[28] = 9'h106;
      expv[29] = 9'h148;
      expv[30] = 9'h001;
      expv[31] = 9'h016;
      expv[32] = 9'h10c;
      expv[33] = 9'h01a;
      expv[34] = 9'h102;
      expv[35] = 9'h061;
      expv[36] = 9'h1f0;
      expv[37] = 9'h008;
      expv[38] = 9'h176;
      expv[39] = 9'h078;
      expv[40] = 9'h022;
      expv[41] = 9'h1d0;
      expv[42] = 9'h12a;
      expv[43] = 9'h1b4;
      expv[44] = 9'h0e6;
      expv[45] = 9'h186;
      expv[46] = 9'h1f0;
      expv[47] = 9'h1f8;
      expv[48] = 9'h122;
      expv[49] = 9'h092;
      expv[50] = 9'h194;
      expv[51] = 9'h01a;
      expv[52] = 9'h03e;
      expv[53] = 9'h001;
      expv[54] = 9'h078;
      expv[55] = 9'h162;
      expv[56] = 9'h188;
      expv[57] = 9'h0b0;
      expv[58] = 9'h06c;
      expv[59] = 9'h136;
      expv[60] = 9'h168;
      expv[61] = 9'h02e;
      expv[62] = 9'h17a;
      expv[63] = 9'h0aa;
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
