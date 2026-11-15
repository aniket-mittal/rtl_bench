// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 7;
  localparam OW = 46;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_140869 dut (
    .lpc_clock(clk),
    .lpc_ad(in_vec[6:3]),
    .lpc_frame(in_vec[2:2]),
    .lpc_reset(in_vec[1:1]),
    .reset(in_vec[0:0]),
    .out_cyctype_dir(out_vec[45:42]),
    .out_addr(out_vec[41:10]),
    .out_data(out_vec[9:2]),
    .out_sync_timeout(out_vec[1:1]),
    .out_clock_enable(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 7'h75;
    stim[1] = 7'h59;
    stim[2] = 7'h10;
    stim[3] = 7'h0a;
    stim[4] = 7'h1c;
    stim[5] = 7'h2a;
    stim[6] = 7'h1c;
    stim[7] = 7'h1e;
    stim[8] = 7'h28;
    stim[9] = 7'h6a;
    stim[10] = 7'h6e;
    stim[11] = 7'h1c;
    stim[12] = 7'h78;
    stim[13] = 7'h1a;
    stim[14] = 7'h3e;
    stim[15] = 7'h7a;
    stim[16] = 7'h02;
    stim[17] = 7'h70;
    stim[18] = 7'h20;
    stim[19] = 7'h46;
    stim[20] = 7'h1e;
    stim[21] = 7'h48;
    stim[22] = 7'h12;
    stim[23] = 7'h1e;
    stim[24] = 7'h2a;
    stim[25] = 7'h2a;
    stim[26] = 7'h3a;
    stim[27] = 7'h1e;
    stim[28] = 7'h12;
    stim[29] = 7'h16;
    stim[30] = 7'h34;
    stim[31] = 7'h48;
    stim[32] = 7'h6a;
    stim[33] = 7'h2a;
    stim[34] = 7'h50;
    stim[35] = 7'h0c;
    stim[36] = 7'h76;
    stim[37] = 7'h0c;
    stim[38] = 7'h00;
    stim[39] = 7'h54;
    stim[40] = 7'h10;
    stim[41] = 7'h1a;
    stim[42] = 7'h10;
    stim[43] = 7'h34;
    stim[44] = 7'h30;
    stim[45] = 7'h5e;
    stim[46] = 7'h02;
    stim[47] = 7'h6c;
    stim[48] = 7'h02;
    stim[49] = 7'h38;
    stim[50] = 7'h28;
    stim[51] = 7'h40;
    stim[52] = 7'h38;
    stim[53] = 7'h38;
    stim[54] = 7'h7a;
    stim[55] = 7'h62;
    stim[56] = 7'h12;
    stim[57] = 7'h6e;
    stim[58] = 7'h50;
    stim[59] = 7'h12;
    stim[60] = 7'h36;
    stim[61] = 7'h3e;
    stim[62] = 7'h78;
    stim[63] = 7'h1a;
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
      expv[0] = 46'h000000000000;
      expv[1] = 46'h000000000000;
      expv[2] = 46'h000000000000;
      expv[3] = 46'h000000000000;
      expv[4] = 46'h0c0000000000;
      expv[5] = 46'h000000000000;
      expv[6] = 46'h000000000000;
      expv[7] = 46'h000000000000;
      expv[8] = 46'h000000000000;
      expv[9] = 46'h000000000000;
      expv[10] = 46'h340000000000;
      expv[11] = 46'h000000000000;
      expv[12] = 46'h000000000000;
      expv[13] = 46'h000000000000;
      expv[14] = 46'h1c0000000000;
      expv[15] = 46'h000000000000;
      expv[16] = 46'h000000000000;
      expv[17] = 46'h380000000000;
      expv[18] = 46'h000000000000;
      expv[19] = 46'h000000000000;
      expv[20] = 46'h000000000000;
      expv[21] = 46'h000000000000;
      expv[22] = 46'h000000000000;
      expv[23] = 46'h0c0000000000;
      expv[24] = 46'h000000000000;
      expv[25] = 46'h000000000000;
      expv[26] = 46'h1c0000000000;
      expv[27] = 46'h000000000000;
      expv[28] = 46'h000000000000;
      expv[29] = 46'h000000000000;
      expv[30] = 46'h000000000000;
      expv[31] = 46'h000000000000;
      expv[32] = 46'h000000000000;
      expv[33] = 46'h140000000000;
      expv[34] = 46'h000000000000;
      expv[35] = 46'h000000000000;
      expv[36] = 46'h000000000000;
      expv[37] = 46'h000000000000;
      expv[38] = 46'h000000000000;
      expv[39] = 46'h000000000000;
      expv[40] = 46'h000000000000;
      expv[41] = 46'h000000000000;
      expv[42] = 46'h080000000000;
      expv[43] = 46'h000000000000;
      expv[44] = 46'h000000000000;
      expv[45] = 46'h000000000000;
      expv[46] = 46'h000000000000;
      expv[47] = 46'h000000000001;
      expv[48] = 46'h000000000000;
      expv[49] = 46'h000000000000;
      expv[50] = 46'h140000000000;
      expv[51] = 46'h000000000000;
      expv[52] = 46'h000000000000;
      expv[53] = 46'h1c0000000000;
      expv[54] = 46'h000000000000;
      expv[55] = 46'h000000000000;
      expv[56] = 46'h080000000000;
      expv[57] = 46'h000000000000;
      expv[58] = 46'h000000000000;
      expv[59] = 46'h000000000000;
      expv[60] = 46'h000000000000;
      expv[61] = 46'h000000000000;
      expv[62] = 46'h000000000002;
      expv[63] = 46'h000000000000;
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
