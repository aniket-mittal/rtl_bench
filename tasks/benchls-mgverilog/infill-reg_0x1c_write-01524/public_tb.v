// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_01524 dut (
    .clk(clk),
    .reset(in_vec[9:9]),
    .wenb(in_vec[8:8]),
    .in_data(in_vec[7:0]),
    .reg_0x1C(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h203;
    stim[1] = 10'h3fc;
    stim[2] = 10'h0c9;
    stim[3] = 10'h141;
    stim[4] = 10'h1ad;
    stim[5] = 10'h02e;
    stim[6] = 10'h086;
    stim[7] = 10'h187;
    stim[8] = 10'h32e;
    stim[9] = 10'h1b6;
    stim[10] = 10'h184;
    stim[11] = 10'h12f;
    stim[12] = 10'h078;
    stim[13] = 10'h373;
    stim[14] = 10'h071;
    stim[15] = 10'h096;
    stim[16] = 10'h081;
    stim[17] = 10'h095;
    stim[18] = 10'h0c6;
    stim[19] = 10'h11e;
    stim[20] = 10'h198;
    stim[21] = 10'h1ad;
    stim[22] = 10'h00a;
    stim[23] = 10'h06f;
    stim[24] = 10'h016;
    stim[25] = 10'h106;
    stim[26] = 10'h04e;
    stim[27] = 10'h195;
    stim[28] = 10'h0ef;
    stim[29] = 10'h153;
    stim[30] = 10'h0ab;
    stim[31] = 10'h072;
    stim[32] = 10'h087;
    stim[33] = 10'h105;
    stim[34] = 10'h1dc;
    stim[35] = 10'h18d;
    stim[36] = 10'h1f0;
    stim[37] = 10'h138;
    stim[38] = 10'h088;
    stim[39] = 10'h06e;
    stim[40] = 10'h0fc;
    stim[41] = 10'h044;
    stim[42] = 10'h167;
    stim[43] = 10'h12a;
    stim[44] = 10'h0c6;
    stim[45] = 10'h0a8;
    stim[46] = 10'h189;
    stim[47] = 10'h31b;
    stim[48] = 10'h1e9;
    stim[49] = 10'h03c;
    stim[50] = 10'h1ae;
    stim[51] = 10'h0f3;
    stim[52] = 10'h14f;
    stim[53] = 10'h381;
    stim[54] = 10'h186;
    stim[55] = 10'h1d0;
    stim[56] = 10'h1f1;
    stim[57] = 10'h1d6;
    stim[58] = 10'h01c;
    stim[59] = 10'h032;
    stim[60] = 10'h1d1;
    stim[61] = 10'h1be;
    stim[62] = 10'h13f;
    stim[63] = 10'h144;
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
      expv[0] = 8'hxx;
      expv[1] = 8'h00;
      expv[2] = 8'h00;
      expv[3] = 8'hc9;
      expv[4] = 8'hc9;
      expv[5] = 8'hc9;
      expv[6] = 8'h2e;
      expv[7] = 8'h86;
      expv[8] = 8'h86;
      expv[9] = 8'h00;
      expv[10] = 8'h00;
      expv[11] = 8'h00;
      expv[12] = 8'h00;
      expv[13] = 8'h78;
      expv[14] = 8'h00;
      expv[15] = 8'h71;
      expv[16] = 8'h96;
      expv[17] = 8'h81;
      expv[18] = 8'h95;
      expv[19] = 8'hc6;
      expv[20] = 8'hc6;
      expv[21] = 8'hc6;
      expv[22] = 8'hc6;
      expv[23] = 8'h0a;
      expv[24] = 8'h6f;
      expv[25] = 8'h16;
      expv[26] = 8'h16;
      expv[27] = 8'h4e;
      expv[28] = 8'h4e;
      expv[29] = 8'hef;
      expv[30] = 8'hef;
      expv[31] = 8'hab;
      expv[32] = 8'h72;
      expv[33] = 8'h87;
      expv[34] = 8'h87;
      expv[35] = 8'h87;
      expv[36] = 8'h87;
      expv[37] = 8'h87;
      expv[38] = 8'h87;
      expv[39] = 8'h88;
      expv[40] = 8'h6e;
      expv[41] = 8'hfc;
      expv[42] = 8'h44;
      expv[43] = 8'h44;
      expv[44] = 8'h44;
      expv[45] = 8'hc6;
      expv[46] = 8'ha8;
      expv[47] = 8'ha8;
      expv[48] = 8'h00;
      expv[49] = 8'h00;
      expv[50] = 8'h3c;
      expv[51] = 8'h3c;
      expv[52] = 8'hf3;
      expv[53] = 8'hf3;
      expv[54] = 8'h00;
      expv[55] = 8'h00;
      expv[56] = 8'h00;
      expv[57] = 8'h00;
      expv[58] = 8'h00;
      expv[59] = 8'h1c;
      expv[60] = 8'h32;
      expv[61] = 8'h32;
      expv[62] = 8'h32;
      expv[63] = 8'h32;
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
