// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 40;
  localparam OW = 44;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_11063 dut (
    .clk(clk),
    .reset_n(in_vec[39:39]),
    .inverse(in_vec[38:38]),
    .sink_valid(in_vec[37:37]),
    .sink_sop(in_vec[36:36]),
    .sink_eop(in_vec[35:35]),
    .sink_real(in_vec[34:19]),
    .sink_imag(in_vec[18:3]),
    .sink_error(in_vec[2:1]),
    .source_ready(in_vec[0:0]),
    .sink_ready(out_vec[43:43]),
    .source_error(out_vec[42:41]),
    .source_sop(out_vec[40:40]),
    .source_eop(out_vec[39:39]),
    .source_valid(out_vec[38:38]),
    .source_exp(out_vec[37:32]),
    .source_real(out_vec[31:16]),
    .source_imag(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 40'h03fcab3118;
    stim[1] = 40'h0afb509673;
    stim[2] = 40'h937f66a923;
    stim[3] = 40'hd15070c111;
    stim[4] = 40'hb736932152;
    stim[5] = 40'h9a755c5422;
    stim[6] = 40'hb96012baed;
    stim[7] = 40'hf0ca74c0e2;
    stim[8] = 40'hc97d0f5a67;
    stim[9] = 40'hf6e64424a9;
    stim[10] = 40'hbd744b7c66;
    stim[11] = 40'h9ee729d331;
    stim[12] = 40'hf34cdc3764;
    stim[13] = 40'hc150146741;
    stim[14] = 40'he9edbe7132;
    stim[15] = 40'hd0c20242b0;
    stim[16] = 40'ha7b19305ee;
    stim[17] = 40'hc0b6175e1c;
    stim[18] = 40'hadaaf466ac;
    stim[19] = 40'hf81c657ade;
    stim[20] = 40'h91c27d807e;
    stim[21] = 40'h968b4dd6fb;
    stim[22] = 40'hdea47b2606;
    stim[23] = 40'ha355453ab2;
    stim[24] = 40'ha0ddcb50a9;
    stim[25] = 40'hdaac179ba7;
    stim[26] = 40'hdde99ac915;
    stim[27] = 40'hb1faef0fb0;
    stim[28] = 40'hdc126c32b3;
    stim[29] = 40'haa11d88548;
    stim[30] = 40'h8d4d356183;
    stim[31] = 40'he9e26e10d0;
    stim[32] = 40'hef744b228d;
    stim[33] = 40'ha4b74699c7;
    stim[34] = 40'h944e344cbd;
    stim[35] = 40'he2cde77d83;
    stim[36] = 40'hc0c8544e78;
    stim[37] = 40'hf755bac319;
    stim[38] = 40'hfb7ee2cd59;
    stim[39] = 40'hdec9453d9b;
    stim[40] = 40'hffcad81f79;
    stim[41] = 40'hd32292dbc5;
    stim[42] = 40'ha14fdf822a;
    stim[43] = 40'hbf94e4e065;
    stim[44] = 40'hd13da64bda;
    stim[45] = 40'h9c7a53ef88;
    stim[46] = 40'hbf289b60bf;
    stim[47] = 40'hc8b482acb0;
    stim[48] = 40'ha7c0db6ea9;
    stim[49] = 40'ha8f4221e9d;
    stim[50] = 40'hf0dfe456a0;
    stim[51] = 40'hbae62a8108;
    stim[52] = 40'heb7bdb2a5e;
    stim[53] = 40'haaca720d37;
    stim[54] = 40'he77bac662e;
    stim[55] = 40'h905d842333;
    stim[56] = 40'hcc94b81953;
    stim[57] = 40'h44f1792028;
    stim[58] = 40'hc4cd169872;
    stim[59] = 40'h87e145e3ad;
    stim[60] = 40'heb8d8fa49e;
    stim[61] = 40'ha7541a7d8c;
    stim[62] = 40'h8b4f1daf1c;
    stim[63] = 40'ha3c22a4c6e;
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
      expv[0] = 44'h00000000000;
      expv[1] = 44'h00000000000;
      expv[2] = 44'h00000000000;
      expv[3] = 44'h00000000000;
      expv[4] = 44'h00000000000;
      expv[5] = 44'hb40e6d2642a;
      expv[6] = 44'h300e6d2642a;
      expv[7] = 44'hdc02c02575d;
      expv[8] = 44'hb40194e981c;
      expv[9] = 44'h300194e981c;
      expv[10] = 44'h940dcc88495;
      expv[11] = 44'hfc0ae896f8c;
      expv[12] = 44'h780ae896f8c;
      expv[13] = 44'hd40699b86ec;
      expv[14] = 44'h500699b86ec;
      expv[15] = 44'hac03db7ce26;
      expv[16] = 44'h2803db7ce26;
      expv[17] = 44'he40f63260bd;
      expv[18] = 44'h600f63260bd;
      expv[19] = 44'hcc0b55e8cd5;
      expv[20] = 44'hfc0038caf5b;
      expv[21] = 44'h780038caf5b;
      expv[22] = 44'h780038caf5b;
      expv[23] = 44'h780038caf5b;
      expv[24] = 44'ha406aa8a756;
      expv[25] = 44'h8401bb96a15;
      expv[26] = 44'h0001bb96a15;
      expv[27] = 44'h0001bb96a15;
      expv[28] = 44'h9403f5de1f6;
      expv[29] = 44'h1003f5de1f6;
      expv[30] = 44'h8c0423b10a9;
      expv[31] = 44'h080423b10a9;
      expv[32] = 44'h8c03c4dc21a;
      expv[33] = 44'hcc0ee896451;
      expv[34] = 44'he4096e8d338;
      expv[35] = 44'h60096e8d338;
      expv[36] = 44'ha4059bcefb0;
      expv[37] = 44'h20059bcefb0;
      expv[38] = 44'h940eab75863;
      expv[39] = 44'h9c06fdc59ab;
      expv[40] = 44'h1806fdc59ab;
      expv[41] = 44'h9c0f95b03ef;
      expv[42] = 44'h180f95b03ef;
      expv[43] = 44'ha4029fbf045;
      expv[44] = 44'hdc0f29c9c0c;
      expv[45] = 44'h580f29c9c0c;
      expv[46] = 44'h580f29c9c0c;
      expv[47] = 44'hfc0e5136c17;
      expv[48] = 44'h780e5136c17;
      expv[49] = 44'h840f81b6dd5;
      expv[50] = 44'hcc01e8443d3;
      expv[51] = 44'h9401bfc8ad4;
      expv[52] = 44'h9c05cc55021;
      expv[53] = 44'hec06f7b654b;
      expv[54] = 44'hec0594e41a6;
      expv[55] = 44'he40ef758cc5;
      expv[56] = 44'h600ef758cc5;
      expv[57] = 44'h00000000000;
      expv[58] = 44'h00000000000;
      expv[59] = 44'h00000000000;
      expv[60] = 44'h00000000000;
      expv[61] = 44'hec071b1f493;
      expv[62] = 44'hc40ea834fb1;
      expv[63] = 44'h400ea834fb1;
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
