// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 33;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_01904 dut (
    .data_in(in_vec[32:1]),
    .io(in_vec[0:0]),
    .data_out(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 33'h0ce2bbc75;
    stim[1] = 33'h126a2fca2;
    stim[2] = 33'h1fc2cc334;
    stim[3] = 33'h0f9bda71f;
    stim[4] = 33'h0f7250acf;
    stim[5] = 33'h11df64bd2;
    stim[6] = 33'h0feb41d99;
    stim[7] = 33'h0bbf93509;
    stim[8] = 33'h18eff0203;
    stim[9] = 33'h0c7b3e20c;
    stim[10] = 33'h1f32b5bcd;
    stim[11] = 33'h012973525;
    stim[12] = 33'h151f98778;
    stim[13] = 33'h0a568d270;
    stim[14] = 33'h08fe633e8;
    stim[15] = 33'h0d9c25e11;
    stim[16] = 33'h1f3be816b;
    stim[17] = 33'h082526277;
    stim[18] = 33'h15c9ee37a;
    stim[19] = 33'h100363159;
    stim[20] = 33'h193ea1a61;
    stim[21] = 33'h048c24c43;
    stim[22] = 33'h190efda90;
    stim[23] = 33'h017045c1e;
    stim[24] = 33'h1df52fbaa;
    stim[25] = 33'h0e63af285;
    stim[26] = 33'h1c7c7b984;
    stim[27] = 33'h0fa08a642;
    stim[28] = 33'h115d51f81;
    stim[29] = 33'h0520526f0;
    stim[30] = 33'h0cac4986a;
    stim[31] = 33'h05f04fe2e;
    stim[32] = 33'h1aeb56ede;
    stim[33] = 33'h1c6ee9c93;
    stim[34] = 33'h1ff074e25;
    stim[35] = 33'h0c469ea40;
    stim[36] = 33'h05641219e;
    stim[37] = 33'h0d6572395;
    stim[38] = 33'h0c5d0c035;
    stim[39] = 33'h1fe0fe389;
    stim[40] = 33'h0d35c8a5c;
    stim[41] = 33'h183679ad3;
    stim[42] = 33'h13a83b52a;
    stim[43] = 33'h1afaac557;
    stim[44] = 33'h17b8c96fd;
    stim[45] = 33'h1f534d14a;
    stim[46] = 33'h1b23c6a82;
    stim[47] = 33'h0e805aa97;
    stim[48] = 33'h059069925;
    stim[49] = 33'h1e0418e19;
    stim[50] = 33'h1f3fed188;
    stim[51] = 33'h04d181ca2;
    stim[52] = 33'h00335ee8c;
    stim[53] = 33'h00e6651ac;
    stim[54] = 33'h0cb5a66bb;
    stim[55] = 33'h08fa72b18;
    stim[56] = 33'h0a8e25ff8;
    stim[57] = 33'h03b47ec11;
    stim[58] = 33'h02b338910;
    stim[59] = 33'h1a323535e;
    stim[60] = 33'h14b763083;
    stim[61] = 33'h15d5dda42;
    stim[62] = 33'h01782dab3;
    stim[63] = 33'h119770ebe;
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
      expv[0] = 32'h00000000;
      expv[1] = 32'h00000000;
      expv[2] = 32'h00000000;
      expv[3] = 32'h00000000;
      expv[4] = 32'h00000000;
      expv[5] = 32'h00000000;
      expv[6] = 32'h00000000;
      expv[7] = 32'h00000000;
      expv[8] = 32'h0000000x;
      expv[9] = 32'h0000000x;
      expv[10] = 32'h0000000x;
      expv[11] = 32'h00000000;
      expv[12] = 32'h00000000;
      expv[13] = 32'h0000000x;
      expv[14] = 32'h0000000x;
      expv[15] = 32'h00000000;
      expv[16] = 32'h0000000x;
      expv[17] = 32'h00000000;
      expv[18] = 32'h00000000;
      expv[19] = 32'h0000000x;
      expv[20] = 32'h0000000x;
      expv[21] = 32'h00000000;
      expv[22] = 32'h00000000;
      expv[23] = 32'h0000000x;
      expv[24] = 32'h00000000;
      expv[25] = 32'h00000000;
      expv[26] = 32'h00000000;
      expv[27] = 32'h0000000x;
      expv[28] = 32'h0000000x;
      expv[29] = 32'h0000000x;
      expv[30] = 32'h0000000x;
      expv[31] = 32'h0000000x;
      expv[32] = 32'h00000000;
      expv[33] = 32'h0000000x;
      expv[34] = 32'h0000000x;
      expv[35] = 32'h0000000x;
      expv[36] = 32'h0000000x;
      expv[37] = 32'h00000000;
      expv[38] = 32'h00000000;
      expv[39] = 32'h0000000x;
      expv[40] = 32'h0000000x;
      expv[41] = 32'h0000000x;
      expv[42] = 32'h00000000;
      expv[43] = 32'h0000000x;
      expv[44] = 32'h0000000x;
      expv[45] = 32'h00000000;
      expv[46] = 32'h00000000;
      expv[47] = 32'h00000000;
      expv[48] = 32'h00000000;
      expv[49] = 32'h0000000x;
      expv[50] = 32'h00000000;
      expv[51] = 32'h0000000x;
      expv[52] = 32'h0000000x;
      expv[53] = 32'h0000000x;
      expv[54] = 32'h00000000;
      expv[55] = 32'h0000000x;
      expv[56] = 32'h0000000x;
      expv[57] = 32'h00000000;
      expv[58] = 32'h0000000x;
      expv[59] = 32'h00000000;
      expv[60] = 32'h0000000x;
      expv[61] = 32'h00000000;
      expv[62] = 32'h00000000;
      expv[63] = 32'h00000000;
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
