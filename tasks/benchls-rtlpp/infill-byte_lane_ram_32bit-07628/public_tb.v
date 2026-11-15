// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 52;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_07628 dut (
    .CLK(clk),
    .CE(in_vec[51:51]),
    .WE(in_vec[50:50]),
    .SEL(in_vec[49:46]),
    .ADR(in_vec[45:32]),
    .DATI(in_vec[31:0]),
    .DATO(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 52'hbf71132540e01;
    stim[1] = 52'h71644fb0c271c;
    stim[2] = 52'hd6584b97b60f4;
    stim[3] = 52'h01aed70036962;
    stim[4] = 52'hdc1db5a7493cc;
    stim[5] = 52'hed0a1d35462db;
    stim[6] = 52'he6be12a40788a;
    stim[7] = 52'hce5ae396ebf9e;
    stim[8] = 52'h2a3e5526452c4;
    stim[9] = 52'he5baee60ab852;
    stim[10] = 52'h31b8db996aa2a;
    stim[11] = 52'h29550081dd2fb;
    stim[12] = 52'h37469cfc48442;
    stim[13] = 52'h8e5c96853c28e;
    stim[14] = 52'h298d9298c57e4;
    stim[15] = 52'h93d3355c3a9f9;
    stim[16] = 52'h8320a3c7ef4f6;
    stim[17] = 52'hcb61f949f7bbe;
    stim[18] = 52'hab6f197fb779f;
    stim[19] = 52'h37d2073516f62;
    stim[20] = 52'h92fa491cbc6e2;
    stim[21] = 52'h550bc8508dd3d;
    stim[22] = 52'h04738f84d957d;
    stim[23] = 52'h5c4c5c0cf6edd;
    stim[24] = 52'h6ee0f7f074268;
    stim[25] = 52'hf563b7f23502f;
    stim[26] = 52'hf85a83d86e054;
    stim[27] = 52'hfae251356a556;
    stim[28] = 52'h26a8413eb2f11;
    stim[29] = 52'ha41a86bdaa0ea;
    stim[30] = 52'h578f9422fae6a;
    stim[31] = 52'hde1bc4b7ba8b3;
    stim[32] = 52'h6fcf14f9b6b4f;
    stim[33] = 52'h6cbe5283adadd;
    stim[34] = 52'hf81200effcdff;
    stim[35] = 52'hd3df8f234a827;
    stim[36] = 52'hdf3921d8d4a60;
    stim[37] = 52'h9cc7a65b2b986;
    stim[38] = 52'h27289cd1655b1;
    stim[39] = 52'hdb9e93be274e0;
    stim[40] = 52'h129922834494f;
    stim[41] = 52'h1032e04a24c35;
    stim[42] = 52'h6bef6a02ec9f0;
    stim[43] = 52'hb15bc1bfc7991;
    stim[44] = 52'hdb519d413457c;
    stim[45] = 52'he97a4fab3a581;
    stim[46] = 52'hc4e24163b8434;
    stim[47] = 52'h4577ae9e08070;
    stim[48] = 52'hb17df4f0e6ce0;
    stim[49] = 52'h491908051cfe0;
    stim[50] = 52'h18c2ea205c525;
    stim[51] = 52'h762d502f12b09;
    stim[52] = 52'hc3a13546601af;
    stim[53] = 52'hf442a252657c9;
    stim[54] = 52'h8548907321390;
    stim[55] = 52'he374782e4fa6b;
    stim[56] = 52'h9b8db34870104;
    stim[57] = 52'hd48b1e2d6be81;
    stim[58] = 52'h29c1f8daf70f8;
    stim[59] = 52'h868fa49c36970;
    stim[60] = 52'h16cfdd9282a31;
    stim[61] = 52'he764fce2a05f0;
    stim[62] = 52'hfc88f5659daea;
    stim[63] = 52'heb19bc8797eb5;
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
      expv[0] = 32'hxxxxxxxx;
      expv[1] = 32'h00000000;
      expv[2] = 32'hxxxxxxxx;
      expv[3] = 32'h00000000;
      expv[4] = 32'hxxxxxxxx;
      expv[5] = 32'hxxxxxxxx;
      expv[6] = 32'hxxxxxxxx;
      expv[7] = 32'hxxxxxxxx;
      expv[8] = 32'h00000000;
      expv[9] = 32'hxxxxxxxx;
      expv[10] = 32'h00000000;
      expv[11] = 32'h00000000;
      expv[12] = 32'h00000000;
      expv[13] = 32'hxxxxxxxx;
      expv[14] = 32'h00000000;
      expv[15] = 32'hxxxxxxxx;
      expv[16] = 32'hxxxxxxxx;
      expv[17] = 32'hxxxxxxxx;
      expv[18] = 32'hxxxx7bxx;
      expv[19] = 32'h00000000;
      expv[20] = 32'hxxxxxxxx;
      expv[21] = 32'h00000000;
      expv[22] = 32'h00000000;
      expv[23] = 32'h00000000;
      expv[24] = 32'h00000000;
      expv[25] = 32'hxxxxxxxx;
      expv[26] = 32'hxxxxxxxx;
      expv[27] = 32'hxxxxxxxx;
      expv[28] = 32'h00000000;
      expv[29] = 32'hxxxxxxxx;
      expv[30] = 32'h00000000;
      expv[31] = 32'hxxxxxxxx;
      expv[32] = 32'h00000000;
      expv[33] = 32'h00000000;
      expv[34] = 32'hxxxxxxxx;
      expv[35] = 32'hxxxxxxxx;
      expv[36] = 32'hxxxxxxxx;
      expv[37] = 32'hxxxxxxxx;
      expv[38] = 32'h00000000;
      expv[39] = 32'hxxxxxxxx;
      expv[40] = 32'h00000000;
      expv[41] = 32'h00000000;
      expv[42] = 32'h00000000;
      expv[43] = 32'hxxxxxxxx;
      expv[44] = 32'hxxxxxxxx;
      expv[45] = 32'hxxxxxxxx;
      expv[46] = 32'hxxxxxxxx;
      expv[47] = 32'h00000000;
      expv[48] = 32'hxxxxxxxx;
      expv[49] = 32'h00000000;
      expv[50] = 32'h00000000;
      expv[51] = 32'h00000000;
      expv[52] = 32'hxxxxxxxx;
      expv[53] = 32'hxxxxxxxx;
      expv[54] = 32'hxxxxxxxx;
      expv[55] = 32'hxxxxxxxx;
      expv[56] = 32'hxxxxxxxx;
      expv[57] = 32'hxxxxxxxx;
      expv[58] = 32'h00000000;
      expv[59] = 32'hxxxxxxxx;
      expv[60] = 32'h00000000;
      expv[61] = 32'hxxxxxxxx;
      expv[62] = 32'hxxxxxxxx;
      expv[63] = 32'hxxxxxxxx;
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
