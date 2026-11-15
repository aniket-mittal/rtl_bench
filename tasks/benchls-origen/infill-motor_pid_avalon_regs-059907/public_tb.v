// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 60;
  localparam OW = 97;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_059907 dut (
    .clock_clk(clk),
    .reset_reset(in_vec[59:59]),
    .avs_s0_address(in_vec[58:51]),
    .avs_s0_read(in_vec[50:50]),
    .avs_s0_write(in_vec[49:49]),
    .avs_s0_writedata(in_vec[48:17]),
    .PWM(in_vec[16:1]),
    .DIR(in_vec[0:0]),
    .avs_s0_readdata(out_vec[96:65]),
    .avs_s0_waitrequest(out_vec[64:64]),
    .RPM(out_vec[63:48]),
    .KP(out_vec[47:32]),
    .KI(out_vec[31:16]),
    .KD(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 60'hc516ddb858cbb33;
    stim[1] = 60'h91c5619087c79fb;
    stim[2] = 60'h6134cda59c4f8c2;
    stim[3] = 60'h0e96462b009edf0;
    stim[4] = 60'h4c2314357876afd;
    stim[5] = 60'h3c925d4f8219053;
    stim[6] = 60'h5b715cc25e99f4f;
    stim[7] = 60'h41364447bd1891b;
    stim[8] = 60'h62bee3e172dad08;
    stim[9] = 60'h248593cb8b2faeb;
    stim[10] = 60'h087d11b61770450;
    stim[11] = 60'h1543510274a8c02;
    stim[12] = 60'h69b7cf19374d04f;
    stim[13] = 60'h701c7d5f733ef6c;
    stim[14] = 60'h568b8d6765abc95;
    stim[15] = 60'h6ece213b2ab7dbe;
    stim[16] = 60'h945c25539abb163;
    stim[17] = 60'h2923aab0027d086;
    stim[18] = 60'h712dac34a5ef56b;
    stim[19] = 60'h276d9ab63ae8b40;
    stim[20] = 60'h3c27ea1726d8c26;
    stim[21] = 60'h32222b5d67c4a94;
    stim[22] = 60'h717bd38078953e0;
    stim[23] = 60'h0a98fed6d89fd61;
    stim[24] = 60'h777bb7b2dc8ba0a;
    stim[25] = 60'h40142c6559d794a;
    stim[26] = 60'h6f8fad071aac80e;
    stim[27] = 60'h146cef2b610a444;
    stim[28] = 60'h27a8144e4f21df3;
    stim[29] = 60'h6153e5b68845bbd;
    stim[30] = 60'h31ae8d13c6e0676;
    stim[31] = 60'h79af74ce5673c64;
    stim[32] = 60'h691e1e402388bb2;
    stim[33] = 60'h105a11fbc977d7e;
    stim[34] = 60'h44429ec2519f906;
    stim[35] = 60'h5637afcab707e7e;
    stim[36] = 60'h6104a57ef4b0a01;
    stim[37] = 60'h3fd893c61925b27;
    stim[38] = 60'h15280f97a8a5cc6;
    stim[39] = 60'hecd9d367c3158d5;
    stim[40] = 60'h4e960d57b159203;
    stim[41] = 60'h5f7f1ef71615178;
    stim[42] = 60'h7cd333170f0ff75;
    stim[43] = 60'h11b9dfd299f7ed2;
    stim[44] = 60'h782a2304df6b33f;
    stim[45] = 60'h6bdd03ab7c1dc8d;
    stim[46] = 60'h70b159f97565ad7;
    stim[47] = 60'h5a9709c3bfdc6d9;
    stim[48] = 60'h5bfa7ccc8abe885;
    stim[49] = 60'h082242b611600db;
    stim[50] = 60'h7707421b26dfd06;
    stim[51] = 60'h0b6b3f27c68e13f;
    stim[52] = 60'h36a2b15bb25954b;
    stim[53] = 60'h0f41235d57ee9a0;
    stim[54] = 60'h5ff9ffc1e622911;
    stim[55] = 60'h172cd09ac4c3dae;
    stim[56] = 60'h6c88fa473170ffb;
    stim[57] = 60'h74344958784f87d;
    stim[58] = 60'h2798da97cef9bc7;
    stim[59] = 60'h251e24e7504164c;
    stim[60] = 60'h5532f3651767976;
    stim[61] = 60'h447afd332c89c76;
    stim[62] = 60'h6f74d58fdad7848;
    stim[63] = 60'h39959fbda6f3e1d;
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
      expv[0] = 97'h0000000000000000000000000;
      expv[1] = 97'h0000000000000000000000000;
      expv[2] = 97'h0000000000000000000000000;
      expv[3] = 97'h0000000000000000000000000;
      expv[4] = 97'h0000000000000000000000000;
      expv[5] = 97'h0000000000000000000000000;
      expv[6] = 97'h0000000000000000000000000;
      expv[7] = 97'h0000000000000000000000000;
      expv[8] = 97'h0000000000000000000000000;
      expv[9] = 97'h0000000000000000000000000;
      expv[10] = 97'h0000000000000000000000000;
      expv[11] = 97'h0000000000000000000000000;
      expv[12] = 97'h0000000000000000000000000;
      expv[13] = 97'h0000000000000000000000000;
      expv[14] = 97'h0000000000000000000000000;
      expv[15] = 97'h0000000000000000000000000;
      expv[16] = 97'h0000000000000000000000000;
      expv[17] = 97'h0000000000000000000000000;
      expv[18] = 97'h0000000000000000000000000;
      expv[19] = 97'h0000000000000000000000000;
      expv[20] = 97'h0000000000000000000000000;
      expv[21] = 97'h0000000000000000000000000;
      expv[22] = 97'h0000000000000000000000000;
      expv[23] = 97'h0000000000000000000000000;
      expv[24] = 97'h0000000000000000000000000;
      expv[25] = 97'h0000000000000000000000000;
      expv[26] = 97'h0000000000000000000000000;
      expv[27] = 97'h0000000000000000000000000;
      expv[28] = 97'h0000000000000000000000000;
      expv[29] = 97'h0000000000000000000000000;
      expv[30] = 97'h0000000000000000000000000;
      expv[31] = 97'h0000000000000000000000000;
      expv[32] = 97'h0000000000000000000000000;
      expv[33] = 97'h0000000000000000000000000;
      expv[34] = 97'h0000000000000000000000000;
      expv[35] = 97'h0000000000000000000000000;
      expv[36] = 97'h0000000000000000000000000;
      expv[37] = 97'h0000000000000000000000000;
      expv[38] = 97'h0000000000000000000000000;
      expv[39] = 97'h0000000000000000000000000;
      expv[40] = 97'h0000000000000000000000000;
      expv[41] = 97'h0000000000000000000000000;
      expv[42] = 97'h0000000000000000000000000;
      expv[43] = 97'h0000000000000000000000000;
      expv[44] = 97'h0000000000000000000000000;
      expv[45] = 97'h0000000000000000000000000;
      expv[46] = 97'h0000000000000000000000000;
      expv[47] = 97'h0000000000000000000000000;
      expv[48] = 97'h0000000000000000000000000;
      expv[49] = 97'h0000000000000000000000000;
      expv[50] = 97'h0000000000000000000000000;
      expv[51] = 97'h0000000000000000000000000;
      expv[52] = 97'h0000000000000000000000000;
      expv[53] = 97'h0000000000000000000000000;
      expv[54] = 97'h0000000000000000000000000;
      expv[55] = 97'h0000000000000000000000000;
      expv[56] = 97'h0000000000000000000000000;
      expv[57] = 97'h0000000000000000000000000;
      expv[58] = 97'h0000000000000000000000000;
      expv[59] = 97'h0000000000000000000000000;
      expv[60] = 97'h0000000000000000000000000;
      expv[61] = 97'h0000000000000000000000000;
      expv[62] = 97'h0000000000000000000000000;
      expv[63] = 97'h0000000000000000000000000;
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
