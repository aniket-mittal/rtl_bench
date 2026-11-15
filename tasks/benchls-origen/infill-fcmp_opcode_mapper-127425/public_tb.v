// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 69;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_127425 dut (
    .din0(in_vec[68:37]),
    .din1(in_vec[36:5]),
    .opcode(in_vec[4:0]),
    .dout(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 69'h10687d12e9071bac0d;
    stim[1] = 69'h02acdde2671a57c071;
    stim[2] = 69'h0e779d40377b089fea;
    stim[3] = 69'h1b7d9b2808ba596f1f;
    stim[4] = 69'h009431b5e04576f6cf;
    stim[5] = 69'h112457aa87e5010050;
    stim[6] = 69'h163e096b3acf698154;
    stim[7] = 69'h0c4b21783663b47da3;
    stim[8] = 69'h05f3eadb6dfe05956f;
    stim[9] = 69'h0724e8b9994552130d;
    stim[10] = 69'h1875e98bf8be3c8983;
    stim[11] = 69'h18f284d398995c8d62;
    stim[12] = 69'h0796995d4333298380;
    stim[13] = 69'h153f3b0827b50c4564;
    stim[14] = 69'h0315047bdb1a7893d0;
    stim[15] = 69'h033bfa980634102568;
    stim[16] = 69'h00271cf01187b62aed;
    stim[17] = 69'h06e4c2b984eb8374c4;
    stim[18] = 69'h13083cf8446a639d5e;
    stim[19] = 69'h0552c99b18bc8fde04;
    stim[20] = 69'h0374bbcb08cea22dae;
    stim[21] = 69'h0df0228fe771d2d9e4;
    stim[22] = 69'h1441c431be45199df3;
    stim[23] = 69'h174ad46feb7c69898b;
    stim[24] = 69'h1b69b1290676ef5ea6;
    stim[25] = 69'h06b4c0e68b4826dd2d;
    stim[26] = 69'h1da0670ac12af1cb1e;
    stim[27] = 69'h1f2c08d7f32d9bb762;
    stim[28] = 69'h1a72ac6fb230593719;
    stim[29] = 69'h04f57e23658d24766f;
    stim[30] = 69'h1a17df7c41f650a3bc;
    stim[31] = 69'h17cb1d67a630efd442;
    stim[32] = 69'h07e2f0ccce5f9860df;
    stim[33] = 69'h13ed4721cb99bc1f77;
    stim[34] = 69'h1673cfef86949e6e73;
    stim[35] = 69'h0f7eb56dde0bf9c359;
    stim[36] = 69'h0b5da2ddbddb9f9d0c;
    stim[37] = 69'h0ab345717b7150968f;
    stim[38] = 69'h15468d640b3fcb1013;
    stim[39] = 69'h0bfcbd4c0b74e7264a;
    stim[40] = 69'h0cc07c670bf9ecf36a;
    stim[41] = 69'h10e14b6260bf38806d;
    stim[42] = 69'h040f0b36d5251192a2;
    stim[43] = 69'h11ada282655060c550;
    stim[44] = 69'h060221c174315d5b22;
    stim[45] = 69'h1091bac7548db3761f;
    stim[46] = 69'h0701e6503080c5696c;
    stim[47] = 69'h0b413cefeab437b858;
    stim[48] = 69'h0ee86ffe63f023cba1;
    stim[49] = 69'h0eec9febd183378ceb;
    stim[50] = 69'h1aaea6d5eb9b80fdfc;
    stim[51] = 69'h1679454615b558bde1;
    stim[52] = 69'h1026bedcbd8b1c5851;
    stim[53] = 69'h02c5ad19d10c6f6b03;
    stim[54] = 69'h12670c8d11386c0ab6;
    stim[55] = 69'h196f9282bd517dec21;
    stim[56] = 69'h14169ab38ee4163779;
    stim[57] = 69'h0b88e7e8b3bbcce7b7;
    stim[58] = 69'h00c41c766bd16791fb;
    stim[59] = 69'h1c0e41f36917043242;
    stim[60] = 69'h0f2a8519a540db70b5;
    stim[61] = 69'h1c7d07d8eac924992a;
    stim[62] = 69'h0eaf1c9b13a8c6c51b;
    stim[63] = 69'h0991e2522fbe33395a;
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
      expv[0] = 1'h0;
      expv[1] = 1'h0;
      expv[2] = 1'h0;
      expv[3] = 1'h0;
      expv[4] = 1'h0;
      expv[5] = 1'h0;
      expv[6] = 1'h0;
      expv[7] = 1'h0;
      expv[8] = 1'h0;
      expv[9] = 1'h0;
      expv[10] = 1'h0;
      expv[11] = 1'h0;
      expv[12] = 1'h0;
      expv[13] = 1'h0;
      expv[14] = 1'h0;
      expv[15] = 1'h0;
      expv[16] = 1'h0;
      expv[17] = 1'h0;
      expv[18] = 1'h0;
      expv[19] = 1'h0;
      expv[20] = 1'h0;
      expv[21] = 1'h0;
      expv[22] = 1'h0;
      expv[23] = 1'h0;
      expv[24] = 1'h0;
      expv[25] = 1'h0;
      expv[26] = 1'h0;
      expv[27] = 1'h0;
      expv[28] = 1'h0;
      expv[29] = 1'h0;
      expv[30] = 1'h0;
      expv[31] = 1'h0;
      expv[32] = 1'h0;
      expv[33] = 1'h0;
      expv[34] = 1'h0;
      expv[35] = 1'h0;
      expv[36] = 1'h0;
      expv[37] = 1'h0;
      expv[38] = 1'h0;
      expv[39] = 1'h0;
      expv[40] = 1'h0;
      expv[41] = 1'h0;
      expv[42] = 1'h0;
      expv[43] = 1'h0;
      expv[44] = 1'h0;
      expv[45] = 1'h0;
      expv[46] = 1'h0;
      expv[47] = 1'h0;
      expv[48] = 1'h0;
      expv[49] = 1'h0;
      expv[50] = 1'h0;
      expv[51] = 1'h0;
      expv[52] = 1'h0;
      expv[53] = 1'h0;
      expv[54] = 1'h0;
      expv[55] = 1'h0;
      expv[56] = 1'h0;
      expv[57] = 1'h0;
      expv[58] = 1'h0;
      expv[59] = 1'h0;
      expv[60] = 1'h0;
      expv[61] = 1'h0;
      expv[62] = 1'h0;
      expv[63] = 1'h0;
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
