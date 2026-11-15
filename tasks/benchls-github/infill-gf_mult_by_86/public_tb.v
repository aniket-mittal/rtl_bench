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

  gf_mult_by_86 dut (
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
    stim[0] = 8'h4a;
    stim[1] = 8'h67;
    stim[2] = 8'hd4;
    stim[3] = 8'heb;
    stim[4] = 8'h81;
    stim[5] = 8'he0;
    stim[6] = 8'h4d;
    stim[7] = 8'h8a;
    stim[8] = 8'he1;
    stim[9] = 8'h04;
    stim[10] = 8'h07;
    stim[11] = 8'h3a;
    stim[12] = 8'h89;
    stim[13] = 8'hbd;
    stim[14] = 8'h52;
    stim[15] = 8'h3c;
    stim[16] = 8'h51;
    stim[17] = 8'h67;
    stim[18] = 8'h29;
    stim[19] = 8'h2c;
    stim[20] = 8'h4a;
    stim[21] = 8'h17;
    stim[22] = 8'h7d;
    stim[23] = 8'hf9;
    stim[24] = 8'hdb;
    stim[25] = 8'hc5;
    stim[26] = 8'ha4;
    stim[27] = 8'h61;
    stim[28] = 8'hf6;
    stim[29] = 8'hec;
    stim[30] = 8'hac;
    stim[31] = 8'h5d;
    stim[32] = 8'h8b;
    stim[33] = 8'h8b;
    stim[34] = 8'hdf;
    stim[35] = 8'h0f;
    stim[36] = 8'h92;
    stim[37] = 8'h2d;
    stim[38] = 8'h31;
    stim[39] = 8'hac;
    stim[40] = 8'h17;
    stim[41] = 8'h86;
    stim[42] = 8'ha7;
    stim[43] = 8'hd6;
    stim[44] = 8'hb1;
    stim[45] = 8'had;
    stim[46] = 8'h75;
    stim[47] = 8'h3e;
    stim[48] = 8'hac;
    stim[49] = 8'hdd;
    stim[50] = 8'h19;
    stim[51] = 8'h88;
    stim[52] = 8'he5;
    stim[53] = 8'hd6;
    stim[54] = 8'h30;
    stim[55] = 8'hbe;
    stim[56] = 8'h29;
    stim[57] = 8'hed;
    stim[58] = 8'hbf;
    stim[59] = 8'hdf;
    stim[60] = 8'hdd;
    stim[61] = 8'h26;
    stim[62] = 8'hd5;
    stim[63] = 8'hf9;
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
      expv[0] = 8'h4f;
      expv[1] = 8'ha2;
      expv[2] = 8'h84;
      expv[3] = 8'hf0;
      expv[4] = 8'hb2;
      expv[5] = 8'h23;
      expv[6] = 8'hfa;
      expv[7] = 8'h61;
      expv[8] = 8'ha5;
      expv[9] = 8'h22;
      expv[10] = 8'hb5;
      expv[11] = 8'hd0;
      expv[12] = 8'hf6;
      expv[13] = 8'h51;
      expv[14] = 8'h83;
      expv[15] = 8'he3;
      expv[16] = 8'h14;
      expv[17] = 8'ha2;
      expv[18] = 8'hcf;
      expv[19] = 8'h6b;
      expv[20] = 8'h4f;
      expv[21] = 8'h3d;
      expv[22] = 8'h7f;
      expv[23] = 8'h69;
      expv[24] = 8'h75;
      expv[25] = 8'h8a;
      expv[26] = 8'h1b;
      expv[27] = 8'h91;
      expv[28] = 8'h98;
      expv[29] = 8'h45;
      expv[30] = 8'h5f;
      expv[31] = 8'h72;
      expv[32] = 8'he7;
      expv[33] = 8'he7;
      expv[34] = 8'h57;
      expv[35] = 8'hf1;
      expv[36] = 8'had;
      expv[37] = 8'hed;
      expv[38] = 8'h03;
      expv[39] = 8'h5f;
      expv[40] = 8'h3d;
      expv[41] = 8'h07;
      expv[42] = 8'h8c;
      expv[43] = 8'h95;
      expv[44] = 8'h37;
      expv[45] = 8'hd9;
      expv[46] = 8'h3b;
      expv[47] = 8'hf2;
      expv[48] = 8'h5f;
      expv[49] = 8'h46;
      expv[50] = 8'h4a;
      expv[51] = 8'h70;
      expv[52] = 8'h87;
      expv[53] = 8'h95;
      expv[54] = 8'h85;
      expv[55] = 8'hc6;
      expv[56] = 8'hcf;
      expv[57] = 8'hc3;
      expv[58] = 8'h40;
      expv[59] = 8'h57;
      expv[60] = 8'h46;
      expv[61] = 8'h3e;
      expv[62] = 8'h02;
      expv[63] = 8'h69;
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
