// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 44;
  localparam OW = 21;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_005671 dut (
    .a_in(in_vec[43:28]),
    .b_in(in_vec[27:12]),
    .op_in(in_vec[11:4]),
    .z_flag_in(in_vec[3:3]),
    .s_flag_in(in_vec[2:2]),
    .c_flag_in(in_vec[1:1]),
    .ovr_flag_in(in_vec[0:0]),
    .c_out(out_vec[20:5]),
    .z_flag_out(out_vec[4:4]),
    .s_flag_out(out_vec[3:3]),
    .c_flag_out(out_vec[2:2]),
    .ovr_flag_out(out_vec[1:1]),
    .op_active(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 44'h5b882df7183;
    stim[1] = 44'hf9b1fa5e3bc;
    stim[2] = 44'h95449539e34;
    stim[3] = 44'h9e4c3dc8df0;
    stim[4] = 44'haf991175e0b;
    stim[5] = 44'h772afcef3a7;
    stim[6] = 44'he4ac3f5faae;
    stim[7] = 44'heb6ee896c7a;
    stim[8] = 44'h88e7e8f5122;
    stim[9] = 44'h2dcef10cb13;
    stim[10] = 44'hac5a33be491;
    stim[11] = 44'h1ac06bcc3ad;
    stim[12] = 44'hfeaeb1e1f65;
    stim[13] = 44'h5cbbea62fd1;
    stim[14] = 44'hbcf3b17dc63;
    stim[15] = 44'h8d6d1da471e;
    stim[16] = 44'hb2b14dc34a3;
    stim[17] = 44'hdef0912815d;
    stim[18] = 44'h13f572d6161;
    stim[19] = 44'hf80222c0643;
    stim[20] = 44'habf3c6d6bbe;
    stim[21] = 44'h6fce475b6c1;
    stim[22] = 44'hed08febf113;
    stim[23] = 44'h4bc5a9c0e5e;
    stim[24] = 44'h5de017b24a6;
    stim[25] = 44'h4d17d48cec2;
    stim[26] = 44'hc846c490ef2;
    stim[27] = 44'h19cd19c7e96;
    stim[28] = 44'h59b1cf63f5a;
    stim[29] = 44'h66e700f95a5;
    stim[30] = 44'h2776850b87a;
    stim[31] = 44'hdf5326aebcb;
    stim[32] = 44'h140cf39af0d;
    stim[33] = 44'h351e3106eac;
    stim[34] = 44'hf3936ff4413;
    stim[35] = 44'hd629bb985b9;
    stim[36] = 44'ha4ee97eaf5a;
    stim[37] = 44'h8fb4d5a5f67;
    stim[38] = 44'hf3eadec48fd;
    stim[39] = 44'hd57bbb0f784;
    stim[40] = 44'h6a5b9121a78;
    stim[41] = 44'h7e00032334e;
    stim[42] = 44'h1f24b2198e5;
    stim[43] = 44'h811dfbc05de;
    stim[44] = 44'h9467bc1a875;
    stim[45] = 44'ha13f77a222a;
    stim[46] = 44'h9485fad6f36;
    stim[47] = 44'h53fd6822e51;
    stim[48] = 44'h41cb00640a3;
    stim[49] = 44'h3b34cf20313;
    stim[50] = 44'h3f81456837b;
    stim[51] = 44'h41674ed8f5b;
    stim[52] = 44'h4876478dec1;
    stim[53] = 44'h7657af9d7ee;
    stim[54] = 44'h91db46dd80c;
    stim[55] = 44'h6b030a24a6f;
    stim[56] = 44'he41f6f4581c;
    stim[57] = 44'hbd3af0a2678;
    stim[58] = 44'h83a9c57d3c5;
    stim[59] = 44'h55ef53e57c9;
    stim[60] = 44'h4df37cba506;
    stim[61] = 44'h9309821ee45;
    stim[62] = 44'hd7b6d4320a6;
    stim[63] = 44'hb3bad2f17eb;
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
      expv[0] = 21'h000012;
      expv[1] = 21'h000010;
      expv[2] = 21'h000010;
      expv[3] = 21'h000010;
      expv[4] = 21'h000012;
      expv[5] = 21'h000012;
      expv[6] = 21'h000010;
      expv[7] = 21'h000010;
      expv[8] = 21'h000010;
      expv[9] = 21'h000012;
      expv[10] = 21'h000012;
      expv[11] = 21'h000012;
      expv[12] = 21'h000012;
      expv[13] = 21'h000012;
      expv[14] = 21'h000012;
      expv[15] = 21'h000010;
      expv[16] = 21'h000012;
      expv[17] = 21'h000012;
      expv[18] = 21'h000012;
      expv[19] = 21'h000012;
      expv[20] = 21'h000010;
      expv[21] = 21'h000012;
      expv[22] = 21'h000012;
      expv[23] = 21'h000010;
      expv[24] = 21'h000010;
      expv[25] = 21'h000010;
      expv[26] = 21'h000010;
      expv[27] = 21'h000010;
      expv[28] = 21'h000010;
      expv[29] = 21'h000012;
      expv[30] = 21'h000010;
      expv[31] = 21'h000012;
      expv[32] = 21'h000012;
      expv[33] = 21'h000010;
      expv[34] = 21'h000012;
      expv[35] = 21'h000012;
      expv[36] = 21'h000010;
      expv[37] = 21'h000012;
      expv[38] = 21'h000012;
      expv[39] = 21'h000010;
      expv[40] = 21'h000010;
      expv[41] = 21'h000010;
      expv[42] = 21'h000012;
      expv[43] = 21'h000010;
      expv[44] = 21'h000012;
      expv[45] = 21'h000010;
      expv[46] = 21'h000010;
      expv[47] = 21'h000012;
      expv[48] = 21'h000012;
      expv[49] = 21'h000012;
      expv[50] = 21'h000012;
      expv[51] = 21'h000012;
      expv[52] = 21'h000012;
      expv[53] = 21'h000010;
      expv[54] = 21'h046dc1;
      expv[55] = 21'h000012;
      expv[56] = 21'h16f449;
      expv[57] = 21'h000010;
      expv[58] = 21'h000012;
      expv[59] = 21'h000012;
      expv[60] = 21'h000010;
      expv[61] = 21'h000012;
      expv[62] = 21'h000010;
      expv[63] = 21'h000012;
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
