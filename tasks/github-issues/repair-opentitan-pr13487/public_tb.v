// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 107;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  pwm_chan dut (
    .clk_i(clk),
    .rst_ni(in_vec[106:106]),
    .pwm_en_i(in_vec[105:105]),
    .invert_i(in_vec[104:104]),
    .blink_en_i(in_vec[103:103]),
    .htbt_en_i(in_vec[102:102]),
    .phase_delay_i(in_vec[101:86]),
    .duty_cycle_a_i(in_vec[85:70]),
    .duty_cycle_b_i(in_vec[69:54]),
    .blink_param_x_i(in_vec[53:38]),
    .blink_param_y_i(in_vec[37:22]),
    .phase_ctr_i(in_vec[21:6]),
    .cycle_end_i(in_vec[5:5]),
    .clr_blink_cntr_i(in_vec[4:4]),
    .dc_resn_i(in_vec[3:0]),
    .pwm_o(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 107'h0d3828bbfa8b4fc3c19f63b7c76;
    stim[1] = 107'h2983a2410c940fd21993b9a857a;
    stim[2] = 107'h73a40931c3fdcb81b9cbfe42c49;
    stim[3] = 107'h254b3fb6fdc4ebc8dd32f0f4947;
    stim[4] = 107'h5375e4f3f0973fe2dd7e0cc059a;
    stim[5] = 107'h500e958bd15af1c48c9bd6238d9;
    stim[6] = 107'h73f10e332a93bc97466f0b94ffe;
    stim[7] = 107'h7720b772776dc47f95cfe90b0de;
    stim[8] = 107'h790d6c0b0d936a3ed1b682cabb6;
    stim[9] = 107'h7db5fbcb247b04a6f9f8ddee37b;
    stim[10] = 107'h5836b72603cb91be9aa7ab378e0;
    stim[11] = 107'h534d99345285eb5a1d3b7b8a285;
    stim[12] = 107'h50873318bd097c8629337f36bec;
    stim[13] = 107'h48b48f55569f7eb3b578bf67c75;
    stim[14] = 107'h477169a54973a51cc616064443d;
    stim[15] = 107'h5b894adc9088eacf3c8176be995;
    stim[16] = 107'h64c59aba8f07362e4f8902313e7;
    stim[17] = 107'h5f1c183c8392856c697f8340864;
    stim[18] = 107'h60e21662864d50acebf5ece8550;
    stim[19] = 107'h4134a458f55e3f78d382c1012d2;
    stim[20] = 107'h795668770d4db47e40fce02cb8d;
    stim[21] = 107'h7530119b9e5285b81dd404b0f02;
    stim[22] = 107'h48422fe1bec7c4b525d851f0ba0;
    stim[23] = 107'h419b70de64815271595a5f40691;
    stim[24] = 107'h5b5768145107e4819173acbfda2;
    stim[25] = 107'h7b8431ef7407f20359779741c31;
    stim[26] = 107'h666d107c1963a5b23119d6cff20;
    stim[27] = 107'h662cbdf217832bd43e5b4abbad0;
    stim[28] = 107'h6478008df0a3f2afdd82522cbb8;
    stim[29] = 107'h6026e7b4787db611f473252fd7d;
    stim[30] = 107'h55b81b458dd560a6c5b745eae4d;
    stim[31] = 107'h7e8acb9e163212635fba91d2d59;
    stim[32] = 107'h7b75218091a339e81e24082286a;
    stim[33] = 107'h65e7e30ac9868f107ae3e058720;
    stim[34] = 107'h4cd52eedfcaa8ae9b4e2095f4bd;
    stim[35] = 107'h28eab0366f2666e2662b692dbfd;
    stim[36] = 107'h432e61073c0e7d9bae32bfc3b13;
    stim[37] = 107'h5d546183532e31ac44cdd857ae4;
    stim[38] = 107'h7d7439dd363cbb0819ebaa41c0e;
    stim[39] = 107'h552ebb30c4f535fced96fe11fa5;
    stim[40] = 107'h7a3b960b0007bd64ffb6afca836;
    stim[41] = 107'h4c8a7e774368e2f69328d6e3bc7;
    stim[42] = 107'h47a77e619de747dc24743be193a;
    stim[43] = 107'h5126a2df1e8ffd40c4ab32caf7d;
    stim[44] = 107'h74d53f3b44b29a02221aeaa2588;
    stim[45] = 107'h5d3c271e8908ea00ec7b130251c;
    stim[46] = 107'h4417e7ec004361152d36deacb7a;
    stim[47] = 107'h4c60de33321a9385ef39f219107;
    stim[48] = 107'h7bbd1e5ca9757583b85b1d67500;
    stim[49] = 107'h5d4e60a209e3973185bfb223a06;
    stim[50] = 107'h6ad2bdbda3d800d29690e1ebcfb;
    stim[51] = 107'h48f763341c2d6e33685a60bb343;
    stim[52] = 107'h5df4988cb1b561067eafa14f7b5;
    stim[53] = 107'h7e942ae5680ca67ff5abecbbcf1;
    stim[54] = 107'h4df08ca192f0aa1bd8ec0e2c882;
    stim[55] = 107'h6b359aac83fb79613aa9728d566;
    stim[56] = 107'h6ca1376038b6db3bf29bbb4a820;
    stim[57] = 107'h6dbd0d3fbccb677cc8b742082b1;
    stim[58] = 107'h47824b967aa066d97ebdcb00af6;
    stim[59] = 107'h66b1c9f0ef67d35aae0e58b9a27;
    stim[60] = 107'h6d6b0457e733cab08b033bf1592;
    stim[61] = 107'h7487eece28d789ff3d628cf9f65;
    stim[62] = 107'h5ecf37c15e05fc9b5e82828dc9a;
    stim[63] = 107'h5d860fd060baceb77ea55e1a8a1;
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
      expv[0] = 1'h0;
      expv[1] = 1'h1;
      expv[2] = 1'h1;
      expv[3] = 1'h1;
      expv[4] = 1'h1;
      expv[5] = 1'h1;
      expv[6] = 1'h1;
      expv[7] = 1'h0;
      expv[8] = 1'h1;
      expv[9] = 1'h1;
      expv[10] = 1'h1;
      expv[11] = 1'h1;
      expv[12] = 1'h1;
      expv[13] = 1'h0;
      expv[14] = 1'h0;
      expv[15] = 1'h1;
      expv[16] = 1'h1;
      expv[17] = 1'h1;
      expv[18] = 1'h1;
      expv[19] = 1'h0;
      expv[20] = 1'h1;
      expv[21] = 1'h1;
      expv[22] = 1'h0;
      expv[23] = 1'h0;
      expv[24] = 1'h1;
      expv[25] = 1'h0;
      expv[26] = 1'h0;
      expv[27] = 1'h0;
      expv[28] = 1'h0;
      expv[29] = 1'h1;
      expv[30] = 1'h1;
      expv[31] = 1'h0;
      expv[32] = 1'h0;
      expv[33] = 1'h1;
      expv[34] = 1'h0;
      expv[35] = 1'h0;
      expv[36] = 1'h0;
      expv[37] = 1'h1;
      expv[38] = 1'h0;
      expv[39] = 1'h1;
      expv[40] = 1'h0;
      expv[41] = 1'h0;
      expv[42] = 1'h0;
      expv[43] = 1'h1;
      expv[44] = 1'h0;
      expv[45] = 1'h1;
      expv[46] = 1'h0;
      expv[47] = 1'h0;
      expv[48] = 1'h1;
      expv[49] = 1'h1;
      expv[50] = 1'h0;
      expv[51] = 1'h0;
      expv[52] = 1'h1;
      expv[53] = 1'h0;
      expv[54] = 1'h0;
      expv[55] = 1'h0;
      expv[56] = 1'h0;
      expv[57] = 1'h1;
      expv[58] = 1'h0;
      expv[59] = 1'h0;
      expv[60] = 1'h0;
      expv[61] = 1'h0;
      expv[62] = 1'h1;
      expv[63] = 1'h1;
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
