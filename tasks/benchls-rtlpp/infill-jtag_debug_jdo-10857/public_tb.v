// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 42;
  localparam OW = 48;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_10857 dut (
    .clk(clk),
    .ir_in(in_vec[41:40]),
    .sr(in_vec[39:2]),
    .vs_udr(in_vec[1:1]),
    .vs_uir(in_vec[0:0]),
    .jdo(out_vec[47:10]),
    .take_action_break_a(out_vec[9:9]),
    .take_action_break_b(out_vec[8:8]),
    .take_action_break_c(out_vec[7:7]),
    .take_action_ocimem_a(out_vec[6:6]),
    .take_action_ocimem_b(out_vec[5:5]),
    .take_action_tracectrl(out_vec[4:4]),
    .take_no_action_break_a(out_vec[3:3]),
    .take_no_action_break_b(out_vec[2:2]),
    .take_no_action_break_c(out_vec[1:1]),
    .take_no_action_ocimem_a(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 42'h3dcb61fec89;
    stim[1] = 42'h2116ae6c8e7;
    stim[2] = 42'h107e7b2d925;
    stim[3] = 42'h36b06464fe6;
    stim[4] = 42'h3f6fe6bcbe3;
    stim[5] = 42'h38fac31599f;
    stim[6] = 42'h3738903ca02;
    stim[7] = 42'h13103f8c1a2;
    stim[8] = 42'h128231929d7;
    stim[9] = 42'h044dac64f1b;
    stim[10] = 42'h1f60fbf0cfe;
    stim[11] = 42'h291a07e9466;
    stim[12] = 42'h1c2ce9dd990;
    stim[13] = 42'h0756d404588;
    stim[14] = 42'h2a0a72a2391;
    stim[15] = 42'h26fc03f791b;
    stim[16] = 42'h3f0d6a0b6bc;
    stim[17] = 42'h2b4820d2b35;
    stim[18] = 42'h1ab3fafa594;
    stim[19] = 42'h3b1a363cc02;
    stim[20] = 42'h12d08e7e4f2;
    stim[21] = 42'h276ca4e1025;
    stim[22] = 42'h358910d0f81;
    stim[23] = 42'h190a4a8a049;
    stim[24] = 42'h16845c1657a;
    stim[25] = 42'h142ed1cfd87;
    stim[26] = 42'h2becf75a45c;
    stim[27] = 42'h27adc418550;
    stim[28] = 42'h218d2a82022;
    stim[29] = 42'h35c0e34b901;
    stim[30] = 42'h34bf84b99d3;
    stim[31] = 42'h3da2ae4d425;
    stim[32] = 42'h3de45516814;
    stim[33] = 42'h162eb2d9d16;
    stim[34] = 42'h3f153024394;
    stim[35] = 42'h0d3daddc176;
    stim[36] = 42'h127078da451;
    stim[37] = 42'h312380ca5e7;
    stim[38] = 42'h2ceb8d5ef05;
    stim[39] = 42'h25753eefb2a;
    stim[40] = 42'h0a352c9af78;
    stim[41] = 42'h2f891375262;
    stim[42] = 42'h26905b38618;
    stim[43] = 42'h317b0f4c4df;
    stim[44] = 42'h0c8b1aae8b5;
    stim[45] = 42'h1c38510e565;
    stim[46] = 42'h3fde1957881;
    stim[47] = 42'h2a6f233f28b;
    stim[48] = 42'h3c219cee0ce;
    stim[49] = 42'h295b8bc4894;
    stim[50] = 42'h065b5a75f4f;
    stim[51] = 42'h0acd7ce7ca0;
    stim[52] = 42'h2d3cfc2e7d1;
    stim[53] = 42'h269e6d1897e;
    stim[54] = 42'h05ba3ec42c6;
    stim[55] = 42'h3009d326c25;
    stim[56] = 42'h1f6a1b17c37;
    stim[57] = 42'h064e5a4f60e;
    stim[58] = 42'h1676fe0ce4f;
    stim[59] = 42'h009d337342e;
    stim[60] = 42'h2fd552b3e89;
    stim[61] = 42'h33ee3da5893;
    stim[62] = 42'h3c6995eed25;
    stim[63] = 42'h07446bec0e4;
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
      expv[0] = 48'hxxxxxxxxxxxx;
      expv[1] = 48'hxxxxxxxxxxxx;
      expv[2] = 48'hxxxxxxxxxxxx;
      expv[3] = 48'hxxxxxxxxxx00;
      expv[4] = 48'h6b06464fe4xx;
      expv[5] = 48'h6b06464fe400;
      expv[6] = 48'h8fac31599x0x;
      expv[7] = 48'h8fac31599c00;
      expv[8] = 48'h8fac31599c00;
      expv[9] = 48'h8fac31599c00;
      expv[10] = 48'h8fac31599c00;
      expv[11] = 48'h8fac31599c00;
      expv[12] = 48'h8fac31599c00;
      expv[13] = 48'h8fac31599c00;
      expv[14] = 48'h8fac31599c00;
      expv[15] = 48'h8fac31599c00;
      expv[16] = 48'h8fac31599c00;
      expv[17] = 48'h8fac31599c00;
      expv[18] = 48'hb4820d2b3400;
      expv[19] = 48'hb4820d2b3400;
      expv[20] = 48'hb4820d2b3400;
      expv[21] = 48'hb4820d2b3400;
      expv[22] = 48'h76ca4e102410;
      expv[23] = 48'h76ca4e102400;
      expv[24] = 48'h76ca4e102400;
      expv[25] = 48'h76ca4e102400;
      expv[26] = 48'h76ca4e102400;
      expv[27] = 48'hbecf75a45c00;
      expv[28] = 48'hbecf75a45c00;
      expv[29] = 48'hbecf75a45c00;
      expv[30] = 48'hbecf75a45c00;
      expv[31] = 48'h4bf84b99d004;
      expv[32] = 48'h4bf84b99d000;
      expv[33] = 48'hde4551681400;
      expv[34] = 48'hde4551681400;
      expv[35] = 48'hde4551681400;
      expv[36] = 48'hd3daddc17400;
      expv[37] = 48'hd3daddc17400;
      expv[38] = 48'h12380ca5e400;
      expv[39] = 48'h12380ca5e400;
      expv[40] = 48'h5753eefb2804;
      expv[41] = 48'h5753eefb2800;
      expv[42] = 48'hf89137526080;
      expv[43] = 48'hf89137526000;
      expv[44] = 48'h17b0f4c4dc08;
      expv[45] = 48'h17b0f4c4dc00;
      expv[46] = 48'hc38510e56400;
      expv[47] = 48'hc38510e56400;
      expv[48] = 48'hc38510e56400;
      expv[49] = 48'hc38510e56400;
      expv[50] = 48'h95b8bc489400;
      expv[51] = 48'h95b8bc489400;
      expv[52] = 48'h95b8bc489400;
      expv[53] = 48'hd3cfc2e7d100;
      expv[54] = 48'hd3cfc2e7d000;
      expv[55] = 48'hd3cfc2e7d000;
      expv[56] = 48'h009d326c2401;
      expv[57] = 48'h009d326c2400;
      expv[58] = 48'h009d326c2400;
      expv[59] = 48'h676fe0ce4c20;
      expv[60] = 48'h676fe0ce4c00;
      expv[61] = 48'h676fe0ce4c00;
      expv[62] = 48'h676fe0ce4c00;
      expv[63] = 48'h676fe0ce4c00;
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
