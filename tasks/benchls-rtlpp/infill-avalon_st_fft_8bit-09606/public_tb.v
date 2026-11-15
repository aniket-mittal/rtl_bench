// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 24;
  localparam OW = 28;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_09606 dut (
    .clk(clk),
    .reset_n(in_vec[23:23]),
    .inverse(in_vec[22:22]),
    .sink_valid(in_vec[21:21]),
    .sink_sop(in_vec[20:20]),
    .sink_eop(in_vec[19:19]),
    .sink_real(in_vec[18:11]),
    .sink_imag(in_vec[10:3]),
    .sink_error(in_vec[2:1]),
    .source_ready(in_vec[0:0]),
    .sink_ready(out_vec[27:27]),
    .source_error(out_vec[26:25]),
    .source_sop(out_vec[24:24]),
    .source_eop(out_vec[23:23]),
    .source_valid(out_vec[22:22]),
    .source_exp(out_vec[21:16]),
    .source_real(out_vec[15:8]),
    .source_imag(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 24'h0761fa;
    stim[1] = 24'h0f0285;
    stim[2] = 24'hdac3a1;
    stim[3] = 24'hda8080;
    stim[4] = 24'hc25cf0;
    stim[5] = 24'hae55ef;
    stim[6] = 24'hca3d22;
    stim[7] = 24'hf2f0f3;
    stim[8] = 24'hffddf7;
    stim[9] = 24'h942747;
    stim[10] = 24'hab0d8b;
    stim[11] = 24'hae5092;
    stim[12] = 24'h860324;
    stim[13] = 24'heb7eff;
    stim[14] = 24'hc3ebb6;
    stim[15] = 24'heedafd;
    stim[16] = 24'hb364f0;
    stim[17] = 24'h9d7fa9;
    stim[18] = 24'hd5b3a7;
    stim[19] = 24'he0d291;
    stim[20] = 24'hca94a8;
    stim[21] = 24'hb3a9ec;
    stim[22] = 24'hffaf00;
    stim[23] = 24'h9f4b81;
    stim[24] = 24'hd8302e;
    stim[25] = 24'h82b745;
    stim[26] = 24'h1890ec;
    stim[27] = 24'h8c461c;
    stim[28] = 24'hdace55;
    stim[29] = 24'hc694b3;
    stim[30] = 24'hb8839f;
    stim[31] = 24'hdcb464;
    stim[32] = 24'hf29a9f;
    stim[33] = 24'haabc85;
    stim[34] = 24'hda545e;
    stim[35] = 24'hac9de8;
    stim[36] = 24'hbc9a13;
    stim[37] = 24'h920987;
    stim[38] = 24'he612e8;
    stim[39] = 24'h9b64c6;
    stim[40] = 24'he2c259;
    stim[41] = 24'haf5f54;
    stim[42] = 24'haa7a82;
    stim[43] = 24'hf18444;
    stim[44] = 24'h96d80a;
    stim[45] = 24'hc943e9;
    stim[46] = 24'h895c81;
    stim[47] = 24'h5b01e0;
    stim[48] = 24'ha30af3;
    stim[49] = 24'hc853c8;
    stim[50] = 24'hf97e1f;
    stim[51] = 24'hee4ea7;
    stim[52] = 24'ha67464;
    stim[53] = 24'hfc07e3;
    stim[54] = 24'h86f604;
    stim[55] = 24'h80569f;
    stim[56] = 24'haf02d9;
    stim[57] = 24'h8b2780;
    stim[58] = 24'hcecc22;
    stim[59] = 24'h95d358;
    stim[60] = 24'hd726b8;
    stim[61] = 24'hf92613;
    stim[62] = 24'hc2c2b8;
    stim[63] = 24'hebe073;
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
      expv[0] = 28'hxxxxxxx;
      expv[1] = 28'h0000000;
      expv[2] = 28'h0000000;
      expv[3] = 28'h9805874;
      expv[4] = 28'h9805010;
      expv[5] = 28'h8004b9e;
      expv[6] = 28'hec0cabd;
      expv[7] = 28'ha8047a4;
      expv[8] = 28'hb405e1e;
      expv[9] = 28'hfc0fbbe;
      expv[10] = 28'hf0084e8;
      expv[11] = 28'hac061b1;
      expv[12] = 28'hac0ca12;
      expv[13] = 28'hc00c064;
      expv[14] = 28'hec06fdf;
      expv[15] = 28'he007d76;
      expv[16] = 28'hcc0db5f;
      expv[17] = 28'h9406c9e;
      expv[18] = 28'h980aff5;
      expv[19] = 28'hf00b674;
      expv[20] = 28'h8401a52;
      expv[21] = 28'h8805295;
      expv[22] = 28'hd40753d;
      expv[23] = 28'h9c0f5e0;
      expv[24] = 28'h980e970;
      expv[25] = 28'hf800605;
      expv[26] = 28'hc0056e8;
      expv[27] = 28'h0000000;
      expv[28] = 28'hc8088c3;
      expv[29] = 28'hd8059ca;
      expv[30] = 28'ha00d296;
      expv[31] = 28'hfc01073;
      expv[32] = 28'hd80968c;
      expv[33] = 28'hf405353;
      expv[34] = 28'hcc05790;
      expv[35] = 28'hf804a8b;
      expv[36] = 28'h8c093bd;
      expv[37] = 28'hbc09342;
      expv[38] = 28'hf004130;
      expv[39] = 28'h840c25d;
      expv[40] = 28'hf806c98;
      expv[41] = 28'h840584b;
      expv[42] = 28'hcc0ebea;
      expv[43] = 28'hac04f50;
      expv[44] = 28'hd403088;
      expv[45] = 28'hb00db01;
      expv[46] = 28'h880287d;
      expv[47] = 28'h8802b90;
      expv[48] = 28'h0000000;
      expv[49] = 28'ha40615e;
      expv[50] = 28'h8800a79;
      expv[51] = 28'hfc02fc3;
      expv[52] = 28'hec0c9d4;
      expv[53] = 28'hc40ce8c;
      expv[54] = 28'hbc080fc;
      expv[55] = 28'hc00dec0;
      expv[56] = 28'he000ad3;
      expv[57] = 28'h8c0e05b;
      expv[58] = 28'h88064f0;
      expv[59] = 28'ha80d984;
      expv[60] = 28'h900ba6b;
      expv[61] = 28'h900e4d7;
      expv[62] = 28'hbc024c2;
      expv[63] = 28'h8005857;
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
