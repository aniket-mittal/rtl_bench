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

  gf_mult_by_5a dut (
    .i(in_vec[7:0]),
    .o(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'h72;
    stim[1] = 8'h24;
    stim[2] = 8'h72;
    stim[3] = 8'h6f;
    stim[4] = 8'hd6;
    stim[5] = 8'h65;
    stim[6] = 8'hee;
    stim[7] = 8'hb7;
    stim[8] = 8'hd8;
    stim[9] = 8'hf6;
    stim[10] = 8'hd6;
    stim[11] = 8'h76;
    stim[12] = 8'h84;
    stim[13] = 8'hbf;
    stim[14] = 8'hd0;
    stim[15] = 8'h8e;
    stim[16] = 8'hf0;
    stim[17] = 8'h5e;
    stim[18] = 8'hc8;
    stim[19] = 8'hc9;
    stim[20] = 8'hf8;
    stim[21] = 8'hf9;
    stim[22] = 8'h36;
    stim[23] = 8'h0d;
    stim[24] = 8'hf0;
    stim[25] = 8'h74;
    stim[26] = 8'had;
    stim[27] = 8'h54;
    stim[28] = 8'hca;
    stim[29] = 8'h66;
    stim[30] = 8'h17;
    stim[31] = 8'h69;
    stim[32] = 8'h30;
    stim[33] = 8'h43;
    stim[34] = 8'hb7;
    stim[35] = 8'h67;
    stim[36] = 8'h93;
    stim[37] = 8'h62;
    stim[38] = 8'h89;
    stim[39] = 8'h1c;
    stim[40] = 8'h77;
    stim[41] = 8'hd0;
    stim[42] = 8'h8e;
    stim[43] = 8'h61;
    stim[44] = 8'h97;
    stim[45] = 8'h52;
    stim[46] = 8'hc6;
    stim[47] = 8'h26;
    stim[48] = 8'hd9;
    stim[49] = 8'hf3;
    stim[50] = 8'h53;
    stim[51] = 8'h98;
    stim[52] = 8'h92;
    stim[53] = 8'h52;
    stim[54] = 8'hc9;
    stim[55] = 8'hf1;
    stim[56] = 8'h27;
    stim[57] = 8'h49;
    stim[58] = 8'hae;
    stim[59] = 8'hd8;
    stim[60] = 8'h18;
    stim[61] = 8'h2d;
    stim[62] = 8'hc0;
    stim[63] = 8'h36;
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
      expv[0] = 8'hf1;
      expv[1] = 8'hfa;
      expv[2] = 8'hf1;
      expv[3] = 8'hfd;
      expv[4] = 8'h0d;
      expv[5] = 8'ha3;
      expv[6] = 8'ha1;
      expv[7] = 8'hdb;
      expv[8] = 8'h26;
      expv[9] = 8'h82;
      expv[10] = 8'h0d;
      expv[11] = 8'h84;
      expv[12] = 8'h73;
      expv[13] = 8'h31;
      expv[14] = 8'hcc;
      expv[15] = 8'h2d;
      expv[16] = 8'h43;
      expv[17] = 8'he1;
      expv[18] = 8'hef;
      expv[19] = 8'hb5;
      expv[20] = 8'ha9;
      expv[21] = 8'hf3;
      expv[22] = 8'h87;
      expv[23] = 8'hc5;
      expv[24] = 8'h43;
      expv[25] = 8'h30;
      expv[26] = 8'h4c;
      expv[27] = 8'hbf;
      expv[28] = 8'h5b;
      expv[29] = 8'h4d;
      expv[30] = 8'h52;
      expv[31] = 8'h3c;
      expv[32] = 8'h46;
      expv[33] = 8'hed;
      expv[34] = 8'hdb;
      expv[35] = 8'h17;
      expv[36] = 8'h21;
      expv[37] = 8'h38;
      expv[38] = 8'hb6;
      expv[39] = 8'h56;
      expv[40] = 8'hde;
      expv[41] = 8'hcc;
      expv[42] = 8'h2d;
      expv[43] = 8'hd6;
      expv[44] = 8'h54;
      expv[45] = 8'h7e;
      expv[46] = 8'hc4;
      expv[47] = 8'h4e;
      expv[48] = 8'h7c;
      expv[49] = 8'had;
      expv[50] = 8'h24;
      expv[51] = 8'h25;
      expv[52] = 8'h7b;
      expv[53] = 8'h7e;
      expv[54] = 8'hb5;
      expv[55] = 8'h19;
      expv[56] = 8'h14;
      expv[57] = 8'hb3;
      expv[58] = 8'ha2;
      expv[59] = 8'h26;
      expv[60] = 8'h23;
      expv[61] = 8'h4a;
      expv[62] = 8'h05;
      expv[63] = 8'h87;
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
