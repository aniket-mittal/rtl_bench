// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 35;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_102879 dut (
    .SD_clk(clk),
    .SD_dataout(in_vec[34:34]),
    .sec(in_vec[33:2]),
    .read_req(in_vec[1:1]),
    .init(in_vec[0:0]),
    .SD_cs(out_vec[16:16]),
    .SD_datain(out_vec[15:15]),
    .mydata_o(out_vec[14:7]),
    .myvalid_o(out_vec[6:6]),
    .data_come(out_vec[5:5]),
    .mystate(out_vec[4:1]),
    .read_o(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 35'h6cafae42f;
    stim[1] = 35'h08283036c;
    stim[2] = 35'h13745c486;
    stim[3] = 35'h4f5351638;
    stim[4] = 35'h6cde9cace;
    stim[5] = 35'h526424743;
    stim[6] = 35'h0fcf64b2f;
    stim[7] = 35'h484c3e6a4;
    stim[8] = 35'h2a8f41279;
    stim[9] = 35'h3389ef0f6;
    stim[10] = 35'h08a3c3ffb;
    stim[11] = 35'h174ef70b7;
    stim[12] = 35'h537f4b064;
    stim[13] = 35'h1492c7663;
    stim[14] = 35'h7648eca3e;
    stim[15] = 35'h2b70ca79b;
    stim[16] = 35'h224796dc6;
    stim[17] = 35'h169ea62f2;
    stim[18] = 35'h2525bd803;
    stim[19] = 35'h089a25757;
    stim[20] = 35'h2c982c04b;
    stim[21] = 35'h154a39065;
    stim[22] = 35'h438bfa2b8;
    stim[23] = 35'h0cd9d6f58;
    stim[24] = 35'h053b8a077;
    stim[25] = 35'h50f8e248e;
    stim[26] = 35'h25245f37c;
    stim[27] = 35'h30ea344e7;
    stim[28] = 35'h2d8e9547c;
    stim[29] = 35'h6290d95a8;
    stim[30] = 35'h0f3dc7b38;
    stim[31] = 35'h35ae72c0d;
    stim[32] = 35'h2513edf17;
    stim[33] = 35'h57ef1fd9c;
    stim[34] = 35'h28a079037;
    stim[35] = 35'h263f8c0f8;
    stim[36] = 35'h5725102bf;
    stim[37] = 35'h13cf7558d;
    stim[38] = 35'h3069b5d86;
    stim[39] = 35'h1ff5b7d79;
    stim[40] = 35'h6835cb5a6;
    stim[41] = 35'h64da7cdb2;
    stim[42] = 35'h38aad2937;
    stim[43] = 35'h0b2577f29;
    stim[44] = 35'h40ddc445e;
    stim[45] = 35'h0a8255b6e;
    stim[46] = 35'h1f97d2b25;
    stim[47] = 35'h3f7f2faa0;
    stim[48] = 35'h0329a9628;
    stim[49] = 35'h76ff10086;
    stim[50] = 35'h572b42c0b;
    stim[51] = 35'h4d3b5f431;
    stim[52] = 35'h138c737ca;
    stim[53] = 35'h1c23b815e;
    stim[54] = 35'h6f83f599b;
    stim[55] = 35'h1ea1b49c9;
    stim[56] = 35'h374411b32;
    stim[57] = 35'h417cfd3a5;
    stim[58] = 35'h1987e99f6;
    stim[59] = 35'h032248db2;
    stim[60] = 35'h13e903355;
    stim[61] = 35'h438c3cb56;
    stim[62] = 35'h421a9bcae;
    stim[63] = 35'h23f453994;
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
      expv[0] = 17'hxxxxx;
      expv[1] = 17'h1xxx2;
      expv[2] = 17'h18000;
      expv[3] = 17'h18000;
      expv[4] = 17'h18000;
      expv[5] = 17'h18000;
      expv[6] = 17'h18002;
      expv[7] = 17'h00002;
      expv[8] = 17'h18000;
      expv[9] = 17'h18000;
      expv[10] = 17'h18000;
      expv[11] = 17'h18002;
      expv[12] = 17'h00002;
      expv[13] = 17'h18000;
      expv[14] = 17'h18002;
      expv[15] = 17'h18000;
      expv[16] = 17'h18002;
      expv[17] = 17'h18000;
      expv[18] = 17'h18000;
      expv[19] = 17'h18002;
      expv[20] = 17'h00002;
      expv[21] = 17'h08002;
      expv[22] = 17'h00002;
      expv[23] = 17'h18000;
      expv[24] = 17'h18000;
      expv[25] = 17'h18002;
      expv[26] = 17'h18000;
      expv[27] = 17'h18000;
      expv[28] = 17'h18002;
      expv[29] = 17'h18000;
      expv[30] = 17'h18000;
      expv[31] = 17'h18000;
      expv[32] = 17'h18000;
      expv[33] = 17'h18002;
      expv[34] = 17'h18000;
      expv[35] = 17'h18002;
      expv[36] = 17'h18000;
      expv[37] = 17'h18002;
      expv[38] = 17'h00002;
      expv[39] = 17'h18000;
      expv[40] = 17'h18000;
      expv[41] = 17'h18000;
      expv[42] = 17'h18000;
      expv[43] = 17'h18002;
      expv[44] = 17'h00002;
      expv[45] = 17'h18000;
      expv[46] = 17'h18000;
      expv[47] = 17'h18000;
      expv[48] = 17'h18000;
      expv[49] = 17'h18000;
      expv[50] = 17'h18000;
      expv[51] = 17'h18002;
      expv[52] = 17'h00002;
      expv[53] = 17'h18000;
      expv[54] = 17'h18000;
      expv[55] = 17'h18002;
      expv[56] = 17'h00002;
      expv[57] = 17'h18000;
      expv[58] = 17'h18000;
      expv[59] = 17'h18000;
      expv[60] = 17'h18000;
      expv[61] = 17'h18000;
      expv[62] = 17'h18000;
      expv[63] = 17'h18000;
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
