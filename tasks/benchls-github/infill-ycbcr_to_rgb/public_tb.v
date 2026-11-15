// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 24;
  localparam OW = 24;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  ycbcr_to_rgb dut (
    .clk(clk),
    .y(in_vec[23:16]),
    .cb(in_vec[15:8]),
    .cr(in_vec[7:0]),
    .red(out_vec[23:16]),
    .green(out_vec[15:8]),
    .blue(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 24'h77fc16;
    stim[1] = 24'hbc833a;
    stim[2] = 24'hdb8595;
    stim[3] = 24'h0d53a4;
    stim[4] = 24'h225ecf;
    stim[5] = 24'h4a05e2;
    stim[6] = 24'h873f62;
    stim[7] = 24'he0d907;
    stim[8] = 24'hd51230;
    stim[9] = 24'h4de0fc;
    stim[10] = 24'h789664;
    stim[11] = 24'hfecd53;
    stim[12] = 24'hb9eb78;
    stim[13] = 24'h35e68c;
    stim[14] = 24'h617490;
    stim[15] = 24'h52fa10;
    stim[16] = 24'hffc00e;
    stim[17] = 24'h8f4f6f;
    stim[18] = 24'h1c2d5a;
    stim[19] = 24'he3950a;
    stim[20] = 24'hc42cd3;
    stim[21] = 24'h3c1a75;
    stim[22] = 24'hbace71;
    stim[23] = 24'h96a4ef;
    stim[24] = 24'hbcbc9b;
    stim[25] = 24'ha6608a;
    stim[26] = 24'h882bed;
    stim[27] = 24'hbb2b04;
    stim[28] = 24'ha0c52d;
    stim[29] = 24'ha7ae2e;
    stim[30] = 24'h7e57c6;
    stim[31] = 24'hd58402;
    stim[32] = 24'h532dc2;
    stim[33] = 24'h252bea;
    stim[34] = 24'h42e33d;
    stim[35] = 24'h859bdb;
    stim[36] = 24'h90dc10;
    stim[37] = 24'ha76739;
    stim[38] = 24'h4bb697;
    stim[39] = 24'h2b99ff;
    stim[40] = 24'h685c3d;
    stim[41] = 24'h373ab2;
    stim[42] = 24'h14ff56;
    stim[43] = 24'h8b0f76;
    stim[44] = 24'heaec57;
    stim[45] = 24'h274056;
    stim[46] = 24'h8fc972;
    stim[47] = 24'h8a75ec;
    stim[48] = 24'h3441c1;
    stim[49] = 24'h16b13b;
    stim[50] = 24'h4f016e;
    stim[51] = 24'hff6a0b;
    stim[52] = 24'hd133fa;
    stim[53] = 24'h87f325;
    stim[54] = 24'h0382da;
    stim[55] = 24'h76cbd6;
    stim[56] = 24'h0b647e;
    stim[57] = 24'hc20074;
    stim[58] = 24'h137508;
    stim[59] = 24'h1d7565;
    stim[60] = 24'hb53654;
    stim[61] = 24'h8240bc;
    stim[62] = 24'h27ca03;
    stim[63] = 24'h269060;
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
      expv[0] = 24'hxxxxxx;
      expv[1] = 24'hxxxxxx;
      expv[2] = 24'hxxxxxx;
      expv[3] = 24'hxxxxxx;
      expv[4] = 24'h009dff;
      expv[5] = 24'h58ffce;
      expv[6] = 24'hffd9f6;
      expv[7] = 24'h350000;
      expv[8] = 24'h920000;
      expv[9] = 24'hdf2300;
      expv[10] = 24'h5abc07;
      expv[11] = 24'h31ffff;
      expv[12] = 24'h65ff07;
      expv[13] = 24'hff00ff;
      expv[14] = 24'h4c87a5;
      expv[15] = 24'hcdffff;
      expv[16] = 24'hb7a1ff;
      expv[17] = 24'h3e00f8;
      expv[18] = 24'h775546;
      expv[19] = 24'h0078ff;
      expv[20] = 24'h60ffff;
      expv[21] = 24'h78b431;
      expv[22] = 24'h004d00;
      expv[23] = 24'h39ffff;
      expv[24] = 24'hffae28;
      expv[25] = 24'h216400;
      expv[26] = 24'hadb3ff;
      expv[27] = 24'hff33e4;
      expv[28] = 24'hf39aff;
      expv[29] = 24'hbeb26e;
      expv[30] = 24'hff5400;
      expv[31] = 24'h01ff1b;
      expv[32] = 24'h23d0ff;
      expv[33] = 24'h2de0ff;
      expv[34] = 24'hef572d;
      expv[35] = 24'h1cffed;
      expv[36] = 24'hb73800;
      expv[37] = 24'hc10000;
      expv[38] = 24'h0049ff;
      expv[39] = 24'hff33be;
      expv[40] = 24'h00ccff;
      expv[41] = 24'h3ef37d;
      expv[42] = 24'h691cb1;
      expv[43] = 24'he90051;
      expv[44] = 24'h00aa1d;
      expv[45] = 24'h7d2000;
      expv[46] = 24'h0000ff;
      expv[47] = 24'h7fc300;
      expv[48] = 24'hbcf4ff;
      expv[49] = 24'h005500;
      expv[50] = 24'h7d82ff;
      expv[51] = 24'hff3a77;
      expv[52] = 24'h910d00;
      expv[53] = 24'h002b69;
      expv[54] = 24'h2c8900;
      expv[55] = 24'h5bffe9;
      expv[56] = 24'hff9b45;
      expv[57] = 24'h00a7ff;
      expv[58] = 24'h800000;
      expv[59] = 24'hff13ff;
      expv[60] = 24'h000600;
      expv[61] = 24'hbcff00;
      expv[62] = 24'h006900;
      expv[63] = 24'h002900;
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
