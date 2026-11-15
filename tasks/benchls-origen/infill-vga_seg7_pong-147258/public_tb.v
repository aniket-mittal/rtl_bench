// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 30;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_147258 dut (
    .mclk(clk),
    .btn(in_vec[11:8]),
    .sw(in_vec[7:0]),
    .led(out_vec[29:22]),
    .seg(out_vec[21:15]),
    .an(out_vec[14:11]),
    .dp(out_vec[10:10]),
    .OutBlue(out_vec[9:8]),
    .OutGreen(out_vec[7:5]),
    .OutRed(out_vec[4:2]),
    .HS(out_vec[1:1]),
    .VS(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'h992;
    stim[1] = 12'hb6c;
    stim[2] = 12'h100;
    stim[3] = 12'h408;
    stim[4] = 12'h8cd;
    stim[5] = 12'h02d;
    stim[6] = 12'h13c;
    stim[7] = 12'h392;
    stim[8] = 12'h554;
    stim[9] = 12'h5e4;
    stim[10] = 12'h151;
    stim[11] = 12'hd2a;
    stim[12] = 12'hda2;
    stim[13] = 12'hd44;
    stim[14] = 12'h553;
    stim[15] = 12'hb13;
    stim[16] = 12'h2fb;
    stim[17] = 12'h92f;
    stim[18] = 12'h1d9;
    stim[19] = 12'h2f4;
    stim[20] = 12'h73d;
    stim[21] = 12'hd05;
    stim[22] = 12'h1ed;
    stim[23] = 12'hdf0;
    stim[24] = 12'he81;
    stim[25] = 12'h379;
    stim[26] = 12'h943;
    stim[27] = 12'h80f;
    stim[28] = 12'h727;
    stim[29] = 12'haec;
    stim[30] = 12'hecb;
    stim[31] = 12'h0e9;
    stim[32] = 12'h88c;
    stim[33] = 12'h37f;
    stim[34] = 12'hf89;
    stim[35] = 12'haca;
    stim[36] = 12'h0d9;
    stim[37] = 12'hc74;
    stim[38] = 12'h439;
    stim[39] = 12'h3cd;
    stim[40] = 12'h49b;
    stim[41] = 12'h763;
    stim[42] = 12'hd6e;
    stim[43] = 12'he6b;
    stim[44] = 12'h1d9;
    stim[45] = 12'ha6d;
    stim[46] = 12'h21f;
    stim[47] = 12'hbab;
    stim[48] = 12'h4df;
    stim[49] = 12'hdd6;
    stim[50] = 12'h64a;
    stim[51] = 12'h438;
    stim[52] = 12'h5bb;
    stim[53] = 12'h8f5;
    stim[54] = 12'hb5a;
    stim[55] = 12'h6e4;
    stim[56] = 12'h346;
    stim[57] = 12'h73e;
    stim[58] = 12'h5b7;
    stim[59] = 12'h7ea;
    stim[60] = 12'h6bc;
    stim[61] = 12'hbed;
    stim[62] = 12'hb7e;
    stim[63] = 12'h512;
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
      expv[0] = 30'h24xxxx0x;
      expv[1] = 30'h1b207403;
      expv[2] = 30'h00207403;
      expv[3] = 30'h02207403;
      expv[4] = 30'h33607403;
      expv[5] = 30'h0b7cf403;
      expv[6] = 30'h0f3cf403;
      expv[7] = 30'h24bcf403;
      expv[8] = 30'h153cf403;
      expv[9] = 30'h393cf403;
      expv[10] = 30'h147cf403;
      expv[11] = 30'h0abcf403;
      expv[12] = 30'h28bcf403;
      expv[13] = 30'h113cf403;
      expv[14] = 30'h14fcf403;
      expv[15] = 30'h04fcf403;
      expv[16] = 30'h3efcf403;
      expv[17] = 30'h0bfcf403;
      expv[18] = 30'h367cf403;
      expv[19] = 30'h3d3cf403;
      expv[20] = 30'h0f7cf403;
      expv[21] = 30'h017cf403;
      expv[22] = 30'h3b7cf403;
      expv[23] = 30'h3c3cf403;
      expv[24] = 30'h207cf403;
      expv[25] = 30'h1e7cf403;
      expv[26] = 30'h10fcf403;
      expv[27] = 30'h03fcf403;
      expv[28] = 30'h09fcf403;
      expv[29] = 30'h3b3cf403;
      expv[30] = 30'h32fcf403;
      expv[31] = 30'h3a7cf403;
      expv[32] = 30'h233cf403;
      expv[33] = 30'h1ffcf403;
      expv[34] = 30'h227cf403;
      expv[35] = 30'h32bcf403;
      expv[36] = 30'h367cf403;
      expv[37] = 30'h1d3cf403;
      expv[38] = 30'h0e7cf403;
      expv[39] = 30'h337cf403;
      expv[40] = 30'h26fcf403;
      expv[41] = 30'h18fcf403;
      expv[42] = 30'h1bbcf403;
      expv[43] = 30'h1afcf403;
      expv[44] = 30'h367cf403;
      expv[45] = 30'h1b7cf403;
      expv[46] = 30'h07fcf403;
      expv[47] = 30'h2afcf403;
      expv[48] = 30'h37fcf403;
      expv[49] = 30'h35bcf403;
      expv[50] = 30'h12bcf403;
      expv[51] = 30'h0e3cf403;
      expv[52] = 30'h2efcf403;
      expv[53] = 30'h3d7cf403;
      expv[54] = 30'h16bcf403;
      expv[55] = 30'h393cf403;
      expv[56] = 30'h11bcf403;
      expv[57] = 30'h0fbcf403;
      expv[58] = 30'h2dfcf403;
      expv[59] = 30'h3abcf403;
      expv[60] = 30'h2f3cf403;
      expv[61] = 30'h3b7cf403;
      expv[62] = 30'h1fbcf403;
      expv[63] = 30'h04bcf403;
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
