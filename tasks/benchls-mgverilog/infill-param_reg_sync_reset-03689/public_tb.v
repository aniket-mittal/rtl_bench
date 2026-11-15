// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_03689 dut (
    .Clk(clk),
    .DataIn(in_vec[10:3]),
    .Write(in_vec[2:2]),
    .Reset(in_vec[1:1]),
    .SyncReset(in_vec[0:0]),
    .DataOut(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h60e;
    stim[1] = 11'h7de;
    stim[2] = 11'h744;
    stim[3] = 11'h49b;
    stim[4] = 11'h458;
    stim[5] = 11'h1a5;
    stim[6] = 11'h534;
    stim[7] = 11'h414;
    stim[8] = 11'h5a9;
    stim[9] = 11'h4d4;
    stim[10] = 11'h458;
    stim[11] = 11'h151;
    stim[12] = 11'h688;
    stim[13] = 11'h160;
    stim[14] = 11'h565;
    stim[15] = 11'h4d0;
    stim[16] = 11'h368;
    stim[17] = 11'h419;
    stim[18] = 11'h015;
    stim[19] = 11'h5c4;
    stim[20] = 11'h0a4;
    stim[21] = 11'h530;
    stim[22] = 11'h359;
    stim[23] = 11'h0d5;
    stim[24] = 11'h300;
    stim[25] = 11'h659;
    stim[26] = 11'h361;
    stim[27] = 11'h649;
    stim[28] = 11'h450;
    stim[29] = 11'h535;
    stim[30] = 11'h341;
    stim[31] = 11'h420;
    stim[32] = 11'h449;
    stim[33] = 11'h5b8;
    stim[34] = 11'h069;
    stim[35] = 11'h4c1;
    stim[36] = 11'h32c;
    stim[37] = 11'h0c9;
    stim[38] = 11'h10d;
    stim[39] = 11'h0e5;
    stim[40] = 11'h428;
    stim[41] = 11'h051;
    stim[42] = 11'h221;
    stim[43] = 11'h0b0;
    stim[44] = 11'h639;
    stim[45] = 11'h2ac;
    stim[46] = 11'h36d;
    stim[47] = 11'h420;
    stim[48] = 11'h2a5;
    stim[49] = 11'h634;
    stim[50] = 11'h421;
    stim[51] = 11'h164;
    stim[52] = 11'h449;
    stim[53] = 11'h02d;
    stim[54] = 11'h63d;
    stim[55] = 11'h184;
    stim[56] = 11'h658;
    stim[57] = 11'h44d;
    stim[58] = 11'h584;
    stim[59] = 11'h55c;
    stim[60] = 11'h2dd;
    stim[61] = 11'h6e8;
    stim[62] = 11'h1a0;
    stim[63] = 11'h3a5;
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
      expv[0] = 8'h00;
      expv[1] = 8'h00;
      expv[2] = 8'h00;
      expv[3] = 8'h00;
      expv[4] = 8'h00;
      expv[5] = 8'h00;
      expv[6] = 8'h00;
      expv[7] = 8'ha6;
      expv[8] = 8'h82;
      expv[9] = 8'h00;
      expv[10] = 8'h9a;
      expv[11] = 8'h9a;
      expv[12] = 8'h00;
      expv[13] = 8'h00;
      expv[14] = 8'h00;
      expv[15] = 8'h00;
      expv[16] = 8'h00;
      expv[17] = 8'h00;
      expv[18] = 8'h00;
      expv[19] = 8'h00;
      expv[20] = 8'hb8;
      expv[21] = 8'h14;
      expv[22] = 8'h14;
      expv[23] = 8'h00;
      expv[24] = 8'h00;
      expv[25] = 8'h00;
      expv[26] = 8'h00;
      expv[27] = 8'h00;
      expv[28] = 8'h00;
      expv[29] = 8'h00;
      expv[30] = 8'h00;
      expv[31] = 8'h00;
      expv[32] = 8'h00;
      expv[33] = 8'h00;
      expv[34] = 8'h00;
      expv[35] = 8'h00;
      expv[36] = 8'h00;
      expv[37] = 8'h65;
      expv[38] = 8'h00;
      expv[39] = 8'h00;
      expv[40] = 8'h00;
      expv[41] = 8'h00;
      expv[42] = 8'h00;
      expv[43] = 8'h00;
      expv[44] = 8'h00;
      expv[45] = 8'h00;
      expv[46] = 8'h55;
      expv[47] = 8'h00;
      expv[48] = 8'h00;
      expv[49] = 8'h00;
      expv[50] = 8'hc6;
      expv[51] = 8'h00;
      expv[52] = 8'h2c;
      expv[53] = 8'h00;
      expv[54] = 8'h00;
      expv[55] = 8'h00;
      expv[56] = 8'h30;
      expv[57] = 8'h30;
      expv[58] = 8'h00;
      expv[59] = 8'hb0;
      expv[60] = 8'hab;
      expv[61] = 8'h00;
      expv[62] = 8'h00;
      expv[63] = 8'h00;
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
