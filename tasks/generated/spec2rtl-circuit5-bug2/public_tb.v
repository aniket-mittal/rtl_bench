// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 20;
  localparam OW = 4;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  dut dut (
    .a(in_vec[19:16]),
    .b(in_vec[15:12]),
    .c(in_vec[11:8]),
    .d(in_vec[7:4]),
    .e(in_vec[3:0]),
    .q(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 20'hbd09e;
    stim[1] = 20'h973b1;
    stim[2] = 20'hf339e;
    stim[3] = 20'h7a655;
    stim[4] = 20'hd96fe;
    stim[5] = 20'h3056c;
    stim[6] = 20'hc0838;
    stim[7] = 20'h0a129;
    stim[8] = 20'hea6f9;
    stim[9] = 20'ha034b;
    stim[10] = 20'h72491;
    stim[11] = 20'h1ca1c;
    stim[12] = 20'h4beeb;
    stim[13] = 20'hb5c5e;
    stim[14] = 20'h8d5dd;
    stim[15] = 20'h56e12;
    stim[16] = 20'haa03f;
    stim[17] = 20'h352f5;
    stim[18] = 20'h04556;
    stim[19] = 20'h918be;
    stim[20] = 20'h2e0f2;
    stim[21] = 20'h93670;
    stim[22] = 20'h44b70;
    stim[23] = 20'h67f74;
    stim[24] = 20'h7cbe1;
    stim[25] = 20'haa35b;
    stim[26] = 20'h6fc66;
    stim[27] = 20'h3a26e;
    stim[28] = 20'h5b63a;
    stim[29] = 20'hbd22d;
    stim[30] = 20'haa127;
    stim[31] = 20'hf7fa0;
    stim[32] = 20'h03525;
    stim[33] = 20'h74786;
    stim[34] = 20'h50ad7;
    stim[35] = 20'h5ffc0;
    stim[36] = 20'h779c5;
    stim[37] = 20'h664b0;
    stim[38] = 20'h4dc3b;
    stim[39] = 20'h32a63;
    stim[40] = 20'h257ce;
    stim[41] = 20'h298d9;
    stim[42] = 20'h382c2;
    stim[43] = 20'h3f665;
    stim[44] = 20'h29560;
    stim[45] = 20'h28eb3;
    stim[46] = 20'h985a6;
    stim[47] = 20'hab85e;
    stim[48] = 20'h72770;
    stim[49] = 20'h63e66;
    stim[50] = 20'h0907c;
    stim[51] = 20'hfd4a1;
    stim[52] = 20'h67bb0;
    stim[53] = 20'h572ab;
    stim[54] = 20'h44837;
    stim[55] = 20'h95c9f;
    stim[56] = 20'hd262f;
    stim[57] = 20'ha3416;
    stim[58] = 20'h63598;
    stim[59] = 20'h7337f;
    stim[60] = 20'he3c7b;
    stim[61] = 20'hbe0da;
    stim[62] = 20'h7e707;
    stim[63] = 20'h5d547;
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
      expv[0] = 4'hd;
      expv[1] = 4'hf;
      expv[2] = 4'hf;
      expv[3] = 4'hf;
      expv[4] = 4'hf;
      expv[5] = 4'hf;
      expv[6] = 4'hf;
      expv[7] = 4'h9;
      expv[8] = 4'hf;
      expv[9] = 4'hf;
      expv[10] = 4'hf;
      expv[11] = 4'hf;
      expv[12] = 4'hf;
      expv[13] = 4'hf;
      expv[14] = 4'hf;
      expv[15] = 4'hf;
      expv[16] = 4'ha;
      expv[17] = 4'h3;
      expv[18] = 4'hf;
      expv[19] = 4'hf;
      expv[20] = 4'he;
      expv[21] = 4'hf;
      expv[22] = 4'hf;
      expv[23] = 4'hf;
      expv[24] = 4'hf;
      expv[25] = 4'hf;
      expv[26] = 4'hf;
      expv[27] = 4'h3;
      expv[28] = 4'hf;
      expv[29] = 4'hb;
      expv[30] = 4'h7;
      expv[31] = 4'hf;
      expv[32] = 4'hf;
      expv[33] = 4'hf;
      expv[34] = 4'hf;
      expv[35] = 4'hf;
      expv[36] = 4'hf;
      expv[37] = 4'hf;
      expv[38] = 4'hf;
      expv[39] = 4'hf;
      expv[40] = 4'hf;
      expv[41] = 4'hf;
      expv[42] = 4'h3;
      expv[43] = 4'hf;
      expv[44] = 4'hf;
      expv[45] = 4'hf;
      expv[46] = 4'hf;
      expv[47] = 4'hf;
      expv[48] = 4'hf;
      expv[49] = 4'hf;
      expv[50] = 4'h9;
      expv[51] = 4'hf;
      expv[52] = 4'hf;
      expv[53] = 4'h5;
      expv[54] = 4'hf;
      expv[55] = 4'hf;
      expv[56] = 4'hf;
      expv[57] = 4'hf;
      expv[58] = 4'hf;
      expv[59] = 4'hf;
      expv[60] = 4'hf;
      expv[61] = 4'he;
      expv[62] = 4'hf;
      expv[63] = 4'hf;
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
