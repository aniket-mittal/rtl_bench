// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 8;
  localparam OW = 3;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_152796 dut (
    .aluop1(in_vec[7:7]),
    .aluop0(in_vec[6:6]),
    .f3(in_vec[5:5]),
    .f2(in_vec[4:4]),
    .f1(in_vec[3:3]),
    .f0(in_vec[2:2]),
    .ORIidentifierSignal(in_vec[1:1]),
    .bneal_identifier(in_vec[0:0]),
    .gout(out_vec[2:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'hbd;
    stim[1] = 8'h49;
    stim[2] = 8'hc5;
    stim[3] = 8'h1d;
    stim[4] = 8'hba;
    stim[5] = 8'h6e;
    stim[6] = 8'hbd;
    stim[7] = 8'hb3;
    stim[8] = 8'h5f;
    stim[9] = 8'h7f;
    stim[10] = 8'hff;
    stim[11] = 8'h53;
    stim[12] = 8'hf3;
    stim[13] = 8'h3f;
    stim[14] = 8'h0b;
    stim[15] = 8'hd3;
    stim[16] = 8'h77;
    stim[17] = 8'h0b;
    stim[18] = 8'hca;
    stim[19] = 8'heb;
    stim[20] = 8'h14;
    stim[21] = 8'hc4;
    stim[22] = 8'h5e;
    stim[23] = 8'h95;
    stim[24] = 8'hd3;
    stim[25] = 8'h82;
    stim[26] = 8'h7e;
    stim[27] = 8'h5d;
    stim[28] = 8'h74;
    stim[29] = 8'h15;
    stim[30] = 8'h0e;
    stim[31] = 8'h9c;
    stim[32] = 8'h83;
    stim[33] = 8'h8a;
    stim[34] = 8'h29;
    stim[35] = 8'h0a;
    stim[36] = 8'h65;
    stim[37] = 8'ha7;
    stim[38] = 8'h3e;
    stim[39] = 8'hf9;
    stim[40] = 8'hb0;
    stim[41] = 8'h0b;
    stim[42] = 8'h0c;
    stim[43] = 8'h60;
    stim[44] = 8'h98;
    stim[45] = 8'h2f;
    stim[46] = 8'ha2;
    stim[47] = 8'hc7;
    stim[48] = 8'h63;
    stim[49] = 8'hcd;
    stim[50] = 8'h2b;
    stim[51] = 8'h1f;
    stim[52] = 8'h00;
    stim[53] = 8'h3d;
    stim[54] = 8'h84;
    stim[55] = 8'h16;
    stim[56] = 8'h5e;
    stim[57] = 8'h86;
    stim[58] = 8'hd8;
    stim[59] = 8'h5f;
    stim[60] = 8'h03;
    stim[61] = 8'h5a;
    stim[62] = 8'h1e;
    stim[63] = 8'h4d;
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
      expv[0] = 3'h6;
      expv[1] = 3'h6;
      expv[2] = 3'h6;
      expv[3] = 3'h6;
      expv[4] = 3'h1;
      expv[5] = 3'h1;
      expv[6] = 3'h6;
      expv[7] = 3'h1;
      expv[8] = 3'h1;
      expv[9] = 3'h1;
      expv[10] = 3'h1;
      expv[11] = 3'h1;
      expv[12] = 3'h1;
      expv[13] = 3'h1;
      expv[14] = 3'h1;
      expv[15] = 3'h1;
      expv[16] = 3'h1;
      expv[17] = 3'h1;
      expv[18] = 3'h1;
      expv[19] = 3'h1;
      expv[20] = 3'h2;
      expv[21] = 3'h6;
      expv[22] = 3'h1;
      expv[23] = 3'h6;
      expv[24] = 3'h1;
      expv[25] = 3'h1;
      expv[26] = 3'h1;
      expv[27] = 3'h6;
      expv[28] = 3'h6;
      expv[29] = 3'h6;
      expv[30] = 3'h1;
      expv[31] = 3'h6;
      expv[32] = 3'h1;
      expv[33] = 3'h1;
      expv[34] = 3'h6;
      expv[35] = 3'h1;
      expv[36] = 3'h6;
      expv[37] = 3'h1;
      expv[38] = 3'h1;
      expv[39] = 3'h6;
      expv[40] = 3'h0;
      expv[41] = 3'h1;
      expv[42] = 3'h2;
      expv[43] = 3'h6;
      expv[44] = 3'h6;
      expv[45] = 3'h1;
      expv[46] = 3'h1;
      expv[47] = 3'h1;
      expv[48] = 3'h1;
      expv[49] = 3'h6;
      expv[50] = 3'h1;
      expv[51] = 3'h1;
      expv[52] = 3'h2;
      expv[53] = 3'h6;
      expv[54] = 3'h2;
      expv[55] = 3'h1;
      expv[56] = 3'h1;
      expv[57] = 3'h1;
      expv[58] = 3'h6;
      expv[59] = 3'h1;
      expv[60] = 3'h1;
      expv[61] = 3'h1;
      expv[62] = 3'h1;
      expv[63] = 3'h6;
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
