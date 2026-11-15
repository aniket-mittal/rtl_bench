// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 48;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_01666 dut (
    .imm12(in_vec[11:0]),
    .str(out_vec[47:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'hf2e;
    stim[1] = 12'h380;
    stim[2] = 12'h015;
    stim[3] = 12'ha42;
    stim[4] = 12'h0b6;
    stim[5] = 12'hf49;
    stim[6] = 12'he61;
    stim[7] = 12'h09a;
    stim[8] = 12'h960;
    stim[9] = 12'h9d8;
    stim[10] = 12'hc6c;
    stim[11] = 12'h828;
    stim[12] = 12'he9e;
    stim[13] = 12'hd70;
    stim[14] = 12'hc2a;
    stim[15] = 12'he0d;
    stim[16] = 12'h997;
    stim[17] = 12'hfe7;
    stim[18] = 12'hd37;
    stim[19] = 12'h739;
    stim[20] = 12'h62e;
    stim[21] = 12'h981;
    stim[22] = 12'hfdb;
    stim[23] = 12'hd1d;
    stim[24] = 12'h32c;
    stim[25] = 12'h34d;
    stim[26] = 12'h7d6;
    stim[27] = 12'hfba;
    stim[28] = 12'h4c8;
    stim[29] = 12'h326;
    stim[30] = 12'h65c;
    stim[31] = 12'ha00;
    stim[32] = 12'he4c;
    stim[33] = 12'hd4e;
    stim[34] = 12'ha48;
    stim[35] = 12'hc41;
    stim[36] = 12'h9e8;
    stim[37] = 12'h6e0;
    stim[38] = 12'h1b8;
    stim[39] = 12'h7cd;
    stim[40] = 12'h471;
    stim[41] = 12'h24f;
    stim[42] = 12'h93c;
    stim[43] = 12'h6a8;
    stim[44] = 12'hb67;
    stim[45] = 12'hb5d;
    stim[46] = 12'h084;
    stim[47] = 12'h700;
    stim[48] = 12'hd0a;
    stim[49] = 12'hce3;
    stim[50] = 12'h7a2;
    stim[51] = 12'h671;
    stim[52] = 12'hba7;
    stim[53] = 12'hbd1;
    stim[54] = 12'h0f7;
    stim[55] = 12'h791;
    stim[56] = 12'hcb8;
    stim[57] = 12'h442;
    stim[58] = 12'he16;
    stim[59] = 12'heee;
    stim[60] = 12'h86c;
    stim[61] = 12'hec0;
    stim[62] = 12'h064;
    stim[63] = 12'h5a6;
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
      expv[0] = 48'h2d3078304432;
      expv[1] = 48'h203078333830;
      expv[2] = 48'h203078303135;
      expv[3] = 48'h2d3078354245;
      expv[4] = 48'h203078304236;
      expv[5] = 48'h2d3078304237;
      expv[6] = 48'h2d3078313946;
      expv[7] = 48'h203078303941;
      expv[8] = 48'h2d3078364130;
      expv[9] = 48'h2d3078363238;
      expv[10] = 48'h2d3078333934;
      expv[11] = 48'h2d3078374438;
      expv[12] = 48'h2d3078313632;
      expv[13] = 48'h2d3078323930;
      expv[14] = 48'h2d3078334436;
      expv[15] = 48'h2d3078314633;
      expv[16] = 48'h2d3078363639;
      expv[17] = 48'h2d3078303139;
      expv[18] = 48'h2d3078324339;
      expv[19] = 48'h203078373339;
      expv[20] = 48'h203078363245;
      expv[21] = 48'h2d3078363746;
      expv[22] = 48'h2d3078303235;
      expv[23] = 48'h2d3078324533;
      expv[24] = 48'h203078333243;
      expv[25] = 48'h203078333444;
      expv[26] = 48'h203078374436;
      expv[27] = 48'h2d3078303436;
      expv[28] = 48'h203078344338;
      expv[29] = 48'h203078333236;
      expv[30] = 48'h203078363543;
      expv[31] = 48'h2d3078363030;
      expv[32] = 48'h2d3078314234;
      expv[33] = 48'h2d3078324232;
      expv[34] = 48'h2d3078354238;
      expv[35] = 48'h2d3078334246;
      expv[36] = 48'h2d3078363138;
      expv[37] = 48'h203078364530;
      expv[38] = 48'h203078314238;
      expv[39] = 48'h203078374344;
      expv[40] = 48'h203078343731;
      expv[41] = 48'h203078323446;
      expv[42] = 48'h2d3078364334;
      expv[43] = 48'h203078364138;
      expv[44] = 48'h2d3078343939;
      expv[45] = 48'h2d3078344133;
      expv[46] = 48'h203078303834;
      expv[47] = 48'h203078373030;
      expv[48] = 48'h2d3078324636;
      expv[49] = 48'h2d3078333144;
      expv[50] = 48'h203078374132;
      expv[51] = 48'h203078363731;
      expv[52] = 48'h2d3078343539;
      expv[53] = 48'h2d3078343246;
      expv[54] = 48'h203078304637;
      expv[55] = 48'h203078373931;
      expv[56] = 48'h2d3078333438;
      expv[57] = 48'h203078343432;
      expv[58] = 48'h2d3078314541;
      expv[59] = 48'h2d3078313132;
      expv[60] = 48'h2d3078373934;
      expv[61] = 48'h2d3078313430;
      expv[62] = 48'h203078303634;
      expv[63] = 48'h203078354136;
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
