// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 66;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_083028 dut (
    .clk(clk),
    .reset(in_vec[65:65]),
    .Multu(in_vec[64:64]),
    .dataA(in_vec[63:32]),
    .dataB(in_vec[31:0]),
    .dataOut(out_vec[63:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 66'h20df11c12a9434fb5;
    stim[1] = 66'h2e8439b9756bc7474;
    stim[2] = 66'h0a39e8fa8f91ab911;
    stim[3] = 66'h38e7ae3d97ef85154;
    stim[4] = 66'h0cb95a0d3a09fe059;
    stim[5] = 66'h03a906adcfad2f0f8;
    stim[6] = 66'h09dd1c6c608240160;
    stim[7] = 66'h0434d82511a1e735e;
    stim[8] = 66'h06c32931a7cb3dde5;
    stim[9] = 66'h1a72a32c241237a6a;
    stim[10] = 66'h05ea100df21220ec2;
    stim[11] = 66'h0d1f19f66974124ad;
    stim[12] = 66'h15dfaa99ec123bf1a;
    stim[13] = 66'h1a029316e89eb930c;
    stim[14] = 66'h0754f46ea5f63d0c6;
    stim[15] = 66'h0a03b637b4b418e21;
    stim[16] = 66'h0aed9c6f1f05aee59;
    stim[17] = 66'h0497cedd690b33e73;
    stim[18] = 66'h03cf839b3b8044147;
    stim[19] = 66'h10efdb4728fa778d2;
    stim[20] = 66'h0398b942673841a13;
    stim[21] = 66'h0e88751631d19b994;
    stim[22] = 66'h1e2814a6be8bc2f0a;
    stim[23] = 66'h0a29e6591fde3baee;
    stim[24] = 66'h1023fb4e5fae2cf11;
    stim[25] = 66'h0c25fa628f073c12e;
    stim[26] = 66'h091eb29dcc172181f;
    stim[27] = 66'h0e52d760131809a40;
    stim[28] = 66'h0660ac60ad843393b;
    stim[29] = 66'h1e8d0a4a78ef9cdcb;
    stim[30] = 66'h026528a36cad5926a;
    stim[31] = 66'h028c6955a54698f6d;
    stim[32] = 66'h192b85e21eeca2184;
    stim[33] = 66'h1ef34bf0deca0be71;
    stim[34] = 66'h11d60317b4e368831;
    stim[35] = 66'h0dbcbff196145e9ba;
    stim[36] = 66'h0514ea7627be6c34a;
    stim[37] = 66'h08bfbaf16d75d36e0;
    stim[38] = 66'h1e75e113470376e74;
    stim[39] = 66'h14712037821339a5b;
    stim[40] = 66'h13cd9fd46abbe2df6;
    stim[41] = 66'h17b881949f3f26675;
    stim[42] = 66'h0bcc67371c6c907b0;
    stim[43] = 66'h19fd254ef75b0de8f;
    stim[44] = 66'h0724708ed630d9a1d;
    stim[45] = 66'h0c7d5cee1cc6dac9b;
    stim[46] = 66'h0b7639fb3402bd729;
    stim[47] = 66'h0eaf2b3435bb8d74d;
    stim[48] = 66'h1940e3a59a5181632;
    stim[49] = 66'h061ee03205e921984;
    stim[50] = 66'h07077c684382dcdf2;
    stim[51] = 66'h1266892955044b09b;
    stim[52] = 66'h159e6baec80c46004;
    stim[53] = 66'h007156bca17a3480b;
    stim[54] = 66'h18f27ba7759ebaf89;
    stim[55] = 66'h0651dc5e281766b54;
    stim[56] = 66'h0364feda5573c3f3b;
    stim[57] = 66'h0b2453321f0b427c6;
    stim[58] = 66'h08cd894d4beec396e;
    stim[59] = 66'h1678ca33dda0c6541;
    stim[60] = 66'h0ba581b7e85fad04a;
    stim[61] = 66'h095c735c4562795b8;
    stim[62] = 66'h185229f7c2bcdbfe0;
    stim[63] = 66'h07c599b116f130feb;
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
      expv[0] = 64'h0000000000000000;
      expv[1] = 64'h0000000000000000;
      expv[2] = 64'h0000000000000000;
      expv[3] = 64'h0000000000000000;
      expv[4] = 64'h0000000000000000;
      expv[5] = 64'h0000000000000000;
      expv[6] = 64'h0000000000000000;
      expv[7] = 64'h0000000000000000;
      expv[8] = 64'h0000000000000000;
      expv[9] = 64'h0000000000000000;
      expv[10] = 64'h0000000000000000;
      expv[11] = 64'h0000000000000000;
      expv[12] = 64'h0000000000000000;
      expv[13] = 64'h0000000000000000;
      expv[14] = 64'h0000000000000000;
      expv[15] = 64'h0000000000000000;
      expv[16] = 64'h0000000000000000;
      expv[17] = 64'h0000000000000000;
      expv[18] = 64'h0000000000000000;
      expv[19] = 64'h0000000000000000;
      expv[20] = 64'h0000000000000000;
      expv[21] = 64'h0000000000000000;
      expv[22] = 64'h0000000000000000;
      expv[23] = 64'h0000000000000000;
      expv[24] = 64'h0000000000000000;
      expv[25] = 64'h0000000000000000;
      expv[26] = 64'h0000000000000000;
      expv[27] = 64'h0000000000000000;
      expv[28] = 64'h0000000000000000;
      expv[29] = 64'h0000000000000000;
      expv[30] = 64'h0000000000000000;
      expv[31] = 64'h0000000000000000;
      expv[32] = 64'h0000000000000000;
      expv[33] = 64'h0000000000000000;
      expv[34] = 64'h0000000000000000;
      expv[35] = 64'h0000000000000000;
      expv[36] = 64'h0000000000000000;
      expv[37] = 64'h0000000000000000;
      expv[38] = 64'h0000000000000000;
      expv[39] = 64'h0000000000000000;
      expv[40] = 64'h0000000000000000;
      expv[41] = 64'h0000000000000000;
      expv[42] = 64'h0000000000000000;
      expv[43] = 64'h2a88e197862f7854;
      expv[44] = 64'h2a88e197862f7854;
      expv[45] = 64'h2a88e197862f7854;
      expv[46] = 64'h2a88e197862f7854;
      expv[47] = 64'h2a88e197862f7854;
      expv[48] = 64'h2a88e197862f7854;
      expv[49] = 64'h2a88e197862f7854;
      expv[50] = 64'h2a88e197862f7854;
      expv[51] = 64'h2a88e197862f7854;
      expv[52] = 64'h2a88e197862f7854;
      expv[53] = 64'h2a88e197862f7854;
      expv[54] = 64'h2a88e197862f7854;
      expv[55] = 64'h2a88e197862f7854;
      expv[56] = 64'h2a88e197862f7854;
      expv[57] = 64'h2a88e197862f7854;
      expv[58] = 64'h2a88e197862f7854;
      expv[59] = 64'h2a88e197862f7854;
      expv[60] = 64'h2a88e197862f7854;
      expv[61] = 64'h2a88e197862f7854;
      expv[62] = 64'h2a88e197862f7854;
      expv[63] = 64'h2a88e197862f7854;
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
