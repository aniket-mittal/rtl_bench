// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 29;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_00448 dut (
    .clk(clk),
    .nrst(in_vec[28:28]),
    .din(in_vec[27:20]),
    .level_sel(in_vec[19:12]),
    .level_mask(in_vec[11:4]),
    .edge_sel(in_vec[3:1]),
    .edge_mask(in_vec[0:0]),
    .trig_out(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 29'h1976b981;
    stim[1] = 29'h191d2bbd;
    stim[2] = 29'h0666677d;
    stim[3] = 29'h09f57f59;
    stim[4] = 29'h00348317;
    stim[5] = 29'h02d42764;
    stim[6] = 29'h09a8cc26;
    stim[7] = 29'h045c8958;
    stim[8] = 29'h00d49bb9;
    stim[9] = 29'h02b3dc11;
    stim[10] = 29'h07fa0d67;
    stim[11] = 29'h052ab25c;
    stim[12] = 29'h098f2c4c;
    stim[13] = 29'h0e08f0db;
    stim[14] = 29'h02a4deac;
    stim[15] = 29'h0f10a024;
    stim[16] = 29'h00755fea;
    stim[17] = 29'h08612765;
    stim[18] = 29'h003d3254;
    stim[19] = 29'h018a7691;
    stim[20] = 29'h0e7005e5;
    stim[21] = 29'h030fbad3;
    stim[22] = 29'h0580c6a9;
    stim[23] = 29'h12e2ecac;
    stim[24] = 29'h0e01581d;
    stim[25] = 29'h0c0fef03;
    stim[26] = 29'h0e540556;
    stim[27] = 29'h05fd8300;
    stim[28] = 29'h0b000342;
    stim[29] = 29'h0f790b07;
    stim[30] = 29'h0e22344b;
    stim[31] = 29'h05daad50;
    stim[32] = 29'h017202d9;
    stim[33] = 29'h02b2b792;
    stim[34] = 29'h036768d7;
    stim[35] = 29'h0751d84a;
    stim[36] = 29'h040230b2;
    stim[37] = 29'h0e735217;
    stim[38] = 29'h03422d46;
    stim[39] = 29'h0c63b018;
    stim[40] = 29'h07cda65f;
    stim[41] = 29'h0265abdb;
    stim[42] = 29'h03b31207;
    stim[43] = 29'h0bd3e658;
    stim[44] = 29'h0805adfc;
    stim[45] = 29'h080dd436;
    stim[46] = 29'h09c51068;
    stim[47] = 29'h040574a3;
    stim[48] = 29'h093b27ac;
    stim[49] = 29'h0efbac6d;
    stim[50] = 29'h0f0c799e;
    stim[51] = 29'h0d6decd0;
    stim[52] = 29'h0bcf9585;
    stim[53] = 29'h062980e8;
    stim[54] = 29'h03fb1367;
    stim[55] = 29'h0d4b7fd2;
    stim[56] = 29'h0aad0da3;
    stim[57] = 29'h0a20df35;
    stim[58] = 29'h0aa6cded;
    stim[59] = 29'h09898e67;
    stim[60] = 29'h04626fa5;
    stim[61] = 29'h00d76228;
    stim[62] = 29'h01bef134;
    stim[63] = 29'h0f50a210;
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
      expv[0] = 1'h0;
      expv[1] = 1'h0;
      expv[2] = 1'h1;
      expv[3] = 1'h0;
      expv[4] = 1'h0;
      expv[5] = 1'h0;
      expv[6] = 1'h0;
      expv[7] = 1'h0;
      expv[8] = 1'h0;
      expv[9] = 1'h0;
      expv[10] = 1'h0;
      expv[11] = 1'h0;
      expv[12] = 1'h0;
      expv[13] = 1'h0;
      expv[14] = 1'h0;
      expv[15] = 1'h0;
      expv[16] = 1'h0;
      expv[17] = 1'h0;
      expv[18] = 1'h0;
      expv[19] = 1'h0;
      expv[20] = 1'h0;
      expv[21] = 1'h0;
      expv[22] = 1'h0;
      expv[23] = 1'h0;
      expv[24] = 1'h0;
      expv[25] = 1'h0;
      expv[26] = 1'h0;
      expv[27] = 1'h0;
      expv[28] = 1'h0;
      expv[29] = 1'h0;
      expv[30] = 1'h0;
      expv[31] = 1'h0;
      expv[32] = 1'h0;
      expv[33] = 1'h1;
      expv[34] = 1'h0;
      expv[35] = 1'h0;
      expv[36] = 1'h0;
      expv[37] = 1'h0;
      expv[38] = 1'h0;
      expv[39] = 1'h0;
      expv[40] = 1'h0;
      expv[41] = 1'h0;
      expv[42] = 1'h0;
      expv[43] = 1'h0;
      expv[44] = 1'h0;
      expv[45] = 1'h0;
      expv[46] = 1'h0;
      expv[47] = 1'h0;
      expv[48] = 1'h0;
      expv[49] = 1'h0;
      expv[50] = 1'h0;
      expv[51] = 1'h0;
      expv[52] = 1'h0;
      expv[53] = 1'h0;
      expv[54] = 1'h0;
      expv[55] = 1'h0;
      expv[56] = 1'h0;
      expv[57] = 1'h0;
      expv[58] = 1'h1;
      expv[59] = 1'h1;
      expv[60] = 1'h1;
      expv[61] = 1'h0;
      expv[62] = 1'h0;
      expv[63] = 1'h0;
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
