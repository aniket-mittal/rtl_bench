// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 33;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_09582 dut (
    .clk(clk),
    .enable(in_vec[32:32]),
    .din(in_vec[31:0]),
    .dout(out_vec[32:1]),
    .valid(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 33'h0e0b314d2;
    stim[1] = 33'h1e9ab6d61;
    stim[2] = 33'h1c6e4ba9d;
    stim[3] = 33'h075a53d37;
    stim[4] = 33'h0aa119e54;
    stim[5] = 33'h0dc1b22cc;
    stim[6] = 33'h03d2e482f;
    stim[7] = 33'h0407b69fb;
    stim[8] = 33'h0a78a6c79;
    stim[9] = 33'h05d669f37;
    stim[10] = 33'h1c8d7f629;
    stim[11] = 33'h028b1e1af;
    stim[12] = 33'h0f8148587;
    stim[13] = 33'h0cc3537d5;
    stim[14] = 33'h108f4b432;
    stim[15] = 33'h02ccea21a;
    stim[16] = 33'h1bf6bc490;
    stim[17] = 33'h0cd9dfc73;
    stim[18] = 33'h115ff3bb9;
    stim[19] = 33'h17793620a;
    stim[20] = 33'h056adf52b;
    stim[21] = 33'h0b428be4a;
    stim[22] = 33'h107780262;
    stim[23] = 33'h1e45a4f8a;
    stim[24] = 33'h07c1aa58d;
    stim[25] = 33'h1487af2b5;
    stim[26] = 33'h19cd8c9c2;
    stim[27] = 33'h13f9e43c0;
    stim[28] = 33'h0cb1ed482;
    stim[29] = 33'h02bf2c9d6;
    stim[30] = 33'h07cca9e67;
    stim[31] = 33'h04a97dc3b;
    stim[32] = 33'h047750e4b;
    stim[33] = 33'h0dad03235;
    stim[34] = 33'h06046d899;
    stim[35] = 33'h1c1acece8;
    stim[36] = 33'h1d3f6fa47;
    stim[37] = 33'h0b8093f31;
    stim[38] = 33'h11285d6f6;
    stim[39] = 33'h12dd897f6;
    stim[40] = 33'h05a35e652;
    stim[41] = 33'h053c13684;
    stim[42] = 33'h023a60cbf;
    stim[43] = 33'h0c5de8a8b;
    stim[44] = 33'h17de8184a;
    stim[45] = 33'h0a0ca1ac2;
    stim[46] = 33'h0782606ef;
    stim[47] = 33'h118564e76;
    stim[48] = 33'h02bec25c5;
    stim[49] = 33'h108a6321b;
    stim[50] = 33'h0975b35a2;
    stim[51] = 33'h19cfc46fc;
    stim[52] = 33'h1f9a84518;
    stim[53] = 33'h08d275bb9;
    stim[54] = 33'h0c6e7e760;
    stim[55] = 33'h06f92c4e3;
    stim[56] = 33'h03945e8d0;
    stim[57] = 33'h17a27d0ed;
    stim[58] = 33'h1052ad6c3;
    stim[59] = 33'h12620f992;
    stim[60] = 33'h0a5512535;
    stim[61] = 33'h0e6545a8a;
    stim[62] = 33'h1bc3b0e21;
    stim[63] = 33'h029d90c49;
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
      expv[0] = 33'hxxxxxxxxx;
      expv[1] = 33'h1c16629a6;
      expv[2] = 33'h1d356dac5;
      expv[3] = 33'h18dc9753d;
      expv[4] = 33'h0eb4a7a70;
      expv[5] = 33'h154233caa;
      expv[6] = 33'h1b836459a;
      expv[7] = 33'h07a5c9060;
      expv[8] = 33'h080f6d3f8;
      expv[9] = 33'h14f14d8f4;
      expv[10] = 33'h0bacd3e70;
      expv[11] = 33'h191afec55;
      expv[12] = 33'h05163c360;
      expv[13] = 33'h1f0290b10;
      expv[14] = 33'h1986a6fac;
      expv[15] = 33'h011e96867;
      expv[16] = 33'h0599d4436;
      expv[17] = 33'h17ed78923;
      expv[18] = 33'h19b3bf8e8;
      expv[19] = 33'h02bfe7775;
      expv[20] = 33'h0ef26c417;
      expv[21] = 33'h0ad5bea58;
      expv[22] = 33'h168517c96;
      expv[23] = 33'h00ef004c7;
      expv[24] = 33'h1c8b49f17;
      expv[25] = 33'h0f8354b1c;
      expv[26] = 33'h090f5e56d;
      expv[27] = 33'h139b19387;
      expv[28] = 33'h07f3c8783;
      expv[29] = 33'h1963da906;
      expv[30] = 33'h057e593ae;
      expv[31] = 33'h0f9953cd0;
      expv[32] = 33'h0952fb878;
      expv[33] = 33'h08eea1c98;
      expv[34] = 33'h1b5a0646c;
      expv[35] = 33'h0c08db134;
      expv[36] = 33'h18359d9d3;
      expv[37] = 33'h1a7edf491;
      expv[38] = 33'h170127e64;
      expv[39] = 33'h0250badef;
      expv[40] = 33'h05bb12fef;
      expv[41] = 33'h0b46bcca6;
      expv[42] = 33'h0a7826d0a;
      expv[43] = 33'h0474c1980;
      expv[44] = 33'h18bbd1518;
      expv[45] = 33'h0fbd03097;
      expv[46] = 33'h141943586;
      expv[47] = 33'h0f04c0de0;
      expv[48] = 33'h030ac9cef;
      expv[49] = 33'h057d84b8c;
      expv[50] = 33'h0114c6439;
      expv[51] = 33'h12eb66b46;
      expv[52] = 33'h139f88dfb;
      expv[53] = 33'h1f3508a33;
      expv[54] = 33'h11a4eb774;
      expv[55] = 33'h18dcfcec2;
      expv[56] = 33'h0df2589c8;
      expv[57] = 33'h0728bd1a2;
      expv[58] = 33'h0f44fa1dd;
      expv[59] = 33'h00a55ad89;
      expv[60] = 33'h04c41f327;
      expv[61] = 33'h14aa24a6c;
      expv[62] = 33'h1cca8b516;
      expv[63] = 33'h178761c45;
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
