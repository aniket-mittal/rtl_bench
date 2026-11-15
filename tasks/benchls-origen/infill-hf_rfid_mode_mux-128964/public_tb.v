// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_128964 dut (
    .clk(clk),
    .rst_n(in_vec[11:11]),
    .mode_select(in_vec[10:8]),
    .adc_data(in_vec[7:0]),
    .output_data(out_vec[9:2]),
    .output_valid(out_vec[1:1]),
    .adc_enable(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'h4d3;
    stim[1] = 12'h7ec;
    stim[2] = 12'hb77;
    stim[3] = 12'hf45;
    stim[4] = 12'hf59;
    stim[5] = 12'hb54;
    stim[6] = 12'ha99;
    stim[7] = 12'hef9;
    stim[8] = 12'hfea;
    stim[9] = 12'h93d;
    stim[10] = 12'hea9;
    stim[11] = 12'h804;
    stim[12] = 12'h808;
    stim[13] = 12'ha80;
    stim[14] = 12'he80;
    stim[15] = 12'h886;
    stim[16] = 12'hd64;
    stim[17] = 12'h926;
    stim[18] = 12'hd00;
    stim[19] = 12'h9a9;
    stim[20] = 12'hac6;
    stim[21] = 12'hdb5;
    stim[22] = 12'he8c;
    stim[23] = 12'ha66;
    stim[24] = 12'hf1f;
    stim[25] = 12'he4a;
    stim[26] = 12'h91e;
    stim[27] = 12'h93b;
    stim[28] = 12'ha4d;
    stim[29] = 12'hc53;
    stim[30] = 12'hd57;
    stim[31] = 12'ha4a;
    stim[32] = 12'hf52;
    stim[33] = 12'hf40;
    stim[34] = 12'h936;
    stim[35] = 12'hf56;
    stim[36] = 12'haa6;
    stim[37] = 12'h905;
    stim[38] = 12'h63a;
    stim[39] = 12'hfc8;
    stim[40] = 12'h9b1;
    stim[41] = 12'h973;
    stim[42] = 12'hf1d;
    stim[43] = 12'hbdb;
    stim[44] = 12'h93b;
    stim[45] = 12'hb5d;
    stim[46] = 12'ha16;
    stim[47] = 12'he26;
    stim[48] = 12'hddd;
    stim[49] = 12'hf17;
    stim[50] = 12'hc27;
    stim[51] = 12'hefc;
    stim[52] = 12'hcbe;
    stim[53] = 12'h3b6;
    stim[54] = 12'hc4c;
    stim[55] = 12'haaf;
    stim[56] = 12'hec4;
    stim[57] = 12'hb6d;
    stim[58] = 12'h849;
    stim[59] = 12'ha25;
    stim[60] = 12'ha52;
    stim[61] = 12'ha6d;
    stim[62] = 12'h5b1;
    stim[63] = 12'h80e;
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
      expv[0] = 10'h001;
      expv[1] = 10'h001;
      expv[2] = 10'h001;
      expv[3] = 10'h001;
      expv[4] = 10'h001;
      expv[5] = 10'h173;
      expv[6] = 10'h15b;
      expv[7] = 10'h001;
      expv[8] = 10'h001;
      expv[9] = 10'h3af;
      expv[10] = 10'h001;
      expv[11] = 10'h2a7;
      expv[12] = 10'h013;
      expv[13] = 10'h02b;
      expv[14] = 10'h001;
      expv[15] = 10'h203;
      expv[16] = 10'h000;
      expv[17] = 10'h197;
      expv[18] = 10'h000;
      expv[19] = 10'h007;
      expv[20] = 10'h2af;
      expv[21] = 10'h000;
      expv[22] = 10'h001;
      expv[23] = 10'h23b;
      expv[24] = 10'h001;
      expv[25] = 10'h001;
      expv[26] = 10'h12f;
      expv[27] = 10'h07f;
      expv[28] = 10'h0f7;
      expv[29] = 10'h147;
      expv[30] = 10'h000;
      expv[31] = 10'h167;
      expv[32] = 10'h001;
      expv[33] = 10'h001;
      expv[34] = 10'h107;
      expv[35] = 10'h001;
      expv[36] = 10'h163;
      expv[37] = 10'h29f;
      expv[38] = 10'h001;
      expv[39] = 10'h001;
      expv[40] = 10'h327;
      expv[41] = 10'h2cb;
      expv[42] = 10'h001;
      expv[43] = 10'h083;
      expv[44] = 10'h373;
      expv[45] = 10'h0fb;
      expv[46] = 10'h17f;
      expv[47] = 10'h001;
      expv[48] = 10'h000;
      expv[49] = 10'h001;
      expv[50] = 10'h06f;
      expv[51] = 10'h001;
      expv[52] = 10'h003;
      expv[53] = 10'h001;
      expv[54] = 10'h001;
      expv[55] = 10'h13b;
      expv[56] = 10'h001;
      expv[57] = 10'h31f;
      expv[58] = 10'h1b7;
      expv[59] = 10'h12f;
      expv[60] = 10'h09f;
      expv[61] = 10'h153;
      expv[62] = 10'h000;
      expv[63] = 10'h001;
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
