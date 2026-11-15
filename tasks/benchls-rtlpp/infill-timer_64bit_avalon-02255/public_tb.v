// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 23;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_02255 dut (
    .clk(clk),
    .address(in_vec[22:19]),
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
    stim[0] = 23'h6409ca;
    stim[1] = 23'h6cfca5;
    stim[2] = 23'h02f24b;
    stim[3] = 23'h7a0159;
    stim[4] = 23'h73d0c2;
    stim[5] = 23'h37f063;
    stim[6] = 23'h3209b6;
    stim[7] = 23'h42c737;
    stim[8] = 23'h2faab4;
    stim[9] = 23'h1e97a9;
    stim[10] = 23'h338bc7;
    stim[11] = 23'h7764b9;
    stim[12] = 23'h0f9a3a;
    stim[13] = 23'h07eda5;
    stim[14] = 23'h2aa89e;
    stim[15] = 23'h1601e5;
    stim[16] = 23'h63e7af;
    stim[17] = 23'h7bdaf0;
    stim[18] = 23'h33790d;
    stim[19] = 23'h165c55;
    stim[20] = 23'h0a830f;
    stim[21] = 23'h0fabeb;
    stim[22] = 23'h12ec19;
    stim[23] = 23'h539937;
    stim[24] = 23'h0eccb4;
    stim[25] = 23'h0b84f5;
    stim[26] = 23'h7bf796;
    stim[27] = 23'h461875;
    stim[28] = 23'h47a248;
    stim[29] = 23'h079bfb;
    stim[30] = 23'h2a9486;
    stim[31] = 23'h328f2c;
    stim[32] = 23'h4737f7;
    stim[33] = 23'h564f99;
    stim[34] = 23'h6eb3b1;
    stim[35] = 23'h3e47e3;
    stim[36] = 23'h594e1a;
    stim[37] = 23'h6b6ef3;
    stim[38] = 23'h134bbd;
    stim[39] = 23'h1b3545;
    stim[40] = 23'h73940f;
    stim[41] = 23'h2e17ad;
    stim[42] = 23'h2d9c41;
    stim[43] = 23'h6e0281;
    stim[44] = 23'h130865;
    stim[45] = 23'h421d60;
    stim[46] = 23'h33c9f1;
    stim[47] = 23'h34b556;
    stim[48] = 23'h5b2718;
    stim[49] = 23'h6e861b;
    stim[50] = 23'h0338be;
    stim[51] = 23'h1a467c;
    stim[52] = 23'h0a898a;
    stim[53] = 23'h2b8f32;
    stim[54] = 23'h6ffacd;
    stim[55] = 23'h575b21;
    stim[56] = 23'h4f1da6;
    stim[57] = 23'h0f28eb;
    stim[58] = 23'h737640;
    stim[59] = 23'h27df38;
    stim[60] = 23'h2f67e0;
    stim[61] = 23'h5f76c8;
    stim[62] = 23'h3627a9;
    stim[63] = 23'h22c71a;
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
      expv[4] = 17'h00000;
      expv[5] = 17'h00000;
      expv[6] = 17'h00000;
      expv[7] = 17'h00000;
      expv[8] = 17'h00000;
      expv[9] = 17'h00000;
      expv[10] = 17'h00000;
      expv[11] = 17'h00000;
      expv[12] = 17'h00000;
      expv[13] = 17'h00000;
      expv[14] = 17'h00000;
      expv[15] = 17'h00000;
      expv[16] = 17'h0c34f;
      expv[17] = 17'h00000;
      expv[18] = 17'h00000;
      expv[19] = 17'h00000;
      expv[20] = 17'h001e5;
      expv[21] = 17'h00000;
      expv[22] = 17'h00000;
      expv[23] = 17'h05c55;
      expv[24] = 17'h00000;
      expv[25] = 17'h00000;
      expv[26] = 17'h00004;
      expv[27] = 17'h00000;
      expv[28] = 17'h00000;
      expv[29] = 17'h00000;
      expv[30] = 17'h00002;
      expv[31] = 17'h00000;
      expv[32] = 17'h05c53;
      expv[33] = 17'h00000;
      expv[34] = 17'h00000;
      expv[35] = 17'h00000;
      expv[36] = 17'h00000;
      expv[37] = 17'h00000;
      expv[38] = 17'h00000;
      expv[39] = 17'h0c34f;
      expv[40] = 17'h00000;
      expv[41] = 17'h00000;
      expv[42] = 17'h00000;
      expv[43] = 17'h00000;
      expv[44] = 17'h00000;
      expv[45] = 17'h0c34f;
      expv[46] = 17'h00000;
      expv[47] = 17'h00000;
      expv[48] = 17'h00000;
      expv[49] = 17'h00000;
      expv[50] = 17'h00000;
      expv[51] = 17'h00000;
      expv[52] = 17'h00000;
      expv[53] = 17'h00000;
      expv[54] = 17'h00000;
      expv[55] = 17'h00000;
      expv[56] = 17'h00000;
      expv[57] = 17'h00000;
      expv[58] = 17'h00000;
      expv[59] = 17'h00000;
      expv[60] = 17'h00000;
      expv[61] = 17'h00000;
      expv[62] = 17'h00000;
      expv[63] = 17'h00000;
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
