// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 22;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_10728 dut (
    .clk(clk),
    .address(in_vec[21:19]),
    .chipselect(in_vec[18:18]),
    .reset_n(in_vec[17:17]),
    .write_n(in_vec[16:16]),
    .writedata(in_vec[15:0]),
    .irq(out_vec[16:16]),
    .readdata(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 22'h1d4975;
    stim[1] = 22'h08d608;
    stim[2] = 22'h0f13f8;
    stim[3] = 22'h122f20;
    stim[4] = 22'h2b97ee;
    stim[5] = 22'h1ecf85;
    stim[6] = 22'h136d4f;
    stim[7] = 22'h07fa93;
    stim[8] = 22'h1af01d;
    stim[9] = 22'h1ad14e;
    stim[10] = 22'h3f750f;
    stim[11] = 22'h0b975a;
    stim[12] = 22'h3314e4;
    stim[13] = 22'h22eff7;
    stim[14] = 22'h3f3af4;
    stim[15] = 22'h3e81a9;
    stim[16] = 22'h0212a1;
    stim[17] = 22'h17b5ee;
    stim[18] = 22'h236662;
    stim[19] = 22'h02dd10;
    stim[20] = 22'h2f5e94;
    stim[21] = 22'h0e8c5a;
    stim[22] = 22'h22e1a4;
    stim[23] = 22'h3b475f;
    stim[24] = 22'h13328e;
    stim[25] = 22'h270ba9;
    stim[26] = 22'h33d45e;
    stim[27] = 22'h1ab009;
    stim[28] = 22'h13e3d1;
    stim[29] = 22'h1f4775;
    stim[30] = 22'h0fde21;
    stim[31] = 22'h02efd4;
    stim[32] = 22'h02a883;
    stim[33] = 22'h1b11e2;
    stim[34] = 22'h1a68c1;
    stim[35] = 22'h373262;
    stim[36] = 22'h2e117e;
    stim[37] = 22'h3e1d84;
    stim[38] = 22'h16c88d;
    stim[39] = 22'h269bcc;
    stim[40] = 22'h2f50e0;
    stim[41] = 22'h0231bc;
    stim[42] = 22'h338373;
    stim[43] = 22'h2a6da5;
    stim[44] = 22'h3ac1b2;
    stim[45] = 22'h1a2dd3;
    stim[46] = 22'h1ad566;
    stim[47] = 22'h370810;
    stim[48] = 22'h12afbe;
    stim[49] = 22'h0b9b31;
    stim[50] = 22'h3b3879;
    stim[51] = 22'h33d796;
    stim[52] = 22'h3e68df;
    stim[53] = 22'h2b8fad;
    stim[54] = 22'h0f8413;
    stim[55] = 22'h2a1b04;
    stim[56] = 22'h26b0ce;
    stim[57] = 22'h2b9a29;
    stim[58] = 22'h0eb8c9;
    stim[59] = 22'h0e5f66;
    stim[60] = 22'h16ea04;
    stim[61] = 22'h0678b1;
    stim[62] = 22'h13ea3a;
    stim[63] = 22'h33537c;
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
      expv[0] = 17'h00000;
      expv[1] = 17'h00000;
      expv[2] = 17'h00000;
      expv[3] = 17'h00000;
      expv[4] = 17'h05e0f;
      expv[5] = 17'h00000;
      expv[6] = 17'h0005f;
      expv[7] = 17'h05e0f;
      expv[8] = 17'h00000;
      expv[9] = 17'h0cf85;
      expv[10] = 17'h0cf85;
      expv[11] = 17'h00000;
      expv[12] = 17'h00000;
      expv[13] = 17'h00000;
      expv[14] = 17'h00000;
      expv[15] = 17'h00000;
      expv[16] = 17'h00000;
      expv[17] = 17'h00000;
      expv[18] = 17'h05e0f;
      expv[19] = 17'h00000;
      expv[20] = 17'h00000;
      expv[21] = 17'h00000;
      expv[22] = 17'h00000;
      expv[23] = 17'h00000;
      expv[24] = 17'h00000;
      expv[25] = 17'h05e0f;
      expv[26] = 17'h00000;
      expv[27] = 17'h00000;
      expv[28] = 17'h0cf85;
      expv[29] = 17'h05e0f;
      expv[30] = 17'h0cf85;
      expv[31] = 17'h0000a;
      expv[32] = 17'h00000;
      expv[33] = 17'h00000;
      expv[34] = 17'h0cf85;
      expv[35] = 17'h0cf85;
      expv[36] = 17'h00000;
      expv[37] = 17'h00000;
      expv[38] = 17'h00000;
      expv[39] = 17'h05e0f;
      expv[40] = 17'h05e0f;
      expv[41] = 17'h0cf85;
      expv[42] = 17'h00000;
      expv[43] = 17'h00000;
      expv[44] = 17'h0cf85;
      expv[45] = 17'h00000;
      expv[46] = 17'h0cf85;
      expv[47] = 17'h0cf85;
      expv[48] = 17'h00000;
      expv[49] = 17'h0c88d;
      expv[50] = 17'h0000a;
      expv[51] = 17'h00000;
      expv[52] = 17'h00000;
      expv[53] = 17'h00000;
      expv[54] = 17'h0cf85;
      expv[55] = 17'h0000a;
      expv[56] = 17'h0cf85;
      expv[57] = 17'h05e0f;
      expv[58] = 17'h0cf85;
      expv[59] = 17'h0000a;
      expv[60] = 17'h00009;
      expv[61] = 17'h0c88d;
      expv[62] = 17'h08000;
      expv[63] = 17'h0ea04;
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
