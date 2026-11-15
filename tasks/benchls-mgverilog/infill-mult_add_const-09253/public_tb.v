// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 34;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_09253 dut (
    .CLK(clk),
    .RST_N(in_vec[33:33]),
    .update_x(in_vec[32:17]),
    .update_y(in_vec[16:1]),
    .EN_update(in_vec[0:0]),
    .update(out_vec[16:1]),
    .RDY_update(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 34'h051b07a33;
    stim[1] = 34'h074c58f20;
    stim[2] = 34'h2efb58f07;
    stim[3] = 34'h209798c62;
    stim[4] = 34'h387c5e608;
    stim[5] = 34'h2777de4e6;
    stim[6] = 34'h2b8766a8a;
    stim[7] = 34'h3291ae582;
    stim[8] = 34'h3afbab6ec;
    stim[9] = 34'h356680c9e;
    stim[10] = 34'h2b927b89e;
    stim[11] = 34'h2b22b275d;
    stim[12] = 34'h2c0dc6838;
    stim[13] = 34'h215114fca;
    stim[14] = 34'h20ee9b4b1;
    stim[15] = 34'h2110594e1;
    stim[16] = 34'h36a4a4635;
    stim[17] = 34'h3653f82b9;
    stim[18] = 34'h22b8e7e52;
    stim[19] = 34'h252690698;
    stim[20] = 34'h280e6995b;
    stim[21] = 34'h32c2ef52b;
    stim[22] = 34'h339245406;
    stim[23] = 34'h3d3a63222;
    stim[24] = 34'h380d8f268;
    stim[25] = 34'h26446007f;
    stim[26] = 34'h32012c1da;
    stim[27] = 34'h35511c89e;
    stim[28] = 34'h0fd31b952;
    stim[29] = 34'h2b2b23652;
    stim[30] = 34'h24b860191;
    stim[31] = 34'h334a28d48;
    stim[32] = 34'h056eecad3;
    stim[33] = 34'h277bf2aea;
    stim[34] = 34'h335e1cbe9;
    stim[35] = 34'h3986494aa;
    stim[36] = 34'h221d35707;
    stim[37] = 34'h39752bb11;
    stim[38] = 34'h3d1e5a7a6;
    stim[39] = 34'h23ebfff37;
    stim[40] = 34'h256d567d2;
    stim[41] = 34'h24153ec2a;
    stim[42] = 34'h37ad3f3c3;
    stim[43] = 34'h2ace9e932;
    stim[44] = 34'h372fb4116;
    stim[45] = 34'h270915a30;
    stim[46] = 34'h32b9eadd2;
    stim[47] = 34'h34a2bc3d2;
    stim[48] = 34'h27a5d3584;
    stim[49] = 34'h3642a60b9;
    stim[50] = 34'h31c508285;
    stim[51] = 34'h3392b0e86;
    stim[52] = 34'h24a60da37;
    stim[53] = 34'h31363405d;
    stim[54] = 34'h336271f9a;
    stim[55] = 34'h2421b7750;
    stim[56] = 34'h32da0e92f;
    stim[57] = 34'h24960dba7;
    stim[58] = 34'h3d22df1cd;
    stim[59] = 34'h346a25f85;
    stim[60] = 34'h39f593c0d;
    stim[61] = 34'h3d6e7df2d;
    stim[62] = 34'h23cf51e04;
    stim[63] = 34'h22c395fa2;
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
      expv[0] = 17'h00001;
      expv[1] = 17'h00001;
      expv[2] = 17'h00001;
      expv[3] = 17'h00001;
      expv[4] = 17'h00001;
      expv[5] = 17'h00001;
      expv[6] = 17'h00001;
      expv[7] = 17'h00001;
      expv[8] = 17'h00001;
      expv[9] = 17'h00001;
      expv[10] = 17'h00001;
      expv[11] = 17'h00001;
      expv[12] = 17'h00001;
      expv[13] = 17'h00001;
      expv[14] = 17'h00001;
      expv[15] = 17'h00001;
      expv[16] = 17'h00001;
      expv[17] = 17'h00001;
      expv[18] = 17'h00001;
      expv[19] = 17'h00001;
      expv[20] = 17'h00001;
      expv[21] = 17'h00001;
      expv[22] = 17'h00001;
      expv[23] = 17'h00001;
      expv[24] = 17'h00001;
      expv[25] = 17'h00001;
      expv[26] = 17'h00001;
      expv[27] = 17'h00001;
      expv[28] = 17'h00001;
      expv[29] = 17'h00001;
      expv[30] = 17'h00001;
      expv[31] = 17'h00001;
      expv[32] = 17'h00001;
      expv[33] = 17'h00001;
      expv[34] = 17'h00001;
      expv[35] = 17'h00001;
      expv[36] = 17'h00001;
      expv[37] = 17'h00001;
      expv[38] = 17'h00001;
      expv[39] = 17'h00001;
      expv[40] = 17'h00001;
      expv[41] = 17'h00001;
      expv[42] = 17'h00001;
      expv[43] = 17'h00001;
      expv[44] = 17'h00001;
      expv[45] = 17'h00001;
      expv[46] = 17'h00001;
      expv[47] = 17'h00001;
      expv[48] = 17'h00001;
      expv[49] = 17'h00001;
      expv[50] = 17'h00001;
      expv[51] = 17'h00001;
      expv[52] = 17'h00001;
      expv[53] = 17'h00001;
      expv[54] = 17'h00001;
      expv[55] = 17'h00001;
      expv[56] = 17'h00001;
      expv[57] = 17'h00001;
      expv[58] = 17'h00001;
      expv[59] = 17'h00001;
      expv[60] = 17'h00001;
      expv[61] = 17'h00001;
      expv[62] = 17'h00001;
      expv[63] = 17'h00001;
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
