// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 31;
  localparam OW = 36;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_06821 dut (
    .clk(clk),
    .rstn(in_vec[30:30]),
    .tic_enable(in_vec[29:29]),
    .f_control(in_vec[28:0]),
    .carrier_val(out_vec[35:4]),
    .i_sign(out_vec[3:3]),
    .i_mag(out_vec[2:2]),
    .q_sign(out_vec[1:1]),
    .q_mag(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 31'h082329f3;
    stim[1] = 31'h2ec73180;
    stim[2] = 31'h5f128326;
    stim[3] = 31'h4d43821d;
    stim[4] = 31'h5015ba9a;
    stim[5] = 31'h44718fb3;
    stim[6] = 31'h4ee6a8c4;
    stim[7] = 31'h4180e154;
    stim[8] = 31'h676740ce;
    stim[9] = 31'h694ddb42;
    stim[10] = 31'h4b536914;
    stim[11] = 31'h55669f86;
    stim[12] = 31'h7336fccf;
    stim[13] = 31'h46f803c5;
    stim[14] = 31'h6fffbd56;
    stim[15] = 31'h78b8ade6;
    stim[16] = 31'h7a971807;
    stim[17] = 31'h49769641;
    stim[18] = 31'h557bdba4;
    stim[19] = 31'h57aae851;
    stim[20] = 31'h6cfcdd8f;
    stim[21] = 31'h76c8a11d;
    stim[22] = 31'h0a944d97;
    stim[23] = 31'h626c956a;
    stim[24] = 31'h661e4c03;
    stim[25] = 31'h66ebce52;
    stim[26] = 31'h7cef8187;
    stim[27] = 31'h5236d32e;
    stim[28] = 31'h7a200284;
    stim[29] = 31'h756a0ecd;
    stim[30] = 31'h6fb701d1;
    stim[31] = 31'h6e700e52;
    stim[32] = 31'h66b98008;
    stim[33] = 31'h609ec87c;
    stim[34] = 31'h61448d33;
    stim[35] = 31'h45cf9106;
    stim[36] = 31'h4da20ed4;
    stim[37] = 31'h41c2239f;
    stim[38] = 31'h6bc8bafe;
    stim[39] = 31'h579d9b05;
    stim[40] = 31'h7893bc4a;
    stim[41] = 31'h4091cc1d;
    stim[42] = 31'h63378a5e;
    stim[43] = 31'h48f70699;
    stim[44] = 31'h513e3495;
    stim[45] = 31'h6c3071ae;
    stim[46] = 31'h67fe68ff;
    stim[47] = 31'h470d5267;
    stim[48] = 31'h50d31fea;
    stim[49] = 31'h489bad65;
    stim[50] = 31'h75994870;
    stim[51] = 31'h686841a6;
    stim[52] = 31'h7feabd83;
    stim[53] = 31'h7540faa7;
    stim[54] = 31'h5964865e;
    stim[55] = 31'h496c90a1;
    stim[56] = 31'h4b3348d4;
    stim[57] = 31'h6b637f6a;
    stim[58] = 31'h41404f3d;
    stim[59] = 31'h6dd70974;
    stim[60] = 31'h7c818b83;
    stim[61] = 31'h67fd3698;
    stim[62] = 31'h7d68833b;
    stim[63] = 31'h6a99964a;
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
      expv[0] = 36'hxxxxxxxxb;
      expv[1] = 36'hxxxxxxxxe;
      expv[2] = 36'hxxxxxxxx9;
      expv[3] = 36'hxxxxxxxx4;
      expv[4] = 36'hxxxxxxxx3;
      expv[5] = 36'hxxxxxxxx3;
      expv[6] = 36'hxxxxxxxxe;
      expv[7] = 36'hxxxxxxxxe;
      expv[8] = 36'hxxxxxxxxc;
      expv[9] = 36'h000005149;
      expv[10] = 36'h0000018a4;
      expv[11] = 36'h0000018a3;
      expv[12] = 36'h0000018ac;
      expv[13] = 36'h0000042b9;
      expv[14] = 36'h0000042b4;
      expv[15] = 36'h000001ceb;
      expv[16] = 36'h000002ce9;
      expv[17] = 36'h000000591;
      expv[18] = 36'h000000593;
      expv[19] = 36'h00000059c;
      expv[20] = 36'h000000599;
      expv[21] = 36'h0000056c6;
      expv[22] = 36'h0000023cb;
      expv[23] = 36'h0000023c3;
      expv[24] = 36'h00000000b;
      expv[25] = 36'h00000026e;
      expv[26] = 36'h000000884;
      expv[27] = 36'h000000f73;
      expv[28] = 36'h000000f7c;
      expv[29] = 36'h000003e94;
      expv[30] = 36'h0000018b3;
      expv[31] = 36'h000002e2e;
      expv[32] = 36'h000003dde;
      expv[33] = 36'h000000c4e;
      expv[34] = 36'h00000130c;
      expv[35] = 36'h0000013ac;
      expv[36] = 36'h0000013a1;
      expv[37] = 36'h0000013a1;
      expv[38] = 36'h0000013a6;
      expv[39] = 36'h000002a1e;
      expv[40] = 36'h000002a11;
      expv[41] = 36'h000004d81;
      expv[42] = 36'h000004d81;
      expv[43] = 36'h0000026a4;
      expv[44] = 36'h0000026ab;
      expv[45] = 36'h0000026ae;
      expv[46] = 36'h00000441c;
      expv[47] = 36'h000001049;
      expv[48] = 36'h000001044;
      expv[49] = 36'h000001046;
      expv[50] = 36'h00000104e;
      expv[51] = 36'h0000038cc;
      expv[52] = 36'h000000e56;
      expv[53] = 36'h0000016cb;
      expv[54] = 36'h0000036a1;
      expv[55] = 36'h0000036a4;
      expv[56] = 36'h0000036a6;
      expv[57] = 36'h0000036ab;
      expv[58] = 36'h0000039fb;
      expv[59] = 36'h0000039fc;
      expv[60] = 36'h000000694;
      expv[61] = 36'h000001466;
      expv[62] = 36'h0000030fc;
      expv[63] = 36'h0000038e9;
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
