// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 31;
  localparam OW = 36;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_09671 dut (
    .clk(clk),
    .rstn(in_vec[30:30]),
    .tic_enable(in_vec[29:29]),
    .f_control(in_vec[28:0]),
    .carrier_val(out_vec[35:4]),
    .i_sign(out_vec[3:3]),
    .i_mag(out_vec[2:2]),
    .q_sign(out_vec[1:1]),
    .q_mag(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 31'h20e0673f;
    stim[1] = 31'h3447d82f;
    stim[2] = 31'h5071a6d1;
    stim[3] = 31'h4b5ab194;
    stim[4] = 31'h55e68bdc;
    stim[5] = 31'h6433347c;
    stim[6] = 31'h7f77ff98;
    stim[7] = 31'h7577bcbf;
    stim[8] = 31'h6667e79d;
    stim[9] = 31'h65a65291;
    stim[10] = 31'h63babea9;
    stim[11] = 31'h74ae08c1;
    stim[12] = 31'h6c57dd43;
    stim[13] = 31'h66ba41f8;
    stim[14] = 31'h0de2bd8c;
    stim[15] = 31'h62ca7dc9;
    stim[16] = 31'h6ceb15b6;
    stim[17] = 31'h76665151;
    stim[18] = 31'h5931073d;
    stim[19] = 31'h47f19f57;
    stim[20] = 31'h5e67c10c;
    stim[21] = 31'h650b370b;
    stim[22] = 31'h70e04579;
    stim[23] = 31'h4b6540fe;
    stim[24] = 31'h4d7e689a;
    stim[25] = 31'h570133fd;
    stim[26] = 31'h69ff1517;
    stim[27] = 31'h739a017c;
    stim[28] = 31'h719898e5;
    stim[29] = 31'h5b32e7f3;
    stim[30] = 31'h6652b684;
    stim[31] = 31'h73ebc5b5;
    stim[32] = 31'h462339b6;
    stim[33] = 31'h5ba18f00;
    stim[34] = 31'h7b5f8682;
    stim[35] = 31'h5c8f3052;
    stim[36] = 31'h787043db;
    stim[37] = 31'h77959eed;
    stim[38] = 31'h50e25822;
    stim[39] = 31'h6f3406dc;
    stim[40] = 31'h5a108bce;
    stim[41] = 31'h4ebf0fef;
    stim[42] = 31'h52140ed3;
    stim[43] = 31'h74022a6a;
    stim[44] = 31'h5b60825c;
    stim[45] = 31'h6e7da9e6;
    stim[46] = 31'h58ff440b;
    stim[47] = 31'h50e618cc;
    stim[48] = 31'h4f330483;
    stim[49] = 31'h5cb87b1a;
    stim[50] = 31'h4d337372;
    stim[51] = 31'h401b0e25;
    stim[52] = 31'h4b8b2503;
    stim[53] = 31'h4c9a6faa;
    stim[54] = 31'h5e940dbf;
    stim[55] = 31'h7fb2c66f;
    stim[56] = 31'h530b628f;
    stim[57] = 31'h45b47e26;
    stim[58] = 31'h5d08cfc0;
    stim[59] = 31'h772ee34a;
    stim[60] = 31'h62b9e88d;
    stim[61] = 31'h7860a18f;
    stim[62] = 31'h4bbb7a4a;
    stim[63] = 31'h79b6328d;
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
      expv[0] = 36'hxxxxxxxxx;
      expv[1] = 36'hxxxxxxxxc;
      expv[2] = 36'hxxxxxxxxe;
      expv[3] = 36'hxxxxxxxxc;
      expv[4] = 36'hxxxxxxxx4;
      expv[5] = 36'hxxxxxxxx6;
      expv[6] = 36'h0000031bc;
      expv[7] = 36'h0000035e1;
      expv[8] = 36'h000001554;
      expv[9] = 36'h000002ad6;
      expv[10] = 36'h000003136;
      expv[11] = 36'h0000036ee;
      expv[12] = 36'h000003a9c;
      expv[13] = 36'h000000f49;
      expv[14] = 36'h000001ba4;
      expv[15] = 36'h000001ba3;
      expv[16] = 36'h00000000e;
      expv[17] = 36'h0000002c1;
      expv[18] = 36'h000000fb3;
      expv[19] = 36'h000000fbb;
      expv[20] = 36'h000000fb1;
      expv[21] = 36'h000000fb1;
      expv[22] = 36'h0000065a6;
      expv[23] = 36'h000002abb;
      expv[24] = 36'h000002abc;
      expv[25] = 36'h000002ab1;
      expv[26] = 36'h000002ab6;
      expv[27] = 36'h000006b7b;
      expv[28] = 36'h00000357c;
      expv[29] = 36'h000000906;
      expv[30] = 36'h000000903;
      expv[31] = 36'h0000035de;
      expv[32] = 36'h000003c2c;
      expv[33] = 36'h000003c24;
      expv[34] = 36'h000003c2e;
      expv[35] = 36'h0000031d1;
      expv[36] = 36'h0000031d3;
      expv[37] = 36'h0000029cc;
      expv[38] = 36'h000000231;
      expv[39] = 36'h000000236;
      expv[40] = 36'h000002abe;
      expv[41] = 36'h000002ab9;
      expv[42] = 36'h000002ab6;
      expv[43] = 36'h000002abb;
      expv[44] = 36'h0000074c1;
      expv[45] = 36'h0000074c4;
      expv[46] = 36'h00000242b;
      expv[47] = 36'h000002429;
      expv[48] = 36'h000002421;
      expv[49] = 36'h00000242b;
      expv[50] = 36'h00000242c;
      expv[51] = 36'h00000242c;
      expv[52] = 36'h000002429;
      expv[53] = 36'h000002424;
      expv[54] = 36'h00000242e;
      expv[55] = 36'h000002424;
      expv[56] = 36'h00000cc83;
      expv[57] = 36'h00000cc8b;
      expv[58] = 36'h00000cc89;
      expv[59] = 36'h00000cc86;
      expv[60] = 36'h000006206;
      expv[61] = 36'h00000393c;
      expv[62] = 36'h000003be9;
      expv[63] = 36'h000003be6;
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
