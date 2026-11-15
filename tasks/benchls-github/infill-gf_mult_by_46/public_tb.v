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

  gf_mult_by_46 dut (
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
    stim[0] = 8'hda;
    stim[1] = 8'ha5;
    stim[2] = 8'h62;
    stim[3] = 8'h0f;
    stim[4] = 8'h7a;
    stim[5] = 8'h0d;
    stim[6] = 8'h4c;
    stim[7] = 8'h04;
    stim[8] = 8'h62;
    stim[9] = 8'h74;
    stim[10] = 8'hc2;
    stim[11] = 8'h04;
    stim[12] = 8'h4f;
    stim[13] = 8'h1f;
    stim[14] = 8'hac;
    stim[15] = 8'h4d;
    stim[16] = 8'h98;
    stim[17] = 8'h7e;
    stim[18] = 8'hed;
    stim[19] = 8'h6d;
    stim[20] = 8'hff;
    stim[21] = 8'hdf;
    stim[22] = 8'h58;
    stim[23] = 8'hd4;
    stim[24] = 8'hc0;
    stim[25] = 8'h69;
    stim[26] = 8'h56;
    stim[27] = 8'h43;
    stim[28] = 8'h86;
    stim[29] = 8'h74;
    stim[30] = 8'hc4;
    stim[31] = 8'h6b;
    stim[32] = 8'h0a;
    stim[33] = 8'h09;
    stim[34] = 8'h2c;
    stim[35] = 8'had;
    stim[36] = 8'hb1;
    stim[37] = 8'h3e;
    stim[38] = 8'hb4;
    stim[39] = 8'hf8;
    stim[40] = 8'he2;
    stim[41] = 8'h11;
    stim[42] = 8'he4;
    stim[43] = 8'hfd;
    stim[44] = 8'h97;
    stim[45] = 8'h67;
    stim[46] = 8'h6f;
    stim[47] = 8'h28;
    stim[48] = 8'hcd;
    stim[49] = 8'h22;
    stim[50] = 8'h51;
    stim[51] = 8'h25;
    stim[52] = 8'haf;
    stim[53] = 8'h8f;
    stim[54] = 8'h8d;
    stim[55] = 8'h40;
    stim[56] = 8'hb7;
    stim[57] = 8'h3a;
    stim[58] = 8'hc3;
    stim[59] = 8'ha9;
    stim[60] = 8'hd0;
    stim[61] = 8'h18;
    stim[62] = 8'h18;
    stim[63] = 8'hd0;
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
      expv[0] = 8'h62;
      expv[1] = 8'hcb;
      expv[2] = 8'hf4;
      expv[3] = 8'hc5;
      expv[4] = 8'hea;
      expv[5] = 8'h49;
      expv[6] = 8'h5f;
      expv[7] = 8'h05;
      expv[8] = 8'hf4;
      expv[9] = 8'h69;
      expv[10] = 8'h7c;
      expv[11] = 8'h05;
      expv[12] = 8'h95;
      expv[13] = 8'hd1;
      expv[14] = 8'h87;
      expv[15] = 8'h19;
      expv[16] = 8'hbe;
      expv[17] = 8'hef;
      expv[18] = 8'h91;
      expv[19] = 8'h31;
      expv[20] = 8'h09;
      expv[21] = 8'h21;
      expv[22] = 8'h4e;
      expv[23] = 8'he1;
      expv[24] = 8'hf0;
      expv[25] = 8'h34;
      expv[26] = 8'hcd;
      expv[27] = 8'h9a;
      expv[28] = 8'h29;
      expv[29] = 8'h69;
      expv[30] = 8'hf5;
      expv[31] = 8'hb8;
      expv[32] = 8'h86;
      expv[33] = 8'h4c;
      expv[34] = 8'h27;
      expv[35] = 8'hc1;
      expv[36] = 8'hda;
      expv[37] = 8'hbf;
      expv[38] = 8'h99;
      expv[39] = 8'hc6;
      expv[40] = 8'h54;
      expv[41] = 8'h52;
      expv[42] = 8'hdd;
      expv[43] = 8'h85;
      expv[44] = 8'h7b;
      expv[45] = 8'hb7;
      expv[46] = 8'hbd;
      expv[47] = 8'h22;
      expv[48] = 8'hb9;
      expv[49] = 8'ha4;
      expv[50] = 8'h02;
      expv[51] = 8'h6b;
      expv[52] = 8'h4d;
      expv[53] = 8'h65;
      expv[54] = 8'he9;
      expv[55] = 8'h50;
      expv[56] = 8'h53;
      expv[57] = 8'hba;
      expv[58] = 8'h3a;
      expv[59] = 8'hc4;
      expv[60] = 8'he4;
      expv[61] = 8'h1e;
      expv[62] = 8'h1e;
      expv[63] = 8'he4;
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
