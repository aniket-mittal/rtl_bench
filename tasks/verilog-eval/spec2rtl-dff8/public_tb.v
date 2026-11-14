// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 8;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  TopModule dut (
    .clk(clk),
    .d(in_vec[7:0]),
    .q(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'h45;
    stim[1] = 8'h76;
    stim[2] = 8'he2;
    stim[3] = 8'hd7;
    stim[4] = 8'ha6;
    stim[5] = 8'hf0;
    stim[6] = 8'h5a;
    stim[7] = 8'h4d;
    stim[8] = 8'hf7;
    stim[9] = 8'h0d;
    stim[10] = 8'h62;
    stim[11] = 8'he7;
    stim[12] = 8'h2d;
    stim[13] = 8'hed;
    stim[14] = 8'hb3;
    stim[15] = 8'h21;
    stim[16] = 8'h73;
    stim[17] = 8'h97;
    stim[18] = 8'h5c;
    stim[19] = 8'h22;
    stim[20] = 8'hc7;
    stim[21] = 8'ha0;
    stim[22] = 8'h14;
    stim[23] = 8'ha2;
    stim[24] = 8'h93;
    stim[25] = 8'h37;
    stim[26] = 8'h2f;
    stim[27] = 8'h80;
    stim[28] = 8'h33;
    stim[29] = 8'hfd;
    stim[30] = 8'h28;
    stim[31] = 8'h63;
    stim[32] = 8'h7f;
    stim[33] = 8'hde;
    stim[34] = 8'h30;
    stim[35] = 8'hf2;
    stim[36] = 8'hf2;
    stim[37] = 8'ha9;
    stim[38] = 8'h33;
    stim[39] = 8'h7d;
    stim[40] = 8'h5a;
    stim[41] = 8'h08;
    stim[42] = 8'h07;
    stim[43] = 8'h09;
    stim[44] = 8'hef;
    stim[45] = 8'h6e;
    stim[46] = 8'h86;
    stim[47] = 8'h26;
    stim[48] = 8'ha9;
    stim[49] = 8'hc3;
    stim[50] = 8'h8c;
    stim[51] = 8'hd4;
    stim[52] = 8'h2e;
    stim[53] = 8'h24;
    stim[54] = 8'h5c;
    stim[55] = 8'hb8;
    stim[56] = 8'hd1;
    stim[57] = 8'h85;
    stim[58] = 8'h5b;
    stim[59] = 8'h9f;
    stim[60] = 8'hc8;
    stim[61] = 8'h58;
    stim[62] = 8'h86;
    stim[63] = 8'h5a;
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
      expv[1] = 8'h45;
      expv[2] = 8'h76;
      expv[3] = 8'he2;
      expv[4] = 8'hd7;
      expv[5] = 8'ha6;
      expv[6] = 8'hf0;
      expv[7] = 8'h5a;
      expv[8] = 8'h4d;
      expv[9] = 8'hf7;
      expv[10] = 8'h0d;
      expv[11] = 8'h62;
      expv[12] = 8'he7;
      expv[13] = 8'h2d;
      expv[14] = 8'hed;
      expv[15] = 8'hb3;
      expv[16] = 8'h21;
      expv[17] = 8'h73;
      expv[18] = 8'h97;
      expv[19] = 8'h5c;
      expv[20] = 8'h22;
      expv[21] = 8'hc7;
      expv[22] = 8'ha0;
      expv[23] = 8'h14;
      expv[24] = 8'ha2;
      expv[25] = 8'h93;
      expv[26] = 8'h37;
      expv[27] = 8'h2f;
      expv[28] = 8'h80;
      expv[29] = 8'h33;
      expv[30] = 8'hfd;
      expv[31] = 8'h28;
      expv[32] = 8'h63;
      expv[33] = 8'h7f;
      expv[34] = 8'hde;
      expv[35] = 8'h30;
      expv[36] = 8'hf2;
      expv[37] = 8'hf2;
      expv[38] = 8'ha9;
      expv[39] = 8'h33;
      expv[40] = 8'h7d;
      expv[41] = 8'h5a;
      expv[42] = 8'h08;
      expv[43] = 8'h07;
      expv[44] = 8'h09;
      expv[45] = 8'hef;
      expv[46] = 8'h6e;
      expv[47] = 8'h86;
      expv[48] = 8'h26;
      expv[49] = 8'ha9;
      expv[50] = 8'hc3;
      expv[51] = 8'h8c;
      expv[52] = 8'hd4;
      expv[53] = 8'h2e;
      expv[54] = 8'h24;
      expv[55] = 8'h5c;
      expv[56] = 8'hb8;
      expv[57] = 8'hd1;
      expv[58] = 8'h85;
      expv[59] = 8'h5b;
      expv[60] = 8'h9f;
      expv[61] = 8'hc8;
      expv[62] = 8'h58;
      expv[63] = 8'h86;
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
