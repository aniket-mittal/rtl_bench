// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 144;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_138836 dut (
    .clk(clk),
    .clk_ena(in_vec[9:9]),
    .in_stream(in_vec[8:1]),
    .reset(in_vec[0:0]),
    .pipeline_reg_0(out_vec[143:136]),
    .pipeline_reg_1(out_vec[135:128]),
    .pipeline_reg_2(out_vec[127:120]),
    .pipeline_reg_3(out_vec[119:112]),
    .pipeline_reg_4(out_vec[111:104]),
    .pipeline_reg_5(out_vec[103:96]),
    .pipeline_reg_6(out_vec[95:88]),
    .pipeline_reg_7(out_vec[87:80]),
    .pipeline_reg_8(out_vec[79:72]),
    .pipeline_reg_9(out_vec[71:64]),
    .pipeline_reg_10(out_vec[63:56]),
    .pipeline_reg_11(out_vec[55:48]),
    .pipeline_reg_12(out_vec[47:40]),
    .pipeline_reg_13(out_vec[39:32]),
    .pipeline_reg_14(out_vec[31:24]),
    .pipeline_reg_15(out_vec[23:16]),
    .pipeline_reg_16(out_vec[15:8]),
    .pipeline_reg_17(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h30b;
    stim[1] = 10'h3ef;
    stim[2] = 10'h31e;
    stim[3] = 10'h1fe;
    stim[4] = 10'h2fa;
    stim[5] = 10'h05c;
    stim[6] = 10'h326;
    stim[7] = 10'h12e;
    stim[8] = 10'h060;
    stim[9] = 10'h10e;
    stim[10] = 10'h0ce;
    stim[11] = 10'h25e;
    stim[12] = 10'h09a;
    stim[13] = 10'h0c0;
    stim[14] = 10'h3f0;
    stim[15] = 10'h094;
    stim[16] = 10'h238;
    stim[17] = 10'h278;
    stim[18] = 10'h1da;
    stim[19] = 10'h3e8;
    stim[20] = 10'h0d0;
    stim[21] = 10'h168;
    stim[22] = 10'h3d0;
    stim[23] = 10'h0fa;
    stim[24] = 10'h13a;
    stim[25] = 10'h3fc;
    stim[26] = 10'h35c;
    stim[27] = 10'h086;
    stim[28] = 10'h05a;
    stim[29] = 10'h31e;
    stim[30] = 10'h36e;
    stim[31] = 10'h1ec;
    stim[32] = 10'h31e;
    stim[33] = 10'h06a;
    stim[34] = 10'h0ec;
    stim[35] = 10'h27e;
    stim[36] = 10'h03c;
    stim[37] = 10'h054;
    stim[38] = 10'h06a;
    stim[39] = 10'h3b0;
    stim[40] = 10'h19c;
    stim[41] = 10'h3a2;
    stim[42] = 10'h350;
    stim[43] = 10'h198;
    stim[44] = 10'h1f6;
    stim[45] = 10'h088;
    stim[46] = 10'h236;
    stim[47] = 10'h22a;
    stim[48] = 10'h374;
    stim[49] = 10'h1d6;
    stim[50] = 10'h2ea;
    stim[51] = 10'h1d2;
    stim[52] = 10'h384;
    stim[53] = 10'h202;
    stim[54] = 10'h1e4;
    stim[55] = 10'h0b8;
    stim[56] = 10'h0d0;
    stim[57] = 10'h240;
    stim[58] = 10'h2e0;
    stim[59] = 10'h0da;
    stim[60] = 10'h060;
    stim[61] = 10'h3ee;
    stim[62] = 10'h1ba;
    stim[63] = 10'h324;
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
      expv[0] = 144'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 144'h000000000000000000000000000000000000;
      expv[2] = 144'h000000000000000000000000000000000000;
      expv[3] = 144'h8f0000000000000000000000000000000000;
      expv[4] = 144'h8f0000000000000000000000000000000000;
      expv[5] = 144'h7d8f00000000000000000000000000000000;
      expv[6] = 144'h7d8f00000000000000000000000000000000;
      expv[7] = 144'h937d8f000000000000000000000000000000;
      expv[8] = 144'h937d8f000000000000000000000000000000;
      expv[9] = 144'h937d8f000000000000000000000000000000;
      expv[10] = 144'h937d8f000000000000000000000000000000;
      expv[11] = 144'h937d8f000000000000000000000000000000;
      expv[12] = 144'h2f937d8f0000000000000000000000000000;
      expv[13] = 144'h2f937d8f0000000000000000000000000000;
      expv[14] = 144'h2f937d8f0000000000000000000000000000;
      expv[15] = 144'hf82f937d8f00000000000000000000000000;
      expv[16] = 144'hf82f937d8f00000000000000000000000000;
      expv[17] = 144'h1cf82f937d8f000000000000000000000000;
      expv[18] = 144'h3c1cf82f937d8f0000000000000000000000;
      expv[19] = 144'h3c1cf82f937d8f0000000000000000000000;
      expv[20] = 144'hf43c1cf82f937d8f00000000000000000000;
      expv[21] = 144'hf43c1cf82f937d8f00000000000000000000;
      expv[22] = 144'hf43c1cf82f937d8f00000000000000000000;
      expv[23] = 144'he8f43c1cf82f937d8f000000000000000000;
      expv[24] = 144'he8f43c1cf82f937d8f000000000000000000;
      expv[25] = 144'he8f43c1cf82f937d8f000000000000000000;
      expv[26] = 144'hfee8f43c1cf82f937d8f0000000000000000;
      expv[27] = 144'haefee8f43c1cf82f937d8f00000000000000;
      expv[28] = 144'haefee8f43c1cf82f937d8f00000000000000;
      expv[29] = 144'haefee8f43c1cf82f937d8f00000000000000;
      expv[30] = 144'h8faefee8f43c1cf82f937d8f000000000000;
      expv[31] = 144'hb78faefee8f43c1cf82f937d8f0000000000;
      expv[32] = 144'hb78faefee8f43c1cf82f937d8f0000000000;
      expv[33] = 144'h8fb78faefee8f43c1cf82f937d8f00000000;
      expv[34] = 144'h8fb78faefee8f43c1cf82f937d8f00000000;
      expv[35] = 144'h8fb78faefee8f43c1cf82f937d8f00000000;
      expv[36] = 144'h3f8fb78faefee8f43c1cf82f937d8f000000;
      expv[37] = 144'h3f8fb78faefee8f43c1cf82f937d8f000000;
      expv[38] = 144'h3f8fb78faefee8f43c1cf82f937d8f000000;
      expv[39] = 144'h3f8fb78faefee8f43c1cf82f937d8f000000;
      expv[40] = 144'hd83f8fb78faefee8f43c1cf82f937d8f0000;
      expv[41] = 144'hd83f8fb78faefee8f43c1cf82f937d8f0000;
      expv[42] = 144'hd1d83f8fb78faefee8f43c1cf82f937d8f00;
      expv[43] = 144'ha8d1d83f8fb78faefee8f43c1cf82f937d8f;
      expv[44] = 144'ha8d1d83f8fb78faefee8f43c1cf82f937d8f;
      expv[45] = 144'ha8d1d83f8fb78faefee8f43c1cf82f937d8f;
      expv[46] = 144'ha8d1d83f8fb78faefee8f43c1cf82f937d8f;
      expv[47] = 144'h1ba8d1d83f8fb78faefee8f43c1cf82f937d;
      expv[48] = 144'h151ba8d1d83f8fb78faefee8f43c1cf82f93;
      expv[49] = 144'hba151ba8d1d83f8fb78faefee8f43c1cf82f;
      expv[50] = 144'hba151ba8d1d83f8fb78faefee8f43c1cf82f;
      expv[51] = 144'h75ba151ba8d1d83f8fb78faefee8f43c1cf8;
      expv[52] = 144'h75ba151ba8d1d83f8fb78faefee8f43c1cf8;
      expv[53] = 144'hc275ba151ba8d1d83f8fb78faefee8f43c1c;
      expv[54] = 144'h01c275ba151ba8d1d83f8fb78faefee8f43c;
      expv[55] = 144'h01c275ba151ba8d1d83f8fb78faefee8f43c;
      expv[56] = 144'h01c275ba151ba8d1d83f8fb78faefee8f43c;
      expv[57] = 144'h01c275ba151ba8d1d83f8fb78faefee8f43c;
      expv[58] = 144'h2001c275ba151ba8d1d83f8fb78faefee8f4;
      expv[59] = 144'h702001c275ba151ba8d1d83f8fb78faefee8;
      expv[60] = 144'h702001c275ba151ba8d1d83f8fb78faefee8;
      expv[61] = 144'h702001c275ba151ba8d1d83f8fb78faefee8;
      expv[62] = 144'hf7702001c275ba151ba8d1d83f8fb78faefe;
      expv[63] = 144'hf7702001c275ba151ba8d1d83f8fb78faefe;
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
