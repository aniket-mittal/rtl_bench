// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 99;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_00844 dut (
    .clk(clk),
    .reset_n(in_vec[98:98]),
    .init(in_vec[97:97]),
    .update(in_vec[96:96]),
    .opa(in_vec[95:32]),
    .opb(in_vec[31:0]),
    .res(out_vec[63:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 99'h059fbf49793ba790c4e8dcb42;
    stim[1] = 99'h3101d56b949aa9eba0d65dc18;
    stim[2] = 99'h64e9e48a08835e2a8ebbc2f05;
    stim[3] = 99'h7053d031045091613fa1ae939;
    stim[4] = 99'h6c84dd84015334b4a0154d7ee;
    stim[5] = 99'h6f021a9806fc4a8e127b1b373;
    stim[6] = 99'h4e18c0239e524a9959be9322c;
    stim[7] = 99'h59bc3b0274e323ac67f1352ee;
    stim[8] = 99'h66df36f865b5587839085b0cf;
    stim[9] = 99'h71a9b93ebdc4e8fce7a962d11;
    stim[10] = 99'h613a9a8aba8a1c46a693b46ed;
    stim[11] = 99'h4a6081a49b20bcb6f72939255;
    stim[12] = 99'h693e525b52f80dea14e3e5820;
    stim[13] = 99'h6c1be3a108cb25d746a57e8c5;
    stim[14] = 99'h5424a0ebb7c064f784fe814cc;
    stim[15] = 99'h5e0992ed5e5211bbb18983297;
    stim[16] = 99'h5adcd128646ec47f939156529;
    stim[17] = 99'h5b393963fc736d0dd6373bcba;
    stim[18] = 99'h451ca69beccd87223b48691e6;
    stim[19] = 99'h45ea9689553ce669987414c44;
    stim[20] = 99'h62e433b7e5093b426300c6a62;
    stim[21] = 99'h5c9f5a3f2cb410b48cae41fa3;
    stim[22] = 99'h54c84642ca2a453636600d1f1;
    stim[23] = 99'h4b8d73c8f6270182fb4edf696;
    stim[24] = 99'h6a71977efe7ea4bbae732246e;
    stim[25] = 99'h6b42dd18cd1bfb1f105eec328;
    stim[26] = 99'h738d4cdf36ee1d11e98aaa030;
    stim[27] = 99'h59c555e1f7ff345f463b310a6;
    stim[28] = 99'h47af2678ff636612c00c1feaf;
    stim[29] = 99'h4ad6739a31c26d9c04dab6f0e;
    stim[30] = 99'h6a119c34a0ad7e1a4b405e725;
    stim[31] = 99'h7a9e02cce5ac39b74bbb47c05;
    stim[32] = 99'h66c96b32db4b652df78958b08;
    stim[33] = 99'h4572fb417b290846159445d24;
    stim[34] = 99'h7c2ad399e2405169e24ffdb53;
    stim[35] = 99'h6fd4f3f37203416d84693fb77;
    stim[36] = 99'h59f5e6e17864ed9f2c44b3bed;
    stim[37] = 99'h44955b5e3df4dff4664d4673e;
    stim[38] = 99'h5e3ff0af443ee31d88911c67a;
    stim[39] = 99'h7c5d54f5e4f9f4023da0d56c5;
    stim[40] = 99'h661fe0d9cd24520bc1611b057;
    stim[41] = 99'h4fcfff14064e4186379ebd88d;
    stim[42] = 99'h6674b6d144e1217c63cb166af;
    stim[43] = 99'h4cd8b23597d9377a709ba3dea;
    stim[44] = 99'h482714a22843aacad77480081;
    stim[45] = 99'h7659320546c968298c8f982dd;
    stim[46] = 99'h5da320d9c937e1fdd05f570d7;
    stim[47] = 99'h51788136a11d7376d2d194348;
    stim[48] = 99'h4fc5bf265b201b915b507730a;
    stim[49] = 99'h4326ecc3abef8b721e42a1237;
    stim[50] = 99'h5c4934814716a98433f2988e7;
    stim[51] = 99'h736318723296747d93343b636;
    stim[52] = 99'h4ce023de998af8363f93f307e;
    stim[53] = 99'h6fec277951147920196851568;
    stim[54] = 99'h592f73dff5330989548ed5f70;
    stim[55] = 99'h451b794adec2836d16e532139;
    stim[56] = 99'h7a4eae7af59ccf914a928dafd;
    stim[57] = 99'h5b3e329b2f51cc399b0c13a20;
    stim[58] = 99'h5a07746e25891843442169fd0;
    stim[59] = 99'h506f55553d28cf70b5aa98563;
    stim[60] = 99'h409a4799edcc133be84028c65;
    stim[61] = 99'h6e56b38199bb35bc0e9323d06;
    stim[62] = 99'h6b124ce6897bc9551aae50a34;
    stim[63] = 99'h77a1118e26654d9a742d57066;
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
      expv[0] = 64'hxxxxxxxxxxxxxxxx;
      expv[1] = 64'h0000000000000000;
      expv[2] = 64'h0000000000000000;
      expv[3] = 64'h0000000000000000;
      expv[4] = 64'he5715fef700b353b;
      expv[5] = 64'he5715fef700b353b;
      expv[6] = 64'he5715fef700b353b;
      expv[7] = 64'he5715fef700b353b;
      expv[8] = 64'hf6817468d043454f;
      expv[9] = 64'hf6817468d043454f;
      expv[10] = 64'h3085cef3df32c2ae;
      expv[11] = 64'h3085cef3df32c2ae;
      expv[12] = 64'h3085cef3df32c2ae;
      expv[13] = 64'h3085cef3df32c2ae;
      expv[14] = 64'h3085cef3df32c2ae;
      expv[15] = 64'h01de8a493f2f764e;
      expv[16] = 64'h43da1775dc29579b;
      expv[17] = 64'h6ccf765ac8d31b7c;
      expv[18] = 64'h711227631250280e;
      expv[19] = 64'h711227631250280e;
      expv[20] = 64'h711227631250280e;
      expv[21] = 64'h711227631250280e;
      expv[22] = 64'h5ff24a6c39380ee6;
      expv[23] = 64'h472a8272effe6219;
      expv[24] = 64'h472a8272effe6219;
      expv[25] = 64'h472a8272effe6219;
      expv[26] = 64'h472a8272effe6219;
      expv[27] = 64'hf61c79109af5f5a0;
      expv[28] = 64'ha9db04a40cb091d8;
      expv[29] = 64'ha9db04a40cb091d8;
      expv[30] = 64'ha9db04a40cb091d8;
      expv[31] = 64'ha9db04a40cb091d8;
      expv[32] = 64'h247988158eae3944;
      expv[33] = 64'h247988158eae3944;
      expv[34] = 64'h247988158eae3944;
      expv[35] = 64'hf00a8f55c7617f3a;
      expv[36] = 64'hf00a8f55c7617f3a;
      expv[37] = 64'h818e9f086c820a44;
      expv[38] = 64'h818e9f086c820a44;
      expv[39] = 64'hde25bf78edeadb34;
      expv[40] = 64'h3d676a06d4df1cef;
      expv[41] = 64'h3d676a06d4df1cef;
      expv[42] = 64'h3d676a06d4df1cef;
      expv[43] = 64'h3d676a06d4df1cef;
      expv[44] = 64'h3d676a06d4df1cef;
      expv[45] = 64'h3d676a06d4df1cef;
      expv[46] = 64'hcd60fc71f217ed38;
      expv[47] = 64'h091989ccce765fd3;
      expv[48] = 64'hcef2550fb9247d7b;
      expv[49] = 64'hcef2550fb9247d7b;
      expv[50] = 64'hcef2550fb9247d7b;
      expv[51] = 64'h0152a14d90f279f0;
      expv[52] = 64'h03f8ea3231a86dc6;
      expv[53] = 64'h03f8ea3231a86dc6;
      expv[54] = 64'h03f8ea3231a86dc6;
      expv[55] = 64'h44eb78acc97b79f6;
      expv[56] = 64'h44eb78acc97b79f6;
      expv[57] = 64'hfb20a3396acd30c4;
      expv[58] = 64'h6766f649390f4de4;
      expv[59] = 64'h4fa043ca54df0424;
      expv[60] = 64'h42305d80f1fe4465;
      expv[61] = 64'h42305d80f1fe4465;
      expv[62] = 64'h42305d80f1fe4465;
      expv[63] = 64'h42305d80f1fe4465;
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
