// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 35;
  localparam OW = 4;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_214113 dut (
    .IFIDrs(in_vec[34:30]),
    .IFIDrt(in_vec[29:25]),
    .IDEXrt(in_vec[24:20]),
    .IDEXrd(in_vec[19:15]),
    .EXMemRead(in_vec[14:14]),
    .EXRegWrite(in_vec[13:13]),
    .MEMRegWrite(in_vec[12:12]),
    .WBRegWrite(in_vec[11:11]),
    .EXMemWrite(in_vec[10:10]),
    .MEMMemWrite(in_vec[9:9]),
    .opcode(in_vec[8:3]),
    .Jump(in_vec[2:1]),
    .PCsrc(in_vec[0:0]),
    .PCWrite(out_vec[3:3]),
    .IFIDWrite(out_vec[2:2]),
    .ControlWrite(out_vec[1:1]),
    .FlushSignal(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 35'h1d5441f79;
    stim[1] = 35'h35158fcc8;
    stim[2] = 35'h0a01d235a;
    stim[3] = 35'h3283d7233;
    stim[4] = 35'h2cea1874f;
    stim[5] = 35'h6f708e07f;
    stim[6] = 35'h165d5f9a3;
    stim[7] = 35'h74491f7dd;
    stim[8] = 35'h28b887bc1;
    stim[9] = 35'h7dff9032b;
    stim[10] = 35'h168ca081e;
    stim[11] = 35'h2599f9aa1;
    stim[12] = 35'h5882c0972;
    stim[13] = 35'h27124ce13;
    stim[14] = 35'h7709a1643;
    stim[15] = 35'h69b3f885c;
    stim[16] = 35'h68b3a80db;
    stim[17] = 35'h48e6cf62d;
    stim[18] = 35'h60014e13f;
    stim[19] = 35'h036e873a4;
    stim[20] = 35'h0ce072f75;
    stim[21] = 35'h3a2179894;
    stim[22] = 35'h638a43f51;
    stim[23] = 35'h3fce97a12;
    stim[24] = 35'h1718cc062;
    stim[25] = 35'h3bb118210;
    stim[26] = 35'h38829e56c;
    stim[27] = 35'h78b255ca0;
    stim[28] = 35'h5e62e59dc;
    stim[29] = 35'h5e7560d6c;
    stim[30] = 35'h4da6a850b;
    stim[31] = 35'h48574e85b;
    stim[32] = 35'h2d92a46c0;
    stim[33] = 35'h264c54037;
    stim[34] = 35'h629e3c0df;
    stim[35] = 35'h09fc92625;
    stim[36] = 35'h6ca51439b;
    stim[37] = 35'h60276626d;
    stim[38] = 35'h314cafa42;
    stim[39] = 35'h795746a23;
    stim[40] = 35'h03e1c7f28;
    stim[41] = 35'h78a483b4a;
    stim[42] = 35'h7c43b5079;
    stim[43] = 35'h7008a6d8c;
    stim[44] = 35'h69941e95b;
    stim[45] = 35'h4e53d531f;
    stim[46] = 35'h56e62fa22;
    stim[47] = 35'h5e89d53a1;
    stim[48] = 35'h13e31f93f;
    stim[49] = 35'h642ae8a82;
    stim[50] = 35'h3b572b941;
    stim[51] = 35'h12b06a60c;
    stim[52] = 35'h03e6a5190;
    stim[53] = 35'h08cc29e46;
    stim[54] = 35'h32fab5674;
    stim[55] = 35'h54ae158f1;
    stim[56] = 35'h0dc41ddcd;
    stim[57] = 35'h26477677b;
    stim[58] = 35'h2e5a407aa;
    stim[59] = 35'h61fe03723;
    stim[60] = 35'h7dc75c5a0;
    stim[61] = 35'h518f2f239;
    stim[62] = 35'h03dd39851;
    stim[63] = 35'h562f55cb5;
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
      expv[0] = 4'h1;
      expv[1] = 4'h0;
      expv[2] = 4'h1;
      expv[3] = 4'h1;
      expv[4] = 4'h1;
      expv[5] = 4'h1;
      expv[6] = 4'h1;
      expv[7] = 4'h1;
      expv[8] = 4'h1;
      expv[9] = 4'h1;
      expv[10] = 4'h1;
      expv[11] = 4'h1;
      expv[12] = 4'h1;
      expv[13] = 4'h1;
      expv[14] = 4'h1;
      expv[15] = 4'h1;
      expv[16] = 4'h1;
      expv[17] = 4'h1;
      expv[18] = 4'h1;
      expv[19] = 4'h1;
      expv[20] = 4'h1;
      expv[21] = 4'h1;
      expv[22] = 4'h1;
      expv[23] = 4'h1;
      expv[24] = 4'hf;
      expv[25] = 4'h0;
      expv[26] = 4'h1;
      expv[27] = 4'h0;
      expv[28] = 4'h1;
      expv[29] = 4'h1;
      expv[30] = 4'h1;
      expv[31] = 4'h1;
      expv[32] = 4'h0;
      expv[33] = 4'h1;
      expv[34] = 4'h1;
      expv[35] = 4'h1;
      expv[36] = 4'hf;
      expv[37] = 4'h1;
      expv[38] = 4'hf;
      expv[39] = 4'h1;
      expv[40] = 4'h0;
      expv[41] = 4'h1;
      expv[42] = 4'h1;
      expv[43] = 4'h1;
      expv[44] = 4'h1;
      expv[45] = 4'hf;
      expv[46] = 4'h1;
      expv[47] = 4'h1;
      expv[48] = 4'h1;
      expv[49] = 4'h1;
      expv[50] = 4'h1;
      expv[51] = 4'h1;
      expv[52] = 4'h0;
      expv[53] = 4'h1;
      expv[54] = 4'h1;
      expv[55] = 4'h1;
      expv[56] = 4'h1;
      expv[57] = 4'h1;
      expv[58] = 4'h1;
      expv[59] = 4'h1;
      expv[60] = 4'h0;
      expv[61] = 4'h1;
      expv[62] = 4'h1;
      expv[63] = 4'h1;
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
