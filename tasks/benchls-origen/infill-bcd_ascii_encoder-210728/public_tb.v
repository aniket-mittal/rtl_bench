// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 24;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_210728 dut (
    .out_BCD1(in_vec[11:8]),
    .out_BCD2(in_vec[7:4]),
    .out_BCD3(in_vec[3:0]),
    .enco1(out_vec[23:16]),
    .enco2(out_vec[15:8]),
    .enco3(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'haac;
    stim[1] = 12'h5cb;
    stim[2] = 12'h871;
    stim[3] = 12'h744;
    stim[4] = 12'h4c6;
    stim[5] = 12'hd38;
    stim[6] = 12'h8fe;
    stim[7] = 12'h0c3;
    stim[8] = 12'ha8e;
    stim[9] = 12'hc05;
    stim[10] = 12'h778;
    stim[11] = 12'hdae;
    stim[12] = 12'h279;
    stim[13] = 12'h5f4;
    stim[14] = 12'h945;
    stim[15] = 12'h219;
    stim[16] = 12'h0f9;
    stim[17] = 12'ha9a;
    stim[18] = 12'hd88;
    stim[19] = 12'h7d8;
    stim[20] = 12'h887;
    stim[21] = 12'h164;
    stim[22] = 12'hcca;
    stim[23] = 12'h1b1;
    stim[24] = 12'h8c9;
    stim[25] = 12'hc83;
    stim[26] = 12'h6ae;
    stim[27] = 12'ha1f;
    stim[28] = 12'hcf5;
    stim[29] = 12'h956;
    stim[30] = 12'h5d9;
    stim[31] = 12'he08;
    stim[32] = 12'h15e;
    stim[33] = 12'h217;
    stim[34] = 12'h222;
    stim[35] = 12'h07d;
    stim[36] = 12'h5bc;
    stim[37] = 12'h698;
    stim[38] = 12'ha79;
    stim[39] = 12'hc7a;
    stim[40] = 12'hd68;
    stim[41] = 12'hbe6;
    stim[42] = 12'h98f;
    stim[43] = 12'hd6d;
    stim[44] = 12'h479;
    stim[45] = 12'hb75;
    stim[46] = 12'h387;
    stim[47] = 12'h943;
    stim[48] = 12'h6c5;
    stim[49] = 12'h05b;
    stim[50] = 12'hd3e;
    stim[51] = 12'h673;
    stim[52] = 12'h917;
    stim[53] = 12'hfca;
    stim[54] = 12'hca7;
    stim[55] = 12'he5b;
    stim[56] = 12'h8a7;
    stim[57] = 12'hbbc;
    stim[58] = 12'h990;
    stim[59] = 12'h987;
    stim[60] = 12'h679;
    stim[61] = 12'h5d4;
    stim[62] = 12'hd5c;
    stim[63] = 12'hb2b;
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
      expv[0] = 24'h303030;
      expv[1] = 24'h353030;
      expv[2] = 24'h383731;
      expv[3] = 24'h373434;
      expv[4] = 24'h343036;
      expv[5] = 24'h303338;
      expv[6] = 24'h383030;
      expv[7] = 24'h303033;
      expv[8] = 24'h303830;
      expv[9] = 24'h303035;
      expv[10] = 24'h373738;
      expv[11] = 24'h303030;
      expv[12] = 24'h323739;
      expv[13] = 24'h353034;
      expv[14] = 24'h393435;
      expv[15] = 24'h323139;
      expv[16] = 24'h303039;
      expv[17] = 24'h303930;
      expv[18] = 24'h303838;
      expv[19] = 24'h373038;
      expv[20] = 24'h383837;
      expv[21] = 24'h313634;
      expv[22] = 24'h303030;
      expv[23] = 24'h313031;
      expv[24] = 24'h383039;
      expv[25] = 24'h303833;
      expv[26] = 24'h363030;
      expv[27] = 24'h303130;
      expv[28] = 24'h303035;
      expv[29] = 24'h393536;
      expv[30] = 24'h353039;
      expv[31] = 24'h303038;
      expv[32] = 24'h313530;
      expv[33] = 24'h323137;
      expv[34] = 24'h323232;
      expv[35] = 24'h303730;
      expv[36] = 24'h353030;
      expv[37] = 24'h363938;
      expv[38] = 24'h303739;
      expv[39] = 24'h303730;
      expv[40] = 24'h303638;
      expv[41] = 24'h303036;
      expv[42] = 24'h393830;
      expv[43] = 24'h303630;
      expv[44] = 24'h343739;
      expv[45] = 24'h303735;
      expv[46] = 24'h333837;
      expv[47] = 24'h393433;
      expv[48] = 24'h363035;
      expv[49] = 24'h303530;
      expv[50] = 24'h303330;
      expv[51] = 24'h363733;
      expv[52] = 24'h393137;
      expv[53] = 24'h303030;
      expv[54] = 24'h303037;
      expv[55] = 24'h303530;
      expv[56] = 24'h383037;
      expv[57] = 24'h303030;
      expv[58] = 24'h393930;
      expv[59] = 24'h393837;
      expv[60] = 24'h363739;
      expv[61] = 24'h353034;
      expv[62] = 24'h303530;
      expv[63] = 24'h303230;
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
