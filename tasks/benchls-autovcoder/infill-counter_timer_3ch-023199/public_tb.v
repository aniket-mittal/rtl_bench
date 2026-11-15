// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 39;
  localparam OW = 35;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_023199 dut (
    .clk(clk),
    .rst(in_vec[38:38]),
    .clk0(in_vec[37:37]),
    .clk1(in_vec[36:36]),
    .clk2(in_vec[35:35]),
    .counter_we(in_vec[34:34]),
    .counter_val(in_vec[33:2]),
    .counter_ch(in_vec[1:0]),
    .counter0_OUT(out_vec[34:34]),
    .counter1_OUT(out_vec[33:33]),
    .counter2_OUT(out_vec[32:32]),
    .counter_out(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 39'h66acbdb538;
    stim[1] = 39'h7266eed7af;
    stim[2] = 39'h045bb26d7b;
    stim[3] = 39'h074caa021d;
    stim[4] = 39'h2219c7d7c8;
    stim[5] = 39'h17601f4be6;
    stim[6] = 39'h05e2cf3d50;
    stim[7] = 39'h1e39fc7ada;
    stim[8] = 39'h3bc13fda34;
    stim[9] = 39'h2e227eb1ae;
    stim[10] = 39'h0e38954e5f;
    stim[11] = 39'h3341a83a89;
    stim[12] = 39'h35443f035c;
    stim[13] = 39'h0abdd0bd58;
    stim[14] = 39'h0ab5b214a3;
    stim[15] = 39'h1bdc75f538;
    stim[16] = 39'h1801039ba1;
    stim[17] = 39'h2d7528c639;
    stim[18] = 39'h144c7081b4;
    stim[19] = 39'h24427e054b;
    stim[20] = 39'h074f16152c;
    stim[21] = 39'h325917f5ec;
    stim[22] = 39'h0bd40f14a0;
    stim[23] = 39'h2ac9f5da20;
    stim[24] = 39'h348590f939;
    stim[25] = 39'h27da48d831;
    stim[26] = 39'h1e467df283;
    stim[27] = 39'h2db546e346;
    stim[28] = 39'h1d798310f2;
    stim[29] = 39'h1fee9d8492;
    stim[30] = 39'h13730e2a65;
    stim[31] = 39'h2945f567f9;
    stim[32] = 39'h0ab22c77bf;
    stim[33] = 39'h1b434fee77;
    stim[34] = 39'h376d1e318b;
    stim[35] = 39'h1c09b48084;
    stim[36] = 39'h3b0cbdc18d;
    stim[37] = 39'h2ebed6c899;
    stim[38] = 39'h1c1ce75bef;
    stim[39] = 39'h1fd2f5d420;
    stim[40] = 39'h254ef62994;
    stim[41] = 39'h3e6edab6cc;
    stim[42] = 39'h163a3e1e6b;
    stim[43] = 39'h0d868aa7ec;
    stim[44] = 39'h082c5e52cb;
    stim[45] = 39'h244d779e4d;
    stim[46] = 39'h1a39379ba7;
    stim[47] = 39'h3d965986ca;
    stim[48] = 39'h1ebb4118bb;
    stim[49] = 39'h11ad2fdef9;
    stim[50] = 39'h29f7efc031;
    stim[51] = 39'h0096d0510a;
    stim[52] = 39'h1a48662b93;
    stim[53] = 39'h2e50881a4e;
    stim[54] = 39'h26bbc5f639;
    stim[55] = 39'h14f2fb7b46;
    stim[56] = 39'h7837187a46;
    stim[57] = 39'h0fa8e0f3b5;
    stim[58] = 39'h22219a19d2;
    stim[59] = 39'h0f872098d4;
    stim[60] = 39'h1947d32d05;
    stim[61] = 39'h1b08633c24;
    stim[62] = 39'h0bfd16115c;
    stim[63] = 39'h2934343c51;
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
      expv[0] = 35'hx00000000;
      expv[1] = 35'hx00000000;
      expv[2] = 35'hx00000000;
      expv[3] = 35'hx00000000;
      expv[4] = 35'hxffffffff;
      expv[5] = 35'hxffffffff;
      expv[6] = 35'hxffffffff;
      expv[7] = 35'hxffffffff;
      expv[8] = 35'hxfffffffe;
      expv[9] = 35'hxfffffffe;
      expv[10] = 35'hxfffffffe;
      expv[11] = 35'hxfffffffd;
      expv[12] = 35'hxfffffffd;
      expv[13] = 35'hxfffffffd;
      expv[14] = 35'hxfffffffd;
      expv[15] = 35'hxfffffffd;
      expv[16] = 35'hxfffffffd;
      expv[17] = 35'hxfffffffc;
      expv[18] = 35'hxfffffffc;
      expv[19] = 35'hxfffffffb;
      expv[20] = 35'hxfffffffb;
      expv[21] = 35'hxd3c5854b;
      expv[22] = 35'hxd3c5854b;
      expv[23] = 35'hxd3c5854a;
      expv[24] = 35'hxd3c5854a;
      expv[25] = 35'hxd3c5854a;
      expv[26] = 35'hxd3c5854a;
      expv[27] = 35'hxd3c5854b;
      expv[28] = 35'hxd3c5854b;
      expv[29] = 35'hxd3c5854b;
      expv[30] = 35'hxd3c5854b;
      expv[31] = 35'hxd3c5854a;
      expv[32] = 35'hxd3c5854a;
      expv[33] = 35'hxd3c5854a;
      expv[34] = 35'hxd3c58549;
      expv[35] = 35'hxd3c58549;
      expv[36] = 35'hxd3c58548;
      expv[37] = 35'hxd3c58548;
      expv[38] = 35'hxd3c58548;
      expv[39] = 35'hxd3c58548;
      expv[40] = 35'hxd3c58547;
      expv[41] = 35'hxd3c58547;
      expv[42] = 35'hxd3c58547;
      expv[43] = 35'hxd3c58547;
      expv[44] = 35'hxd3c58547;
      expv[45] = 35'hxd3c58546;
      expv[46] = 35'hxd3c58546;
      expv[47] = 35'hxd3c58545;
      expv[48] = 35'hxd3c58545;
      expv[49] = 35'hxd3c58545;
      expv[50] = 35'hxd3c58544;
      expv[51] = 35'hxd3c58544;
      expv[52] = 35'hxd3c58544;
      expv[53] = 35'hxd3c58543;
      expv[54] = 35'hxd3c58543;
      expv[55] = 35'hxd3c58543;
      expv[56] = 35'hx00000000;
      expv[57] = 35'hx00000000;
      expv[58] = 35'hx00000000;
      expv[59] = 35'hx00000000;
      expv[60] = 35'hx00000000;
      expv[61] = 35'hx00000000;
      expv[62] = 35'hx00000000;
      expv[63] = 35'hxffffffff;
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
