// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 18;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_08579 dut (
    .clk(clk),
    .rst(in_vec[16:16]),
    .wr_en(in_vec[15:15]),
    .rd0_addr(in_vec[14:13]),
    .rd1_addr(in_vec[12:11]),
    .wr_addr(in_vec[10:9]),
    .wr_data(in_vec[8:0]),
    .rd0_data(out_vec[17:9]),
    .rd1_data(out_vec[8:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h1b0ff;
    stim[1] = 17'h1e7fa;
    stim[2] = 17'h0b52f;
    stim[3] = 17'h00072;
    stim[4] = 17'h0b95d;
    stim[5] = 17'h06932;
    stim[6] = 17'h0b3d9;
    stim[7] = 17'h0f569;
    stim[8] = 17'h14334;
    stim[9] = 17'h0e872;
    stim[10] = 17'h0f505;
    stim[11] = 17'h07456;
    stim[12] = 17'h05a5a;
    stim[13] = 17'h05628;
    stim[14] = 17'h0bb82;
    stim[15] = 17'h03070;
    stim[16] = 17'h04701;
    stim[17] = 17'h0ca77;
    stim[18] = 17'h0ecb5;
    stim[19] = 17'h0d8e4;
    stim[20] = 17'h0e7de;
    stim[21] = 17'h0d209;
    stim[22] = 17'h08cc2;
    stim[23] = 17'h077d6;
    stim[24] = 17'h083d0;
    stim[25] = 17'h073e0;
    stim[26] = 17'h090f6;
    stim[27] = 17'h02d71;
    stim[28] = 17'h0054e;
    stim[29] = 17'h05b2b;
    stim[30] = 17'h00584;
    stim[31] = 17'h05549;
    stim[32] = 17'h0528c;
    stim[33] = 17'h0e9cd;
    stim[34] = 17'h00975;
    stim[35] = 17'h00b3e;
    stim[36] = 17'h018a9;
    stim[37] = 17'h04b23;
    stim[38] = 17'h0a03c;
    stim[39] = 17'h0ee43;
    stim[40] = 17'h01c7c;
    stim[41] = 17'h0cd8d;
    stim[42] = 17'h06ffa;
    stim[43] = 17'h08d46;
    stim[44] = 17'h039c3;
    stim[45] = 17'h0cdf3;
    stim[46] = 17'h0e6b7;
    stim[47] = 17'h05f78;
    stim[48] = 17'h065a8;
    stim[49] = 17'h0ba79;
    stim[50] = 17'h0eb4f;
    stim[51] = 17'h04554;
    stim[52] = 17'h046e1;
    stim[53] = 17'h016bb;
    stim[54] = 17'h0d6fc;
    stim[55] = 17'h093cb;
    stim[56] = 17'h03923;
    stim[57] = 17'h1e248;
    stim[58] = 17'h01ec6;
    stim[59] = 17'h01887;
    stim[60] = 17'h008d0;
    stim[61] = 17'h05f47;
    stim[62] = 17'h0b3c1;
    stim[63] = 17'h0f543;
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
      expv[0] = 18'h00000;
      expv[1] = 18'h00000;
      expv[2] = 18'h00000;
      expv[3] = 18'h00000;
      expv[4] = 18'h00000;
      expv[5] = 18'h00000;
      expv[6] = 18'h0012f;
      expv[7] = 18'h0012f;
      expv[8] = 18'h00000;
      expv[9] = 18'h00000;
      expv[10] = 18'h00000;
      expv[11] = 18'h00105;
      expv[12] = 18'h20a00;
      expv[13] = 18'h20b05;
      expv[14] = 18'h00000;
      expv[15] = 18'h30505;
      expv[16] = 18'h20a72;
      expv[17] = 18'h20b82;
      expv[18] = 18'h00077;
      expv[19] = 18'h16a00;
      expv[20] = 18'h000e4;
      expv[21] = 18'h16ab5;
      expv[22] = 18'h1c809;
      expv[23] = 18'h3bcc2;
      expv[24] = 18'h1c8e4;
      expv[25] = 18'h3bcc2;
      expv[26] = 18'h1c8c2;
      expv[27] = 18'h3a1d0;
      expv[28] = 18'h1ecf6;
      expv[29] = 18'h185de;
      expv[30] = 18'h1ecf6;
      expv[31] = 18'h184c2;
      expv[32] = 18'h184c2;
      expv[33] = 18'h3bdd0;
      expv[34] = 18'h39bd0;
      expv[35] = 18'h39bd0;
      expv[36] = 18'h39bde;
      expv[37] = 18'h185d0;
      expv[38] = 18'h3a1cd;
      expv[39] = 18'h3bdd0;
      expv[40] = 18'h07843;
      expv[41] = 18'h185d0;
      expv[42] = 18'h087d0;
      expv[43] = 18'h079d0;
      expv[44] = 18'h3a043;
      expv[45] = 18'h28dd0;
      expv[46] = 18'h0863c;
      expv[47] = 18'h3e6b7;
      expv[48] = 18'h16e3c;
      expv[49] = 18'h3a0b7;
      expv[50] = 18'h16e79;
      expv[51] = 18'h3e63c;
      expv[52] = 18'h3e63c;
      expv[53] = 18'h079f3;
      expv[54] = 18'h3e7f3;
      expv[55] = 18'h079f3;
      expv[56] = 18'h396fc;
      expv[57] = 18'h00000;
      expv[58] = 18'h00000;
      expv[59] = 18'h00000;
      expv[60] = 18'h00000;
      expv[61] = 18'h00000;
      expv[62] = 18'h00000;
      expv[63] = 18'h00000;
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
