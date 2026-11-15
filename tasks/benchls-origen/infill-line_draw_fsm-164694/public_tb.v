// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 45;
  localparam OW = 21;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_164694 dut (
    .pclk(clk),
    .go(in_vec[44:44]),
    .stax(in_vec[43:33]),
    .stay(in_vec[32:22]),
    .endx(in_vec[21:11]),
    .endy(in_vec[10:0]),
    .busy(out_vec[20:20]),
    .wr(out_vec[19:19]),
    .addr(out_vec[18:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 45'h1e74201e78f4;
    stim[1] = 45'h1e0b8e7a1156;
    stim[2] = 45'h1de37d703ea3;
    stim[3] = 45'h114bd68fc6c4;
    stim[4] = 45'h0c9ba73741e8;
    stim[5] = 45'h1f9991809258;
    stim[6] = 45'h040af7198156;
    stim[7] = 45'h1bf92bbc15cb;
    stim[8] = 45'h10508bcbde49;
    stim[9] = 45'h10b033777ae3;
    stim[10] = 45'h0b7bae0ffa8f;
    stim[11] = 45'h0658b51053a9;
    stim[12] = 45'h0b999d26bae5;
    stim[13] = 45'h0e627538b5c3;
    stim[14] = 45'h1da5bce6d533;
    stim[15] = 45'h12bccdb5882d;
    stim[16] = 45'h13d6d0474fde;
    stim[17] = 45'h18dbcece2b8f;
    stim[18] = 45'h1627d3310fab;
    stim[19] = 45'h0604496d875b;
    stim[20] = 45'h01586c9176ef;
    stim[21] = 45'h133fdceac656;
    stim[22] = 45'h072776797d85;
    stim[23] = 45'h1a517f4e67c7;
    stim[24] = 45'h1d1f73a4df46;
    stim[25] = 45'h0cb03ff90981;
    stim[26] = 45'h019dabb60fd5;
    stim[27] = 45'h1be58851b279;
    stim[28] = 45'h12d5d5e53030;
    stim[29] = 45'h0d6e5c364723;
    stim[30] = 45'h1a7aa276f2e5;
    stim[31] = 45'h0c469a7f46a8;
    stim[32] = 45'h09942700c52f;
    stim[33] = 45'h14bfe44d6edd;
    stim[34] = 45'h020575ee130d;
    stim[35] = 45'h125419e7daa8;
    stim[36] = 45'h00836d557095;
    stim[37] = 45'h160cc95fc6ef;
    stim[38] = 45'h026ed1d20a2f;
    stim[39] = 45'h11ab6b6d1442;
    stim[40] = 45'h1c37d5c891ab;
    stim[41] = 45'h1d389cd7fb64;
    stim[42] = 45'h092fe98f452f;
    stim[43] = 45'h1f371e5638e6;
    stim[44] = 45'h10e989b4c494;
    stim[45] = 45'h1b8a2004a718;
    stim[46] = 45'h0fd46ef068bf;
    stim[47] = 45'h18b8f963f540;
    stim[48] = 45'h19804cec3383;
    stim[49] = 45'h0399bb26c676;
    stim[50] = 45'h0ecd3e28ae28;
    stim[51] = 45'h0c261aa1f9d2;
    stim[52] = 45'h01297243899e;
    stim[53] = 45'h0c75ff4243c7;
    stim[54] = 45'h054de227a608;
    stim[55] = 45'h19d559ce42e7;
    stim[56] = 45'h1e97c745d69d;
    stim[57] = 45'h101608953210;
    stim[58] = 45'h1f57926189c4;
    stim[59] = 45'h124944164486;
    stim[60] = 45'h0a0cda58bfb6;
    stim[61] = 45'h033e6daed135;
    stim[62] = 45'h0e23745611cb;
    stim[63] = 45'h1ca955474a99;
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
      expv[0] = 21'hxxxxxx;
      expv[1] = 21'h0xxxxx;
      expv[2] = 21'h0xxxxx;
      expv[3] = 21'h0xxxxx;
      expv[4] = 21'h0xxxxx;
      expv[5] = 21'h0xxxxx;
      expv[6] = 21'h0xxxxx;
      expv[7] = 21'h0xxxxx;
      expv[8] = 21'h0xxxxx;
      expv[9] = 21'h0xxxxx;
      expv[10] = 21'h0xxxxx;
      expv[11] = 21'h0xxxxx;
      expv[12] = 21'h0xxxxx;
      expv[13] = 21'h0xxxxx;
      expv[14] = 21'h0xxxxx;
      expv[15] = 21'h0xxxxx;
      expv[16] = 21'h0xxxxx;
      expv[17] = 21'h0xxxxx;
      expv[18] = 21'h0xxxxx;
      expv[19] = 21'h0xxxxx;
      expv[20] = 21'h0xxxxx;
      expv[21] = 21'h0xxxxx;
      expv[22] = 21'h0xxxxx;
      expv[23] = 21'h0xxxxx;
      expv[24] = 21'h0xxxxx;
      expv[25] = 21'h0xxxxx;
      expv[26] = 21'h0xxxxx;
      expv[27] = 21'h0xxxxx;
      expv[28] = 21'h0xxxxx;
      expv[29] = 21'h0xxxxx;
      expv[30] = 21'h0xxxxx;
      expv[31] = 21'h0xxxxx;
      expv[32] = 21'h0xxxxx;
      expv[33] = 21'h0xxxxx;
      expv[34] = 21'h0xxxxx;
      expv[35] = 21'h0xxxxx;
      expv[36] = 21'h0xxxxx;
      expv[37] = 21'h0xxxxx;
      expv[38] = 21'h0xxxxx;
      expv[39] = 21'h0xxxxx;
      expv[40] = 21'h0xxxxx;
      expv[41] = 21'h0xxxxx;
      expv[42] = 21'h0xxxxx;
      expv[43] = 21'h0xxxxx;
      expv[44] = 21'h0xxxxx;
      expv[45] = 21'h0xxxxx;
      expv[46] = 21'h0xxxxx;
      expv[47] = 21'h0xxxxx;
      expv[48] = 21'h0xxxxx;
      expv[49] = 21'h0xxxxx;
      expv[50] = 21'h0xxxxx;
      expv[51] = 21'h0xxxxx;
      expv[52] = 21'h0xxxxx;
      expv[53] = 21'h0xxxxx;
      expv[54] = 21'h0xxxxx;
      expv[55] = 21'h0xxxxx;
      expv[56] = 21'h0xxxxx;
      expv[57] = 21'h0xxxxx;
      expv[58] = 21'h0xxxxx;
      expv[59] = 21'h0xxxxx;
      expv[60] = 21'h0xxxxx;
      expv[61] = 21'h0xxxxx;
      expv[62] = 21'h0xxxxx;
      expv[63] = 21'h0xxxxx;
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
