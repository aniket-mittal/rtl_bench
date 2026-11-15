// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 16;
  localparam OW = 11;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  ISERDESE2 dut (
    .CLK(clk),
    .BITSLIP(in_vec[15:15]),
    .CE1(in_vec[14:14]),
    .CE2(in_vec[13:13]),
    .CLKB(in_vec[12:12]),
    .CLKDIV(in_vec[11:11]),
    .CLKDIVP(in_vec[10:10]),
    .D(in_vec[9:9]),
    .DDLY(in_vec[8:8]),
    .DYNCLKDIVSEL(in_vec[7:7]),
    .DYNCLKSEL(in_vec[6:6]),
    .OCLK(in_vec[5:5]),
    .OCLKB(in_vec[4:4]),
    .OFB(in_vec[3:3]),
    .RST(in_vec[2:2]),
    .SHIFTIN1(in_vec[1:1]),
    .SHIFTIN2(in_vec[0:0]),
    .O(out_vec[10:10]),
    .Q1(out_vec[9:9]),
    .Q2(out_vec[8:8]),
    .Q3(out_vec[7:7]),
    .Q4(out_vec[6:6]),
    .Q5(out_vec[5:5]),
    .Q6(out_vec[4:4]),
    .Q7(out_vec[3:3]),
    .Q8(out_vec[2:2]),
    .SHIFTOUT1(out_vec[1:1]),
    .SHIFTOUT2(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 16'hc266;
    stim[1] = 16'ha7c7;
    stim[2] = 16'h2fb2;
    stim[3] = 16'hce08;
    stim[4] = 16'h2922;
    stim[5] = 16'hf631;
    stim[6] = 16'h1f29;
    stim[7] = 16'he039;
    stim[8] = 16'h868a;
    stim[9] = 16'h6709;
    stim[10] = 16'h50a9;
    stim[11] = 16'h70fb;
    stim[12] = 16'hd3c1;
    stim[13] = 16'hf662;
    stim[14] = 16'h7c0a;
    stim[15] = 16'he47a;
    stim[16] = 16'h8c8a;
    stim[17] = 16'hcc29;
    stim[18] = 16'hf522;
    stim[19] = 16'h2b83;
    stim[20] = 16'h26a0;
    stim[21] = 16'hfd6b;
    stim[22] = 16'hf453;
    stim[23] = 16'hfe1a;
    stim[24] = 16'he00a;
    stim[25] = 16'h1223;
    stim[26] = 16'he809;
    stim[27] = 16'h00d2;
    stim[28] = 16'hcd6d;
    stim[29] = 16'he4f0;
    stim[30] = 16'h24c3;
    stim[31] = 16'hb339;
    stim[32] = 16'h5179;
    stim[33] = 16'hfcf2;
    stim[34] = 16'h42eb;
    stim[35] = 16'h9273;
    stim[36] = 16'h2832;
    stim[37] = 16'ha249;
    stim[38] = 16'h2213;
    stim[39] = 16'he2c8;
    stim[40] = 16'h2e58;
    stim[41] = 16'h10e9;
    stim[42] = 16'h2320;
    stim[43] = 16'h1cc1;
    stim[44] = 16'h63c9;
    stim[45] = 16'h7d98;
    stim[46] = 16'h65a8;
    stim[47] = 16'ha4d8;
    stim[48] = 16'ha8d0;
    stim[49] = 16'hc2e3;
    stim[50] = 16'he439;
    stim[51] = 16'h8619;
    stim[52] = 16'h96b2;
    stim[53] = 16'h7680;
    stim[54] = 16'h8a68;
    stim[55] = 16'h7bb8;
    stim[56] = 16'hc831;
    stim[57] = 16'hbce1;
    stim[58] = 16'h2ee3;
    stim[59] = 16'hed68;
    stim[60] = 16'h02a0;
    stim[61] = 16'h7b52;
    stim[62] = 16'hea50;
    stim[63] = 16'hc459;
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
      expv[0] = 11'hxxx;
      expv[1] = 11'hxxx;
      expv[2] = 11'h7xx;
      expv[3] = 11'h7xx;
      expv[4] = 11'h3xx;
      expv[5] = 11'h7xx;
      expv[6] = 11'h73c;
      expv[7] = 11'h33c;
      expv[8] = 11'h73c;
      expv[9] = 11'h73c;
      expv[10] = 11'h33c;
      expv[11] = 11'h33c;
      expv[12] = 11'h73c;
      expv[13] = 11'h73c;
      expv[14] = 11'h3c0;
      expv[15] = 11'h3c0;
      expv[16] = 11'h03c;
      expv[17] = 11'h03c;
      expv[18] = 11'h03c;
      expv[19] = 11'h400;
      expv[20] = 11'h400;
      expv[21] = 11'h3c0;
      expv[22] = 11'h3c0;
      expv[23] = 11'h43c;
      expv[24] = 11'h03c;
      expv[25] = 11'h43c;
      expv[26] = 11'h330;
      expv[27] = 11'h330;
      expv[28] = 11'h030;
      expv[29] = 11'h030;
      expv[30] = 11'h030;
      expv[31] = 11'h430;
      expv[32] = 11'h030;
      expv[33] = 11'h0c0;
      expv[34] = 11'h4c0;
      expv[35] = 11'h4c0;
      expv[36] = 11'h3c0;
      expv[37] = 11'h7c0;
      expv[38] = 11'h7c0;
      expv[39] = 11'h7c0;
      expv[40] = 11'h7f0;
      expv[41] = 11'h3f0;
      expv[42] = 11'h7f0;
      expv[43] = 11'h33c;
      expv[44] = 11'h73c;
      expv[45] = 11'h330;
      expv[46] = 11'h330;
      expv[47] = 11'h330;
      expv[48] = 11'h00c;
      expv[49] = 11'h40c;
      expv[50] = 11'h00c;
      expv[51] = 11'h40c;
      expv[52] = 11'h40c;
      expv[53] = 11'h40c;
      expv[54] = 11'h7f0;
      expv[55] = 11'h7f0;
      expv[56] = 11'h3f0;
      expv[57] = 11'h3f0;
      expv[58] = 11'h7f0;
      expv[59] = 11'h3f0;
      expv[60] = 11'h7f0;
      expv[61] = 11'h730;
      expv[62] = 11'h730;
      expv[63] = 11'h330;
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
