// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 45;
  localparam OW = 45;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_04641 dut (
    .CLK(clk),
    .A(in_vec[44:44]),
    .B(in_vec[43:40]),
    .C(in_vec[39:32]),
    .D(in_vec[31:0]),
    .E(out_vec[44:44]),
    .F(out_vec[43:40]),
    .G(out_vec[39:32]),
    .H(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 45'h1fb69f9ac62a;
    stim[1] = 45'h1736954d3a84;
    stim[2] = 45'h18367a518987;
    stim[3] = 45'h060c48f2d89d;
    stim[4] = 45'h05f96e699afe;
    stim[5] = 45'h176d63e47ccd;
    stim[6] = 45'h1039a5ff9ac3;
    stim[7] = 45'h11548f940169;
    stim[8] = 45'h0ca959c4997e;
    stim[9] = 45'h0d64ab59d940;
    stim[10] = 45'h06f50393dac6;
    stim[11] = 45'h1d2af712ba2f;
    stim[12] = 45'h0c9fea0bd1c4;
    stim[13] = 45'h079f107db43d;
    stim[14] = 45'h1ee952982a41;
    stim[15] = 45'h15dac3d03eea;
    stim[16] = 45'h1c45886316fc;
    stim[17] = 45'h1d617a5151c9;
    stim[18] = 45'h04cbfdde274a;
    stim[19] = 45'h0120828ae789;
    stim[20] = 45'h02a8db8f1308;
    stim[21] = 45'h01e7f6c90fcf;
    stim[22] = 45'h1eab57b6a8cb;
    stim[23] = 45'h03f286438e14;
    stim[24] = 45'h1f54e35cafc5;
    stim[25] = 45'h09afe68bef86;
    stim[26] = 45'h1017f33d8536;
    stim[27] = 45'h1bcc2e5a90a7;
    stim[28] = 45'h0519e214642f;
    stim[29] = 45'h0d547ee66faa;
    stim[30] = 45'h065498407348;
    stim[31] = 45'h0608e957a2b1;
    stim[32] = 45'h009cbcd37190;
    stim[33] = 45'h119b910b4fa2;
    stim[34] = 45'h0a90ba3dfde1;
    stim[35] = 45'h10133703af43;
    stim[36] = 45'h12078385b439;
    stim[37] = 45'h154b08a34c26;
    stim[38] = 45'h0faf6440eb82;
    stim[39] = 45'h17a40effe5dc;
    stim[40] = 45'h0a019bc0e92b;
    stim[41] = 45'h1c9bc72ddd9f;
    stim[42] = 45'h092f90facde7;
    stim[43] = 45'h07203a29a1a1;
    stim[44] = 45'h0408aec6ba5d;
    stim[45] = 45'h07a4b0fdc3b0;
    stim[46] = 45'h0b6d529ef733;
    stim[47] = 45'h0303d147bd58;
    stim[48] = 45'h1cc97242e15e;
    stim[49] = 45'h17b3b109344d;
    stim[50] = 45'h0f9a41b238c6;
    stim[51] = 45'h01f8a1f8e2a8;
    stim[52] = 45'h00b4d8aeaa07;
    stim[53] = 45'h058beba60bd6;
    stim[54] = 45'h1f3e69d6a68c;
    stim[55] = 45'h171b963ca463;
    stim[56] = 45'h00a2c6001d42;
    stim[57] = 45'h06a77a49875c;
    stim[58] = 45'h1db68bfdcd59;
    stim[59] = 45'h0495f195d788;
    stim[60] = 45'h098662aee5d2;
    stim[61] = 45'h1e0edaeab699;
    stim[62] = 45'h1f75fe39a857;
    stim[63] = 45'h10f4b8127c37;
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
      expv[0] = 45'hxxxxxxxxxxxx;
      expv[1] = 45'h1fb69f9ac62a;
      expv[2] = 45'h1736954d3a84;
      expv[3] = 45'h18367a518987;
      expv[4] = 45'h060c48f2d89d;
      expv[5] = 45'h05f96e699afe;
      expv[6] = 45'h176d63e47ccd;
      expv[7] = 45'h1039a5ff9ac3;
      expv[8] = 45'h11548f940169;
      expv[9] = 45'h0ca959c4997e;
      expv[10] = 45'h0d64ab59d940;
      expv[11] = 45'h06f50393dac6;
      expv[12] = 45'h1d2af712ba2f;
      expv[13] = 45'h0c9fea0bd1c4;
      expv[14] = 45'h079f107db43d;
      expv[15] = 45'h1ee952982a41;
      expv[16] = 45'h15dac3d03eea;
      expv[17] = 45'h1c45886316fc;
      expv[18] = 45'h1d617a5151c9;
      expv[19] = 45'h04cbfdde274a;
      expv[20] = 45'h0120828ae789;
      expv[21] = 45'h02a8db8f1308;
      expv[22] = 45'h01e7f6c90fcf;
      expv[23] = 45'h1eab57b6a8cb;
      expv[24] = 45'h03f286438e14;
      expv[25] = 45'h1f54e35cafc5;
      expv[26] = 45'h09afe68bef86;
      expv[27] = 45'h1017f33d8536;
      expv[28] = 45'h1bcc2e5a90a7;
      expv[29] = 45'h0519e214642f;
      expv[30] = 45'h0d547ee66faa;
      expv[31] = 45'h065498407348;
      expv[32] = 45'h0608e957a2b1;
      expv[33] = 45'h009cbcd37190;
      expv[34] = 45'h119b910b4fa2;
      expv[35] = 45'h0a90ba3dfde1;
      expv[36] = 45'h10133703af43;
      expv[37] = 45'h12078385b439;
      expv[38] = 45'h154b08a34c26;
      expv[39] = 45'h0faf6440eb82;
      expv[40] = 45'h17a40effe5dc;
      expv[41] = 45'h0a019bc0e92b;
      expv[42] = 45'h1c9bc72ddd9f;
      expv[43] = 45'h092f90facde7;
      expv[44] = 45'h07203a29a1a1;
      expv[45] = 45'h0408aec6ba5d;
      expv[46] = 45'h07a4b0fdc3b0;
      expv[47] = 45'h0b6d529ef733;
      expv[48] = 45'h0303d147bd58;
      expv[49] = 45'h1cc97242e15e;
      expv[50] = 45'h17b3b109344d;
      expv[51] = 45'h0f9a41b238c6;
      expv[52] = 45'h01f8a1f8e2a8;
      expv[53] = 45'h00b4d8aeaa07;
      expv[54] = 45'h058beba60bd6;
      expv[55] = 45'h1f3e69d6a68c;
      expv[56] = 45'h171b963ca463;
      expv[57] = 45'h00a2c6001d42;
      expv[58] = 45'h06a77a49875c;
      expv[59] = 45'h1db68bfdcd59;
      expv[60] = 45'h0495f195d788;
      expv[61] = 45'h098662aee5d2;
      expv[62] = 45'h1e0edaeab699;
      expv[63] = 45'h1f75fe39a857;
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
