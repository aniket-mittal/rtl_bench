// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 35;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_049589 dut (
    .PORT1(in_vec[34:19]),
    .PORT2(in_vec[18:3]),
    .ALUCON(in_vec[2:0]),
    .ALUOUT(out_vec[16:1]),
    .carry(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 35'h11b50b3bb;
    stim[1] = 35'h1b178fbe2;
    stim[2] = 35'h0d8009a84;
    stim[3] = 35'h10e3641ae;
    stim[4] = 35'h7416cd88b;
    stim[5] = 35'h5d02f604a;
    stim[6] = 35'h44443c507;
    stim[7] = 35'h58fbf88d7;
    stim[8] = 35'h5b6625777;
    stim[9] = 35'h0321444aa;
    stim[10] = 35'h067b54771;
    stim[11] = 35'h4258e3ef2;
    stim[12] = 35'h16df4e3fd;
    stim[13] = 35'h6d39c241d;
    stim[14] = 35'h505df0c02;
    stim[15] = 35'h5ada092e9;
    stim[16] = 35'h222fa20fe;
    stim[17] = 35'h5eb2636cd;
    stim[18] = 35'h003be8822;
    stim[19] = 35'h6b694ef33;
    stim[20] = 35'h1ebadc0f4;
    stim[21] = 35'h5fe44d03b;
    stim[22] = 35'h48025c6f5;
    stim[23] = 35'h5c4202121;
    stim[24] = 35'h6e6ee251c;
    stim[25] = 35'h1a883735b;
    stim[26] = 35'h682ab251f;
    stim[27] = 35'h584668d89;
    stim[28] = 35'h1471ffe1e;
    stim[29] = 35'h0c7c574e1;
    stim[30] = 35'h256b56e00;
    stim[31] = 35'h014c10a54;
    stim[32] = 35'h04584e0e1;
    stim[33] = 35'h49d605d20;
    stim[34] = 35'h2e80d8fd0;
    stim[35] = 35'h2a676c510;
    stim[36] = 35'h0fb7442ee;
    stim[37] = 35'h677813b17;
    stim[38] = 35'h35540643d;
    stim[39] = 35'h53e030df6;
    stim[40] = 35'h326171626;
    stim[41] = 35'h1872692bf;
    stim[42] = 35'h1e9ff047f;
    stim[43] = 35'h7b72228bf;
    stim[44] = 35'h41ae2f515;
    stim[45] = 35'h142631e53;
    stim[46] = 35'h3b745c551;
    stim[47] = 35'h4bb488fee;
    stim[48] = 35'h683326b11;
    stim[49] = 35'h62edece41;
    stim[50] = 35'h512b7fe93;
    stim[51] = 35'h0ce75e487;
    stim[52] = 35'h4384e2b9b;
    stim[53] = 35'h2f4db3fd5;
    stim[54] = 35'h249b5871c;
    stim[55] = 35'h22cfd077a;
    stim[56] = 35'h06e02a70c;
    stim[57] = 35'h04f704fba;
    stim[58] = 35'h209fb15c7;
    stim[59] = 35'h5bc5683aa;
    stim[60] = 35'h0cfebd642;
    stim[61] = 35'h2928677dd;
    stim[62] = 35'h048a60a31;
    stim[63] = 35'h764cdc7e5;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 17'h06efe;
      expv[1] = 17'h02c58;
      expv[2] = 17'h010a0;
      expv[3] = 17'h08718;
      expv[4] = 17'h1f67a;
      expv[5] = 17'h15002;
      expv[6] = 17'h08888;
      expv[7] = 17'h0b1f6;
      expv[8] = 17'h0b6cc;
      expv[9] = 17'h00000;
      expv[10] = 17'h0c810;
      expv[11] = 17'h10920;
      expv[12] = 17'h1a482;
      expv[13] = 17'h04b18;
      expv[14] = 17'h14100;
      expv[15] = 17'h146ae;
      expv[16] = 17'h1117c;
      expv[17] = 17'h08536;
      expv[18] = 17'h00008;
      expv[19] = 17'h1bfec;
      expv[20] = 17'h10ad6;
      expv[21] = 17'h17f9e;
      expv[22] = 17'h0dff6;
      expv[23] = 17'h168c0;
      expv[24] = 17'h030fc;
      expv[25] = 17'h0fef6;
      expv[26] = 17'h0d054;
      expv[27] = 17'h1bdb6;
      expv[28] = 17'h0a38c;
      expv[29] = 17'h0d4b8;
      expv[30] = 17'h1f12c;
      expv[31] = 17'h047a4;
      expv[32] = 17'h0d928;
      expv[33] = 17'h13ea0;
      expv[34] = 17'h01df6;
      expv[35] = 17'h05ae0;
      expv[36] = 17'h07db8;
      expv[37] = 17'h0cef0;
      expv[38] = 17'h12aae;
      expv[39] = 17'h09f00;
      expv[40] = 17'h19308;
      expv[41] = 17'h030e4;
      expv[42] = 17'h03d3e;
      expv[43] = 17'h0f6e4;
      expv[44] = 17'h0f946;
      expv[45] = 17'h0d79c;
      expv[46] = 17'h17c7d;
      expv[47] = 17'h05da4;
      expv[48] = 17'h10608;
      expv[49] = 17'h1d826;
      expv[50] = 17'h1ffac;
      expv[51] = 17'h019ce;
      expv[52] = 17'h18ef6;
      expv[53] = 17'h142c8;
      expv[54] = 17'h1f3aa;
      expv[55] = 17'h0011e;
      expv[56] = 17'h0b242;
      expv[57] = 17'h013cc;
      expv[58] = 17'h0413e;
      expv[59] = 17'h12000;
      expv[60] = 17'h03190;
      expv[61] = 17'h15b5e;
      expv[62] = 17'h08f9c;
      expv[63] = 17'h026cc;
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
