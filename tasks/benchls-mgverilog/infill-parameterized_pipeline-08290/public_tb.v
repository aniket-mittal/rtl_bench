// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 32;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_08290 dut (
    .CLK(clk),
    .data(in_vec[31:0]),
    .piped_data(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'h61d91aae;
    stim[1] = 32'he596f6be;
    stim[2] = 32'hbe52dbf4;
    stim[3] = 32'h4497173e;
    stim[4] = 32'h0bb55243;
    stim[5] = 32'h700875b4;
    stim[6] = 32'hf196e1b6;
    stim[7] = 32'h732f30d0;
    stim[8] = 32'h273c4508;
    stim[9] = 32'heef7849e;
    stim[10] = 32'h6952956a;
    stim[11] = 32'hf0c8a1be;
    stim[12] = 32'he1345041;
    stim[13] = 32'h87e6ffca;
    stim[14] = 32'h635f79fd;
    stim[15] = 32'hc5d94236;
    stim[16] = 32'h99c57c18;
    stim[17] = 32'h7c8a5f21;
    stim[18] = 32'h3550ba19;
    stim[19] = 32'h09d364ff;
    stim[20] = 32'haa50a663;
    stim[21] = 32'he17b13d1;
    stim[22] = 32'hcd0dac82;
    stim[23] = 32'hb1b4a461;
    stim[24] = 32'h758e6a81;
    stim[25] = 32'h0b76bab2;
    stim[26] = 32'h95ef8dce;
    stim[27] = 32'h3ae144a2;
    stim[28] = 32'h82384f78;
    stim[29] = 32'hfafe1ab0;
    stim[30] = 32'h6e8603fd;
    stim[31] = 32'h83dda0c9;
    stim[32] = 32'hb1e1861c;
    stim[33] = 32'h288cca46;
    stim[34] = 32'hc2bafd70;
    stim[35] = 32'h27686976;
    stim[36] = 32'h08336265;
    stim[37] = 32'h51f6a0e2;
    stim[38] = 32'h2b9bb845;
    stim[39] = 32'h49e0aef7;
    stim[40] = 32'h60b00a05;
    stim[41] = 32'h5a80d6a6;
    stim[42] = 32'h09860f17;
    stim[43] = 32'h3506583b;
    stim[44] = 32'hdb68bd82;
    stim[45] = 32'ha51882f7;
    stim[46] = 32'hdd6ab2a8;
    stim[47] = 32'h1e1900fc;
    stim[48] = 32'h8fdce468;
    stim[49] = 32'hdd93cb52;
    stim[50] = 32'hba00e7b2;
    stim[51] = 32'h7fae2f9a;
    stim[52] = 32'h7c3d3a80;
    stim[53] = 32'hc2e4c839;
    stim[54] = 32'h5e3520f0;
    stim[55] = 32'h24eb04f5;
    stim[56] = 32'h8a491b2a;
    stim[57] = 32'h1bfd5577;
    stim[58] = 32'hc5abf5ee;
    stim[59] = 32'hc3096cd9;
    stim[60] = 32'hc8834320;
    stim[61] = 32'h1b0f0e7e;
    stim[62] = 32'he3796134;
    stim[63] = 32'h682edcc0;
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
      expv[0] = 32'h61d91aae;
      expv[1] = 32'he596f6be;
      expv[2] = 32'hbe52dbf4;
      expv[3] = 32'h4497173e;
      expv[4] = 32'h0bb55243;
      expv[5] = 32'h700875b4;
      expv[6] = 32'hf196e1b6;
      expv[7] = 32'h732f30d0;
      expv[8] = 32'h273c4508;
      expv[9] = 32'heef7849e;
      expv[10] = 32'h6952956a;
      expv[11] = 32'hf0c8a1be;
      expv[12] = 32'he1345041;
      expv[13] = 32'h87e6ffca;
      expv[14] = 32'h635f79fd;
      expv[15] = 32'hc5d94236;
      expv[16] = 32'h99c57c18;
      expv[17] = 32'h7c8a5f21;
      expv[18] = 32'h3550ba19;
      expv[19] = 32'h09d364ff;
      expv[20] = 32'haa50a663;
      expv[21] = 32'he17b13d1;
      expv[22] = 32'hcd0dac82;
      expv[23] = 32'hb1b4a461;
      expv[24] = 32'h758e6a81;
      expv[25] = 32'h0b76bab2;
      expv[26] = 32'h95ef8dce;
      expv[27] = 32'h3ae144a2;
      expv[28] = 32'h82384f78;
      expv[29] = 32'hfafe1ab0;
      expv[30] = 32'h6e8603fd;
      expv[31] = 32'h83dda0c9;
      expv[32] = 32'hb1e1861c;
      expv[33] = 32'h288cca46;
      expv[34] = 32'hc2bafd70;
      expv[35] = 32'h27686976;
      expv[36] = 32'h08336265;
      expv[37] = 32'h51f6a0e2;
      expv[38] = 32'h2b9bb845;
      expv[39] = 32'h49e0aef7;
      expv[40] = 32'h60b00a05;
      expv[41] = 32'h5a80d6a6;
      expv[42] = 32'h09860f17;
      expv[43] = 32'h3506583b;
      expv[44] = 32'hdb68bd82;
      expv[45] = 32'ha51882f7;
      expv[46] = 32'hdd6ab2a8;
      expv[47] = 32'h1e1900fc;
      expv[48] = 32'h8fdce468;
      expv[49] = 32'hdd93cb52;
      expv[50] = 32'hba00e7b2;
      expv[51] = 32'h7fae2f9a;
      expv[52] = 32'h7c3d3a80;
      expv[53] = 32'hc2e4c839;
      expv[54] = 32'h5e3520f0;
      expv[55] = 32'h24eb04f5;
      expv[56] = 32'h8a491b2a;
      expv[57] = 32'h1bfd5577;
      expv[58] = 32'hc5abf5ee;
      expv[59] = 32'hc3096cd9;
      expv[60] = 32'hc8834320;
      expv[61] = 32'h1b0f0e7e;
      expv[62] = 32'he3796134;
      expv[63] = 32'h682edcc0;
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
