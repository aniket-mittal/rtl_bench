// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 7;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_023167 dut (
    .funct_i(in_vec[9:4]),
    .ALUOp_i(in_vec[3:0]),
    .ALU_operation_o(out_vec[6:2]),
    .FURslt_o(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h1f7;
    stim[1] = 10'h392;
    stim[2] = 10'h154;
    stim[3] = 10'h113;
    stim[4] = 10'h3a2;
    stim[5] = 10'h27e;
    stim[6] = 10'h265;
    stim[7] = 10'h0e2;
    stim[8] = 10'h205;
    stim[9] = 10'h3d7;
    stim[10] = 10'h103;
    stim[11] = 10'h14a;
    stim[12] = 10'h2ee;
    stim[13] = 10'h062;
    stim[14] = 10'h04b;
    stim[15] = 10'h249;
    stim[16] = 10'h07f;
    stim[17] = 10'h190;
    stim[18] = 10'h3b8;
    stim[19] = 10'h324;
    stim[20] = 10'h092;
    stim[21] = 10'h01f;
    stim[22] = 10'h09c;
    stim[23] = 10'h043;
    stim[24] = 10'h33a;
    stim[25] = 10'h3f4;
    stim[26] = 10'h33a;
    stim[27] = 10'h268;
    stim[28] = 10'h056;
    stim[29] = 10'h323;
    stim[30] = 10'h3cf;
    stim[31] = 10'h1de;
    stim[32] = 10'h3a8;
    stim[33] = 10'h221;
    stim[34] = 10'h077;
    stim[35] = 10'h06b;
    stim[36] = 10'h20d;
    stim[37] = 10'h3e6;
    stim[38] = 10'h11b;
    stim[39] = 10'h344;
    stim[40] = 10'h369;
    stim[41] = 10'h393;
    stim[42] = 10'h1d7;
    stim[43] = 10'h158;
    stim[44] = 10'h1f5;
    stim[45] = 10'h109;
    stim[46] = 10'h001;
    stim[47] = 10'h0ae;
    stim[48] = 10'h3ba;
    stim[49] = 10'h319;
    stim[50] = 10'h130;
    stim[51] = 10'h127;
    stim[52] = 10'h2d2;
    stim[53] = 10'h24a;
    stim[54] = 10'h029;
    stim[55] = 10'h13c;
    stim[56] = 10'h164;
    stim[57] = 10'h293;
    stim[58] = 10'h003;
    stim[59] = 10'h2d4;
    stim[60] = 10'h0d5;
    stim[61] = 10'h399;
    stim[62] = 10'h3b5;
    stim[63] = 10'h3b3;
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
      expv[0] = 7'h27;
      expv[1] = 7'h00;
      expv[2] = 7'h08;
      expv[3] = 7'h1c;
      expv[4] = 7'h00;
      expv[5] = 7'h00;
      expv[6] = 7'h0e;
      expv[7] = 7'h00;
      expv[8] = 7'h0e;
      expv[9] = 7'h27;
      expv[10] = 7'h1c;
      expv[11] = 7'h30;
      expv[12] = 7'h00;
      expv[13] = 7'h00;
      expv[14] = 7'h34;
      expv[15] = 7'h2c;
      expv[16] = 7'h00;
      expv[17] = 7'h00;
      expv[18] = 7'h28;
      expv[19] = 7'h08;
      expv[20] = 7'h00;
      expv[21] = 7'h00;
      expv[22] = 7'h00;
      expv[23] = 7'h1c;
      expv[24] = 7'h30;
      expv[25] = 7'h08;
      expv[26] = 7'h30;
      expv[27] = 7'h28;
      expv[28] = 7'h20;
      expv[29] = 7'h1c;
      expv[30] = 7'h00;
      expv[31] = 7'h00;
      expv[32] = 7'h28;
      expv[33] = 7'h04;
      expv[34] = 7'h27;
      expv[35] = 7'h34;
      expv[36] = 7'h00;
      expv[37] = 7'h20;
      expv[38] = 7'h34;
      expv[39] = 7'h08;
      expv[40] = 7'h2c;
      expv[41] = 7'h1c;
      expv[42] = 7'h27;
      expv[43] = 7'h28;
      expv[44] = 7'h0e;
      expv[45] = 7'h2c;
      expv[46] = 7'h04;
      expv[47] = 7'h00;
      expv[48] = 7'h30;
      expv[49] = 7'h2c;
      expv[50] = 7'h00;
      expv[51] = 7'h27;
      expv[52] = 7'h00;
      expv[53] = 7'h30;
      expv[54] = 7'h2c;
      expv[55] = 7'h00;
      expv[56] = 7'h08;
      expv[57] = 7'h1c;
      expv[58] = 7'h1c;
      expv[59] = 7'h08;
      expv[60] = 7'h0e;
      expv[61] = 7'h2c;
      expv[62] = 7'h0e;
      expv[63] = 7'h1c;
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
