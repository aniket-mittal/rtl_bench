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

  gf_mult_by_33 dut (
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
    stim[0] = 8'h7c;
    stim[1] = 8'h5f;
    stim[2] = 8'haf;
    stim[3] = 8'h59;
    stim[4] = 8'h39;
    stim[5] = 8'hdc;
    stim[6] = 8'h21;
    stim[7] = 8'hf4;
    stim[8] = 8'hc7;
    stim[9] = 8'h2d;
    stim[10] = 8'h21;
    stim[11] = 8'h88;
    stim[12] = 8'h09;
    stim[13] = 8'h03;
    stim[14] = 8'h5f;
    stim[15] = 8'hef;
    stim[16] = 8'h3c;
    stim[17] = 8'h3e;
    stim[18] = 8'h7d;
    stim[19] = 8'h66;
    stim[20] = 8'h85;
    stim[21] = 8'hcf;
    stim[22] = 8'h71;
    stim[23] = 8'h95;
    stim[24] = 8'h83;
    stim[25] = 8'h92;
    stim[26] = 8'h9c;
    stim[27] = 8'hc0;
    stim[28] = 8'hdc;
    stim[29] = 8'hb0;
    stim[30] = 8'h20;
    stim[31] = 8'hd1;
    stim[32] = 8'h1f;
    stim[33] = 8'hf0;
    stim[34] = 8'hb6;
    stim[35] = 8'hac;
    stim[36] = 8'hd5;
    stim[37] = 8'h21;
    stim[38] = 8'hbe;
    stim[39] = 8'hd6;
    stim[40] = 8'h03;
    stim[41] = 8'h8a;
    stim[42] = 8'h60;
    stim[43] = 8'h43;
    stim[44] = 8'h3e;
    stim[45] = 8'h34;
    stim[46] = 8'h65;
    stim[47] = 8'h0d;
    stim[48] = 8'hf2;
    stim[49] = 8'h6b;
    stim[50] = 8'h25;
    stim[51] = 8'hd1;
    stim[52] = 8'h68;
    stim[53] = 8'h6e;
    stim[54] = 8'h6f;
    stim[55] = 8'h86;
    stim[56] = 8'h6f;
    stim[57] = 8'h93;
    stim[58] = 8'hc1;
    stim[59] = 8'h6f;
    stim[60] = 8'hf1;
    stim[61] = 8'hbe;
    stim[62] = 8'h93;
    stim[63] = 8'haf;
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
      expv[0] = 8'h2c;
      expv[1] = 8'h57;
      expv[2] = 8'h8a;
      expv[3] = 8'hfd;
      expv[4] = 8'h8f;
      expv[5] = 8'hba;
      expv[6] = 8'h1d;
      expv[7] = 8'h11;
      expv[8] = 8'h7d;
      expv[9] = 8'h54;
      expv[10] = 8'h1d;
      expv[11] = 8'h3d;
      expv[12] = 8'hb6;
      expv[13] = 8'h55;
      expv[14] = 8'h57;
      expv[15] = 8'hd6;
      expv[16] = 8'h70;
      expv[17] = 8'h16;
      expv[18] = 8'h1f;
      expv[19] = 8'hd8;
      expv[20] = 8'h47;
      expv[21] = 8'hf8;
      expv[22] = 8'h56;
      expv[23] = 8'h50;
      expv[24] = 8'hed;
      expv[25] = 8'hc9;
      expv[26] = 8'he6;
      expv[27] = 8'he4;
      expv[28] = 8'hba;
      expv[29] = 8'h81;
      expv[30] = 8'h2e;
      expv[31] = 8'hc0;
      expv[32] = 8'h0b;
      expv[33] = 8'hdd;
      expv[34] = 8'h2b;
      expv[35] = 8'hdf;
      expv[36] = 8'h0c;
      expv[37] = 8'h1d;
      expv[38] = 8'hae;
      expv[39] = 8'h59;
      expv[40] = 8'h55;
      expv[41] = 8'h5b;
      expv[42] = 8'h72;
      expv[43] = 8'h09;
      expv[44] = 8'h16;
      expv[45] = 8'hf5;
      expv[46] = 8'h8d;
      expv[47] = 8'h7a;
      expv[48] = 8'hbb;
      expv[49] = 8'ha2;
      expv[50] = 8'hd1;
      expv[51] = 8'hc0;
      expv[52] = 8'hf7;
      expv[53] = 8'h5d;
      expv[54] = 8'h6e;
      expv[55] = 8'h12;
      expv[56] = 8'h6e;
      expv[57] = 8'hfa;
      expv[58] = 8'hd7;
      expv[59] = 8'h6e;
      expv[60] = 8'hee;
      expv[61] = 8'hae;
      expv[62] = 8'hfa;
      expv[63] = 8'h8a;
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
