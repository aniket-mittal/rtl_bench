// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 55;
  localparam OW = 55;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_062224 dut (
    .clock(clk),
    .io_d(in_vec[54:0]),
    .io_q(out_vec[54:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 55'h0b9ec0f7803342;
    stim[1] = 55'h737c650c5fd203;
    stim[2] = 55'h2c68740ca61baf;
    stim[3] = 55'h55b6715da915eb;
    stim[4] = 55'h78d124587cc5ab;
    stim[5] = 55'h2c9ee8e46f4a99;
    stim[6] = 55'h556b876597691b;
    stim[7] = 55'h5cfe6fbf692c9d;
    stim[8] = 55'h12b720b43f38ba;
    stim[9] = 55'h582876edc10f71;
    stim[10] = 55'h010379cdf80128;
    stim[11] = 55'h65b8de77950c52;
    stim[12] = 55'h70d81cbced44eb;
    stim[13] = 55'h1546c07f02815b;
    stim[14] = 55'h66482b660adb3d;
    stim[15] = 55'h5cefa99c951af5;
    stim[16] = 55'h2d43ee8517802d;
    stim[17] = 55'h626c6363d3c8df;
    stim[18] = 55'h36be18fab7d65a;
    stim[19] = 55'h6845870ec2943c;
    stim[20] = 55'h10734b0f3a4ed9;
    stim[21] = 55'h0c572796492223;
    stim[22] = 55'h0156710c2d9201;
    stim[23] = 55'h3439dd32744fbf;
    stim[24] = 55'h5775122f1dc0d6;
    stim[25] = 55'h1da2aa12a51a62;
    stim[26] = 55'h5259cee6f13504;
    stim[27] = 55'h3eedc240327706;
    stim[28] = 55'h3c96c2b845c0ce;
    stim[29] = 55'h2e0a607e0a931d;
    stim[30] = 55'h56e97b62c6140c;
    stim[31] = 55'h7dce279f075fab;
    stim[32] = 55'h09a3dff0b75a65;
    stim[33] = 55'h3781dcb92c9e49;
    stim[34] = 55'h1a982a439e622f;
    stim[35] = 55'h0ba4c9b3b29437;
    stim[36] = 55'h2a5a048ed25bff;
    stim[37] = 55'h526e5a9373c852;
    stim[38] = 55'h3ede35d16ab739;
    stim[39] = 55'h50284209556191;
    stim[40] = 55'h699e96e4e6ac3a;
    stim[41] = 55'h592e28510d7263;
    stim[42] = 55'h7d5696ab6a9c08;
    stim[43] = 55'h24334db72d0b9d;
    stim[44] = 55'h6238ef7b4ddc19;
    stim[45] = 55'h61443206928652;
    stim[46] = 55'h6e090405a5a75a;
    stim[47] = 55'h23e2f090797d05;
    stim[48] = 55'h503dfa98ccc9f5;
    stim[49] = 55'h2fc026f97b9317;
    stim[50] = 55'h7a5864c250869d;
    stim[51] = 55'h375712eef5ad38;
    stim[52] = 55'h0a8d90a1d611c5;
    stim[53] = 55'h5a09fbec13f4ff;
    stim[54] = 55'h5b716750f8a6a0;
    stim[55] = 55'h45475508625e80;
    stim[56] = 55'h2226afcc949397;
    stim[57] = 55'h6ef314e7bcdb29;
    stim[58] = 55'h1ebfb705093027;
    stim[59] = 55'h5b297e454f8222;
    stim[60] = 55'h76ccdad3ab5478;
    stim[61] = 55'h76521ca6aa8709;
    stim[62] = 55'h45fdfd3fb0dd1c;
    stim[63] = 55'h332d3d256c8888;
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
      expv[0] = 55'hxxxxxxxxxxxxxx;
      expv[1] = 55'h0b9ec0f7803342;
      expv[2] = 55'h737c650c5fd203;
      expv[3] = 55'h2c68740ca61baf;
      expv[4] = 55'h55b6715da915eb;
      expv[5] = 55'h78d124587cc5ab;
      expv[6] = 55'h2c9ee8e46f4a99;
      expv[7] = 55'h556b876597691b;
      expv[8] = 55'h5cfe6fbf692c9d;
      expv[9] = 55'h12b720b43f38ba;
      expv[10] = 55'h582876edc10f71;
      expv[11] = 55'h010379cdf80128;
      expv[12] = 55'h65b8de77950c52;
      expv[13] = 55'h70d81cbced44eb;
      expv[14] = 55'h1546c07f02815b;
      expv[15] = 55'h66482b660adb3d;
      expv[16] = 55'h5cefa99c951af5;
      expv[17] = 55'h2d43ee8517802d;
      expv[18] = 55'h626c6363d3c8df;
      expv[19] = 55'h36be18fab7d65a;
      expv[20] = 55'h6845870ec2943c;
      expv[21] = 55'h10734b0f3a4ed9;
      expv[22] = 55'h0c572796492223;
      expv[23] = 55'h0156710c2d9201;
      expv[24] = 55'h3439dd32744fbf;
      expv[25] = 55'h5775122f1dc0d6;
      expv[26] = 55'h1da2aa12a51a62;
      expv[27] = 55'h5259cee6f13504;
      expv[28] = 55'h3eedc240327706;
      expv[29] = 55'h3c96c2b845c0ce;
      expv[30] = 55'h2e0a607e0a931d;
      expv[31] = 55'h56e97b62c6140c;
      expv[32] = 55'h7dce279f075fab;
      expv[33] = 55'h09a3dff0b75a65;
      expv[34] = 55'h3781dcb92c9e49;
      expv[35] = 55'h1a982a439e622f;
      expv[36] = 55'h0ba4c9b3b29437;
      expv[37] = 55'h2a5a048ed25bff;
      expv[38] = 55'h526e5a9373c852;
      expv[39] = 55'h3ede35d16ab739;
      expv[40] = 55'h50284209556191;
      expv[41] = 55'h699e96e4e6ac3a;
      expv[42] = 55'h592e28510d7263;
      expv[43] = 55'h7d5696ab6a9c08;
      expv[44] = 55'h24334db72d0b9d;
      expv[45] = 55'h6238ef7b4ddc19;
      expv[46] = 55'h61443206928652;
      expv[47] = 55'h6e090405a5a75a;
      expv[48] = 55'h23e2f090797d05;
      expv[49] = 55'h503dfa98ccc9f5;
      expv[50] = 55'h2fc026f97b9317;
      expv[51] = 55'h7a5864c250869d;
      expv[52] = 55'h375712eef5ad38;
      expv[53] = 55'h0a8d90a1d611c5;
      expv[54] = 55'h5a09fbec13f4ff;
      expv[55] = 55'h5b716750f8a6a0;
      expv[56] = 55'h45475508625e80;
      expv[57] = 55'h2226afcc949397;
      expv[58] = 55'h6ef314e7bcdb29;
      expv[59] = 55'h1ebfb705093027;
      expv[60] = 55'h5b297e454f8222;
      expv[61] = 55'h76ccdad3ab5478;
      expv[62] = 55'h76521ca6aa8709;
      expv[63] = 55'h45fdfd3fb0dd1c;
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
