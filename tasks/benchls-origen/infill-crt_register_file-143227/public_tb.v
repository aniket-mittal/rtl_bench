// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 121;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_143227 dut (
    .I_E(clk),
    .I_RSTn(in_vec[11:11]),
    .I_DI(in_vec[10:3]),
    .I_RS(in_vec[2:2]),
    .I_RWn(in_vec[1:1]),
    .I_CSn(in_vec[0:0]),
    .O_Nht(out_vec[120:113]),
    .O_Nhd(out_vec[112:105]),
    .O_Nhsp(out_vec[104:97]),
    .O_Nhsw(out_vec[96:89]),
    .O_Nvt(out_vec[88:81]),
    .O_Nadj(out_vec[80:73]),
    .O_Nvd(out_vec[72:65]),
    .O_Nvsp(out_vec[64:57]),
    .O_Nvsw(out_vec[56:49]),
    .O_Nr(out_vec[48:41]),
    .O_Msa(out_vec[40:25]),
    .O_DScue(out_vec[24:17]),
    .O_CScue(out_vec[16:9]),
    .O_VMode(out_vec[8:1]),
    .O_IntSync(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'h23b;
    stim[1] = 12'h692;
    stim[2] = 12'h826;
    stim[3] = 12'h8ab;
    stim[4] = 12'h148;
    stim[5] = 12'h86c;
    stim[6] = 12'he92;
    stim[7] = 12'hc13;
    stim[8] = 12'hafd;
    stim[9] = 12'ha6a;
    stim[10] = 12'h888;
    stim[11] = 12'haa7;
    stim[12] = 12'h8e2;
    stim[13] = 12'hb9f;
    stim[14] = 12'ha00;
    stim[15] = 12'hd90;
    stim[16] = 12'haad;
    stim[17] = 12'hfa6;
    stim[18] = 12'hca5;
    stim[19] = 12'hb34;
    stim[20] = 12'h9b4;
    stim[21] = 12'h9d5;
    stim[22] = 12'hb02;
    stim[23] = 12'hce2;
    stim[24] = 12'h88d;
    stim[25] = 12'h8e2;
    stim[26] = 12'hed8;
    stim[27] = 12'hf3d;
    stim[28] = 12'h852;
    stim[29] = 12'h831;
    stim[30] = 12'hf8d;
    stim[31] = 12'hf4e;
    stim[32] = 12'h91e;
    stim[33] = 12'hf4a;
    stim[34] = 12'hee9;
    stim[35] = 12'hf8a;
    stim[36] = 12'hd7a;
    stim[37] = 12'hc6e;
    stim[38] = 12'hb50;
    stim[39] = 12'hb30;
    stim[40] = 12'h885;
    stim[41] = 12'hee9;
    stim[42] = 12'h2b1;
    stim[43] = 12'hde7;
    stim[44] = 12'hfb5;
    stim[45] = 12'hda3;
    stim[46] = 12'hc97;
    stim[47] = 12'hab8;
    stim[48] = 12'he91;
    stim[49] = 12'hfbd;
    stim[50] = 12'ha98;
    stim[51] = 12'hff5;
    stim[52] = 12'h82a;
    stim[53] = 12'h830;
    stim[54] = 12'h92c;
    stim[55] = 12'hec4;
    stim[56] = 12'hc8b;
    stim[57] = 12'h8ca;
    stim[58] = 12'haf3;
    stim[59] = 12'h897;
    stim[60] = 12'hc4f;
    stim[61] = 12'ha1b;
    stim[62] = 12'h9a1;
    stim[63] = 12'he6f;
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
      expv[0] = 121'h0000000000000000000000000000000;
      expv[1] = 121'h0000000000000000000000000000000;
      expv[2] = 121'h0000000000000000000000000000000;
      expv[3] = 121'h0000000000000000000000000000000;
      expv[4] = 121'h0000000000000000000000000000000;
      expv[5] = 121'h0000000000000000000000000000000;
      expv[6] = 121'h0000000000000000000000000000000;
      expv[7] = 121'h0000000000000000000000000000000;
      expv[8] = 121'h0000000000000000000000000000000;
      expv[9] = 121'h0000000000000000000000000000000;
      expv[10] = 121'h0000000000000000000000000000000;
      expv[11] = 121'h0000000000000000000000000000000;
      expv[12] = 121'h0000000000000000000000000000000;
      expv[13] = 121'h0000000000000000000000000000000;
      expv[14] = 121'h0000000000000000000000000000000;
      expv[15] = 121'h0000000000000000000000000000000;
      expv[16] = 121'h0000000000000000000000000000000;
      expv[17] = 121'h0000000000000000000000000000000;
      expv[18] = 121'h0000000000000000000000000000000;
      expv[19] = 121'h0000000000000000000000000000000;
      expv[20] = 121'h0000000000000000000000000000000;
      expv[21] = 121'h0000000000000000000000000000000;
      expv[22] = 121'h0000000000000000000000000000000;
      expv[23] = 121'h0000000000000000000000000000000;
      expv[24] = 121'h0000000000000000000000000000000;
      expv[25] = 121'h0000000000000000000000000000000;
      expv[26] = 121'h0000000000000000000000000000000;
      expv[27] = 121'h0000000000000000000000000000000;
      expv[28] = 121'h0000000000000000000000000000000;
      expv[29] = 121'h0000000000000000000000000000000;
      expv[30] = 121'h0000000000000000000000000000000;
      expv[31] = 121'h0000000000000000000000000000000;
      expv[32] = 121'h0000000000000000000000000000000;
      expv[33] = 121'h0000000000000000000000000000000;
      expv[34] = 121'h0000000000000000000000000000000;
      expv[35] = 121'h0000000000000000000000000000000;
      expv[36] = 121'h0000000000000000000000000000000;
      expv[37] = 121'h0000000000000000000000000000000;
      expv[38] = 121'h0000000000000000000000000000000;
      expv[39] = 121'h0000000000000000000000000000000;
      expv[40] = 121'h0000000000000000000000000000000;
      expv[41] = 121'h0000000000000000000000000000000;
      expv[42] = 121'h0000000000000000000000000000000;
      expv[43] = 121'h0000000000000000000000000000000;
      expv[44] = 121'h0000000000000000000000000000000;
      expv[45] = 121'h0000000000000000000000000000000;
      expv[46] = 121'h0000000000000000000000000000000;
      expv[47] = 121'h0000000000000000000000000000000;
      expv[48] = 121'h0000000000000000000000000000000;
      expv[49] = 121'h0000000000000000000000000000000;
      expv[50] = 121'h0000000000000000000000000000000;
      expv[51] = 121'h0000000000000000000000000000000;
      expv[52] = 121'h0000000000000000000000000000000;
      expv[53] = 121'h0000000000000000000000000000000;
      expv[54] = 121'h0000000000000000000000000000000;
      expv[55] = 121'h0000000000000000000000000000000;
      expv[56] = 121'h0000000000000000000000000000000;
      expv[57] = 121'h0000000000000000000000000000000;
      expv[58] = 121'h0000000000000000000000000000000;
      expv[59] = 121'h0000000000000000000000000000000;
      expv[60] = 121'h0000000000000000000000000000000;
      expv[61] = 121'h0000000000000000000000000000000;
      expv[62] = 121'h0000000000000000000000000000000;
      expv[63] = 121'h0000000000000000000000000000000;
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
