// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 19;
  localparam OW = 19;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_119119 dut (
    .ap_clk(clk),
    .ap_rst(in_vec[18:18]),
    .ap_start(in_vec[17:17]),
    .ap_continue(in_vec[16:16]),
    .tmp(in_vec[15:0]),
    .ap_done(out_vec[18:18]),
    .ap_idle(out_vec[17:17]),
    .ap_ready(out_vec[16:16]),
    .ap_return(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 19'h5369b;
    stim[1] = 19'h77f54;
    stim[2] = 19'h26ce8;
    stim[3] = 19'h100d8;
    stim[4] = 19'h3ae93;
    stim[5] = 19'h205bf;
    stim[6] = 19'h1810b;
    stim[7] = 19'h1bf97;
    stim[8] = 19'h12562;
    stim[9] = 19'h0c75e;
    stim[10] = 19'h31e62;
    stim[11] = 19'h285b9;
    stim[12] = 19'h0647f;
    stim[13] = 19'h017c0;
    stim[14] = 19'h32b62;
    stim[15] = 19'h266b5;
    stim[16] = 19'h27cc8;
    stim[17] = 19'h2f2c2;
    stim[18] = 19'h22e59;
    stim[19] = 19'h2f75f;
    stim[20] = 19'h18b19;
    stim[21] = 19'h3fc03;
    stim[22] = 19'h24c29;
    stim[23] = 19'h0a3aa;
    stim[24] = 19'h5cc2b;
    stim[25] = 19'h3858d;
    stim[26] = 19'h0eded;
    stim[27] = 19'h3f43e;
    stim[28] = 19'h19a23;
    stim[29] = 19'h134b8;
    stim[30] = 19'h0565d;
    stim[31] = 19'h1570b;
    stim[32] = 19'h19c47;
    stim[33] = 19'h3fd82;
    stim[34] = 19'h33b6a;
    stim[35] = 19'h1a5af;
    stim[36] = 19'h1511a;
    stim[37] = 19'h03d17;
    stim[38] = 19'h0c977;
    stim[39] = 19'h3be7b;
    stim[40] = 19'h19877;
    stim[41] = 19'h10101;
    stim[42] = 19'h0a4c4;
    stim[43] = 19'h31d41;
    stim[44] = 19'h2747b;
    stim[45] = 19'h01bf2;
    stim[46] = 19'h3e20e;
    stim[47] = 19'h3fb64;
    stim[48] = 19'h1ed51;
    stim[49] = 19'h1dabc;
    stim[50] = 19'h20c97;
    stim[51] = 19'h1892b;
    stim[52] = 19'h363c8;
    stim[53] = 19'h3440a;
    stim[54] = 19'h17a75;
    stim[55] = 19'h02055;
    stim[56] = 19'h006dd;
    stim[57] = 19'h110c6;
    stim[58] = 19'h2b85a;
    stim[59] = 19'h11c05;
    stim[60] = 19'h12aea;
    stim[61] = 19'h2e0c3;
    stim[62] = 19'h31f72;
    stim[63] = 19'h24fbb;
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
      expv[0] = 19'h20000;
      expv[1] = 19'h57f54;
      expv[2] = 19'h56ce8;
      expv[3] = 19'h66ce8;
      expv[4] = 19'h5ae93;
      expv[5] = 19'h505bf;
      expv[6] = 19'h605bf;
      expv[7] = 19'h205bf;
      expv[8] = 19'h205bf;
      expv[9] = 19'h205bf;
      expv[10] = 19'h51e62;
      expv[11] = 19'h585b9;
      expv[12] = 19'h685b9;
      expv[13] = 19'h685b9;
      expv[14] = 19'h485b9;
      expv[15] = 19'h566b5;
      expv[16] = 19'h466b5;
      expv[17] = 19'h466b5;
      expv[18] = 19'h466b5;
      expv[19] = 19'h466b5;
      expv[20] = 19'h666b5;
      expv[21] = 19'h5fc03;
      expv[22] = 19'h54c29;
      expv[23] = 19'h64c29;
      expv[24] = 19'h64c29;
      expv[25] = 19'h5858d;
      expv[26] = 19'h2858d;
      expv[27] = 19'h5f43e;
      expv[28] = 19'h2f43e;
      expv[29] = 19'h2f43e;
      expv[30] = 19'h2f43e;
      expv[31] = 19'h2f43e;
      expv[32] = 19'h2f43e;
      expv[33] = 19'h5fd82;
      expv[34] = 19'h53b6a;
      expv[35] = 19'h23b6a;
      expv[36] = 19'h23b6a;
      expv[37] = 19'h23b6a;
      expv[38] = 19'h23b6a;
      expv[39] = 19'h5be7b;
      expv[40] = 19'h2be7b;
      expv[41] = 19'h2be7b;
      expv[42] = 19'h2be7b;
      expv[43] = 19'h51d41;
      expv[44] = 19'h5747b;
      expv[45] = 19'h6747b;
      expv[46] = 19'h4747b;
      expv[47] = 19'h5fb64;
      expv[48] = 19'h2fb64;
      expv[49] = 19'h2fb64;
      expv[50] = 19'h50c97;
      expv[51] = 19'h60c97;
      expv[52] = 19'h563c8;
      expv[53] = 19'h5440a;
      expv[54] = 19'h2440a;
      expv[55] = 19'h2440a;
      expv[56] = 19'h2440a;
      expv[57] = 19'h2440a;
      expv[58] = 19'h5b85a;
      expv[59] = 19'h6b85a;
      expv[60] = 19'h2b85a;
      expv[61] = 19'h5e0c3;
      expv[62] = 19'h4e0c3;
      expv[63] = 19'h54fbb;
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
