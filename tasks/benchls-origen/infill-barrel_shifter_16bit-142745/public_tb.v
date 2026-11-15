// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 20;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_142745 dut (
    .in(in_vec[19:4]),
    .shift(in_vec[3:0]),
    .out(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 20'h70c5c;
    stim[1] = 20'h74205;
    stim[2] = 20'h06653;
    stim[3] = 20'ha65a8;
    stim[4] = 20'h2467e;
    stim[5] = 20'hbb8af;
    stim[6] = 20'h91da9;
    stim[7] = 20'hef13a;
    stim[8] = 20'he14fc;
    stim[9] = 20'hd8c8b;
    stim[10] = 20'h20b48;
    stim[11] = 20'hd27e2;
    stim[12] = 20'h8147d;
    stim[13] = 20'h19ec0;
    stim[14] = 20'hf5435;
    stim[15] = 20'h8f76c;
    stim[16] = 20'hdf904;
    stim[17] = 20'h3869a;
    stim[18] = 20'h98b3d;
    stim[19] = 20'h07adb;
    stim[20] = 20'h5ee51;
    stim[21] = 20'ha3ec8;
    stim[22] = 20'h147b7;
    stim[23] = 20'h88707;
    stim[24] = 20'h21745;
    stim[25] = 20'h55d04;
    stim[26] = 20'h9b790;
    stim[27] = 20'h4e24e;
    stim[28] = 20'hee69f;
    stim[29] = 20'hd8f7c;
    stim[30] = 20'haad9d;
    stim[31] = 20'h44f27;
    stim[32] = 20'h58600;
    stim[33] = 20'h45a8c;
    stim[34] = 20'hf799c;
    stim[35] = 20'h1c819;
    stim[36] = 20'he85c6;
    stim[37] = 20'hfa93e;
    stim[38] = 20'hab8da;
    stim[39] = 20'h59aa0;
    stim[40] = 20'h1f01e;
    stim[41] = 20'h29d0e;
    stim[42] = 20'h506f6;
    stim[43] = 20'h669df;
    stim[44] = 20'hee30f;
    stim[45] = 20'hed948;
    stim[46] = 20'hdf1ec;
    stim[47] = 20'ha9562;
    stim[48] = 20'h2bdeb;
    stim[49] = 20'h266b0;
    stim[50] = 20'h2817d;
    stim[51] = 20'h67e51;
    stim[52] = 20'hc8b6a;
    stim[53] = 20'h5fa76;
    stim[54] = 20'h4995c;
    stim[55] = 20'he56b7;
    stim[56] = 20'he3812;
    stim[57] = 20'h7f22a;
    stim[58] = 20'he8bb4;
    stim[59] = 20'h9df56;
    stim[60] = 20'hd4f84;
    stim[61] = 20'hba94a;
    stim[62] = 20'hb14d7;
    stim[63] = 20'h91c25;
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
      expv[0] = 16'h0c57;
      expv[1] = 16'h03a1;
      expv[2] = 16'ha0cc;
      expv[3] = 16'h5aa6;
      expv[4] = 16'h919c;
      expv[5] = 16'h7715;
      expv[6] = 16'hed48;
      expv[7] = 16'hc4fb;
      expv[8] = 16'h14fe;
      expv[9] = 16'h191b;
      expv[10] = 16'hb420;
      expv[11] = 16'hb49f;
      expv[12] = 16'h0a3c;
      expv[13] = 16'h19ec;
      expv[14] = 16'h1faa;
      expv[15] = 16'hf768;
      expv[16] = 16'h0df9;
      expv[17] = 16'h1a4e;
      expv[18] = 16'hc59c;
      expv[19] = 16'hf5a0;
      expv[20] = 16'haf72;
      expv[21] = 16'heca3;
      expv[22] = 16'hf628;
      expv[23] = 16'he110;
      expv[24] = 16'ha10b;
      expv[25] = 16'h055d;
      expv[26] = 16'h9b79;
      expv[27] = 16'h3891;
      expv[28] = 16'hdcd3;
      expv[29] = 16'h8f7d;
      expv[30] = 16'h56cd;
      expv[31] = 16'he489;
      expv[32] = 16'h5860;
      expv[33] = 16'h5a84;
      expv[34] = 16'h799f;
      expv[35] = 16'h408e;
      expv[36] = 16'h73a1;
      expv[37] = 16'hea4f;
      expv[38] = 16'he36a;
      expv[39] = 16'h59aa;
      expv[40] = 16'h7c04;
      expv[41] = 16'ha740;
      expv[42] = 16'hbd41;
      expv[43] = 16'hcd3a;
      expv[44] = 16'hdc61;
      expv[45] = 16'h94ed;
      expv[46] = 16'hf1ed;
      expv[47] = 16'haa55;
      expv[48] = 16'h7bc5;
      expv[49] = 16'h266b;
      expv[50] = 16'h40b9;
      expv[51] = 16'hb3f2;
      expv[52] = 16'h2db2;
      expv[53] = 16'h9d7e;
      expv[54] = 16'h9954;
      expv[55] = 16'hd7ca;
      expv[56] = 16'h78e0;
      expv[57] = 16'hc89f;
      expv[58] = 16'hbe8b;
      expv[59] = 16'hd677;
      expv[60] = 16'h8d4f;
      expv[61] = 16'ha52e;
      expv[62] = 16'h9b62;
      expv[63] = 16'h148e;
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
