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

  CDP_ICVT_mgc_in_wire_v1 dut (
    .z(in_vec[7:0]),
    .d(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'h82;
    stim[1] = 8'h8c;
    stim[2] = 8'h01;
    stim[3] = 8'h26;
    stim[4] = 8'hf9;
    stim[5] = 8'hb4;
    stim[6] = 8'h11;
    stim[7] = 8'h25;
    stim[8] = 8'hcc;
    stim[9] = 8'h25;
    stim[10] = 8'h50;
    stim[11] = 8'h7b;
    stim[12] = 8'he8;
    stim[13] = 8'h77;
    stim[14] = 8'h21;
    stim[15] = 8'hfd;
    stim[16] = 8'hee;
    stim[17] = 8'hf7;
    stim[18] = 8'hb0;
    stim[19] = 8'h7a;
    stim[20] = 8'hda;
    stim[21] = 8'hdd;
    stim[22] = 8'h41;
    stim[23] = 8'hf0;
    stim[24] = 8'h0c;
    stim[25] = 8'h59;
    stim[26] = 8'h17;
    stim[27] = 8'h63;
    stim[28] = 8'h13;
    stim[29] = 8'h18;
    stim[30] = 8'h9e;
    stim[31] = 8'hc6;
    stim[32] = 8'h14;
    stim[33] = 8'hb6;
    stim[34] = 8'h0a;
    stim[35] = 8'hd2;
    stim[36] = 8'h1a;
    stim[37] = 8'hf7;
    stim[38] = 8'h35;
    stim[39] = 8'hc0;
    stim[40] = 8'hec;
    stim[41] = 8'h99;
    stim[42] = 8'h34;
    stim[43] = 8'h72;
    stim[44] = 8'h67;
    stim[45] = 8'hd7;
    stim[46] = 8'h1b;
    stim[47] = 8'h33;
    stim[48] = 8'h19;
    stim[49] = 8'h2a;
    stim[50] = 8'hb5;
    stim[51] = 8'hd7;
    stim[52] = 8'hd4;
    stim[53] = 8'h73;
    stim[54] = 8'h8d;
    stim[55] = 8'h02;
    stim[56] = 8'hb1;
    stim[57] = 8'hd3;
    stim[58] = 8'h7b;
    stim[59] = 8'h6f;
    stim[60] = 8'h79;
    stim[61] = 8'h1d;
    stim[62] = 8'h90;
    stim[63] = 8'hb5;
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
      expv[0] = 8'h82;
      expv[1] = 8'h8c;
      expv[2] = 8'h01;
      expv[3] = 8'h26;
      expv[4] = 8'hf9;
      expv[5] = 8'hb4;
      expv[6] = 8'h11;
      expv[7] = 8'h25;
      expv[8] = 8'hcc;
      expv[9] = 8'h25;
      expv[10] = 8'h50;
      expv[11] = 8'h7b;
      expv[12] = 8'he8;
      expv[13] = 8'h77;
      expv[14] = 8'h21;
      expv[15] = 8'hfd;
      expv[16] = 8'hee;
      expv[17] = 8'hf7;
      expv[18] = 8'hb0;
      expv[19] = 8'h7a;
      expv[20] = 8'hda;
      expv[21] = 8'hdd;
      expv[22] = 8'h41;
      expv[23] = 8'hf0;
      expv[24] = 8'h0c;
      expv[25] = 8'h59;
      expv[26] = 8'h17;
      expv[27] = 8'h63;
      expv[28] = 8'h13;
      expv[29] = 8'h18;
      expv[30] = 8'h9e;
      expv[31] = 8'hc6;
      expv[32] = 8'h14;
      expv[33] = 8'hb6;
      expv[34] = 8'h0a;
      expv[35] = 8'hd2;
      expv[36] = 8'h1a;
      expv[37] = 8'hf7;
      expv[38] = 8'h35;
      expv[39] = 8'hc0;
      expv[40] = 8'hec;
      expv[41] = 8'h99;
      expv[42] = 8'h34;
      expv[43] = 8'h72;
      expv[44] = 8'h67;
      expv[45] = 8'hd7;
      expv[46] = 8'h1b;
      expv[47] = 8'h33;
      expv[48] = 8'h19;
      expv[49] = 8'h2a;
      expv[50] = 8'hb5;
      expv[51] = 8'hd7;
      expv[52] = 8'hd4;
      expv[53] = 8'h73;
      expv[54] = 8'h8d;
      expv[55] = 8'h02;
      expv[56] = 8'hb1;
      expv[57] = 8'hd3;
      expv[58] = 8'h7b;
      expv[59] = 8'h6f;
      expv[60] = 8'h79;
      expv[61] = 8'h1d;
      expv[62] = 8'h90;
      expv[63] = 8'hb5;
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
