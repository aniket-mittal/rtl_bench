// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 19;
  localparam OW = 18;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_128425 dut (
    .clk(clk),
    .rst(in_vec[18:18]),
    .start_chan1(in_vec[17:17]),
    .start_chan2(in_vec[16:16]),
    .src_addr_chan1(in_vec[15:8]),
    .src_addr_chan2(in_vec[7:0]),
    .dest_addr_chan1(out_vec[17:10]),
    .dest_addr_chan2(out_vec[9:2]),
    .transfer_complete_chan1(out_vec[1:1]),
    .transfer_complete_chan2(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 19'h760c9;
    stim[1] = 19'h50347;
    stim[2] = 19'h3ad41;
    stim[3] = 19'h1d5c8;
    stim[4] = 19'h0625c;
    stim[5] = 19'h11f9f;
    stim[6] = 19'h3e8a4;
    stim[7] = 19'h207ee;
    stim[8] = 19'h0efe3;
    stim[9] = 19'h0c012;
    stim[10] = 19'h0a9d9;
    stim[11] = 19'h2384a;
    stim[12] = 19'h0f83e;
    stim[13] = 19'h2c6c5;
    stim[14] = 19'h33364;
    stim[15] = 19'h1f9cc;
    stim[16] = 19'h0dfe0;
    stim[17] = 19'h1947e;
    stim[18] = 19'h168f0;
    stim[19] = 19'h04cf7;
    stim[20] = 19'h300a1;
    stim[21] = 19'h33b2e;
    stim[22] = 19'h21ef8;
    stim[23] = 19'h36dc4;
    stim[24] = 19'h2a6ca;
    stim[25] = 19'h254ae;
    stim[26] = 19'h3fdb0;
    stim[27] = 19'h2a992;
    stim[28] = 19'h1b912;
    stim[29] = 19'h23664;
    stim[30] = 19'h39887;
    stim[31] = 19'h1d259;
    stim[32] = 19'h34125;
    stim[33] = 19'h17030;
    stim[34] = 19'h33fae;
    stim[35] = 19'h1fe2d;
    stim[36] = 19'h18928;
    stim[37] = 19'h31930;
    stim[38] = 19'h05ac4;
    stim[39] = 19'h21891;
    stim[40] = 19'h04d3e;
    stim[41] = 19'h092b3;
    stim[42] = 19'h297a8;
    stim[43] = 19'h1bfd3;
    stim[44] = 19'h18f7e;
    stim[45] = 19'h1397f;
    stim[46] = 19'h0fd2f;
    stim[47] = 19'h07daa;
    stim[48] = 19'h0c51c;
    stim[49] = 19'h181b7;
    stim[50] = 19'h0cf33;
    stim[51] = 19'h233fe;
    stim[52] = 19'h0d5a7;
    stim[53] = 19'h1e93a;
    stim[54] = 19'h11152;
    stim[55] = 19'h33164;
    stim[56] = 19'h1fac4;
    stim[57] = 19'h2d9f0;
    stim[58] = 19'h0b481;
    stim[59] = 19'h1e930;
    stim[60] = 19'h31eee;
    stim[61] = 19'h64645;
    stim[62] = 19'h07a51;
    stim[63] = 19'h0d1af;
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
      expv[0] = 18'h00000;
      expv[1] = 18'h00000;
      expv[2] = 18'h00000;
      expv[3] = 18'h00000;
      expv[4] = 18'h35400;
      expv[5] = 18'h35402;
      expv[6] = 18'h35402;
      expv[7] = 18'h35692;
      expv[8] = 18'h35693;
      expv[9] = 18'h35693;
      expv[10] = 18'h35693;
      expv[11] = 18'h35693;
      expv[12] = 18'h35693;
      expv[13] = 18'h3e293;
      expv[14] = 18'h3e293;
      expv[15] = 18'h3e293;
      expv[16] = 18'h3e693;
      expv[17] = 18'h3e693;
      expv[18] = 18'h3e693;
      expv[19] = 18'h3e7c3;
      expv[20] = 18'h3e7c3;
      expv[21] = 18'h3e7c3;
      expv[22] = 18'h0efc3;
      expv[23] = 18'h0efc3;
      expv[24] = 18'h0efc3;
      expv[25] = 18'h29bc3;
      expv[26] = 18'h29bc3;
      expv[27] = 18'h29bc3;
      expv[28] = 18'h2a7c3;
      expv[29] = 18'h2a7c3;
      expv[30] = 18'h2a7c3;
      expv[31] = 18'h263c3;
      expv[32] = 18'h263c3;
      expv[33] = 18'h263c3;
      expv[34] = 18'h1c3c3;
      expv[35] = 18'h1c3c3;
      expv[36] = 18'h1c3c3;
      expv[37] = 18'h1c0a3;
      expv[38] = 18'h1c0a3;
      expv[39] = 18'h1c0a3;
      expv[40] = 18'h1c0a3;
      expv[41] = 18'h134a3;
      expv[42] = 18'h134a3;
      expv[43] = 18'h134a3;
      expv[44] = 18'h2fca3;
      expv[45] = 18'h2fca3;
      expv[46] = 18'h2fca3;
      expv[47] = 18'h2fcbf;
      expv[48] = 18'h2fcbf;
      expv[49] = 18'h2fcbf;
      expv[50] = 18'h2fcbf;
      expv[51] = 18'h2fccf;
      expv[52] = 18'h2fccf;
      expv[53] = 18'h2fccf;
      expv[54] = 18'h2fccf;
      expv[55] = 18'h2fd4b;
      expv[56] = 18'h2fd4b;
      expv[57] = 18'h2fd4b;
      expv[58] = 18'h2ffc3;
      expv[59] = 18'h2ffc3;
      expv[60] = 18'h2ffc3;
      expv[61] = 18'h00000;
      expv[62] = 18'h00000;
      expv[63] = 18'h00000;
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
