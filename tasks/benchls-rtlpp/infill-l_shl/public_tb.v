// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 50;
  localparam OW = 34;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  L_shl dut (
    .clk(clk),
    .reset(in_vec[49:49]),
    .ready(in_vec[48:48]),
    .var1(in_vec[47:16]),
    .numShift(in_vec[15:0]),
    .done(out_vec[33:33]),
    .overflow(out_vec[32:32]),
    .out(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 50'h231a3e651d037;
    stim[1] = 50'h2545586ecccac;
    stim[2] = 50'h09903f4647c14;
    stim[3] = 50'h11ae6eb20253f;
    stim[4] = 50'h14bb82de91906;
    stim[5] = 50'h03e941ba91b0f;
    stim[6] = 50'h083e4dda87e0b;
    stim[7] = 50'h187d67c8987b7;
    stim[8] = 50'h180eb17cc22bd;
    stim[9] = 50'h1d587b8fcc5dc;
    stim[10] = 50'h16082fec18b41;
    stim[11] = 50'h0a91cdce85586;
    stim[12] = 50'h1b804b5dbc887;
    stim[13] = 50'h062f138cfa7b1;
    stim[14] = 50'h1cfc43519b7ef;
    stim[15] = 50'h1121ecc030616;
    stim[16] = 50'h130764829e352;
    stim[17] = 50'h10a125ccce776;
    stim[18] = 50'h0045573989461;
    stim[19] = 50'h1e279dd0c0755;
    stim[20] = 50'h1d9f43c1ba4a2;
    stim[21] = 50'h0436c56cbbb87;
    stim[22] = 50'h16603481dab39;
    stim[23] = 50'h144b395c31874;
    stim[24] = 50'h167bda7a0b560;
    stim[25] = 50'h072bd5e9dccfb;
    stim[26] = 50'h159d88ebe15b4;
    stim[27] = 50'h0b093c64077f7;
    stim[28] = 50'h03fa6b1483745;
    stim[29] = 50'h00813fce72d1a;
    stim[30] = 50'h077ef711d3e64;
    stim[31] = 50'h1d94519f349b1;
    stim[32] = 50'h1c1a32df7bf55;
    stim[33] = 50'h0c29b5787a67f;
    stim[34] = 50'h1f5ff3a8dea4b;
    stim[35] = 50'h025da144bea4b;
    stim[36] = 50'h0edb50aec2662;
    stim[37] = 50'h005ff3af90c4e;
    stim[38] = 50'h0b27ddf173079;
    stim[39] = 50'h083d3ad205a37;
    stim[40] = 50'h0103ac92e6121;
    stim[41] = 50'h0b1604395bc46;
    stim[42] = 50'h11e1edd896227;
    stim[43] = 50'h0be88422483ef;
    stim[44] = 50'h0f74f6278ab22;
    stim[45] = 50'h1e70431992ebc;
    stim[46] = 50'h06acaba645676;
    stim[47] = 50'h06dbc93a4436a;
    stim[48] = 50'h1c32b88fad026;
    stim[49] = 50'h19ed8ee39072e;
    stim[50] = 50'h183176ce45dfa;
    stim[51] = 50'h1203129108c92;
    stim[52] = 50'h145fe191301b6;
    stim[53] = 50'h09c8f2ccb7175;
    stim[54] = 50'h1602b4db0ff77;
    stim[55] = 50'h0bfde38a0ef5e;
    stim[56] = 50'h197fe279d5146;
    stim[57] = 50'h0dea617807f22;
    stim[58] = 50'h0ada744a5fbea;
    stim[59] = 50'h2117843a2d262;
    stim[60] = 50'h1650950bf378a;
    stim[61] = 50'h089304c54f477;
    stim[62] = 50'h10bbb0b7c67c3;
    stim[63] = 50'h0a7525d854ffe;
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
      expv[0] = 34'h000000000;
      expv[1] = 34'h000000000;
      expv[2] = 34'h000000000;
      expv[3] = 34'h000000000;
      expv[4] = 34'h200000000;
      expv[5] = 34'h200000000;
      expv[6] = 34'h200000000;
      expv[7] = 34'h200000000;
      expv[8] = 34'h200000000;
      expv[9] = 34'h200000000;
      expv[10] = 34'h200000000;
      expv[11] = 34'h200000000;
      expv[12] = 34'h200000000;
      expv[13] = 34'h200000000;
      expv[14] = 34'h200000000;
      expv[15] = 34'h200000000;
      expv[16] = 34'h200000000;
      expv[17] = 34'h200000000;
      expv[18] = 34'h200000000;
      expv[19] = 34'h200000000;
      expv[20] = 34'h200000000;
      expv[21] = 34'h200000000;
      expv[22] = 34'h200000000;
      expv[23] = 34'h200000000;
      expv[24] = 34'h200000000;
      expv[25] = 34'h200000000;
      expv[26] = 34'h200000000;
      expv[27] = 34'h200000000;
      expv[28] = 34'h200000000;
      expv[29] = 34'h200000000;
      expv[30] = 34'h200000000;
      expv[31] = 34'h200000000;
      expv[32] = 34'h200000000;
      expv[33] = 34'h200000000;
      expv[34] = 34'h200000000;
      expv[35] = 34'h200000000;
      expv[36] = 34'h200000000;
      expv[37] = 34'h200000000;
      expv[38] = 34'h200000000;
      expv[39] = 34'h200000000;
      expv[40] = 34'h200000000;
      expv[41] = 34'h200000000;
      expv[42] = 34'h200000000;
      expv[43] = 34'h200000000;
      expv[44] = 34'h200000000;
      expv[45] = 34'h200000000;
      expv[46] = 34'h200000000;
      expv[47] = 34'h200000000;
      expv[48] = 34'h200000000;
      expv[49] = 34'h200000000;
      expv[50] = 34'h200000000;
      expv[51] = 34'h200000000;
      expv[52] = 34'h200000000;
      expv[53] = 34'h200000000;
      expv[54] = 34'h200000000;
      expv[55] = 34'h200000000;
      expv[56] = 34'h200000000;
      expv[57] = 34'h200000000;
      expv[58] = 34'h200000000;
      expv[59] = 34'h000000000;
      expv[60] = 34'h000000000;
      expv[61] = 34'h200000000;
      expv[62] = 34'h200000000;
      expv[63] = 34'h200000000;
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
