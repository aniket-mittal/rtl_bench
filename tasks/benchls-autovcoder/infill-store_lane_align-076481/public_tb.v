// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 36;
  localparam OW = 36;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_076481 dut (
    .addrtail(in_vec[35:34]),
    .width(in_vec[33:32]),
    .inval(in_vec[31:0]),
    .out_wbyte_enable(out_vec[35:32]),
    .outval(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 36'ha3735e26f;
    stim[1] = 36'hf4fc8537e;
    stim[2] = 36'h2e4fa3dc5;
    stim[3] = 36'h722bd2d52;
    stim[4] = 36'he98d56577;
    stim[5] = 36'h4079651a9;
    stim[6] = 36'hd788b86f6;
    stim[7] = 36'h6614d6925;
    stim[8] = 36'h425bf2226;
    stim[9] = 36'h577789dea;
    stim[10] = 36'h53c033e60;
    stim[11] = 36'h9cf378912;
    stim[12] = 36'hff8202538;
    stim[13] = 36'h5813d2f69;
    stim[14] = 36'h2e346cabc;
    stim[15] = 36'h308c17498;
    stim[16] = 36'h3d513a2cb;
    stim[17] = 36'haf411deee;
    stim[18] = 36'ha2410fac3;
    stim[19] = 36'h2072e4b93;
    stim[20] = 36'h804ec96f6;
    stim[21] = 36'h9af014d38;
    stim[22] = 36'h00e6b77ef;
    stim[23] = 36'h9533009af;
    stim[24] = 36'h004cd36ad;
    stim[25] = 36'h1e35685ce;
    stim[26] = 36'h582f87aa6;
    stim[27] = 36'habc1ca105;
    stim[28] = 36'hbff8e0b75;
    stim[29] = 36'h62d0ad7f7;
    stim[30] = 36'h70d983d61;
    stim[31] = 36'h56027c3b0;
    stim[32] = 36'h2e1f195a5;
    stim[33] = 36'h3fa220e24;
    stim[34] = 36'h0f2350cb9;
    stim[35] = 36'h577ed3b16;
    stim[36] = 36'h0ff0396a8;
    stim[37] = 36'h9e6145194;
    stim[38] = 36'hab6524604;
    stim[39] = 36'hffa0501e2;
    stim[40] = 36'h91ccf570b;
    stim[41] = 36'h0f118e337;
    stim[42] = 36'h6fbf57696;
    stim[43] = 36'h1d9087700;
    stim[44] = 36'h0c5142e6b;
    stim[45] = 36'h760847be0;
    stim[46] = 36'ha60eb337f;
    stim[47] = 36'hd7c2eba3b;
    stim[48] = 36'hdeacebdba;
    stim[49] = 36'hf3ecec960;
    stim[50] = 36'h28341dda3;
    stim[51] = 36'h449379610;
    stim[52] = 36'h80fff1bef;
    stim[53] = 36'h3ab64e47d;
    stim[54] = 36'hc173dbd5d;
    stim[55] = 36'h96d481f85;
    stim[56] = 36'hdf823d16b;
    stim[57] = 36'hcc9edf3eb;
    stim[58] = 36'hcebb5975d;
    stim[59] = 36'h51b4712f3;
    stim[60] = 36'h4531a1a59;
    stim[61] = 36'h6ad4d6ef3;
    stim[62] = 36'h3378053c6;
    stim[63] = 36'h4df9af71e;
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
      expv[0] = 36'h000000000;
      expv[1] = 36'h000000000;
      expv[2] = 36'h000000000;
      expv[3] = 36'h000000000;
      expv[4] = 36'h000000000;
      expv[5] = 36'h000000000;
      expv[6] = 36'h8f6000000;
      expv[7] = 36'h000000000;
      expv[8] = 36'h000000000;
      expv[9] = 36'h20000ea00;
      expv[10] = 36'h200006000;
      expv[11] = 36'h400120000;
      expv[12] = 36'h000000000;
      expv[13] = 36'h200006900;
      expv[14] = 36'h000000000;
      expv[15] = 36'hf08c17498;
      expv[16] = 36'hfd513a2cb;
      expv[17] = 36'h000000000;
      expv[18] = 36'h000000000;
      expv[19] = 36'h000000000;
      expv[20] = 36'h000000000;
      expv[21] = 36'h400380000;
      expv[22] = 36'h000000000;
      expv[23] = 36'h400af0000;
      expv[24] = 36'h000000000;
      expv[25] = 36'h1000000ce;
      expv[26] = 36'h20000a600;
      expv[27] = 36'h000000000;
      expv[28] = 36'h000000000;
      expv[29] = 36'h000000000;
      expv[30] = 36'h000000000;
      expv[31] = 36'h20000b000;
      expv[32] = 36'h000000000;
      expv[33] = 36'hffa220e24;
      expv[34] = 36'h000000000;
      expv[35] = 36'h200001600;
      expv[36] = 36'h000000000;
      expv[37] = 36'h400940000;
      expv[38] = 36'h000000000;
      expv[39] = 36'h000000000;
      expv[40] = 36'h4000b0000;
      expv[41] = 36'h000000000;
      expv[42] = 36'h000000000;
      expv[43] = 36'h100000000;
      expv[44] = 36'h000000000;
      expv[45] = 36'h000000000;
      expv[46] = 36'h000000000;
      expv[47] = 36'h83b000000;
      expv[48] = 36'h8ba000000;
      expv[49] = 36'h000000000;
      expv[50] = 36'h000000000;
      expv[51] = 36'h000000000;
      expv[52] = 36'h000000000;
      expv[53] = 36'hfab64e47d;
      expv[54] = 36'h000000000;
      expv[55] = 36'h400850000;
      expv[56] = 36'h86b000000;
      expv[57] = 36'h000000000;
      expv[58] = 36'h000000000;
      expv[59] = 36'h20000f300;
      expv[60] = 36'h000000000;
      expv[61] = 36'h000000000;
      expv[62] = 36'hf378053c6;
      expv[63] = 36'h000000000;
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
