// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 42;
  localparam OW = 48;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_10966 dut (
    .clk(clk),
    .ir_in(in_vec[41:40]),
    .sr(in_vec[39:2]),
    .vs_udr(in_vec[1:1]),
    .vs_uir(in_vec[0:0]),
    .jdo(out_vec[47:10]),
    .take_action_break_a(out_vec[9:9]),
    .take_action_break_b(out_vec[8:8]),
    .take_action_break_c(out_vec[7:7]),
    .take_action_ocimem_a(out_vec[6:6]),
    .take_action_ocimem_b(out_vec[5:5]),
    .take_action_tracectrl(out_vec[4:4]),
    .take_no_action_break_a(out_vec[3:3]),
    .take_no_action_break_b(out_vec[2:2]),
    .take_no_action_break_c(out_vec[1:1]),
    .take_no_action_ocimem_a(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 42'h3faf5204e77;
    stim[1] = 42'h09dd04caf20;
    stim[2] = 42'h3753c5976c8;
    stim[3] = 42'h13f3b81eb5c;
    stim[4] = 42'h1218c3548af;
    stim[5] = 42'h17ba16ee954;
    stim[6] = 42'h24286c5e06f;
    stim[7] = 42'h20ad2e8795e;
    stim[8] = 42'h0f1c209ca0b;
    stim[9] = 42'h27d5596bc00;
    stim[10] = 42'h3a67c06624f;
    stim[11] = 42'h3af57d79555;
    stim[12] = 42'h0707b4ea7c3;
    stim[13] = 42'h1ade29a4d24;
    stim[14] = 42'h2ecc794fc5e;
    stim[15] = 42'h29e84fa5d12;
    stim[16] = 42'h03de6c63e4a;
    stim[17] = 42'h252d80b0c37;
    stim[18] = 42'h14b860a7520;
    stim[19] = 42'h399a23afb4a;
    stim[20] = 42'h3e500662763;
    stim[21] = 42'h389a8c10398;
    stim[22] = 42'h3fc3654fbd4;
    stim[23] = 42'h141ec6534b6;
    stim[24] = 42'h3c8268cfa3e;
    stim[25] = 42'h36cb3ffafc2;
    stim[26] = 42'h336a2b92234;
    stim[27] = 42'h0a6bb069d55;
    stim[28] = 42'h340282eeba7;
    stim[29] = 42'h09ee3860d2c;
    stim[30] = 42'h36ff90da9bf;
    stim[31] = 42'h029d691123f;
    stim[32] = 42'h096fafef1a9;
    stim[33] = 42'h1b822e7ab71;
    stim[34] = 42'h12340619e84;
    stim[35] = 42'h0d92de162a9;
    stim[36] = 42'h311b9fddb6e;
    stim[37] = 42'h0c2876689d7;
    stim[38] = 42'h2d0c5f04ae5;
    stim[39] = 42'h2bb500f4856;
    stim[40] = 42'h3c12eb1f159;
    stim[41] = 42'h026f78817d4;
    stim[42] = 42'h1c1a64e4d4b;
    stim[43] = 42'h32821aa8871;
    stim[44] = 42'h10ea6df60ce;
    stim[45] = 42'h1e61c7dcd1d;
    stim[46] = 42'h2729b766c99;
    stim[47] = 42'h04ef09e3d23;
    stim[48] = 42'h039398a62f8;
    stim[49] = 42'h13eb1ed8108;
    stim[50] = 42'h13a9281eb8e;
    stim[51] = 42'h28d5f3797d2;
    stim[52] = 42'h06b6ddb73d6;
    stim[53] = 42'h1188429dbd7;
    stim[54] = 42'h11e1cd3c4f5;
    stim[55] = 42'h2f2de2c16f8;
    stim[56] = 42'h3237f7ca91f;
    stim[57] = 42'h385b4fa135a;
    stim[58] = 42'h11b91eb3491;
    stim[59] = 42'h2ecaf9031db;
    stim[60] = 42'h2dbe7d5f45d;
    stim[61] = 42'h1547ada2265;
    stim[62] = 42'h113bca4afc4;
    stim[63] = 42'h2389073eb19;
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
      expv[0] = 48'hxxxxxxxxxxxx;
      expv[1] = 48'hxxxxxxxxxxxx;
      expv[2] = 48'hxxxxxxxxxxxx;
      expv[3] = 48'hxxxxxxxxxxxx;
      expv[4] = 48'hxxxxxxxxxxxx;
      expv[5] = 48'hxxxxxxxxxx00;
      expv[6] = 48'hxxxxxxxxxx00;
      expv[7] = 48'hxxxxxxxxxx00;
      expv[8] = 48'h0ad2e8795c08;
      expv[9] = 48'h0ad2e8795c00;
      expv[10] = 48'h7d5596bc0002;
      expv[11] = 48'h7d5596bc0000;
      expv[12] = 48'h7d5596bc0000;
      expv[13] = 48'h7d5596bc0000;
      expv[14] = 48'hade29a4d2400;
      expv[15] = 48'hade29a4d2400;
      expv[16] = 48'h9e84fa5d1000;
      expv[17] = 48'h9e84fa5d1000;
      expv[18] = 48'h52d80b0c3400;
      expv[19] = 48'h52d80b0c3400;
      expv[20] = 48'h52d80b0c3400;
      expv[21] = 48'h52d80b0c3400;
      expv[22] = 48'h52d80b0c3400;
      expv[23] = 48'hfc3654fbd400;
      expv[24] = 48'hfc3654fbd400;
      expv[25] = 48'hfc3654fbd400;
      expv[26] = 48'hfc3654fbd400;
      expv[27] = 48'h36a2b9223400;
      expv[28] = 48'h36a2b9223400;
      expv[29] = 48'h36a2b9223400;
      expv[30] = 48'h36a2b9223400;
      expv[31] = 48'h36a2b9223400;
      expv[32] = 48'h29d691123c00;
      expv[33] = 48'h29d691123c00;
      expv[34] = 48'hb822e7ab7000;
      expv[35] = 48'hb822e7ab7000;
      expv[36] = 48'hb822e7ab7000;
      expv[37] = 48'hb822e7ab7000;
      expv[38] = 48'hb822e7ab7000;
      expv[39] = 48'hb822e7ab7000;
      expv[40] = 48'hbb500f485600;
      expv[41] = 48'hbb500f485400;
      expv[42] = 48'hbb500f485400;
      expv[43] = 48'hc1a64e4d4810;
      expv[44] = 48'hc1a64e4d4800;
      expv[45] = 48'hc1a64e4d4800;
      expv[46] = 48'he61c7dcd1c00;
      expv[47] = 48'he61c7dcd1c00;
      expv[48] = 48'h4ef09e3d2000;
      expv[49] = 48'h4ef09e3d2000;
      expv[50] = 48'h4ef09e3d2000;
      expv[51] = 48'h3a9281eb8c20;
      expv[52] = 48'h3a9281eb8c00;
      expv[53] = 48'h3a9281eb8c00;
      expv[54] = 48'h188429dbd440;
      expv[55] = 48'h188429dbd400;
      expv[56] = 48'h188429dbd400;
      expv[57] = 48'h188429dbd400;
      expv[58] = 48'h188429dbd400;
      expv[59] = 48'h188429dbd400;
      expv[60] = 48'hecaf9031d880;
      expv[61] = 48'hecaf9031d800;
      expv[62] = 48'hecaf9031d800;
      expv[63] = 48'h13bca4afc400;
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
