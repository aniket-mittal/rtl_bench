// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_104063 dut (
    .clk(clk),
    .rst_n(in_vec[10:10]),
    .clr(in_vec[9:9]),
    .din(in_vec[8:1]),
    .sin(in_vec[0:0]),
    .dout(out_vec[16:9]),
    .dshift(out_vec[8:1]),
    .sout(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h160;
    stim[1] = 11'h3e2;
    stim[2] = 11'h549;
    stim[3] = 11'h501;
    stim[4] = 11'h5a0;
    stim[5] = 11'h4ee;
    stim[6] = 11'h771;
    stim[7] = 11'h458;
    stim[8] = 11'h53d;
    stim[9] = 11'h663;
    stim[10] = 11'h78f;
    stim[11] = 11'h5ba;
    stim[12] = 11'h581;
    stim[13] = 11'h6fe;
    stim[14] = 11'h742;
    stim[15] = 11'h51d;
    stim[16] = 11'h59e;
    stim[17] = 11'h41c;
    stim[18] = 11'h5e4;
    stim[19] = 11'h79c;
    stim[20] = 11'h538;
    stim[21] = 11'h75c;
    stim[22] = 11'h620;
    stim[23] = 11'h5ca;
    stim[24] = 11'h6bf;
    stim[25] = 11'h7d1;
    stim[26] = 11'h795;
    stim[27] = 11'h466;
    stim[28] = 11'h4c0;
    stim[29] = 11'h514;
    stim[30] = 11'h48f;
    stim[31] = 11'h645;
    stim[32] = 11'h6d1;
    stim[33] = 11'h66a;
    stim[34] = 11'h638;
    stim[35] = 11'h657;
    stim[36] = 11'h474;
    stim[37] = 11'h570;
    stim[38] = 11'h52c;
    stim[39] = 11'h67d;
    stim[40] = 11'h762;
    stim[41] = 11'h60c;
    stim[42] = 11'h650;
    stim[43] = 11'h5aa;
    stim[44] = 11'h5dc;
    stim[45] = 11'h436;
    stim[46] = 11'h404;
    stim[47] = 11'h400;
    stim[48] = 11'h7e4;
    stim[49] = 11'h791;
    stim[50] = 11'h02c;
    stim[51] = 11'h742;
    stim[52] = 11'h689;
    stim[53] = 11'h448;
    stim[54] = 11'h746;
    stim[55] = 11'h790;
    stim[56] = 11'h781;
    stim[57] = 11'h465;
    stim[58] = 11'h6f2;
    stim[59] = 11'h4ed;
    stim[60] = 11'h7fa;
    stim[61] = 11'h5bf;
    stim[62] = 11'h410;
    stim[63] = 11'h6bc;
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
      expv[3] = 17'h1480x;
      expv[4] = 17'h14801;
      expv[5] = 17'h14801;
      expv[6] = 17'h14800;
      expv[7] = 17'h14800;
      expv[8] = 17'h14801;
      expv[9] = 17'h14800;
      expv[10] = 17'h14801;
      expv[11] = 17'h14801;
      expv[12] = 17'h14801;
      expv[13] = 17'h14800;
      expv[14] = 17'h14801;
      expv[15] = 17'h14800;
      expv[16] = 17'h14800;
      expv[17] = 17'h14801;
      expv[18] = 17'h14800;
      expv[19] = 17'h14800;
      expv[20] = 17'h14800;
      expv[21] = 17'h14800;
      expv[22] = 17'h14800;
      expv[23] = 17'h14800;
      expv[24] = 17'h14800;
      expv[25] = 17'h14800;
      expv[26] = 17'h14801;
      expv[27] = 17'h14801;
      expv[28] = 17'h14801;
      expv[29] = 17'h14800;
      expv[30] = 17'h14800;
      expv[31] = 17'h14800;
      expv[32] = 17'h14801;
      expv[33] = 17'h14801;
      expv[34] = 17'h14801;
      expv[35] = 17'h14800;
      expv[36] = 17'h14800;
      expv[37] = 17'h14801;
      expv[38] = 17'h14800;
      expv[39] = 17'h14800;
      expv[40] = 17'h14800;
      expv[41] = 17'h14801;
      expv[42] = 17'h14800;
      expv[43] = 17'h14800;
      expv[44] = 17'h14800;
      expv[45] = 17'h14800;
      expv[46] = 17'h14800;
      expv[47] = 17'h14800;
      expv[48] = 17'h14800;
      expv[49] = 17'h14800;
      expv[50] = 17'h00000;
      expv[51] = 17'h00000;
      expv[52] = 17'h14201;
      expv[53] = 17'h08800;
      expv[54] = 17'h08991;
      expv[55] = 17'h08800;
      expv[56] = 17'h08800;
      expv[57] = 17'h08800;
      expv[58] = 17'h08801;
      expv[59] = 17'h08801;
      expv[60] = 17'h08800;
      expv[61] = 17'h08801;
      expv[62] = 17'h08800;
      expv[63] = 17'h08801;
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
