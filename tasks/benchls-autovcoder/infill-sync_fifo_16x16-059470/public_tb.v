// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 19;
  localparam OW = 23;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_059470 dut (
    .clk(clk),
    .reset(in_vec[18:18]),
    .data_in(in_vec[17:2]),
    .wen(in_vec[1:1]),
    .ren(in_vec[0:0]),
    .data_out(out_vec[22:7]),
    .depth(out_vec[6:2]),
    .empty(out_vec[1:1]),
    .full(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 19'h7857d;
    stim[1] = 19'h4218c;
    stim[2] = 19'h378cb;
    stim[3] = 19'h309a1;
    stim[4] = 19'h200ec;
    stim[5] = 19'h1d43d;
    stim[6] = 19'h210cf;
    stim[7] = 19'h03855;
    stim[8] = 19'h18882;
    stim[9] = 19'h0ec9c;
    stim[10] = 19'h01215;
    stim[11] = 19'h3dcc0;
    stim[12] = 19'h3d63f;
    stim[13] = 19'h5b99d;
    stim[14] = 19'h31d50;
    stim[15] = 19'h13ec8;
    stim[16] = 19'h1ad26;
    stim[17] = 19'h46677;
    stim[18] = 19'h2182c;
    stim[19] = 19'h05860;
    stim[20] = 19'h10d78;
    stim[21] = 19'h14f08;
    stim[22] = 19'h1bf72;
    stim[23] = 19'h313f9;
    stim[24] = 19'h1f092;
    stim[25] = 19'h11d6a;
    stim[26] = 19'h24284;
    stim[27] = 19'h10d30;
    stim[28] = 19'h05109;
    stim[29] = 19'h2aaa3;
    stim[30] = 19'h27478;
    stim[31] = 19'h1f3a7;
    stim[32] = 19'h29a3e;
    stim[33] = 19'h367f1;
    stim[34] = 19'h00b30;
    stim[35] = 19'h3822c;
    stim[36] = 19'h290e0;
    stim[37] = 19'h019ce;
    stim[38] = 19'h14a16;
    stim[39] = 19'h10210;
    stim[40] = 19'h062b5;
    stim[41] = 19'h245ae;
    stim[42] = 19'h2bef8;
    stim[43] = 19'h22207;
    stim[44] = 19'h11e98;
    stim[45] = 19'h3a7f0;
    stim[46] = 19'h33bdc;
    stim[47] = 19'h0896f;
    stim[48] = 19'h3ce2f;
    stim[49] = 19'h2b15d;
    stim[50] = 19'h2a7fb;
    stim[51] = 19'h02b9e;
    stim[52] = 19'h216db;
    stim[53] = 19'h2b61e;
    stim[54] = 19'h01442;
    stim[55] = 19'h20176;
    stim[56] = 19'h29bbc;
    stim[57] = 19'h0e9da;
    stim[58] = 19'h79183;
    stim[59] = 19'h17f7d;
    stim[60] = 19'h137b5;
    stim[61] = 19'h02c28;
    stim[62] = 19'h382df;
    stim[63] = 19'h2b5c5;
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
      expv[0] = 23'hxxxxx2;
      expv[1] = 23'hxxxxx2;
      expv[2] = 23'hxxxxx2;
      expv[3] = 23'h6f1904;
      expv[4] = 23'hxxxxx2;
      expv[5] = 23'hxxxxx2;
      expv[6] = 23'hxxxxx2;
      expv[7] = 23'h421984;
      expv[8] = 23'hxxxxx2;
      expv[9] = 23'h311004;
      expv[10] = 23'h311004;
      expv[11] = 23'hxxxxx2;
      expv[12] = 23'hxxxxx2;
      expv[13] = 23'h6f1902;
      expv[14] = 23'h6f1902;
      expv[15] = 23'h6f1902;
      expv[16] = 23'h6f1902;
      expv[17] = 23'h35a482;
      expv[18] = 23'h35a482;
      expv[19] = 23'h35a482;
      expv[20] = 23'h35a482;
      expv[21] = 23'h35a482;
      expv[22] = 23'h35a482;
      expv[23] = 23'h37ee04;
      expv[24] = 23'h421982;
      expv[25] = 23'h3e1204;
      expv[26] = 23'h3e1208;
      expv[27] = 23'h3e1208;
      expv[28] = 23'h3e1208;
      expv[29] = 23'h23ad04;
      expv[30] = 23'h555404;
      expv[31] = 23'h555404;
      expv[32] = 23'h3e7484;
      expv[33] = 23'h3e7488;
      expv[34] = 23'h534784;
      expv[35] = 23'h534784;
      expv[36] = 23'h534784;
      expv[37] = 23'h534784;
      expv[38] = 23'h534788;
      expv[39] = 23'h53478c;
      expv[40] = 23'h53478c;
      expv[41] = 23'h033988;
      expv[42] = 23'h03398c;
      expv[43] = 23'h03398c;
      expv[44] = 23'h29428c;
      expv[45] = 23'h29428c;
      expv[46] = 23'h29428c;
      expv[47] = 23'h29428c;
      expv[48] = 23'h48b58c;
      expv[49] = 23'h44408c;
      expv[50] = 23'h112d88;
      expv[51] = 23'h79c588;
      expv[52] = 23'h79c58c;
      expv[53] = 23'h54ff0c;
      expv[54] = 23'h54ff10;
      expv[55] = 23'h54ff14;
      expv[56] = 23'h54ff18;
      expv[57] = 23'h54ff18;
      expv[58] = 23'h028802;
      expv[59] = 23'h028802;
      expv[60] = 23'h028802;
      expv[61] = 23'h028802;
      expv[62] = 23'h028802;
      expv[63] = 23'h705b84;
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
