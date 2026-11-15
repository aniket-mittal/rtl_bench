// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 53;
  localparam OW = 35;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_01172 dut (
    .Bus2IP_Clk(clk),
    .Bus2IP_Reset(in_vec[52:52]),
    .Bus2IP_Data(in_vec[51:20]),
    .Bus2IP_BE(in_vec[19:16]),
    .Bus2IP_RdCE(in_vec[15:8]),
    .Bus2IP_WrCE(in_vec[7:0]),
    .IP2Bus_Data(out_vec[34:3]),
    .IP2Bus_RdAck(out_vec[2:2]),
    .IP2Bus_WrAck(out_vec[1:1]),
    .IP2Bus_Error(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 53'h1cc373496ec269;
    stim[1] = 53'h1ad99b6d0aed03;
    stim[2] = 53'h0fbcb832c42f35;
    stim[3] = 53'h08bd05fe8c8e3b;
    stim[4] = 53'h078743c5482b48;
    stim[5] = 53'h05fd42fe28bab6;
    stim[6] = 53'h0a16d77019b663;
    stim[7] = 53'h025f60d02192b7;
    stim[8] = 53'h1a49e9de78b181;
    stim[9] = 53'h0cf1604df60a60;
    stim[10] = 53'h065e9175644ffc;
    stim[11] = 53'h0ce1c30a87146c;
    stim[12] = 53'h0705846c442734;
    stim[13] = 53'h0b3f5883ebc790;
    stim[14] = 53'h02fdbe8e224eb6;
    stim[15] = 53'h0927870483b06b;
    stim[16] = 53'h071a00d38ca8d4;
    stim[17] = 53'h07a14de58659e0;
    stim[18] = 53'h0e2d1f3eb959e0;
    stim[19] = 53'h0dd5a82e7b60c2;
    stim[20] = 53'h0cb4b7e013e43e;
    stim[21] = 53'h0866c4c1f7bbe1;
    stim[22] = 53'h0a5aa8350234d3;
    stim[23] = 53'h001858f390317e;
    stim[24] = 53'h03a9c598305a18;
    stim[25] = 53'h06da768b66122b;
    stim[26] = 53'h0743eef1b95a54;
    stim[27] = 53'h01c3e536f34fe4;
    stim[28] = 53'h0cbf33f599bca7;
    stim[29] = 53'h0c948fd2faa0cf;
    stim[30] = 53'h0f222494c240e9;
    stim[31] = 53'h0b4a00df1dc0a6;
    stim[32] = 53'h00557c7bac0e3e;
    stim[33] = 53'h05c0cfd9285a2a;
    stim[34] = 53'h0d9e89363dac6d;
    stim[35] = 53'h02255e370f36f9;
    stim[36] = 53'h038ac03a615f4b;
    stim[37] = 53'h03e5593078419b;
    stim[38] = 53'h0343214e9487ad;
    stim[39] = 53'h056e916211d147;
    stim[40] = 53'h1f47519fa20bf7;
    stim[41] = 53'h01da2c6a57271f;
    stim[42] = 53'h0e4da0be03c743;
    stim[43] = 53'h032b272b9ec3dd;
    stim[44] = 53'h081c0dd0da1441;
    stim[45] = 53'h08d60e9cc0d872;
    stim[46] = 53'h0696be43b5a06d;
    stim[47] = 53'h0e1f9e07ea51e4;
    stim[48] = 53'h0311d89a1b9d1b;
    stim[49] = 53'h0224f866c1fc23;
    stim[50] = 53'h0fe5ab34db8962;
    stim[51] = 53'h0566f0818015ee;
    stim[52] = 53'h0dde33851e893e;
    stim[53] = 53'h0ca5e66ebb9239;
    stim[54] = 53'h0c55456c753ea6;
    stim[55] = 53'h010861e3c3de84;
    stim[56] = 53'h06be1dffd7171d;
    stim[57] = 53'h0ba03284eb42b6;
    stim[58] = 53'h0ca37e20df9384;
    stim[59] = 53'h0cc5c02ca9e9ab;
    stim[60] = 53'h00cdcac1f30b6f;
    stim[61] = 53'h028eae3e7d01b3;
    stim[62] = 53'h040d59620abf93;
    stim[63] = 53'h0160954c366be1;
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
      expv[0] = 35'h000000006;
      expv[1] = 35'h000000006;
      expv[2] = 35'h000000006;
      expv[3] = 35'h000000006;
      expv[4] = 35'h000000006;
      expv[5] = 35'h000000006;
      expv[6] = 35'h000000006;
      expv[7] = 35'h000000006;
      expv[8] = 35'h000000006;
      expv[9] = 35'h000000006;
      expv[10] = 35'h000000006;
      expv[11] = 35'h000000006;
      expv[12] = 35'h000000006;
      expv[13] = 35'h000000006;
      expv[14] = 35'h000000006;
      expv[15] = 35'h000000006;
      expv[16] = 35'h000000006;
      expv[17] = 35'h000000006;
      expv[18] = 35'h000000006;
      expv[19] = 35'h000000006;
      expv[20] = 35'h000000006;
      expv[21] = 35'h000000006;
      expv[22] = 35'h000000006;
      expv[23] = 35'h000000006;
      expv[24] = 35'h000000006;
      expv[25] = 35'h000000006;
      expv[26] = 35'h000000006;
      expv[27] = 35'h000000006;
      expv[28] = 35'h000000006;
      expv[29] = 35'h000000006;
      expv[30] = 35'h000000006;
      expv[31] = 35'h000000006;
      expv[32] = 35'h000000006;
      expv[33] = 35'h000000006;
      expv[34] = 35'h000000006;
      expv[35] = 35'h000000006;
      expv[36] = 35'h000000006;
      expv[37] = 35'h000000006;
      expv[38] = 35'h000000006;
      expv[39] = 35'h000000006;
      expv[40] = 35'h000000006;
      expv[41] = 35'h000000006;
      expv[42] = 35'h000000006;
      expv[43] = 35'h000000006;
      expv[44] = 35'h000000006;
      expv[45] = 35'h000000006;
      expv[46] = 35'h000000006;
      expv[47] = 35'h000000006;
      expv[48] = 35'h000000006;
      expv[49] = 35'h000000006;
      expv[50] = 35'h000000006;
      expv[51] = 35'h000000006;
      expv[52] = 35'h000000006;
      expv[53] = 35'h000000006;
      expv[54] = 35'h000000006;
      expv[55] = 35'h000000006;
      expv[56] = 35'h000000006;
      expv[57] = 35'h000000006;
      expv[58] = 35'h000000006;
      expv[59] = 35'h000000006;
      expv[60] = 35'h000000006;
      expv[61] = 35'h000000006;
      expv[62] = 35'h000000006;
      expv[63] = 35'h000000006;
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
