// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 18;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_011605 dut (
    .clk(clk),
    .reset(in_vec[17:17]),
    .codif(in_vec[16:5]),
    .busy_mem(in_vec[4:4]),
    .done_mem(in_vec[3:3]),
    .aligned_mem(in_vec[2:2]),
    .done_exec(in_vec[1:1]),
    .is_exec(in_vec[0:0]),
    .W_R_mem(out_vec[9:8]),
    .wordsize_mem(out_vec[7:6]),
    .sign_mem(out_vec[5:5]),
    .en_mem(out_vec[4:4]),
    .enable_exec(out_vec[3:3]),
    .enable_exec_mem(out_vec[2:2]),
    .trap(out_vec[1:1]),
    .enable_pc(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 18'h353d5;
    stim[1] = 18'h26653;
    stim[2] = 18'h12f44;
    stim[3] = 18'h019f3;
    stim[4] = 18'h11e83;
    stim[5] = 18'h091a6;
    stim[6] = 18'h180f4;
    stim[7] = 18'h10d9d;
    stim[8] = 18'h07dcd;
    stim[9] = 18'h06194;
    stim[10] = 18'h11e5e;
    stim[11] = 18'h12484;
    stim[12] = 18'h00fe0;
    stim[13] = 18'h14a3f;
    stim[14] = 18'h0011b;
    stim[15] = 18'h0afe9;
    stim[16] = 18'h0e489;
    stim[17] = 18'h16146;
    stim[18] = 18'h1dfdd;
    stim[19] = 18'h1b184;
    stim[20] = 18'h1814c;
    stim[21] = 18'h15ba7;
    stim[22] = 18'h1944f;
    stim[23] = 18'h17910;
    stim[24] = 18'h1752f;
    stim[25] = 18'h04399;
    stim[26] = 18'h0c607;
    stim[27] = 18'h098a4;
    stim[28] = 18'h1a361;
    stim[29] = 18'h13db9;
    stim[30] = 18'h1a366;
    stim[31] = 18'h0842b;
    stim[32] = 18'h139f5;
    stim[33] = 18'h19815;
    stim[34] = 18'h159e4;
    stim[35] = 18'h07029;
    stim[36] = 18'h09053;
    stim[37] = 18'h00eaf;
    stim[38] = 18'h10838;
    stim[39] = 18'h105d7;
    stim[40] = 18'h1ac4a;
    stim[41] = 18'h13244;
    stim[42] = 18'h04bff;
    stim[43] = 18'h08475;
    stim[44] = 18'h15213;
    stim[45] = 18'h0029a;
    stim[46] = 18'h0d746;
    stim[47] = 18'h0553c;
    stim[48] = 18'h0d00b;
    stim[49] = 18'h08a07;
    stim[50] = 18'h0b9bb;
    stim[51] = 18'h126bf;
    stim[52] = 18'h0bd29;
    stim[53] = 18'h1e9d6;
    stim[54] = 18'h0ff01;
    stim[55] = 18'h0a697;
    stim[56] = 18'h015a4;
    stim[57] = 18'h04720;
    stim[58] = 18'h110e1;
    stim[59] = 18'h19eb3;
    stim[60] = 18'h095e7;
    stim[61] = 18'h06382;
    stim[62] = 18'h05251;
    stim[63] = 18'h07e76;
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
      expv[0] = 10'h110;
      expv[1] = 10'h000;
      expv[2] = 10'h110;
      expv[3] = 10'h110;
      expv[4] = 10'h110;
      expv[5] = 10'h110;
      expv[6] = 10'h110;
      expv[7] = 10'h110;
      expv[8] = 10'h110;
      expv[9] = 10'h110;
      expv[10] = 10'h110;
      expv[11] = 10'h110;
      expv[12] = 10'h110;
      expv[13] = 10'h110;
      expv[14] = 10'h110;
      expv[15] = 10'h110;
      expv[16] = 10'h110;
      expv[17] = 10'h110;
      expv[18] = 10'h110;
      expv[19] = 10'h110;
      expv[20] = 10'h110;
      expv[21] = 10'h110;
      expv[22] = 10'h110;
      expv[23] = 10'h110;
      expv[24] = 10'h110;
      expv[25] = 10'h110;
      expv[26] = 10'h110;
      expv[27] = 10'h110;
      expv[28] = 10'h110;
      expv[29] = 10'h110;
      expv[30] = 10'h110;
      expv[31] = 10'h110;
      expv[32] = 10'h110;
      expv[33] = 10'h110;
      expv[34] = 10'h110;
      expv[35] = 10'h110;
      expv[36] = 10'h110;
      expv[37] = 10'h110;
      expv[38] = 10'h110;
      expv[39] = 10'h110;
      expv[40] = 10'h110;
      expv[41] = 10'h110;
      expv[42] = 10'h110;
      expv[43] = 10'h110;
      expv[44] = 10'h110;
      expv[45] = 10'h110;
      expv[46] = 10'h110;
      expv[47] = 10'h110;
      expv[48] = 10'h110;
      expv[49] = 10'h110;
      expv[50] = 10'h110;
      expv[51] = 10'h110;
      expv[52] = 10'h110;
      expv[53] = 10'h110;
      expv[54] = 10'h110;
      expv[55] = 10'h110;
      expv[56] = 10'h110;
      expv[57] = 10'h110;
      expv[58] = 10'h110;
      expv[59] = 10'h110;
      expv[60] = 10'h110;
      expv[61] = 10'h110;
      expv[62] = 10'h110;
      expv[63] = 10'h110;
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
