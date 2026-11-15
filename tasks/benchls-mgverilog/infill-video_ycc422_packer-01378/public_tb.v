// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 8;
  localparam OW = 34;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_01378 dut (
    .vid_clk(clk),
    .p(in_vec[7:0]),
    .stb(out_vec[33:33]),
    .field(out_vec[32:32]),
    .ycc422(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'ha0;
    stim[1] = 8'hd7;
    stim[2] = 8'he9;
    stim[3] = 8'h58;
    stim[4] = 8'h43;
    stim[5] = 8'hdd;
    stim[6] = 8'h23;
    stim[7] = 8'hb6;
    stim[8] = 8'h63;
    stim[9] = 8'h40;
    stim[10] = 8'h4e;
    stim[11] = 8'h60;
    stim[12] = 8'h0a;
    stim[13] = 8'hea;
    stim[14] = 8'hb4;
    stim[15] = 8'h2b;
    stim[16] = 8'h7c;
    stim[17] = 8'h69;
    stim[18] = 8'h0d;
    stim[19] = 8'h9f;
    stim[20] = 8'h6d;
    stim[21] = 8'hac;
    stim[22] = 8'h79;
    stim[23] = 8'haa;
    stim[24] = 8'hd6;
    stim[25] = 8'h89;
    stim[26] = 8'hb8;
    stim[27] = 8'hfc;
    stim[28] = 8'hca;
    stim[29] = 8'hab;
    stim[30] = 8'h7a;
    stim[31] = 8'h71;
    stim[32] = 8'h33;
    stim[33] = 8'hc8;
    stim[34] = 8'h46;
    stim[35] = 8'hc0;
    stim[36] = 8'hc1;
    stim[37] = 8'h0b;
    stim[38] = 8'h52;
    stim[39] = 8'hd1;
    stim[40] = 8'h8e;
    stim[41] = 8'h42;
    stim[42] = 8'hce;
    stim[43] = 8'hea;
    stim[44] = 8'h26;
    stim[45] = 8'h41;
    stim[46] = 8'h2b;
    stim[47] = 8'h96;
    stim[48] = 8'hd4;
    stim[49] = 8'h8d;
    stim[50] = 8'h8f;
    stim[51] = 8'h34;
    stim[52] = 8'h41;
    stim[53] = 8'h54;
    stim[54] = 8'h51;
    stim[55] = 8'h80;
    stim[56] = 8'h06;
    stim[57] = 8'h13;
    stim[58] = 8'h24;
    stim[59] = 8'h36;
    stim[60] = 8'h4b;
    stim[61] = 8'h90;
    stim[62] = 8'h48;
    stim[63] = 8'hf4;
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
      expv[0] = 34'hxxxxxxxxx;
      expv[1] = 34'h200000000;
      expv[2] = 34'h000000000;
      expv[3] = 34'h000000000;
      expv[4] = 34'h000000000;
      expv[5] = 34'h2xxa0d7e9;
      expv[6] = 34'h0xxa0d7e9;
      expv[7] = 34'h0xxa0d7e9;
      expv[8] = 34'h0xxa0d7e9;
      expv[9] = 34'h25843dd23;
      expv[10] = 34'h05843dd23;
      expv[11] = 34'h05843dd23;
      expv[12] = 34'h05843dd23;
      expv[13] = 34'h2b663404e;
      expv[14] = 34'h0b663404e;
      expv[15] = 34'h0b663404e;
      expv[16] = 34'h0b663404e;
      expv[17] = 34'h2600aeab4;
      expv[18] = 34'h0600aeab4;
      expv[19] = 34'h0600aeab4;
      expv[20] = 34'h0600aeab4;
      expv[21] = 34'h22b7c690d;
      expv[22] = 34'h02b7c690d;
      expv[23] = 34'h02b7c690d;
      expv[24] = 34'h02b7c690d;
      expv[25] = 34'h29f6dac79;
      expv[26] = 34'h09f6dac79;
      expv[27] = 34'h09f6dac79;
      expv[28] = 34'h09f6dac79;
      expv[29] = 34'h2aad689b8;
      expv[30] = 34'h0aad689b8;
      expv[31] = 34'h0aad689b8;
      expv[32] = 34'h0aad689b8;
      expv[33] = 34'h2fccaab7a;
      expv[34] = 34'h0fccaab7a;
      expv[35] = 34'h0fccaab7a;
      expv[36] = 34'h0fccaab7a;
      expv[37] = 34'h27133c846;
      expv[38] = 34'h07133c846;
      expv[39] = 34'h07133c846;
      expv[40] = 34'h07133c846;
      expv[41] = 34'h2c0c10b52;
      expv[42] = 34'h0c0c10b52;
      expv[43] = 34'h0c0c10b52;
      expv[44] = 34'h0c0c10b52;
      expv[45] = 34'h2d18e42ce;
      expv[46] = 34'h0d18e42ce;
      expv[47] = 34'h0d18e42ce;
      expv[48] = 34'h0d18e42ce;
      expv[49] = 34'h2ea26412b;
      expv[50] = 34'h0ea26412b;
      expv[51] = 34'h0ea26412b;
      expv[52] = 34'h0ea26412b;
      expv[53] = 34'h296d48d8f;
      expv[54] = 34'h096d48d8f;
      expv[55] = 34'h096d48d8f;
      expv[56] = 34'h096d48d8f;
      expv[57] = 34'h234415451;
      expv[58] = 34'h034415451;
      expv[59] = 34'h034415451;
      expv[60] = 34'h034415451;
      expv[61] = 34'h280061324;
      expv[62] = 34'h080061324;
      expv[63] = 34'h080061324;
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
