// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 65;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_117095 dut (
    .A_0(in_vec[64:33]),
    .B_1(in_vec[32:1]),
    .Select(in_vec[0:0]),
    .Out(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 65'h066bca9d7c208d3e5;
    stim[1] = 65'h18b246e45e83b2e32;
    stim[2] = 65'h1f4405f32fa43baf2;
    stim[3] = 65'h0faa66fc3fd67e123;
    stim[4] = 65'h083d8f2194d8f9edf;
    stim[5] = 65'h18761c52c8fd14994;
    stim[6] = 65'h098a75581bc1d9f5e;
    stim[7] = 65'h01cfc99e56066397a;
    stim[8] = 65'h09c02b984e3cb2e15;
    stim[9] = 65'h0c182f40b523a0943;
    stim[10] = 65'h0b1701d2755cf6865;
    stim[11] = 65'h01d3a72461af8835f;
    stim[12] = 65'h1edd8f2b21f65e501;
    stim[13] = 65'h168e19224f09ad31d;
    stim[14] = 65'h0ca99798054fff8db;
    stim[15] = 65'h05e10c11b97d43282;
    stim[16] = 65'h06e2d09c15da28afd;
    stim[17] = 65'h010130db92219b519;
    stim[18] = 65'h02d23f63a9026867f;
    stim[19] = 65'h0d0184638402746ec;
    stim[20] = 65'h1110dc207bc6daaf5;
    stim[21] = 65'h0f5d8a926751a775e;
    stim[22] = 65'h139dd632e1cb25428;
    stim[23] = 65'h107e41775a2ab1938;
    stim[24] = 65'h133779e48e1fd3113;
    stim[25] = 65'h04c468f7692023161;
    stim[26] = 65'h132f4cb1d2fcd7494;
    stim[27] = 65'h18d5bc24b2e2e29b6;
    stim[28] = 65'h043a8f8f2985922db;
    stim[29] = 65'h1fb58d6926478e534;
    stim[30] = 65'h115bf4d25aa0e7196;
    stim[31] = 65'h0d90ad0ba822f52e3;
    stim[32] = 65'h153ac48891a5d4f60;
    stim[33] = 65'h0c35b17b062bcf0e4;
    stim[34] = 65'h010b771608cc95a92;
    stim[35] = 65'h175a2dae85b12b51b;
    stim[36] = 65'h18ac4e70542113b1b;
    stim[37] = 65'h003f200ae9c0e584e;
    stim[38] = 65'h055d8408d836c510b;
    stim[39] = 65'h0b0b640c80d3f9efc;
    stim[40] = 65'h10fdadece6e2b9115;
    stim[41] = 65'h13c688d75457a63d4;
    stim[42] = 65'h0d33169785b5c3a9a;
    stim[43] = 65'h0c4386605a933c43e;
    stim[44] = 65'h003f7f6f854d2fd02;
    stim[45] = 65'h1510f08c2f8c7c97a;
    stim[46] = 65'h1c9add11d698d523e;
    stim[47] = 65'h114319fad0aecb65e;
    stim[48] = 65'h11fc1b1f50d26be56;
    stim[49] = 65'h11d0e19ba20640255;
    stim[50] = 65'h036b350c6d88a9a08;
    stim[51] = 65'h01386c7ed946038c0;
    stim[52] = 65'h0784a8fcb6711b36b;
    stim[53] = 65'h1fd540d67a1761492;
    stim[54] = 65'h0c85c3418ebcfcb5a;
    stim[55] = 65'h0188e874ab05881c4;
    stim[56] = 65'h169ced59f6c604048;
    stim[57] = 65'h1a2f12b351de629d8;
    stim[58] = 65'h0b503ea0f54dec171;
    stim[59] = 65'h1606e6d4d8f3c71a6;
    stim[60] = 65'h0d393d8532b8bf627;
    stim[61] = 65'h1c5f5a66abd1381b2;
    stim[62] = 65'h1f5e5454f7bee6cef;
    stim[63] = 65'h198fb4f58d48e9bce;
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
      expv[0] = 16'h69f2;
      expv[1] = 16'h3722;
      expv[2] = 16'h2f99;
      expv[3] = 16'hf091;
      expv[4] = 16'hcf6f;
      expv[5] = 16'he296;
      expv[6] = 16'haac0;
      expv[7] = 16'h4cf2;
      expv[8] = 16'h970a;
      expv[9] = 16'h04a1;
      expv[10] = 16'hb432;
      expv[11] = 16'h41af;
      expv[12] = 16'hf280;
      expv[13] = 16'h698e;
      expv[14] = 16'hfc6d;
      expv[15] = 16'h608d;
      expv[16] = 16'h457e;
      expv[17] = 16'hda8c;
      expv[18] = 16'h433f;
      expv[19] = 16'h231c;
      expv[20] = 16'hd57a;
      expv[21] = 16'h5493;
      expv[22] = 16'hb197;
      expv[23] = 16'h0bba;
      expv[24] = 16'h9889;
      expv[25] = 16'h18b0;
      expv[26] = 16'h658e;
      expv[27] = 16'he125;
      expv[28] = 16'h916d;
      expv[29] = 16'h6b49;
      expv[30] = 16'ha692;
      expv[31] = 16'ha971;
      expv[32] = 16'h2444;
      expv[33] = 16'h8bd8;
      expv[34] = 16'hb8b0;
      expv[35] = 16'h5a8d;
      expv[36] = 16'h9d8d;
      expv[37] = 16'h0057;
      expv[38] = 16'h2885;
      expv[39] = 16'h2064;
      expv[40] = 16'hc88a;
      expv[41] = 16'h46ba;
      expv[42] = 16'hb4bc;
      expv[43] = 16'h3302;
      expv[44] = 16'hfb7c;
      expv[45] = 16'h8461;
      expv[46] = 16'he88e;
      expv[47] = 16'hcfd6;
      expv[48] = 16'hd8fa;
      expv[49] = 16'h012a;
      expv[50] = 16'ha863;
      expv[51] = 16'h63f6;
      expv[52] = 16'hd9b5;
      expv[53] = 16'h06b3;
      expv[54] = 16'h1a0c;
      expv[55] = 16'h43a5;
      expv[56] = 16'h6acf;
      expv[57] = 16'h959a;
      expv[58] = 16'h60b8;
      expv[59] = 16'h36a6;
      expv[60] = 16'hfb13;
      expv[61] = 16'hd335;
      expv[62] = 16'h3677;
      expv[63] = 16'ha7ac;
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
