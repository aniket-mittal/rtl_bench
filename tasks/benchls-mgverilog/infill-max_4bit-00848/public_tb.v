// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 8;
  localparam OW = 4;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_00848 dut (
    .x(in_vec[7:4]),
    .y(in_vec[3:0]),
    .z(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'h80;
    stim[1] = 8'h19;
    stim[2] = 8'hca;
    stim[3] = 8'h9e;
    stim[4] = 8'hf9;
    stim[5] = 8'h8e;
    stim[6] = 8'hff;
    stim[7] = 8'hea;
    stim[8] = 8'h65;
    stim[9] = 8'h48;
    stim[10] = 8'hbd;
    stim[11] = 8'he5;
    stim[12] = 8'hb5;
    stim[13] = 8'h7b;
    stim[14] = 8'h30;
    stim[15] = 8'h62;
    stim[16] = 8'h54;
    stim[17] = 8'hd1;
    stim[18] = 8'h28;
    stim[19] = 8'h81;
    stim[20] = 8'h49;
    stim[21] = 8'hd1;
    stim[22] = 8'ha6;
    stim[23] = 8'h18;
    stim[24] = 8'ha3;
    stim[25] = 8'hd9;
    stim[26] = 8'h76;
    stim[27] = 8'h79;
    stim[28] = 8'he2;
    stim[29] = 8'h18;
    stim[30] = 8'h33;
    stim[31] = 8'ha3;
    stim[32] = 8'hd4;
    stim[33] = 8'he1;
    stim[34] = 8'hc7;
    stim[35] = 8'he4;
    stim[36] = 8'h82;
    stim[37] = 8'h3f;
    stim[38] = 8'h7f;
    stim[39] = 8'hba;
    stim[40] = 8'hf7;
    stim[41] = 8'hf2;
    stim[42] = 8'he5;
    stim[43] = 8'hb8;
    stim[44] = 8'h10;
    stim[45] = 8'h9c;
    stim[46] = 8'h29;
    stim[47] = 8'h44;
    stim[48] = 8'hc9;
    stim[49] = 8'h1d;
    stim[50] = 8'hf7;
    stim[51] = 8'hd8;
    stim[52] = 8'h73;
    stim[53] = 8'hd9;
    stim[54] = 8'h15;
    stim[55] = 8'ha6;
    stim[56] = 8'h03;
    stim[57] = 8'h0a;
    stim[58] = 8'hf5;
    stim[59] = 8'he2;
    stim[60] = 8'hed;
    stim[61] = 8'hf7;
    stim[62] = 8'he1;
    stim[63] = 8'h93;
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
      expv[0] = 4'h8;
      expv[1] = 4'h9;
      expv[2] = 4'hc;
      expv[3] = 4'he;
      expv[4] = 4'hf;
      expv[5] = 4'he;
      expv[6] = 4'hf;
      expv[7] = 4'he;
      expv[8] = 4'h6;
      expv[9] = 4'h8;
      expv[10] = 4'hd;
      expv[11] = 4'he;
      expv[12] = 4'hb;
      expv[13] = 4'hb;
      expv[14] = 4'h3;
      expv[15] = 4'h6;
      expv[16] = 4'h5;
      expv[17] = 4'hd;
      expv[18] = 4'h8;
      expv[19] = 4'h8;
      expv[20] = 4'h9;
      expv[21] = 4'hd;
      expv[22] = 4'ha;
      expv[23] = 4'h8;
      expv[24] = 4'ha;
      expv[25] = 4'hd;
      expv[26] = 4'h7;
      expv[27] = 4'h9;
      expv[28] = 4'he;
      expv[29] = 4'h8;
      expv[30] = 4'h3;
      expv[31] = 4'ha;
      expv[32] = 4'hd;
      expv[33] = 4'he;
      expv[34] = 4'hc;
      expv[35] = 4'he;
      expv[36] = 4'h8;
      expv[37] = 4'hf;
      expv[38] = 4'hf;
      expv[39] = 4'hb;
      expv[40] = 4'hf;
      expv[41] = 4'hf;
      expv[42] = 4'he;
      expv[43] = 4'hb;
      expv[44] = 4'h1;
      expv[45] = 4'hc;
      expv[46] = 4'h9;
      expv[47] = 4'h4;
      expv[48] = 4'hc;
      expv[49] = 4'hd;
      expv[50] = 4'hf;
      expv[51] = 4'hd;
      expv[52] = 4'h7;
      expv[53] = 4'hd;
      expv[54] = 4'h5;
      expv[55] = 4'ha;
      expv[56] = 4'h3;
      expv[57] = 4'ha;
      expv[58] = 4'hf;
      expv[59] = 4'he;
      expv[60] = 4'he;
      expv[61] = 4'hf;
      expv[62] = 4'he;
      expv[63] = 4'h9;
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
