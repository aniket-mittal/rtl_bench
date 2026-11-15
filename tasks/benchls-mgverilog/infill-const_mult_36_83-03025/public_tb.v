// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 20;
  localparam OW = 54;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_03025 dut (
    .i_data(in_vec[19:0]),
    .o_data_36(out_vec[53:27]),
    .o_data_83(out_vec[26:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 20'hc24e2;
    stim[1] = 20'h5de92;
    stim[2] = 20'h833f0;
    stim[3] = 20'h48fbe;
    stim[4] = 20'hd510a;
    stim[5] = 20'h7dc5e;
    stim[6] = 20'hdbf72;
    stim[7] = 20'hc985d;
    stim[8] = 20'haa9f8;
    stim[9] = 20'haee19;
    stim[10] = 20'h1acc1;
    stim[11] = 20'h13834;
    stim[12] = 20'h68b20;
    stim[13] = 20'h0fb5e;
    stim[14] = 20'h675bc;
    stim[15] = 20'he2943;
    stim[16] = 20'h6f449;
    stim[17] = 20'h1ee82;
    stim[18] = 20'h1a288;
    stim[19] = 20'he2593;
    stim[20] = 20'h8426b;
    stim[21] = 20'hf54d1;
    stim[22] = 20'ha99b9;
    stim[23] = 20'h84ea2;
    stim[24] = 20'h6fcdf;
    stim[25] = 20'h94c01;
    stim[26] = 20'h86c09;
    stim[27] = 20'h7eaa4;
    stim[28] = 20'h3fdb5;
    stim[29] = 20'h4b409;
    stim[30] = 20'he251a;
    stim[31] = 20'h49d35;
    stim[32] = 20'hc357e;
    stim[33] = 20'hc2be3;
    stim[34] = 20'h2fe2b;
    stim[35] = 20'h24020;
    stim[36] = 20'h6ac06;
    stim[37] = 20'h31bae;
    stim[38] = 20'h81aa5;
    stim[39] = 20'h54925;
    stim[40] = 20'hed856;
    stim[41] = 20'h6a255;
    stim[42] = 20'h584ad;
    stim[43] = 20'h07bb5;
    stim[44] = 20'h37789;
    stim[45] = 20'h64b2c;
    stim[46] = 20'h8c092;
    stim[47] = 20'h20e0f;
    stim[48] = 20'he62a2;
    stim[49] = 20'h808d3;
    stim[50] = 20'hc71a5;
    stim[51] = 20'ha0e9e;
    stim[52] = 20'h393d2;
    stim[53] = 20'h6a057;
    stim[54] = 20'h8e7a5;
    stim[55] = 20'hf26b1;
    stim[56] = 20'h0b8ce;
    stim[57] = 20'he6247;
    stim[58] = 20'h991d0;
    stim[59] = 20'ha86b2;
    stim[60] = 20'h60baf;
    stim[61] = 20'ha2100;
    stim[62] = 20'hf8ad5;
    stim[63] = 20'h1bf32;
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
      expv[0] = 54'h3ba97e46bff546;
      expv[1] = 54'h069a6441e72956;
      expv[2] = 54'h373a6e0578d6d0;
      expv[3] = 54'h0521b5c17a9a9a;
      expv[4] = 54'h3cfb2b4721463e;
      expv[5] = 54'h08d7e9c28c727a;
      expv[6] = 54'h3d7760474511f6;
      expv[7] = 54'h3c2b68a6e56627;
      expv[8] = 54'h39ff3706451b68;
      expv[9] = 54'h3a4bdc265b321b;
      expv[10] = 54'h01e259208b0293;
      expv[11] = 54'h015f3a806538dc;
      expv[12] = 54'h075c84021f1b60;
      expv[13] = 54'h011ac9c0517f7a;
      expv[14] = 54'h07447382182bf4;
      expv[15] = 54'h3dee6b676760b9;
      expv[16] = 54'h07d2d2224133ab;
      expv[17] = 54'h022c5240a05426;
      expv[18] = 54'h01d6d90087b218;
      expv[19] = 54'h3dea4567662ea9;
      expv[20] = 54'h374ab8657d88b1;
      expv[21] = 54'h3f3f6b27c87fc3;
      expv[22] = 54'h39ecf0263fd6fb;
      expv[23] = 54'h37587645817e86;
      expv[24] = 54'h07dc7ae243fc4d;
      expv[25] = 54'h38758125d3a453;
      expv[26] = 54'h37798a258b06eb;
      expv[27] = 54'h08e7f88291132c;
      expv[28] = 54'h047d6ba14b41af;
      expv[29] = 54'h054a8a21865eeb;
      expv[30] = 54'h3de9bd4766076e;
      expv[31] = 54'h0530dba17ef82f;
      expv[32] = 54'h3bbc2dc6c557da;
      expv[33] = 54'h3bb15f66c23a99;
      expv[34] = 54'h035df060f867f1;
      expv[35] = 54'h02882400baca60;
      expv[36] = 54'h078186c229c5f2;
      expv[37] = 54'h037f23c101f96a;
      expv[38] = 54'h371df9a570a37f;
      expv[39] = 54'h05f249a1b6b6ff;
      expv[40] = 54'h3eb360c7a023e2;
      expv[41] = 54'h07769fa226a18f;
      expv[42] = 54'h063542a1ca0417;
      expv[43] = 54'h008b2ba0281baf;
      expv[44] = 54'h03e67a211fc16b;
      expv[45] = 54'h071491820a5f44;
      expv[46] = 54'h37d8a445a66f56;
      expv[47] = 54'h024fd0e0aa8edd;
      expv[48] = 54'h3e2ef64779fa86;
      expv[49] = 54'h3709ed656adc69;
      expv[50] = 54'h3bffd9a6d8d87f;
      expv[51] = 54'h395071c612bd3a;
      expv[52] = 54'h04064c4128ed16;
      expv[53] = 54'h077461e225fc35;
      expv[54] = 54'h380499a5b31a7f;
      expv[55] = 54'h3f0b8727b98b63;
      expv[56] = 54'h00cfe7c03beaca;
      expv[57] = 54'h3e2e8fe779dd05;
      expv[58] = 54'h38c40a05ea4670;
      expv[59] = 54'h39d7884639abb6;
      expv[60] = 54'h06cd24e1f5c9bd;
      expv[61] = 54'h3965200618b300;
      expv[62] = 54'h3f7c2fa7da030f;
      expv[63] = 54'h01f7184090fd36;
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
