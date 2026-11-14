// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 19;
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
    .clk(clk),
    .resetn(in_vec[18:18]),
    .byteena(in_vec[17:16]),
    .d(in_vec[15:0]),
    .q(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 19'h04258;
    stim[1] = 19'h0f06b;
    stim[2] = 19'h62cf2;
    stim[3] = 19'h734fc;
    stim[4] = 19'h40af4;
    stim[5] = 19'h4642e;
    stim[6] = 19'h5b1e4;
    stim[7] = 19'h4d461;
    stim[8] = 19'h59b95;
    stim[9] = 19'h4bf08;
    stim[10] = 19'h44480;
    stim[11] = 19'h5f4d6;
    stim[12] = 19'h4b26a;
    stim[13] = 19'h63346;
    stim[14] = 19'h48a13;
    stim[15] = 19'h3dbc9;
    stim[16] = 19'h6f586;
    stim[17] = 19'h549d0;
    stim[18] = 19'h7196f;
    stim[19] = 19'h46354;
    stim[20] = 19'h57ceb;
    stim[21] = 19'h5134a;
    stim[22] = 19'h46e1b;
    stim[23] = 19'h4ad55;
    stim[24] = 19'h7b0ab;
    stim[25] = 19'h6fafd;
    stim[26] = 19'h692c8;
    stim[27] = 19'h631e7;
    stim[28] = 19'h53705;
    stim[29] = 19'h41c56;
    stim[30] = 19'h5c29d;
    stim[31] = 19'h46a35;
    stim[32] = 19'h491b7;
    stim[33] = 19'h74eb8;
    stim[34] = 19'h517d9;
    stim[35] = 19'h68ff5;
    stim[36] = 19'h4a841;
    stim[37] = 19'h4c2f2;
    stim[38] = 19'h4c0d8;
    stim[39] = 19'h7ffd5;
    stim[40] = 19'h5909d;
    stim[41] = 19'h5d842;
    stim[42] = 19'h45eeb;
    stim[43] = 19'h3c0ae;
    stim[44] = 19'h69af8;
    stim[45] = 19'h68ad4;
    stim[46] = 19'h769bb;
    stim[47] = 19'h5e2e9;
    stim[48] = 19'h6ede2;
    stim[49] = 19'h5b6c7;
    stim[50] = 19'h76011;
    stim[51] = 19'h64b0d;
    stim[52] = 19'h70483;
    stim[53] = 19'h63e07;
    stim[54] = 19'h51451;
    stim[55] = 19'h4df76;
    stim[56] = 19'h5712e;
    stim[57] = 19'h4b0f3;
    stim[58] = 19'h56aa6;
    stim[59] = 19'h5507e;
    stim[60] = 19'h7563b;
    stim[61] = 19'h7a8a8;
    stim[62] = 19'h7a0b6;
    stim[63] = 19'h600b4;
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
      expv[0] = 16'hxxxx;
      expv[1] = 16'h0000;
      expv[2] = 16'h0000;
      expv[3] = 16'h2cf2;
      expv[4] = 16'h34f2;
      expv[5] = 16'h34f4;
      expv[6] = 16'h342e;
      expv[7] = 16'h342e;
      expv[8] = 16'h3461;
      expv[9] = 16'h3461;
      expv[10] = 16'h3408;
      expv[11] = 16'h3480;
      expv[12] = 16'h3480;
      expv[13] = 16'h346a;
      expv[14] = 16'h3346;
      expv[15] = 16'h3313;
      expv[16] = 16'h0000;
      expv[17] = 16'hf586;
      expv[18] = 16'hf586;
      expv[19] = 16'h1986;
      expv[20] = 16'h1954;
      expv[21] = 16'h1954;
      expv[22] = 16'h1954;
      expv[23] = 16'h191b;
      expv[24] = 16'h1955;
      expv[25] = 16'hb055;
      expv[26] = 16'hfafd;
      expv[27] = 16'h92c8;
      expv[28] = 16'h31e7;
      expv[29] = 16'h31e7;
      expv[30] = 16'h3156;
      expv[31] = 16'h3156;
      expv[32] = 16'h3135;
      expv[33] = 16'h31b7;
      expv[34] = 16'h4eb7;
      expv[35] = 16'h4eb7;
      expv[36] = 16'h8ff5;
      expv[37] = 16'h8f41;
      expv[38] = 16'h8ff2;
      expv[39] = 16'h8fd8;
      expv[40] = 16'hffd8;
      expv[41] = 16'hffd8;
      expv[42] = 16'hffd8;
      expv[43] = 16'hffeb;
      expv[44] = 16'h0000;
      expv[45] = 16'h9af8;
      expv[46] = 16'h8ad4;
      expv[47] = 16'h69d4;
      expv[48] = 16'h69d4;
      expv[49] = 16'hede2;
      expv[50] = 16'hede2;
      expv[51] = 16'h60e2;
      expv[52] = 16'h4b0d;
      expv[53] = 16'h040d;
      expv[54] = 16'h3e07;
      expv[55] = 16'h3e07;
      expv[56] = 16'h3e76;
      expv[57] = 16'h3e76;
      expv[58] = 16'h3ef3;
      expv[59] = 16'h3ef3;
      expv[60] = 16'h3ef3;
      expv[61] = 16'h56f3;
      expv[62] = 16'ha8f3;
      expv[63] = 16'ha0f3;
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
