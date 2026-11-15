// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 16;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_01888 dut (
    .i(in_vec[15:0]),
    .o3(out_vec[15:12]),
    .o2(out_vec[11:8]),
    .o1(out_vec[7:4]),
    .o0(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 16'hf990;
    stim[1] = 16'he9c6;
    stim[2] = 16'h62b6;
    stim[3] = 16'hdaf0;
    stim[4] = 16'he6e6;
    stim[5] = 16'hd39a;
    stim[6] = 16'h4cee;
    stim[7] = 16'h0421;
    stim[8] = 16'h62cd;
    stim[9] = 16'h3fca;
    stim[10] = 16'h8d8a;
    stim[11] = 16'h3b9e;
    stim[12] = 16'hb48a;
    stim[13] = 16'hd89a;
    stim[14] = 16'hf7c7;
    stim[15] = 16'hf1a4;
    stim[16] = 16'h4948;
    stim[17] = 16'h1f32;
    stim[18] = 16'hf279;
    stim[19] = 16'hcb3b;
    stim[20] = 16'hc6ed;
    stim[21] = 16'hfdb4;
    stim[22] = 16'h3f79;
    stim[23] = 16'hb117;
    stim[24] = 16'h7a06;
    stim[25] = 16'h85fe;
    stim[26] = 16'h3d51;
    stim[27] = 16'h788f;
    stim[28] = 16'h2423;
    stim[29] = 16'he8fa;
    stim[30] = 16'h2836;
    stim[31] = 16'had62;
    stim[32] = 16'h29ad;
    stim[33] = 16'heed9;
    stim[34] = 16'he74a;
    stim[35] = 16'hd296;
    stim[36] = 16'hdcfc;
    stim[37] = 16'hea20;
    stim[38] = 16'h255d;
    stim[39] = 16'h3c46;
    stim[40] = 16'h0826;
    stim[41] = 16'hc878;
    stim[42] = 16'h7292;
    stim[43] = 16'hf769;
    stim[44] = 16'hfdfa;
    stim[45] = 16'h35f3;
    stim[46] = 16'h66ca;
    stim[47] = 16'h3403;
    stim[48] = 16'h67d1;
    stim[49] = 16'h3391;
    stim[50] = 16'h725c;
    stim[51] = 16'h76eb;
    stim[52] = 16'hce63;
    stim[53] = 16'h8856;
    stim[54] = 16'h1021;
    stim[55] = 16'h9dd5;
    stim[56] = 16'hca04;
    stim[57] = 16'h6394;
    stim[58] = 16'h58b4;
    stim[59] = 16'h6c5c;
    stim[60] = 16'h6226;
    stim[61] = 16'h1657;
    stim[62] = 16'h325a;
    stim[63] = 16'h3bcb;
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
      expv[0] = 16'hf990;
      expv[1] = 16'he9c6;
      expv[2] = 16'h62b6;
      expv[3] = 16'hdaf0;
      expv[4] = 16'he6e6;
      expv[5] = 16'hd39a;
      expv[6] = 16'h4cee;
      expv[7] = 16'h0421;
      expv[8] = 16'h62cd;
      expv[9] = 16'h3fca;
      expv[10] = 16'h8d8a;
      expv[11] = 16'h3b9e;
      expv[12] = 16'hb48a;
      expv[13] = 16'hd89a;
      expv[14] = 16'hf7c7;
      expv[15] = 16'hf1a4;
      expv[16] = 16'h4948;
      expv[17] = 16'h1f32;
      expv[18] = 16'hf279;
      expv[19] = 16'hcb3b;
      expv[20] = 16'hc6ed;
      expv[21] = 16'hfdb4;
      expv[22] = 16'h3f79;
      expv[23] = 16'hb117;
      expv[24] = 16'h7a06;
      expv[25] = 16'h85fe;
      expv[26] = 16'h3d51;
      expv[27] = 16'h788f;
      expv[28] = 16'h2423;
      expv[29] = 16'he8fa;
      expv[30] = 16'h2836;
      expv[31] = 16'had62;
      expv[32] = 16'h29ad;
      expv[33] = 16'heed9;
      expv[34] = 16'he74a;
      expv[35] = 16'hd296;
      expv[36] = 16'hdcfc;
      expv[37] = 16'hea20;
      expv[38] = 16'h255d;
      expv[39] = 16'h3c46;
      expv[40] = 16'h0826;
      expv[41] = 16'hc878;
      expv[42] = 16'h7292;
      expv[43] = 16'hf769;
      expv[44] = 16'hfdfa;
      expv[45] = 16'h35f3;
      expv[46] = 16'h66ca;
      expv[47] = 16'h3403;
      expv[48] = 16'h67d1;
      expv[49] = 16'h3391;
      expv[50] = 16'h725c;
      expv[51] = 16'h76eb;
      expv[52] = 16'hce63;
      expv[53] = 16'h8856;
      expv[54] = 16'h1021;
      expv[55] = 16'h9dd5;
      expv[56] = 16'hca04;
      expv[57] = 16'h6394;
      expv[58] = 16'h58b4;
      expv[59] = 16'h6c5c;
      expv[60] = 16'h6226;
      expv[61] = 16'h1657;
      expv[62] = 16'h325a;
      expv[63] = 16'h3bcb;
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
