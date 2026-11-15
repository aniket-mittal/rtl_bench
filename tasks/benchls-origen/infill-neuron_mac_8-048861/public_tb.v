// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 88;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_048861 dut (
    .clk(clk),
    .A1(in_vec[87:79]),
    .A2(in_vec[78:70]),
    .A3(in_vec[69:61]),
    .A4(in_vec[60:52]),
    .A5(in_vec[51:43]),
    .A6(in_vec[42:34]),
    .A7(in_vec[33:25]),
    .A8(in_vec[24:16]),
    .W1(in_vec[15:14]),
    .W2(in_vec[13:12]),
    .W3(in_vec[11:10]),
    .W4(in_vec[9:8]),
    .W5(in_vec[7:6]),
    .W6(in_vec[5:4]),
    .W7(in_vec[3:2]),
    .W8(in_vec[1:0]),
    .out_neuron(out_vec[11:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 88'hec89c95cb45a1ad88a0218;
    stim[1] = 88'hb6f903b9bda85e83e9389f;
    stim[2] = 88'h9a824bc6408eef97b2ff58;
    stim[3] = 88'hadb6151a756fab783668a0;
    stim[4] = 88'h3fc7288ab260916b22da8c;
    stim[5] = 88'heaf0bf90371de751c85c35;
    stim[6] = 88'he754c2d2b34cc299b7aa84;
    stim[7] = 88'h356ecdab65d0915507eb4c;
    stim[8] = 88'h557c584b48348b93d5e07b;
    stim[9] = 88'hf0f6a31926f25bc765cacd;
    stim[10] = 88'h7ba4408209744803496d35;
    stim[11] = 88'hcd4562cb9569a6f4f4ca2d;
    stim[12] = 88'h7fd21b28c9006d1a27ed2b;
    stim[13] = 88'hd6c877b62119e5dec1cbe4;
    stim[14] = 88'hbf9ae7cfa1d5d078ae5514;
    stim[15] = 88'h1c41150bcea0a3ecdd82c5;
    stim[16] = 88'hf2022e4958b17f5e0ecaf8;
    stim[17] = 88'hd746af6c504d037e3dbc2a;
    stim[18] = 88'hc8b44ead7d5ec0fcddfeec;
    stim[19] = 88'hddb1f77cd49b3674edc473;
    stim[20] = 88'h77b363019708c34e5366e1;
    stim[21] = 88'h924b1d1c6a13de85073f7e;
    stim[22] = 88'h1c406a3e9144d9ea2f4a59;
    stim[23] = 88'h1f82a59d85feabe2d480f8;
    stim[24] = 88'he1dac5c15a56794fd5b724;
    stim[25] = 88'h4110f0caf0fc66b67875a8;
    stim[26] = 88'h24de2a961b75c2756b0f72;
    stim[27] = 88'h1bd47279c3fd33eff8569f;
    stim[28] = 88'h02576d516a4f708409d6d8;
    stim[29] = 88'h19e9264007d839777d15cb;
    stim[30] = 88'hbf50c8e501eee4d771df5e;
    stim[31] = 88'he41434affff36b26a291b6;
    stim[32] = 88'hb8a490f3b884037a048976;
    stim[33] = 88'h2f943e9f67961f30635da1;
    stim[34] = 88'h45b278ee77a2f9164104e1;
    stim[35] = 88'hdc84c6050589c008fda339;
    stim[36] = 88'hb1baf0be7befd8928faa21;
    stim[37] = 88'ha5249394a0a6281641cf3a;
    stim[38] = 88'hcdbd244eb40eed830d5a24;
    stim[39] = 88'hd1235855385993fb88cf84;
    stim[40] = 88'h0f5f562190068454305bb5;
    stim[41] = 88'hd14c4ed9109cc45b995a07;
    stim[42] = 88'h46786caa897b246962991f;
    stim[43] = 88'h7726c39a4e7147626d4c00;
    stim[44] = 88'h0d5c18e735b7c62f1bb65c;
    stim[45] = 88'h9298080ea575b9c9d32891;
    stim[46] = 88'hd5113be8cef87cc6f16ebc;
    stim[47] = 88'h2c7ae16c13da1fd6d6bd8b;
    stim[48] = 88'h4875360e556b206c6b8a12;
    stim[49] = 88'hc1130c8bb06019b816bfba;
    stim[50] = 88'he8190fe1a2a250d9f38c6c;
    stim[51] = 88'h607023f237c0554b7b522c;
    stim[52] = 88'hbad5ac95fa71992c91912a;
    stim[53] = 88'h6063f6fd1e3e1d55bd7f43;
    stim[54] = 88'hfd7c51c49fceb5cb587b9d;
    stim[55] = 88'h88103ee02b1ec2fd6ce910;
    stim[56] = 88'hd0e3ce602ab04296b046b3;
    stim[57] = 88'h5287595c3746b594f973a8;
    stim[58] = 88'h32e38d1c428aa9ba9f25b4;
    stim[59] = 88'h2b0de0b85be222faff29b7;
    stim[60] = 88'h23c08a45ca8bbd18ad0b87;
    stim[61] = 88'h8f20a93df086959695ec84;
    stim[62] = 88'h0f79acb127c54153ac651c;
    stim[63] = 88'h1a58337de518f59756ea37;
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
      expv[0] = 12'hxxx;
      expv[1] = 12'hxxx;
      expv[2] = 12'hxxx;
      expv[3] = 12'hxxx;
      expv[4] = 12'h165;
      expv[5] = 12'h165;
      expv[6] = 12'h165;
      expv[7] = 12'h165;
      expv[8] = 12'hf92;
      expv[9] = 12'hf92;
      expv[10] = 12'hf92;
      expv[11] = 12'hf92;
      expv[12] = 12'h16f;
      expv[13] = 12'h16f;
      expv[14] = 12'h16f;
      expv[15] = 12'h16f;
      expv[16] = 12'h151;
      expv[17] = 12'h151;
      expv[18] = 12'h151;
      expv[19] = 12'h151;
      expv[20] = 12'h397;
      expv[21] = 12'h397;
      expv[22] = 12'h397;
      expv[23] = 12'h397;
      expv[24] = 12'h121;
      expv[25] = 12'h121;
      expv[26] = 12'h121;
      expv[27] = 12'h121;
      expv[28] = 12'h34e;
      expv[29] = 12'h34e;
      expv[30] = 12'h34e;
      expv[31] = 12'h34e;
      expv[32] = 12'hce8;
      expv[33] = 12'hce8;
      expv[34] = 12'hce8;
      expv[35] = 12'hce8;
      expv[36] = 12'h022;
      expv[37] = 12'h022;
      expv[38] = 12'h022;
      expv[39] = 12'h022;
      expv[40] = 12'h0ae;
      expv[41] = 12'h0ae;
      expv[42] = 12'h0ae;
      expv[43] = 12'h0ae;
      expv[44] = 12'hf59;
      expv[45] = 12'hf59;
      expv[46] = 12'hf59;
      expv[47] = 12'hf59;
      expv[48] = 12'hca5;
      expv[49] = 12'hca5;
      expv[50] = 12'hca5;
      expv[51] = 12'hca5;
      expv[52] = 12'hd8f;
      expv[53] = 12'hd8f;
      expv[54] = 12'hd8f;
      expv[55] = 12'hd8f;
      expv[56] = 12'h1b3;
      expv[57] = 12'h1b3;
      expv[58] = 12'h1b3;
      expv[59] = 12'h1b3;
      expv[60] = 12'he07;
      expv[61] = 12'he07;
      expv[62] = 12'he07;
      expv[63] = 12'he07;
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
