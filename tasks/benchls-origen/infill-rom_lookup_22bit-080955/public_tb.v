// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 6;
  localparam OW = 22;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_080955 dut (
    .clk(clk),
    .en(in_vec[5:5]),
    .addr(in_vec[4:0]),
    .dout(out_vec[21:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 6'h23;
    stim[1] = 6'h3b;
    stim[2] = 6'h30;
    stim[3] = 6'h19;
    stim[4] = 6'h1c;
    stim[5] = 6'h05;
    stim[6] = 6'h31;
    stim[7] = 6'h1e;
    stim[8] = 6'h32;
    stim[9] = 6'h37;
    stim[10] = 6'h13;
    stim[11] = 6'h20;
    stim[12] = 6'h29;
    stim[13] = 6'h1f;
    stim[14] = 6'h33;
    stim[15] = 6'h3c;
    stim[16] = 6'h1b;
    stim[17] = 6'h36;
    stim[18] = 6'h01;
    stim[19] = 6'h31;
    stim[20] = 6'h1b;
    stim[21] = 6'h22;
    stim[22] = 6'h2a;
    stim[23] = 6'h00;
    stim[24] = 6'h2d;
    stim[25] = 6'h1d;
    stim[26] = 6'h3d;
    stim[27] = 6'h2a;
    stim[28] = 6'h21;
    stim[29] = 6'h2b;
    stim[30] = 6'h10;
    stim[31] = 6'h22;
    stim[32] = 6'h2b;
    stim[33] = 6'h08;
    stim[34] = 6'h27;
    stim[35] = 6'h1b;
    stim[36] = 6'h06;
    stim[37] = 6'h17;
    stim[38] = 6'h0f;
    stim[39] = 6'h1b;
    stim[40] = 6'h28;
    stim[41] = 6'h22;
    stim[42] = 6'h2d;
    stim[43] = 6'h0c;
    stim[44] = 6'h29;
    stim[45] = 6'h12;
    stim[46] = 6'h1c;
    stim[47] = 6'h33;
    stim[48] = 6'h01;
    stim[49] = 6'h36;
    stim[50] = 6'h1b;
    stim[51] = 6'h1b;
    stim[52] = 6'h14;
    stim[53] = 6'h05;
    stim[54] = 6'h0f;
    stim[55] = 6'h00;
    stim[56] = 6'h36;
    stim[57] = 6'h12;
    stim[58] = 6'h2b;
    stim[59] = 6'h31;
    stim[60] = 6'h36;
    stim[61] = 6'h38;
    stim[62] = 6'h0a;
    stim[63] = 6'h37;
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
      expv[0] = 22'hxxxxxx;
      expv[1] = 22'h3ffffc;
      expv[2] = 22'h000004;
      expv[3] = 22'h3fffff;
      expv[4] = 22'h3fffff;
      expv[5] = 22'h3fffff;
      expv[6] = 22'h3fffff;
      expv[7] = 22'h3ffffe;
      expv[8] = 22'h3ffffe;
      expv[9] = 22'h3ffffd;
      expv[10] = 22'h3ffff8;
      expv[11] = 22'h3ffff8;
      expv[12] = 22'h3fffff;
      expv[13] = 22'h000006;
      expv[14] = 22'h000006;
      expv[15] = 22'h3ffffc;
      expv[16] = 22'h000003;
      expv[17] = 22'h000003;
      expv[18] = 22'h3ffff9;
      expv[19] = 22'h3ffff9;
      expv[20] = 22'h3ffffe;
      expv[21] = 22'h3ffffe;
      expv[22] = 22'h3ffffd;
      expv[23] = 22'h000005;
      expv[24] = 22'h000005;
      expv[25] = 22'h000002;
      expv[26] = 22'h000002;
      expv[27] = 22'h000002;
      expv[28] = 22'h000005;
      expv[29] = 22'h3ffffe;
      expv[30] = 22'h000004;
      expv[31] = 22'h000004;
      expv[32] = 22'h3ffffd;
      expv[33] = 22'h000004;
      expv[34] = 22'h000004;
      expv[35] = 22'h3ffff8;
      expv[36] = 22'h3ffff8;
      expv[37] = 22'h3ffff8;
      expv[38] = 22'h3ffff8;
      expv[39] = 22'h3ffff8;
      expv[40] = 22'h3ffff8;
      expv[41] = 22'h000007;
      expv[42] = 22'h3ffffd;
      expv[43] = 22'h000002;
      expv[44] = 22'h000002;
      expv[45] = 22'h000006;
      expv[46] = 22'h000006;
      expv[47] = 22'h000006;
      expv[48] = 22'h3ffffc;
      expv[49] = 22'h3ffffc;
      expv[50] = 22'h3ffff9;
      expv[51] = 22'h3ffff9;
      expv[52] = 22'h3ffff9;
      expv[53] = 22'h3ffff9;
      expv[54] = 22'h3ffff9;
      expv[55] = 22'h3ffff9;
      expv[56] = 22'h3ffff9;
      expv[57] = 22'h3ffff9;
      expv[58] = 22'h3ffff9;
      expv[59] = 22'h000004;
      expv[60] = 22'h3ffffe;
      expv[61] = 22'h3ffff9;
      expv[62] = 22'h000007;
      expv[63] = 22'h000007;
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
