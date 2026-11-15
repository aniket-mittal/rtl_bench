// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 71;
  localparam OW = 21;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_005877 dut (
    .i_enable_mask(in_vec[70:70]),
    .i_timer_done(in_vec[69:69]),
    .i_am_value(in_vec[68:21]),
    .i_match_mask(in_vec[20:1]),
    .i_sh_valid(in_vec[0:0]),
    .o_am_match(out_vec[20:20]),
    .o_match_vector(out_vec[19:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 71'h6d9b3d0ffe08e5c166;
    stim[1] = 71'h789ec1388ec03dc007;
    stim[2] = 71'h5acd0e986fc4a3d775;
    stim[3] = 71'h5ce3b0c2059087eecd;
    stim[4] = 71'h3a587b3eced42c2233;
    stim[5] = 71'h011f5cbd10b1840ad0;
    stim[6] = 71'h75143a4984ad877212;
    stim[7] = 71'h468de8a22bc4472649;
    stim[8] = 71'h3e123d92b51ca9c285;
    stim[9] = 71'h602b42331049c474d5;
    stim[10] = 71'h375afac4e63ae1e4b5;
    stim[11] = 71'h08364b9527e7948835;
    stim[12] = 71'h0c5cd75a9f3f3fca23;
    stim[13] = 71'h593456b020b3430235;
    stim[14] = 71'h6e0fce83333fe18aee;
    stim[15] = 71'h6557d0e18c862539a5;
    stim[16] = 71'h45e463b7f1efd08b19;
    stim[17] = 71'h3cf6623bddddcab7e5;
    stim[18] = 71'h52f888545eb6019bbb;
    stim[19] = 71'h3ffb4c33f7fd7bb965;
    stim[20] = 71'h07368317d2e882bbb9;
    stim[21] = 71'h7742ea950168c1c26b;
    stim[22] = 71'h2bbd8965552dddffcc;
    stim[23] = 71'h20d90ae84eeeac01e5;
    stim[24] = 71'h3386170585ea52b0af;
    stim[25] = 71'h78d2de35eb68a0c1ef;
    stim[26] = 71'h705136e80206d9628a;
    stim[27] = 71'h6ad99f094ad6e25283;
    stim[28] = 71'h3ac0d4fa0b41e43017;
    stim[29] = 71'h312cd6ab52ca5d325f;
    stim[30] = 71'h51d4d4c1e53079e894;
    stim[31] = 71'h0f8b5aac59cff9a9db;
    stim[32] = 71'h39722d1a171616d475;
    stim[33] = 71'h2a15495ff0f868deb2;
    stim[34] = 71'h6a08a21c4089bc3d2f;
    stim[35] = 71'h477873370b72abc7d8;
    stim[36] = 71'h4e1798e248d535869e;
    stim[37] = 71'h068f72cb51f2a694ac;
    stim[38] = 71'h6e4a54e28f496c037b;
    stim[39] = 71'h134a8045a4cb4ae65c;
    stim[40] = 71'h3c552c6e0453ec28fe;
    stim[41] = 71'h6e525f5cbbd7ae7545;
    stim[42] = 71'h7bd14590cea64478fd;
    stim[43] = 71'h35fc7896e236022eed;
    stim[44] = 71'h3882b907dee1e74340;
    stim[45] = 71'h1e8ab22dda65e02fc6;
    stim[46] = 71'h3bee6bd50e1ea48ebb;
    stim[47] = 71'h73dbd25552c59566b7;
    stim[48] = 71'h5c3cb686c46b284ef7;
    stim[49] = 71'h549cff0fc3eaca04f5;
    stim[50] = 71'h51c0708c4a88c55426;
    stim[51] = 71'h74250e1c97aac9e1f5;
    stim[52] = 71'h0dc8ec7d452008e729;
    stim[53] = 71'h414608e77699732008;
    stim[54] = 71'h15f16f8686188744cd;
    stim[55] = 71'h578e7cdd56198c2777;
    stim[56] = 71'h66fc75c8a4bc732619;
    stim[57] = 71'h268492c4c719fcff4a;
    stim[58] = 71'h169d0984225930c774;
    stim[59] = 71'h0ca7f354bb835a5b86;
    stim[60] = 71'h76678647f84d626d12;
    stim[61] = 71'h750f1e8f10ca8989a2;
    stim[62] = 71'h6ddad6472ace5ef959;
    stim[63] = 71'h5b4b8485b00fd925d2;
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
      expv[0] = 21'h000000;
      expv[1] = 21'h000000;
      expv[2] = 21'h000000;
      expv[3] = 21'h000000;
      expv[4] = 21'h000000;
      expv[5] = 21'h000000;
      expv[6] = 21'h000000;
      expv[7] = 21'h000000;
      expv[8] = 21'h000000;
      expv[9] = 21'h000000;
      expv[10] = 21'h000000;
      expv[11] = 21'h000000;
      expv[12] = 21'h000000;
      expv[13] = 21'h000000;
      expv[14] = 21'h000000;
      expv[15] = 21'h000000;
      expv[16] = 21'h000000;
      expv[17] = 21'h000000;
      expv[18] = 21'h000000;
      expv[19] = 21'h000000;
      expv[20] = 21'h000000;
      expv[21] = 21'h000000;
      expv[22] = 21'h000000;
      expv[23] = 21'h000000;
      expv[24] = 21'h000000;
      expv[25] = 21'h000000;
      expv[26] = 21'h000000;
      expv[27] = 21'h000000;
      expv[28] = 21'h000000;
      expv[29] = 21'h000000;
      expv[30] = 21'h000000;
      expv[31] = 21'h000000;
      expv[32] = 21'h000000;
      expv[33] = 21'h000000;
      expv[34] = 21'h000000;
      expv[35] = 21'h000000;
      expv[36] = 21'h000000;
      expv[37] = 21'h000000;
      expv[38] = 21'h000000;
      expv[39] = 21'h000000;
      expv[40] = 21'h000000;
      expv[41] = 21'h000000;
      expv[42] = 21'h000000;
      expv[43] = 21'h000000;
      expv[44] = 21'h000000;
      expv[45] = 21'h000000;
      expv[46] = 21'h000000;
      expv[47] = 21'h000000;
      expv[48] = 21'h000000;
      expv[49] = 21'h000000;
      expv[50] = 21'h000000;
      expv[51] = 21'h000000;
      expv[52] = 21'h000000;
      expv[53] = 21'h000000;
      expv[54] = 21'h000000;
      expv[55] = 21'h000000;
      expv[56] = 21'h000000;
      expv[57] = 21'h000000;
      expv[58] = 21'h000000;
      expv[59] = 21'h000000;
      expv[60] = 21'h000000;
      expv[61] = 21'h000000;
      expv[62] = 21'h000000;
      expv[63] = 21'h000000;
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
