// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 32;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_02285 dut (
    .clk(clk),
    .a(in_vec[31:16]),
    .b(in_vec[15:0]),
    .q(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'h7d6c06a5;
    stim[1] = 32'h4a17da37;
    stim[2] = 32'h244fd2b2;
    stim[3] = 32'h845583e0;
    stim[4] = 32'hb7f3438a;
    stim[5] = 32'h10c7658c;
    stim[6] = 32'h157f4a44;
    stim[7] = 32'h6c17783e;
    stim[8] = 32'hea7c39fc;
    stim[9] = 32'h11416c6f;
    stim[10] = 32'h78cffda2;
    stim[11] = 32'h111509c0;
    stim[12] = 32'h0257ef08;
    stim[13] = 32'h9143982b;
    stim[14] = 32'h8ae704e1;
    stim[15] = 32'hede4fd06;
    stim[16] = 32'h92c5bee0;
    stim[17] = 32'hc1f4a836;
    stim[18] = 32'ha9a97e76;
    stim[19] = 32'h80a1f93b;
    stim[20] = 32'h6713294f;
    stim[21] = 32'h5e5cc161;
    stim[22] = 32'hf9d1727f;
    stim[23] = 32'hd3d24835;
    stim[24] = 32'h670c4367;
    stim[25] = 32'h34561b75;
    stim[26] = 32'h88b86ff3;
    stim[27] = 32'h89dafbab;
    stim[28] = 32'hfefcbe89;
    stim[29] = 32'h644d84ca;
    stim[30] = 32'h7b05fa46;
    stim[31] = 32'hdca89124;
    stim[32] = 32'h8f4ae393;
    stim[33] = 32'h99bb1bdc;
    stim[34] = 32'h6071f805;
    stim[35] = 32'hf1b7bda6;
    stim[36] = 32'hc33608ef;
    stim[37] = 32'h76ac476f;
    stim[38] = 32'he66f7678;
    stim[39] = 32'hb327b55e;
    stim[40] = 32'h7b40ada1;
    stim[41] = 32'h65d0f22e;
    stim[42] = 32'hc24c5b2f;
    stim[43] = 32'h3753496a;
    stim[44] = 32'h9ea0bc52;
    stim[45] = 32'h8a2bea92;
    stim[46] = 32'h64503878;
    stim[47] = 32'h179262df;
    stim[48] = 32'h11d51862;
    stim[49] = 32'h0f2ad4da;
    stim[50] = 32'hf98208de;
    stim[51] = 32'h0180e64a;
    stim[52] = 32'h6dab1d11;
    stim[53] = 32'hed13ea8d;
    stim[54] = 32'ha1d38203;
    stim[55] = 32'hc36745d8;
    stim[56] = 32'h3b3d42b8;
    stim[57] = 32'hc67e812c;
    stim[58] = 32'h92bead73;
    stim[59] = 32'hd6a0db87;
    stim[60] = 32'h4921da09;
    stim[61] = 32'h678822b3;
    stim[62] = 32'h5a2dcf38;
    stim[63] = 32'h692fe2bf;
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
      expv[0] = 16'hxxxx;
      expv[1] = 16'h76c7;
      expv[2] = 16'h6fe0;
      expv[3] = 16'h519d;
      expv[4] = 16'h0075;
      expv[5] = 16'h7469;
      expv[6] = 16'hab3b;
      expv[7] = 16'hcb3b;
      expv[8] = 16'hf3d9;
      expv[9] = 16'hb080;
      expv[10] = 16'ha4d2;
      expv[11] = 16'h7b2d;
      expv[12] = 16'h0755;
      expv[13] = 16'h134f;
      expv[14] = 16'hf918;
      expv[15] = 16'h8606;
      expv[16] = 16'hf0de;
      expv[17] = 16'hd3e5;
      expv[18] = 16'h19be;
      expv[19] = 16'h2b33;
      expv[20] = 16'h8766;
      expv[21] = 16'h3dc4;
      expv[22] = 16'h9cfb;
      expv[23] = 16'h8752;
      expv[24] = 16'h8b9d;
      expv[25] = 16'h23a5;
      expv[26] = 16'h18e1;
      expv[27] = 16'h18c5;
      expv[28] = 16'h8e2f;
      expv[29] = 16'h4073;
      expv[30] = 16'hdf83;
      expv[31] = 16'h80bf;
      expv[32] = 16'h4b84;
      expv[33] = 16'habb7;
      expv[34] = 16'h7ddf;
      expv[35] = 16'h686c;
      expv[36] = 16'h3411;
      expv[37] = 16'hba47;
      expv[38] = 16'h2f3d;
      expv[39] = 16'h6ff7;
      expv[40] = 16'hfdc9;
      expv[41] = 16'hcd9f;
      expv[42] = 16'h73a2;
      expv[43] = 16'h671d;
      expv[44] = 16'hede9;
      expv[45] = 16'he24e;
      expv[46] = 16'h9f99;
      expv[47] = 16'h2bd8;
      expv[48] = 16'hb4b3;
      expv[49] = 16'hf973;
      expv[50] = 16'h3a50;
      expv[51] = 16'hf0a4;
      expv[52] = 16'h1b36;
      expv[53] = 16'h509a;
      expv[54] = 16'h0286;
      expv[55] = 16'h1fd0;
      expv[56] = 16'h7d8f;
      expv[57] = 16'hf885;
      expv[58] = 16'h4552;
      expv[59] = 16'he54b;
      expv[60] = 16'hfb19;
      expv[61] = 16'h6f18;
      expv[62] = 16'h44d5;
      expv[63] = 16'h8af5;
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
