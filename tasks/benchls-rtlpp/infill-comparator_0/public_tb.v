// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 54;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  comparator_0 dut (
    .a(in_vec[53:27]),
    .b(in_vec[26:0]),
    .c(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 54'h25f6f8d13be21d;
    stim[1] = 54'h2d1790fa16cb8d;
    stim[2] = 54'h3fcb64a87b2612;
    stim[3] = 54'h3121f3e75381b7;
    stim[4] = 54'h1c160b0b070385;
    stim[5] = 54'h36b73421c44607;
    stim[6] = 54'h14f30035d135b6;
    stim[7] = 54'h3d92dce44a80c3;
    stim[8] = 54'h29d16ccbf941f9;
    stim[9] = 54'h2719920523dc81;
    stim[10] = 54'h03aed56f807e02;
    stim[11] = 54'h1b537b40484f27;
    stim[12] = 54'h11dd0949a465b2;
    stim[13] = 54'h30d2bc4dba2a54;
    stim[14] = 54'h193aae202c8fcf;
    stim[15] = 54'h2f49038ddfacb7;
    stim[16] = 54'h1c186698da1e6f;
    stim[17] = 54'h3cd9c56ce49d49;
    stim[18] = 54'h0eaebec312e142;
    stim[19] = 54'h051e13a53b82d6;
    stim[20] = 54'h1b018b3087343e;
    stim[21] = 54'h07f06e02f7bbf7;
    stim[22] = 54'h389986b8ec2eaf;
    stim[23] = 54'h3b827c9d5e20be;
    stim[24] = 54'h2e9c48dc9e56af;
    stim[25] = 54'h3e2cf04f8c63f8;
    stim[26] = 54'h12be9081797f28;
    stim[27] = 54'h278dcfc7fb821f;
    stim[28] = 54'h2c904241957e18;
    stim[29] = 54'h226cc235137869;
    stim[30] = 54'h2366e94e4257ae;
    stim[31] = 54'h14bf0d9bcaa4c4;
    stim[32] = 54'h0f3829cfe6803e;
    stim[33] = 54'h1f7f1686a80a31;
    stim[34] = 54'h327ae451ebe365;
    stim[35] = 54'h2766aff49272af;
    stim[36] = 54'h194b338d0eb611;
    stim[37] = 54'h1856eff2c3f8e0;
    stim[38] = 54'h2e4cf8fa0f92ab;
    stim[39] = 54'h3da7e84bdc8615;
    stim[40] = 54'h32cbac59c25f4b;
    stim[41] = 54'h0bccae92ffd88a;
    stim[42] = 54'h0a6c6492f33183;
    stim[43] = 54'h2cf732c5f5ad81;
    stim[44] = 54'h1f0cff9d80b474;
    stim[45] = 54'h1d29a14382f4a6;
    stim[46] = 54'h190be438212e74;
    stim[47] = 54'h060dbb2aa41a3f;
    stim[48] = 54'h2b3a57e581b626;
    stim[49] = 54'h374145822cf397;
    stim[50] = 54'h2700d14f2da19a;
    stim[51] = 54'h3360b4dc5f55fc;
    stim[52] = 54'h3ba9d9b20845b7;
    stim[53] = 54'h377dc958e49ef1;
    stim[54] = 54'h10ce205f30aaa0;
    stim[55] = 54'h1f3ed567588daa;
    stim[56] = 54'h1f8d1f461ba3ba;
    stim[57] = 54'h384cec366aadef;
    stim[58] = 54'h14c9926a35763b;
    stim[59] = 54'h0019b05146b33a;
    stim[60] = 54'h2f159568e4ac53;
    stim[61] = 54'h2438339d0ae817;
    stim[62] = 54'h0c2d9e4c853c1a;
    stim[63] = 54'h343a6b7b7faadb;
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
      expv[0] = 1'h0;
      expv[1] = 1'h0;
      expv[2] = 1'h0;
      expv[3] = 1'h1;
      expv[4] = 1'h0;
      expv[5] = 1'h0;
      expv[6] = 1'h1;
      expv[7] = 1'h0;
      expv[8] = 1'h0;
      expv[9] = 1'h1;
      expv[10] = 1'h1;
      expv[11] = 1'h0;
      expv[12] = 1'h0;
      expv[13] = 1'h0;
      expv[14] = 1'h0;
      expv[15] = 1'h0;
      expv[16] = 1'h0;
      expv[17] = 1'h0;
      expv[18] = 1'h1;
      expv[19] = 1'h1;
      expv[20] = 1'h0;
      expv[21] = 1'h1;
      expv[22] = 1'h0;
      expv[23] = 1'h0;
      expv[24] = 1'h0;
      expv[25] = 1'h0;
      expv[26] = 1'h0;
      expv[27] = 1'h1;
      expv[28] = 1'h0;
      expv[29] = 1'h1;
      expv[30] = 1'h1;
      expv[31] = 1'h1;
      expv[32] = 1'h1;
      expv[33] = 1'h1;
      expv[34] = 1'h0;
      expv[35] = 1'h0;
      expv[36] = 1'h1;
      expv[37] = 1'h0;
      expv[38] = 1'h0;
      expv[39] = 1'h0;
      expv[40] = 1'h0;
      expv[41] = 1'h1;
      expv[42] = 1'h1;
      expv[43] = 1'h1;
      expv[44] = 1'h1;
      expv[45] = 1'h0;
      expv[46] = 1'h0;
      expv[47] = 1'h1;
      expv[48] = 1'h1;
      expv[49] = 1'h0;
      expv[50] = 1'h1;
      expv[51] = 1'h0;
      expv[52] = 1'h0;
      expv[53] = 1'h0;
      expv[54] = 1'h1;
      expv[55] = 1'h1;
      expv[56] = 1'h1;
      expv[57] = 1'h0;
      expv[58] = 1'h0;
      expv[59] = 1'h1;
      expv[60] = 1'h0;
      expv[61] = 1'h1;
      expv[62] = 1'h1;
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
