// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_088750 dut (
    .Input_1(in_vec[11:11]),
    .Input_10(in_vec[10:10]),
    .Input_11(in_vec[9:9]),
    .Input_12(in_vec[8:8]),
    .Input_2(in_vec[7:7]),
    .Input_3(in_vec[6:6]),
    .Input_4(in_vec[5:5]),
    .Input_5(in_vec[4:4]),
    .Input_6(in_vec[3:3]),
    .Input_7(in_vec[2:2]),
    .Input_8(in_vec[1:1]),
    .Input_9(in_vec[0:0]),
    .Result(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'h00a;
    stim[1] = 12'h971;
    stim[2] = 12'h858;
    stim[3] = 12'hef5;
    stim[4] = 12'h2cb;
    stim[5] = 12'h4c2;
    stim[6] = 12'h22b;
    stim[7] = 12'h904;
    stim[8] = 12'h993;
    stim[9] = 12'h091;
    stim[10] = 12'hd38;
    stim[11] = 12'h7dc;
    stim[12] = 12'h110;
    stim[13] = 12'hde6;
    stim[14] = 12'h5c2;
    stim[15] = 12'hc98;
    stim[16] = 12'h0e9;
    stim[17] = 12'h50a;
    stim[18] = 12'h89d;
    stim[19] = 12'h370;
    stim[20] = 12'h224;
    stim[21] = 12'h215;
    stim[22] = 12'hfba;
    stim[23] = 12'hea6;
    stim[24] = 12'hac0;
    stim[25] = 12'hda9;
    stim[26] = 12'h570;
    stim[27] = 12'h48d;
    stim[28] = 12'h232;
    stim[29] = 12'hbdc;
    stim[30] = 12'ha65;
    stim[31] = 12'h55e;
    stim[32] = 12'hf05;
    stim[33] = 12'hb43;
    stim[34] = 12'h007;
    stim[35] = 12'h18d;
    stim[36] = 12'h8f1;
    stim[37] = 12'hed9;
    stim[38] = 12'h1f6;
    stim[39] = 12'h93b;
    stim[40] = 12'hd65;
    stim[41] = 12'h986;
    stim[42] = 12'h2eb;
    stim[43] = 12'ha5b;
    stim[44] = 12'hf3f;
    stim[45] = 12'h2f6;
    stim[46] = 12'h9a4;
    stim[47] = 12'hf9a;
    stim[48] = 12'h61f;
    stim[49] = 12'hecc;
    stim[50] = 12'hce4;
    stim[51] = 12'hf9e;
    stim[52] = 12'h09f;
    stim[53] = 12'h360;
    stim[54] = 12'hcd7;
    stim[55] = 12'hafd;
    stim[56] = 12'hcd6;
    stim[57] = 12'h623;
    stim[58] = 12'h270;
    stim[59] = 12'h126;
    stim[60] = 12'had4;
    stim[61] = 12'h833;
    stim[62] = 12'hc25;
    stim[63] = 12'he29;
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
      expv[0] = 1'h1;
      expv[1] = 1'h1;
      expv[2] = 1'h1;
      expv[3] = 1'h1;
      expv[4] = 1'h1;
      expv[5] = 1'h1;
      expv[6] = 1'h1;
      expv[7] = 1'h1;
      expv[8] = 1'h1;
      expv[9] = 1'h1;
      expv[10] = 1'h1;
      expv[11] = 1'h1;
      expv[12] = 1'h1;
      expv[13] = 1'h1;
      expv[14] = 1'h1;
      expv[15] = 1'h1;
      expv[16] = 1'h1;
      expv[17] = 1'h1;
      expv[18] = 1'h1;
      expv[19] = 1'h1;
      expv[20] = 1'h1;
      expv[21] = 1'h1;
      expv[22] = 1'h1;
      expv[23] = 1'h1;
      expv[24] = 1'h1;
      expv[25] = 1'h1;
      expv[26] = 1'h1;
      expv[27] = 1'h1;
      expv[28] = 1'h1;
      expv[29] = 1'h1;
      expv[30] = 1'h1;
      expv[31] = 1'h1;
      expv[32] = 1'h1;
      expv[33] = 1'h1;
      expv[34] = 1'h1;
      expv[35] = 1'h1;
      expv[36] = 1'h1;
      expv[37] = 1'h1;
      expv[38] = 1'h1;
      expv[39] = 1'h1;
      expv[40] = 1'h1;
      expv[41] = 1'h1;
      expv[42] = 1'h1;
      expv[43] = 1'h1;
      expv[44] = 1'h1;
      expv[45] = 1'h1;
      expv[46] = 1'h1;
      expv[47] = 1'h1;
      expv[48] = 1'h1;
      expv[49] = 1'h1;
      expv[50] = 1'h1;
      expv[51] = 1'h1;
      expv[52] = 1'h1;
      expv[53] = 1'h1;
      expv[54] = 1'h1;
      expv[55] = 1'h1;
      expv[56] = 1'h1;
      expv[57] = 1'h1;
      expv[58] = 1'h1;
      expv[59] = 1'h1;
      expv[60] = 1'h1;
      expv[61] = 1'h1;
      expv[62] = 1'h1;
      expv[63] = 1'h1;
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
