// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_146886 dut (
    .clk(clk),
    .en(in_vec[11:11]),
    .arst(in_vec[10:10]),
    .srst(in_vec[9:9]),
    .ld(in_vec[8:8]),
    .d(in_vec[7:0]),
    .vd(out_vec[9:9]),
    .lz(out_vec[8:8]),
    .z(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'h6e6;
    stim[1] = 12'hcfc;
    stim[2] = 12'h903;
    stim[3] = 12'h001;
    stim[4] = 12'h813;
    stim[5] = 12'h140;
    stim[6] = 12'h829;
    stim[7] = 12'h1a7;
    stim[8] = 12'hb9c;
    stim[9] = 12'h34a;
    stim[10] = 12'hb92;
    stim[11] = 12'h093;
    stim[12] = 12'h9ed;
    stim[13] = 12'ha4a;
    stim[14] = 12'h856;
    stim[15] = 12'h909;
    stim[16] = 12'hac5;
    stim[17] = 12'h3bb;
    stim[18] = 12'h2eb;
    stim[19] = 12'h909;
    stim[20] = 12'h334;
    stim[21] = 12'ha4f;
    stim[22] = 12'h13d;
    stim[23] = 12'h90c;
    stim[24] = 12'h347;
    stim[25] = 12'hb0e;
    stim[26] = 12'h899;
    stim[27] = 12'h990;
    stim[28] = 12'h3c4;
    stim[29] = 12'hbfc;
    stim[30] = 12'h0ca;
    stim[31] = 12'h15e;
    stim[32] = 12'h1ff;
    stim[33] = 12'h1fe;
    stim[34] = 12'h055;
    stim[35] = 12'h2a2;
    stim[36] = 12'h00f;
    stim[37] = 12'hbe6;
    stim[38] = 12'h1de;
    stim[39] = 12'h8ba;
    stim[40] = 12'h98d;
    stim[41] = 12'h133;
    stim[42] = 12'h2fb;
    stim[43] = 12'h822;
    stim[44] = 12'hb5f;
    stim[45] = 12'h3ec;
    stim[46] = 12'h27c;
    stim[47] = 12'h870;
    stim[48] = 12'h2c7;
    stim[49] = 12'hb32;
    stim[50] = 12'h07f;
    stim[51] = 12'ha19;
    stim[52] = 12'h920;
    stim[53] = 12'h375;
    stim[54] = 12'h34f;
    stim[55] = 12'h18c;
    stim[56] = 12'hb80;
    stim[57] = 12'hb7a;
    stim[58] = 12'hb8f;
    stim[59] = 12'hba1;
    stim[60] = 12'h847;
    stim[61] = 12'haf3;
    stim[62] = 12'h3ff;
    stim[63] = 12'h2ed;
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
      expv[0] = 10'h000;
      expv[1] = 10'h000;
      expv[2] = 10'h000;
      expv[3] = 10'h000;
      expv[4] = 10'h000;
      expv[5] = 10'h100;
      expv[6] = 10'h100;
      expv[7] = 10'h100;
      expv[8] = 10'h100;
      expv[9] = 10'h000;
      expv[10] = 10'h000;
      expv[11] = 10'h000;
      expv[12] = 10'h000;
      expv[13] = 10'h000;
      expv[14] = 10'h000;
      expv[15] = 10'h000;
      expv[16] = 10'h000;
      expv[17] = 10'h000;
      expv[18] = 10'h000;
      expv[19] = 10'h000;
      expv[20] = 10'h000;
      expv[21] = 10'h000;
      expv[22] = 10'h000;
      expv[23] = 10'h000;
      expv[24] = 10'h000;
      expv[25] = 10'h000;
      expv[26] = 10'h000;
      expv[27] = 10'h000;
      expv[28] = 10'h000;
      expv[29] = 10'h000;
      expv[30] = 10'h000;
      expv[31] = 10'h000;
      expv[32] = 10'h000;
      expv[33] = 10'h000;
      expv[34] = 10'h000;
      expv[35] = 10'h000;
      expv[36] = 10'h000;
      expv[37] = 10'h000;
      expv[38] = 10'h000;
      expv[39] = 10'h000;
      expv[40] = 10'h000;
      expv[41] = 10'h000;
      expv[42] = 10'h000;
      expv[43] = 10'h000;
      expv[44] = 10'h000;
      expv[45] = 10'h000;
      expv[46] = 10'h000;
      expv[47] = 10'h000;
      expv[48] = 10'h000;
      expv[49] = 10'h000;
      expv[50] = 10'h000;
      expv[51] = 10'h000;
      expv[52] = 10'h000;
      expv[53] = 10'h000;
      expv[54] = 10'h000;
      expv[55] = 10'h000;
      expv[56] = 10'h000;
      expv[57] = 10'h000;
      expv[58] = 10'h000;
      expv[59] = 10'h000;
      expv[60] = 10'h000;
      expv[61] = 10'h000;
      expv[62] = 10'h000;
      expv[63] = 10'h000;
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
