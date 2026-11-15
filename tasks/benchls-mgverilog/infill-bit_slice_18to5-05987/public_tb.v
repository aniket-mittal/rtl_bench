// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 18;
  localparam OW = 5;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_05987 dut (
    .Din(in_vec[17:0]),
    .Dout(out_vec[4:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 18'h37c3c;
    stim[1] = 18'h0683b;
    stim[2] = 18'h1fbe9;
    stim[3] = 18'h2386f;
    stim[4] = 18'h030e7;
    stim[5] = 18'h3b4ab;
    stim[6] = 18'h291a9;
    stim[7] = 18'h35780;
    stim[8] = 18'h31bfd;
    stim[9] = 18'h205fe;
    stim[10] = 18'h1e6c4;
    stim[11] = 18'h16994;
    stim[12] = 18'h011fe;
    stim[13] = 18'h24727;
    stim[14] = 18'h30b65;
    stim[15] = 18'h009cb;
    stim[16] = 18'h28c77;
    stim[17] = 18'h15fea;
    stim[18] = 18'h1696a;
    stim[19] = 18'h15c22;
    stim[20] = 18'h0c05f;
    stim[21] = 18'h2e008;
    stim[22] = 18'h31731;
    stim[23] = 18'h2f32f;
    stim[24] = 18'h036ac;
    stim[25] = 18'h34b57;
    stim[26] = 18'h3e491;
    stim[27] = 18'h318b9;
    stim[28] = 18'h396c4;
    stim[29] = 18'h22f56;
    stim[30] = 18'h29549;
    stim[31] = 18'h33999;
    stim[32] = 18'h052b3;
    stim[33] = 18'h02574;
    stim[34] = 18'h05f37;
    stim[35] = 18'h338a8;
    stim[36] = 18'h32835;
    stim[37] = 18'h228fc;
    stim[38] = 18'h36d7a;
    stim[39] = 18'h230c0;
    stim[40] = 18'h20cef;
    stim[41] = 18'h2ecd4;
    stim[42] = 18'h1879f;
    stim[43] = 18'h391f7;
    stim[44] = 18'h0affe;
    stim[45] = 18'h3d1de;
    stim[46] = 18'h07d29;
    stim[47] = 18'h1431e;
    stim[48] = 18'h1ce05;
    stim[49] = 18'h201b3;
    stim[50] = 18'h1eb48;
    stim[51] = 18'h132a1;
    stim[52] = 18'h01e10;
    stim[53] = 18'h3b7c2;
    stim[54] = 18'h254af;
    stim[55] = 18'h0b412;
    stim[56] = 18'h1b060;
    stim[57] = 18'h06284;
    stim[58] = 18'h14235;
    stim[59] = 18'h2a2f2;
    stim[60] = 18'h22f0b;
    stim[61] = 18'h1474f;
    stim[62] = 18'h1eafd;
    stim[63] = 18'h0ebeb;
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
      expv[0] = 5'h1c;
      expv[1] = 5'h08;
      expv[2] = 5'h1b;
      expv[3] = 5'h18;
      expv[4] = 5'h10;
      expv[5] = 5'h14;
      expv[6] = 5'h11;
      expv[7] = 5'h17;
      expv[8] = 5'h1b;
      expv[9] = 5'h05;
      expv[10] = 5'h06;
      expv[11] = 5'h09;
      expv[12] = 5'h11;
      expv[13] = 5'h07;
      expv[14] = 5'h0b;
      expv[15] = 5'h09;
      expv[16] = 5'h0c;
      expv[17] = 5'h1f;
      expv[18] = 5'h09;
      expv[19] = 5'h1c;
      expv[20] = 5'h00;
      expv[21] = 5'h00;
      expv[22] = 5'h17;
      expv[23] = 5'h13;
      expv[24] = 5'h16;
      expv[25] = 5'h0b;
      expv[26] = 5'h04;
      expv[27] = 5'h18;
      expv[28] = 5'h16;
      expv[29] = 5'h0f;
      expv[30] = 5'h15;
      expv[31] = 5'h19;
      expv[32] = 5'h12;
      expv[33] = 5'h05;
      expv[34] = 5'h1f;
      expv[35] = 5'h18;
      expv[36] = 5'h08;
      expv[37] = 5'h08;
      expv[38] = 5'h0d;
      expv[39] = 5'h10;
      expv[40] = 5'h0c;
      expv[41] = 5'h0c;
      expv[42] = 5'h07;
      expv[43] = 5'h11;
      expv[44] = 5'h0f;
      expv[45] = 5'h11;
      expv[46] = 5'h1d;
      expv[47] = 5'h03;
      expv[48] = 5'h0e;
      expv[49] = 5'h01;
      expv[50] = 5'h0b;
      expv[51] = 5'h12;
      expv[52] = 5'h1e;
      expv[53] = 5'h17;
      expv[54] = 5'h14;
      expv[55] = 5'h14;
      expv[56] = 5'h10;
      expv[57] = 5'h02;
      expv[58] = 5'h02;
      expv[59] = 5'h02;
      expv[60] = 5'h0f;
      expv[61] = 5'h07;
      expv[62] = 5'h0a;
      expv[63] = 5'h0b;
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
