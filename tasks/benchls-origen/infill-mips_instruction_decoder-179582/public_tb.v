// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 32;
  localparam OW = 40;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_179582 dut (
    .instruction(in_vec[31:0]),
    .addrInfo(out_vec[39:14]),
    .ALUop(out_vec[13:11]),
    .writeReg(out_vec[10:6]),
    .wbEnable(out_vec[5:5]),
    .memRead(out_vec[4:4]),
    .memWrite(out_vec[3:3]),
    .iType(out_vec[2:2]),
    .isBranch(out_vec[1:1]),
    .isJump(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'headb4090;
    stim[1] = 32'h3e3e2bc3;
    stim[2] = 32'h40be594d;
    stim[3] = 32'hf05e34f3;
    stim[4] = 32'h335591d3;
    stim[5] = 32'hbd63aa72;
    stim[6] = 32'h92fa9de5;
    stim[7] = 32'h11966327;
    stim[8] = 32'hb8e2f2b1;
    stim[9] = 32'h7697d4ce;
    stim[10] = 32'h1978aa8a;
    stim[11] = 32'h55226ee3;
    stim[12] = 32'h525625ec;
    stim[13] = 32'hcf261643;
    stim[14] = 32'ha9adecf5;
    stim[15] = 32'haa10c064;
    stim[16] = 32'hb5b4ab37;
    stim[17] = 32'h71a5149c;
    stim[18] = 32'hed464a32;
    stim[19] = 32'hfcd87050;
    stim[20] = 32'h80aedffc;
    stim[21] = 32'h64b42899;
    stim[22] = 32'h7bfa07d5;
    stim[23] = 32'h5be922b4;
    stim[24] = 32'h9cc36c9a;
    stim[25] = 32'he2cf1a98;
    stim[26] = 32'h7dc35ad8;
    stim[27] = 32'hec080b7c;
    stim[28] = 32'ha53f6797;
    stim[29] = 32'h1a9ed9da;
    stim[30] = 32'h7a8b59c4;
    stim[31] = 32'h619eeece;
    stim[32] = 32'h1b33325d;
    stim[33] = 32'h4a4bc787;
    stim[34] = 32'h3102511d;
    stim[35] = 32'hb51a709e;
    stim[36] = 32'h5be35189;
    stim[37] = 32'h965d7378;
    stim[38] = 32'hdaa2c40f;
    stim[39] = 32'h47ed9005;
    stim[40] = 32'h2a44d060;
    stim[41] = 32'h54275551;
    stim[42] = 32'h75ab5901;
    stim[43] = 32'hd4fab889;
    stim[44] = 32'h28d5dcbe;
    stim[45] = 32'h13bf26d6;
    stim[46] = 32'h4dc3e696;
    stim[47] = 32'hd659c54b;
    stim[48] = 32'h06770095;
    stim[49] = 32'hcf1a6ad8;
    stim[50] = 32'h58954cf0;
    stim[51] = 32'hd15fb5d2;
    stim[52] = 32'h987946a5;
    stim[53] = 32'ha8a1fbda;
    stim[54] = 32'hbaa8ba19;
    stim[55] = 32'h02810aad;
    stim[56] = 32'hb052b303;
    stim[57] = 32'h7caf3898;
    stim[58] = 32'h3e2ae23e;
    stim[59] = 32'hed54fe40;
    stim[60] = 32'he31df8d3;
    stim[61] = 32'h5e6733c6;
    stim[62] = 32'h790d10ee;
    stim[63] = 32'hb834917a;
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
      expv[0] = 40'hb6d02416c4;
      expv[1] = 40'h8f8af0d784;
      expv[2] = 40'h2f96535784;
      expv[3] = 40'h178d3cd784;
      expv[4] = 40'hd56474d544;
      expv[5] = 40'h58ea9c90c4;
      expv[6] = 40'hbea7795684;
      expv[7] = 40'h6598c9d586;
      expv[8] = 40'h38bcac5084;
      expv[9] = 40'ha5f53395c4;
      expv[10] = 40'h5e2aa29604;
      expv[11] = 40'h489bb8d084;
      expv[12] = 40'h95897b1584;
      expv[13] = 40'hc98590d184;
      expv[14] = 40'h6b7b3d5344;
      expv[15] = 40'h8430191404;
      expv[16] = 40'h6d2acdd504;
      expv[17] = 40'h6945271144;
      expv[18] = 40'h51928c9184;
      expv[19] = 40'h361c141604;
      expv[20] = 40'h2bb7ff1384;
      expv[21] = 40'h2d0a265504;
      expv[22] = 40'hfe81f55684;
      expv[23] = 40'hfa48ad1244;
      expv[24] = 40'h30db2690c4;
      expv[25] = 40'hb3c6a613c4;
      expv[26] = 40'h70d6b610c4;
      expv[27] = 40'h0202df1204;
      expv[28] = 40'h4fd9e5d7c4;
      expv[29] = 40'ha7b6769784;
      expv[30] = 40'ha2d67112c4;
      expv[31] = 40'h67bbb39784;
      expv[32] = 40'hcccc9754c4;
      expv[33] = 40'h92f1e1d2c4;
      expv[34] = 40'h4094475084;
      expv[35] = 40'h469c279684;
      expv[36] = 40'hf8d46250c4;
      expv[37] = 40'h975cde1744;
      expv[38] = 40'ha8b103d084;
      expv[39] = 40'hfb64015344;
      expv[40] = 40'h9134181104;
      expv[41] = 40'h09d55451c4;
      expv[42] = 40'h6ad64052c4;
      expv[43] = 40'h3eae225684;
      expv[44] = 40'h35772f9544;
      expv[45] = 40'hefc9b597c6;
      expv[46] = 40'h70f9a590c4;
      expv[47] = 40'h967152d644;
      expv[48] = 40'h9dc02555c4;
      expv[49] = 40'hc69ab61684;
      expv[50] = 40'h25533c1544;
      expv[51] = 40'h57ed7497c4;
      expv[52] = 40'h1e51a95644;
      expv[53] = 40'h287ef69044;
      expv[54] = 40'haa2e865204;
      expv[55] = 40'ha042ab4060;
      expv[56] = 40'h14acc0d484;
      expv[57] = 40'h2bce2613c4;
      expv[58] = 40'h8ab88f9284;
      expv[59] = 40'h553f901504;
      expv[60] = 40'hc77e34d744;
      expv[61] = 40'h99ccf191c4;
      expv[62] = 40'h43443b9344;
      expv[63] = 40'h0d245e9504;
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
