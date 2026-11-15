// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 137;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_203438 dut (
    .rst(in_vec[136:136]),
    .pcM(in_vec[135:104]),
    .exceptioncollectM(in_vec[103:96]),
    .cp0_status(in_vec[95:64]),
    .cp0_cause(in_vec[63:32]),
    .aluoutM(in_vec[31:0]),
    .excepttype_i(out_vec[63:32]),
    .bad_addr(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 137'h166572a61623b04c4cf926e092e7fc39609;
    stim[1] = 137'h12501070a23564a804e37a4758f6cf6639d;
    stim[2] = 137'h0e272a3feaa02b2921f80911f379060d28e;
    stim[3] = 137'h0e8fa0d9ef8758bb7e7af24493d8fbece89;
    stim[4] = 137'h05b7b0217cb45c3290439f67a2fc78cb5be;
    stim[5] = 137'h01c4909a9de8e8fdc560f3a0a45ba320428;
    stim[6] = 137'h055d68d25dd3b797e2bff9562d349c18533;
    stim[7] = 137'h017e0710fb74abeecee664ac53e49c26bf2;
    stim[8] = 137'h1b2f501361c456633abc2169b5193bab83c;
    stim[9] = 137'h0de18cf36e71b8c7c9ca9b63e0cb0ec9c71;
    stim[10] = 137'h001498546d378d249a87cb25a2a53741fc5;
    stim[11] = 137'h01f641a455264d20c66e83c36c108ce6dd5;
    stim[12] = 137'h0c1cc3316481d69e4ccade9cc38308e6b5c;
    stim[13] = 137'h0befbb6ad752d53b3072f8720455c17aa97;
    stim[14] = 137'h06f3e9cbabb4938b51ae7c46a3d0d685a17;
    stim[15] = 137'h0a71227116e8611fcf20b1da3963d300423;
    stim[16] = 137'h0168af47615d67dfacabeba10ac9b83ceb7;
    stim[17] = 137'h0043ecb28f215d3b22664033e5ffa984926;
    stim[18] = 137'h0cbb4b981e03fc9caf10207251d7b8fa184;
    stim[19] = 137'h0f1d9a5f4f9317bcf29781b413eab30d7f3;
    stim[20] = 137'h0437ab11dda8cc282431cf5c73b2fb06f65;
    stim[21] = 137'h081f45028c898e8ecc38c83acc67b890fab;
    stim[22] = 137'h05d6c6738fea49c1df49ed4f5f6c906ba9a;
    stim[23] = 137'h0e1ad1c90d1b8ebbb56a543c631d561fae7;
    stim[24] = 137'h02d0b6faf5202d850980fe36623ec9273d8;
    stim[25] = 137'h0fcc8e55536fe1abed0ccfe158621fc8f88;
    stim[26] = 137'h08cade369972046cc64503c537436b1c8cb;
    stim[27] = 137'h017c959a3a727b7d3b60b4561aeabe44755;
    stim[28] = 137'h06f30142936819396c9fe9fcca8eb83a58e;
    stim[29] = 137'h089528c5eec8f901b638c3b0cd1ad8bae3f;
    stim[30] = 137'h0e9d2cfd3066697e873b47231c2892ba7ed;
    stim[31] = 137'h062e8b9baedcee5d36d59fef5587b3f5d1f;
    stim[32] = 137'h0dc3eb6c8668b5cd56d8baa64874dada5f1;
    stim[33] = 137'h07618925dc390fc8ba29a8be24b189793fe;
    stim[34] = 137'h0684302f3b57bb3b10037472111c531238c;
    stim[35] = 137'h0814dfc8f2411e25a5b47899273f5db225e;
    stim[36] = 137'h0f73928950e3a615ad60ac42b1b92852941;
    stim[37] = 137'h0bc5022ace5a38e2528c8a5aa212fef5ca7;
    stim[38] = 137'h0d32f3a49892a76ce3467d2a1e188ead346;
    stim[39] = 137'h063abbe8aecb99564faa31e1ee92d25dba6;
    stim[40] = 137'h0a301e7fc6296d809371aedaa21aeb1dd1a;
    stim[41] = 137'h04dc5768ba78d1515aeb79f8cc62b660560;
    stim[42] = 137'h014560d832a43e6a83c14d08805e8845b05;
    stim[43] = 137'h02cedf1af92e55d5a2678b0864b501cf207;
    stim[44] = 137'h06ffa12d3acc6c57453ae250006293ad4b4;
    stim[45] = 137'h09a2a675defefadba5bbd05737cd387cf31;
    stim[46] = 137'h0b44990fbfd1bb5ed4616c0bd935226df61;
    stim[47] = 137'h0b0ed6c3871db17eaed0092fb69ae02bdd9;
    stim[48] = 137'h04da42b6188b54c2604cf98ec4d143084c5;
    stim[49] = 137'h0365a33f519f8693c5d7074506228ef4241;
    stim[50] = 137'h0f560d68da30fc56a7fee160145c14205c0;
    stim[51] = 137'h0564eedb2c176ce11448d9197fc3be75127;
    stim[52] = 137'h046a6f6ef0a728c2999ea5c659ffe70a3a8;
    stim[53] = 137'h0518402b02ea6cd798695c00d9d86be6555;
    stim[54] = 137'h01a2698bd91959c5485a4e29bcd3319c1fa;
    stim[55] = 137'h021ac5be17e761a0dfb3f087cea9b913721;
    stim[56] = 137'h0f18b93026523c9b3fa84b43e0e093bf5bd;
    stim[57] = 137'h09a5901774f5b640cc3099950c844a4c022;
    stim[58] = 137'h02c72217b0bda3ed38df29cc2e01de89398;
    stim[59] = 137'h08b51068fec6ee71555fd17a06e50b22a80;
    stim[60] = 137'h04dca73fe623439118fde54d8577c20871b;
    stim[61] = 137'h0878078a69179645fc1a6164a89ab6dc0c2;
    stim[62] = 137'h0f4fa54ba3bcba0a997cfe03458aa289ee3;
    stim[63] = 137'h0418adb19098a6aafdd2c34e2ce53fc8270;
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
      expv[0] = 64'h00000000xxxxxxxx;
      expv[1] = 64'h00000000xxxxxxxx;
      expv[2] = 64'h00000004e272a3fe;
      expv[3] = 64'h00000004e8fa0d9e;
      expv[4] = 64'h000000045b7b0217;
      expv[5] = 64'h000000041c4909a9;
      expv[6] = 64'h0000000455d68d25;
      expv[7] = 64'h0000000417e0710f;
      expv[8] = 64'h0000000017e0710f;
      expv[9] = 64'h00000004de18cf36;
      expv[10] = 64'h0000000401498546;
      expv[11] = 64'h000000041f641a45;
      expv[12] = 64'h00000004c1cc3316;
      expv[13] = 64'h00000004befbb6ad;
      expv[14] = 64'h000000046f3e9cba;
      expv[15] = 64'h00000004a7122711;
      expv[16] = 64'h00000004168af476;
      expv[17] = 64'h00000004fa984926;
      expv[18] = 64'h00000001fa984926;
      expv[19] = 64'h00000001fa984926;
      expv[20] = 64'h00000004437ab11d;
      expv[21] = 64'h0000000a437ab11d;
      expv[22] = 64'h00000004c906ba9a;
      expv[23] = 64'h0000000ec906ba9a;
      expv[24] = 64'h000000042d0b6faf;
      expv[25] = 64'h00000004fcc8e555;
      expv[26] = 64'h000000048cade369;
      expv[27] = 64'h0000000417c959a3;
      expv[28] = 64'h000000046f301429;
      expv[29] = 64'h0000000489528c5e;
      expv[30] = 64'h00000004e9d2cfd3;
      expv[31] = 64'h00000001e9d2cfd3;
      expv[32] = 64'h000000044dada5f1;
      expv[33] = 64'h000000047618925d;
      expv[34] = 64'h00000004684302f3;
      expv[35] = 64'h00000004814dfc8f;
      expv[36] = 64'h00000004f7392895;
      expv[37] = 64'h000000042fef5ca7;
      expv[38] = 64'h00000004d32f3a49;
      expv[39] = 64'h0000000463abbe8a;
      expv[40] = 64'h00000004aeb1dd1a;
      expv[41] = 64'h000000044dc5768b;
      expv[42] = 64'h0000000414560d83;
      expv[43] = 64'h000000042cedf1af;
      expv[44] = 64'h000000046ffa12d3;
      expv[45] = 64'h000000049a2a675d;
      expv[46] = 64'h00000004b44990fb;
      expv[47] = 64'h00000001b44990fb;
      expv[48] = 64'h000000044da42b61;
      expv[49] = 64'h00000004365a33f5;
      expv[50] = 64'h00000004f560d68d;
      expv[51] = 64'h00000004564eedb2;
      expv[52] = 64'h00000001564eedb2;
      expv[53] = 64'h0000000486be6555;
      expv[54] = 64'h0000000186be6555;
      expv[55] = 64'h0000000421ac5be1;
      expv[56] = 64'h00000004f18b9302;
      expv[57] = 64'h000000049a590177;
      expv[58] = 64'h000000042c72217b;
      expv[59] = 64'h000000048b51068f;
      expv[60] = 64'h000000044dca73fe;
      expv[61] = 64'h00000004878078a6;
      expv[62] = 64'h00000004f4fa54ba;
      expv[63] = 64'h00000004418adb19;
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
