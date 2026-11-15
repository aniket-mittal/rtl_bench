// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 2;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_183408 dut (
    .En(in_vec[11:11]),
    .S(in_vec[10:8]),
    .D(in_vec[7:0]),
    .Y(out_vec[1:1]),
    .Yn(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'h39b;
    stim[1] = 12'hb4f;
    stim[2] = 12'hc54;
    stim[3] = 12'hf9c;
    stim[4] = 12'h060;
    stim[5] = 12'h5bf;
    stim[6] = 12'he50;
    stim[7] = 12'hf5a;
    stim[8] = 12'h57e;
    stim[9] = 12'h93f;
    stim[10] = 12'hdcc;
    stim[11] = 12'h1ae;
    stim[12] = 12'h116;
    stim[13] = 12'hbe9;
    stim[14] = 12'h91c;
    stim[15] = 12'hc0d;
    stim[16] = 12'h3f0;
    stim[17] = 12'hd00;
    stim[18] = 12'hdb8;
    stim[19] = 12'hdae;
    stim[20] = 12'h14a;
    stim[21] = 12'hb8b;
    stim[22] = 12'hb3c;
    stim[23] = 12'hf9c;
    stim[24] = 12'he8a;
    stim[25] = 12'h1ca;
    stim[26] = 12'hb72;
    stim[27] = 12'h228;
    stim[28] = 12'h81f;
    stim[29] = 12'hf7d;
    stim[30] = 12'ha57;
    stim[31] = 12'h029;
    stim[32] = 12'h5f1;
    stim[33] = 12'h282;
    stim[34] = 12'ha8c;
    stim[35] = 12'h0f8;
    stim[36] = 12'h6f8;
    stim[37] = 12'hc31;
    stim[38] = 12'h7c6;
    stim[39] = 12'hb7e;
    stim[40] = 12'h35f;
    stim[41] = 12'ha1c;
    stim[42] = 12'h07e;
    stim[43] = 12'ha09;
    stim[44] = 12'hedf;
    stim[45] = 12'h48e;
    stim[46] = 12'h45a;
    stim[47] = 12'ha0c;
    stim[48] = 12'h12c;
    stim[49] = 12'h7f6;
    stim[50] = 12'hd4a;
    stim[51] = 12'hb93;
    stim[52] = 12'hd24;
    stim[53] = 12'h9b5;
    stim[54] = 12'hada;
    stim[55] = 12'h54e;
    stim[56] = 12'h2f8;
    stim[57] = 12'h105;
    stim[58] = 12'hf3e;
    stim[59] = 12'h0a9;
    stim[60] = 12'h6dd;
    stim[61] = 12'hbef;
    stim[62] = 12'h0ed;
    stim[63] = 12'h85b;
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
      expv[0] = 2'h2;
      expv[1] = 2'h1;
      expv[2] = 2'h1;
      expv[3] = 2'h1;
      expv[4] = 2'h1;
      expv[5] = 2'h2;
      expv[6] = 2'h1;
      expv[7] = 2'h1;
      expv[8] = 2'h2;
      expv[9] = 2'h1;
      expv[10] = 2'h1;
      expv[11] = 2'h2;
      expv[12] = 2'h2;
      expv[13] = 2'h1;
      expv[14] = 2'h1;
      expv[15] = 2'h1;
      expv[16] = 2'h1;
      expv[17] = 2'h1;
      expv[18] = 2'h1;
      expv[19] = 2'h1;
      expv[20] = 2'h2;
      expv[21] = 2'h1;
      expv[22] = 2'h1;
      expv[23] = 2'h1;
      expv[24] = 2'h1;
      expv[25] = 2'h2;
      expv[26] = 2'h1;
      expv[27] = 2'h1;
      expv[28] = 2'h1;
      expv[29] = 2'h1;
      expv[30] = 2'h1;
      expv[31] = 2'h2;
      expv[32] = 2'h2;
      expv[33] = 2'h1;
      expv[34] = 2'h1;
      expv[35] = 2'h1;
      expv[36] = 2'h2;
      expv[37] = 2'h1;
      expv[38] = 2'h2;
      expv[39] = 2'h1;
      expv[40] = 2'h2;
      expv[41] = 2'h1;
      expv[42] = 2'h1;
      expv[43] = 2'h1;
      expv[44] = 2'h1;
      expv[45] = 2'h1;
      expv[46] = 2'h2;
      expv[47] = 2'h1;
      expv[48] = 2'h1;
      expv[49] = 2'h2;
      expv[50] = 2'h1;
      expv[51] = 2'h1;
      expv[52] = 2'h1;
      expv[53] = 2'h1;
      expv[54] = 2'h1;
      expv[55] = 2'h1;
      expv[56] = 2'h1;
      expv[57] = 2'h1;
      expv[58] = 2'h1;
      expv[59] = 2'h2;
      expv[60] = 2'h2;
      expv[61] = 2'h1;
      expv[62] = 2'h2;
      expv[63] = 2'h1;
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
