// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_104067 dut (
    .clk(clk),
    .rst_n(in_vec[10:10]),
    .clr(in_vec[9:9]),
    .din(in_vec[8:1]),
    .sin(in_vec[0:0]),
    .dout(out_vec[16:9]),
    .dshift(out_vec[8:1]),
    .sout(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h323;
    stim[1] = 11'h0ac;
    stim[2] = 11'h4bb;
    stim[3] = 11'h521;
    stim[4] = 11'h553;
    stim[5] = 11'h792;
    stim[6] = 11'h560;
    stim[7] = 11'h7ca;
    stim[8] = 11'h6a0;
    stim[9] = 11'h662;
    stim[10] = 11'h53c;
    stim[11] = 11'h7f0;
    stim[12] = 11'h74c;
    stim[13] = 11'h783;
    stim[14] = 11'h4cd;
    stim[15] = 11'h6b7;
    stim[16] = 11'h5bd;
    stim[17] = 11'h5b3;
    stim[18] = 11'h7b5;
    stim[19] = 11'h74c;
    stim[20] = 11'h4dd;
    stim[21] = 11'h652;
    stim[22] = 11'h5d5;
    stim[23] = 11'h4fe;
    stim[24] = 11'h41b;
    stim[25] = 11'h691;
    stim[26] = 11'h4fe;
    stim[27] = 11'h5c3;
    stim[28] = 11'h77c;
    stim[29] = 11'h700;
    stim[30] = 11'h76a;
    stim[31] = 11'h57e;
    stim[32] = 11'h445;
    stim[33] = 11'h682;
    stim[34] = 11'h61e;
    stim[35] = 11'h48b;
    stim[36] = 11'h732;
    stim[37] = 11'h768;
    stim[38] = 11'h7ff;
    stim[39] = 11'h62b;
    stim[40] = 11'h483;
    stim[41] = 11'h671;
    stim[42] = 11'h56d;
    stim[43] = 11'h582;
    stim[44] = 11'h5c0;
    stim[45] = 11'h447;
    stim[46] = 11'h643;
    stim[47] = 11'h6a0;
    stim[48] = 11'h547;
    stim[49] = 11'h441;
    stim[50] = 11'h47d;
    stim[51] = 11'h59a;
    stim[52] = 11'h6ba;
    stim[53] = 11'h539;
    stim[54] = 11'h4a0;
    stim[55] = 11'h42f;
    stim[56] = 11'h511;
    stim[57] = 11'h59f;
    stim[58] = 11'h438;
    stim[59] = 11'h5b9;
    stim[60] = 11'h436;
    stim[61] = 11'h7fe;
    stim[62] = 11'h7ec;
    stim[63] = 11'h469;
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
      expv[0] = 17'h00000;
      expv[1] = 17'h00000;
      expv[2] = 17'h00000;
      expv[3] = 17'h0ba0x;
      expv[4] = 17'h0ba01;
      expv[5] = 17'h0ba01;
      expv[6] = 17'h0ba01;
      expv[7] = 17'h0ba00;
      expv[8] = 17'h0ba00;
      expv[9] = 17'h0ba00;
      expv[10] = 17'h0ba00;
      expv[11] = 17'h0ba00;
      expv[12] = 17'h0ba00;
      expv[13] = 17'h0ba00;
      expv[14] = 17'h0ba00;
      expv[15] = 17'h0ba01;
      expv[16] = 17'h0ba01;
      expv[17] = 17'h0ba01;
      expv[18] = 17'h0ba01;
      expv[19] = 17'h0ba01;
      expv[20] = 17'h0ba01;
      expv[21] = 17'h0ba00;
      expv[22] = 17'h0ba01;
      expv[23] = 17'h0ba00;
      expv[24] = 17'h0ba01;
      expv[25] = 17'h0ba00;
      expv[26] = 17'h0ba01;
      expv[27] = 17'h0ba01;
      expv[28] = 17'h0ba00;
      expv[29] = 17'h0ba01;
      expv[30] = 17'h0ba00;
      expv[31] = 17'h0ba00;
      expv[32] = 17'h0ba00;
      expv[33] = 17'h0ba00;
      expv[34] = 17'h0ba01;
      expv[35] = 17'h0ba00;
      expv[36] = 17'h0ba00;
      expv[37] = 17'h0ba01;
      expv[38] = 17'h0ba00;
      expv[39] = 17'h0ba00;
      expv[40] = 17'h0ba01;
      expv[41] = 17'h0ba01;
      expv[42] = 17'h0ba01;
      expv[43] = 17'h0ba01;
      expv[44] = 17'h0ba01;
      expv[45] = 17'h0ba00;
      expv[46] = 17'h0ba00;
      expv[47] = 17'h0ba01;
      expv[48] = 17'h0ba01;
      expv[49] = 17'h0ba00;
      expv[50] = 17'h0ba01;
      expv[51] = 17'h0ba01;
      expv[52] = 17'h0ba01;
      expv[53] = 17'h0ba00;
      expv[54] = 17'h0ba00;
      expv[55] = 17'h0ba01;
      expv[56] = 17'h0ba00;
      expv[57] = 17'h0ba01;
      expv[58] = 17'h0ba01;
      expv[59] = 17'h0ba01;
      expv[60] = 17'h0ba00;
      expv[61] = 17'h0ba01;
      expv[62] = 17'h0ba00;
      expv[63] = 17'h0ba00;
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
