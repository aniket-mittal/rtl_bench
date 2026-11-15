// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_214188 dut (
    .clk(clk),
    .rst(in_vec[10:10]),
    .up_bus(in_vec[9:2]),
    .up_val(in_vec[1:1]),
    .dn_rdy(in_vec[0:0]),
    .up_rdy(out_vec[9:9]),
    .dn_bus(out_vec[8:1]),
    .dn_val(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h6b4;
    stim[1] = 11'h406;
    stim[2] = 11'h3ab;
    stim[3] = 11'h38e;
    stim[4] = 11'h0d8;
    stim[5] = 11'h3ad;
    stim[6] = 11'h33d;
    stim[7] = 11'h056;
    stim[8] = 11'h064;
    stim[9] = 11'h367;
    stim[10] = 11'h24a;
    stim[11] = 11'h055;
    stim[12] = 11'h0c7;
    stim[13] = 11'h302;
    stim[14] = 11'h053;
    stim[15] = 11'h225;
    stim[16] = 11'h054;
    stim[17] = 11'h284;
    stim[18] = 11'h2e1;
    stim[19] = 11'h353;
    stim[20] = 11'h175;
    stim[21] = 11'h1e3;
    stim[22] = 11'h2c1;
    stim[23] = 11'h245;
    stim[24] = 11'h0b9;
    stim[25] = 11'h083;
    stim[26] = 11'h114;
    stim[27] = 11'h39b;
    stim[28] = 11'h287;
    stim[29] = 11'h2e5;
    stim[30] = 11'h180;
    stim[31] = 11'h197;
    stim[32] = 11'h32a;
    stim[33] = 11'h110;
    stim[34] = 11'h0f7;
    stim[35] = 11'h254;
    stim[36] = 11'h2e9;
    stim[37] = 11'h2b7;
    stim[38] = 11'h3f3;
    stim[39] = 11'h027;
    stim[40] = 11'h0ed;
    stim[41] = 11'h0ad;
    stim[42] = 11'h02d;
    stim[43] = 11'h121;
    stim[44] = 11'h39e;
    stim[45] = 11'h35d;
    stim[46] = 11'h0af;
    stim[47] = 11'h022;
    stim[48] = 11'h177;
    stim[49] = 11'h283;
    stim[50] = 11'h304;
    stim[51] = 11'h0cf;
    stim[52] = 11'h1c2;
    stim[53] = 11'h106;
    stim[54] = 11'h35d;
    stim[55] = 11'h0e6;
    stim[56] = 11'h19f;
    stim[57] = 11'h1be;
    stim[58] = 11'h1c0;
    stim[59] = 11'h3b8;
    stim[60] = 11'h372;
    stim[61] = 11'h325;
    stim[62] = 11'h32b;
    stim[63] = 11'h339;
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
      expv[0] = 10'h200;
      expv[1] = 10'h200;
      expv[2] = 10'h200;
      expv[3] = 10'h3c7;
      expv[4] = 10'h200;
      expv[5] = 10'h200;
      expv[6] = 10'h39e;
      expv[7] = 10'h22b;
      expv[8] = 10'h200;
      expv[9] = 10'h200;
      expv[10] = 10'h325;
      expv[11] = 10'h200;
      expv[12] = 10'h263;
      expv[13] = 10'h381;
      expv[14] = 10'h200;
      expv[15] = 10'h312;
      expv[16] = 10'h22a;
      expv[17] = 10'h200;
      expv[18] = 10'h200;
      expv[19] = 10'h3a9;
      expv[20] = 10'h2ba;
      expv[21] = 10'h2f1;
      expv[22] = 10'h360;
      expv[23] = 10'h322;
      expv[24] = 10'h25c;
      expv[25] = 10'h241;
      expv[26] = 10'h28a;
      expv[27] = 10'h200;
      expv[28] = 10'h343;
      expv[29] = 10'h372;
      expv[30] = 10'h2c0;
      expv[31] = 10'h200;
      expv[32] = 10'h395;
      expv[33] = 10'h200;
      expv[34] = 10'h200;
      expv[35] = 10'h32a;
      expv[36] = 10'h200;
      expv[37] = 10'h35b;
      expv[38] = 10'h3f9;
      expv[39] = 10'h213;
      expv[40] = 10'h276;
      expv[41] = 10'h256;
      expv[42] = 10'h216;
      expv[43] = 10'h290;
      expv[44] = 10'h3cf;
      expv[45] = 10'h200;
      expv[46] = 10'h257;
      expv[47] = 10'h211;
      expv[48] = 10'h200;
      expv[49] = 10'h341;
      expv[50] = 10'h382;
      expv[51] = 10'h200;
      expv[52] = 10'h2e1;
      expv[53] = 10'h200;
      expv[54] = 10'h200;
      expv[55] = 10'h273;
      expv[56] = 10'h200;
      expv[57] = 10'h2df;
      expv[58] = 10'h200;
      expv[59] = 10'h200;
      expv[60] = 10'h200;
      expv[61] = 10'h200;
      expv[62] = 10'h395;
      expv[63] = 10'h39c;
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
