// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 16;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  dut dut (
    .in(in_vec[15:0]),
    .out_hi(out_vec[15:8]),
    .out_lo(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 16'he90f;
    stim[1] = 16'hd09c;
    stim[2] = 16'h2788;
    stim[3] = 16'h342e;
    stim[4] = 16'h9559;
    stim[5] = 16'h9c7f;
    stim[6] = 16'h471f;
    stim[7] = 16'h54aa;
    stim[8] = 16'h5ccb;
    stim[9] = 16'hba1e;
    stim[10] = 16'h9bb0;
    stim[11] = 16'he5bf;
    stim[12] = 16'hd6b5;
    stim[13] = 16'h7a19;
    stim[14] = 16'h407c;
    stim[15] = 16'hb796;
    stim[16] = 16'hf962;
    stim[17] = 16'hbecc;
    stim[18] = 16'h7bd0;
    stim[19] = 16'hea32;
    stim[20] = 16'hb552;
    stim[21] = 16'h2b03;
    stim[22] = 16'haae4;
    stim[23] = 16'hee0c;
    stim[24] = 16'ha79a;
    stim[25] = 16'hb856;
    stim[26] = 16'hd0db;
    stim[27] = 16'h95c0;
    stim[28] = 16'ha113;
    stim[29] = 16'hf6f9;
    stim[30] = 16'hca8d;
    stim[31] = 16'h27ed;
    stim[32] = 16'h4e1c;
    stim[33] = 16'h0890;
    stim[34] = 16'hc62d;
    stim[35] = 16'h2943;
    stim[36] = 16'h81e2;
    stim[37] = 16'hab37;
    stim[38] = 16'h3418;
    stim[39] = 16'h7941;
    stim[40] = 16'he9d0;
    stim[41] = 16'haeae;
    stim[42] = 16'h431d;
    stim[43] = 16'h33dc;
    stim[44] = 16'hb019;
    stim[45] = 16'h1df9;
    stim[46] = 16'h689e;
    stim[47] = 16'h0321;
    stim[48] = 16'hf7f0;
    stim[49] = 16'h22b5;
    stim[50] = 16'h3f88;
    stim[51] = 16'h2617;
    stim[52] = 16'h3612;
    stim[53] = 16'hfd96;
    stim[54] = 16'h62ac;
    stim[55] = 16'h38d1;
    stim[56] = 16'hf06f;
    stim[57] = 16'hd79f;
    stim[58] = 16'h9343;
    stim[59] = 16'h7adf;
    stim[60] = 16'hd4c0;
    stim[61] = 16'he36b;
    stim[62] = 16'hc749;
    stim[63] = 16'h4fc5;
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
      expv[0] = 16'h0fe9;
      expv[1] = 16'h9cd0;
      expv[2] = 16'h8827;
      expv[3] = 16'h2e34;
      expv[4] = 16'h5995;
      expv[5] = 16'h7f9c;
      expv[6] = 16'h1f47;
      expv[7] = 16'haa54;
      expv[8] = 16'hcb5c;
      expv[9] = 16'h1eba;
      expv[10] = 16'hb09b;
      expv[11] = 16'hbfe5;
      expv[12] = 16'hb5d6;
      expv[13] = 16'h197a;
      expv[14] = 16'h7c40;
      expv[15] = 16'h96b7;
      expv[16] = 16'h62f9;
      expv[17] = 16'hccbe;
      expv[18] = 16'hd07b;
      expv[19] = 16'h32ea;
      expv[20] = 16'h52b5;
      expv[21] = 16'h032b;
      expv[22] = 16'he4aa;
      expv[23] = 16'h0cee;
      expv[24] = 16'h9aa7;
      expv[25] = 16'h56b8;
      expv[26] = 16'hdbd0;
      expv[27] = 16'hc095;
      expv[28] = 16'h13a1;
      expv[29] = 16'hf9f6;
      expv[30] = 16'h8dca;
      expv[31] = 16'hed27;
      expv[32] = 16'h1c4e;
      expv[33] = 16'h9008;
      expv[34] = 16'h2dc6;
      expv[35] = 16'h4329;
      expv[36] = 16'he281;
      expv[37] = 16'h37ab;
      expv[38] = 16'h1834;
      expv[39] = 16'h4179;
      expv[40] = 16'hd0e9;
      expv[41] = 16'haeae;
      expv[42] = 16'h1d43;
      expv[43] = 16'hdc33;
      expv[44] = 16'h19b0;
      expv[45] = 16'hf91d;
      expv[46] = 16'h9e68;
      expv[47] = 16'h2103;
      expv[48] = 16'hf0f7;
      expv[49] = 16'hb522;
      expv[50] = 16'h883f;
      expv[51] = 16'h1726;
      expv[52] = 16'h1236;
      expv[53] = 16'h96fd;
      expv[54] = 16'hac62;
      expv[55] = 16'hd138;
      expv[56] = 16'h6ff0;
      expv[57] = 16'h9fd7;
      expv[58] = 16'h4393;
      expv[59] = 16'hdf7a;
      expv[60] = 16'hc0d4;
      expv[61] = 16'h6be3;
      expv[62] = 16'h49c7;
      expv[63] = 16'hc54f;
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
