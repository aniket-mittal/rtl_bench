// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 68;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_07106 dut (
    .clk(clk),
    .Mem_byte_wr_in(in_vec[67:64]),
    .Mem_data(in_vec[63:32]),
    .Mem_addr_in(in_vec[31:0]),
    .Mem_data_out(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 68'hc0366f6bdf477492b;
    stim[1] = 68'hc87c10eae8faead3f;
    stim[2] = 68'hd01e4274c343c2f5e;
    stim[3] = 68'ha898240dd14809596;
    stim[4] = 68'h3628d1938ce06d488;
    stim[5] = 68'hf2a602fd3149d6229;
    stim[6] = 68'hec00cb294edd0f996;
    stim[7] = 68'h460dfcff5d3ef7931;
    stim[8] = 68'hbc5deb558124b6b40;
    stim[9] = 68'h1f0fd747f89ba11d7;
    stim[10] = 68'h282e8dd95abc3a007;
    stim[11] = 68'h2eedeaf26e322d70e;
    stim[12] = 68'hdbeb894b36c6fd158;
    stim[13] = 68'hcd25c0de2bdf72246;
    stim[14] = 68'haa3d14d99bf38ca22;
    stim[15] = 68'h6f8db9be9d47baa12;
    stim[16] = 68'h25b2560f8dab54009;
    stim[17] = 68'h8761d3f2fc373a63c;
    stim[18] = 68'hacbe3d46ce24d7c97;
    stim[19] = 68'h7c8b0f7387dfc2da4;
    stim[20] = 68'h74e5f8a1ee4cf5a3b;
    stim[21] = 68'h33866d80e4e353b26;
    stim[22] = 68'h8496d3d21de6df0ec;
    stim[23] = 68'h4fc824789438b25e0;
    stim[24] = 68'hb110458de25ccb05e;
    stim[25] = 68'h9f240ad8621b32fc3;
    stim[26] = 68'hd49ec706021c23472;
    stim[27] = 68'h3b8daa70fb7948c0f;
    stim[28] = 68'he65d49d55c18d1666;
    stim[29] = 68'h08fd79a2428e27ec0;
    stim[30] = 68'h289b7e8d9df3da326;
    stim[31] = 68'hba68adaa60995685a;
    stim[32] = 68'h6b131e1493772ee9c;
    stim[33] = 68'hdfa632d6bcf0ba9f5;
    stim[34] = 68'h747715a325724fd9e;
    stim[35] = 68'h675b8827ee9a49968;
    stim[36] = 68'h476b717c85f36f00b;
    stim[37] = 68'hc916382e88c161af6;
    stim[38] = 68'he69c7e23659c87fa7;
    stim[39] = 68'h576b18b39e196f9c7;
    stim[40] = 68'h95041495518237283;
    stim[41] = 68'h1cf6faec2e08ff5bd;
    stim[42] = 68'h41614eabde55a2f1a;
    stim[43] = 68'h98b04524986e144dd;
    stim[44] = 68'hd043fd47ff9800116;
    stim[45] = 68'h50ed9c78614c4ce38;
    stim[46] = 68'h927c929e336b9bd4f;
    stim[47] = 68'h7ffe11603b75f67e1;
    stim[48] = 68'h3fd5e88d7d72681da;
    stim[49] = 68'h4c9f5d3d68cbc2e44;
    stim[50] = 68'h829bad4de8cacced5;
    stim[51] = 68'h0520cf5a25bcde1e8;
    stim[52] = 68'h814cc28c8fc92ff98;
    stim[53] = 68'h21fef20446f4067df;
    stim[54] = 68'h55f3d406f0a19da41;
    stim[55] = 68'h513e68e873a91129b;
    stim[56] = 68'hf11620cf1a5814130;
    stim[57] = 68'he7b88e4b93f4358e0;
    stim[58] = 68'h420dc42d519224983;
    stim[59] = 68'h63cfdd8d7015f5fc8;
    stim[60] = 68'h46a400deb7bf61364;
    stim[61] = 68'hea36b7a981e0d56e8;
    stim[62] = 68'hc52a108d50d5fa9cb;
    stim[63] = 68'h539b3547cf58df4c6;
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
      expv[0] = 32'hxxxxxxxx;
      expv[1] = 32'h00000000;
      expv[2] = 32'h00000000;
      expv[3] = 32'h00000000;
      expv[4] = 32'h00000000;
      expv[5] = 32'h00000000;
      expv[6] = 32'h00000000;
      expv[7] = 32'h00000000;
      expv[8] = 32'h00000000;
      expv[9] = 32'h00000000;
      expv[10] = 32'h00000000;
      expv[11] = 32'h00000000;
      expv[12] = 32'h00000000;
      expv[13] = 32'h00000000;
      expv[14] = 32'h00000000;
      expv[15] = 32'h00000000;
      expv[16] = 32'h00000000;
      expv[17] = 32'h00000000;
      expv[18] = 32'h00000000;
      expv[19] = 32'h00000000;
      expv[20] = 32'h00000000;
      expv[21] = 32'h00000000;
      expv[22] = 32'h00000000;
      expv[23] = 32'h00000000;
      expv[24] = 32'h00000000;
      expv[25] = 32'h00000000;
      expv[26] = 32'h00000000;
      expv[27] = 32'h00000000;
      expv[28] = 32'h00000000;
      expv[29] = 32'h00000000;
      expv[30] = 32'h00000000;
      expv[31] = 32'h00000000;
      expv[32] = 32'h00000000;
      expv[33] = 32'h00000000;
      expv[34] = 32'h00000000;
      expv[35] = 32'h00000000;
      expv[36] = 32'h00000000;
      expv[37] = 32'h00000000;
      expv[38] = 32'h00000000;
      expv[39] = 32'h00000000;
      expv[40] = 32'h00000000;
      expv[41] = 32'h00000000;
      expv[42] = 32'h00000000;
      expv[43] = 32'h00000000;
      expv[44] = 32'h00000000;
      expv[45] = 32'h00000000;
      expv[46] = 32'h00000000;
      expv[47] = 32'h00000000;
      expv[48] = 32'h00000000;
      expv[49] = 32'h00000000;
      expv[50] = 32'h00000000;
      expv[51] = 32'h00000000;
      expv[52] = 32'h00000000;
      expv[53] = 32'h00000000;
      expv[54] = 32'h00000000;
      expv[55] = 32'h00000000;
      expv[56] = 32'h00000000;
      expv[57] = 32'h00000000;
      expv[58] = 32'h00000000;
      expv[59] = 32'h00000000;
      expv[60] = 32'h00000000;
      expv[61] = 32'h00000000;
      expv[62] = 32'h00000000;
      expv[63] = 32'h00000000;
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
