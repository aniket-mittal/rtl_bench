// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_081631 dut (
    .in(in_vec[11:0]),
    .sign(out_vec[11:11]),
    .magnitude(out_vec[10:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'hc8f;
    stim[1] = 12'he5d;
    stim[2] = 12'h639;
    stim[3] = 12'hebd;
    stim[4] = 12'h1e9;
    stim[5] = 12'hab8;
    stim[6] = 12'hab0;
    stim[7] = 12'h9ad;
    stim[8] = 12'h481;
    stim[9] = 12'hde6;
    stim[10] = 12'ha6a;
    stim[11] = 12'h020;
    stim[12] = 12'h741;
    stim[13] = 12'ha2d;
    stim[14] = 12'h9dd;
    stim[15] = 12'h021;
    stim[16] = 12'h3cd;
    stim[17] = 12'h583;
    stim[18] = 12'hdbd;
    stim[19] = 12'hb0f;
    stim[20] = 12'hede;
    stim[21] = 12'hd38;
    stim[22] = 12'hf69;
    stim[23] = 12'h773;
    stim[24] = 12'h015;
    stim[25] = 12'hbc8;
    stim[26] = 12'hd80;
    stim[27] = 12'h5ad;
    stim[28] = 12'h3a3;
    stim[29] = 12'hecf;
    stim[30] = 12'h036;
    stim[31] = 12'ha0d;
    stim[32] = 12'hc70;
    stim[33] = 12'h4c8;
    stim[34] = 12'h9c1;
    stim[35] = 12'h50f;
    stim[36] = 12'h18c;
    stim[37] = 12'h6d4;
    stim[38] = 12'h9db;
    stim[39] = 12'hdb0;
    stim[40] = 12'he7d;
    stim[41] = 12'h16c;
    stim[42] = 12'ha66;
    stim[43] = 12'h2fd;
    stim[44] = 12'h351;
    stim[45] = 12'h664;
    stim[46] = 12'hda1;
    stim[47] = 12'hec7;
    stim[48] = 12'h713;
    stim[49] = 12'hc5d;
    stim[50] = 12'hd9d;
    stim[51] = 12'h997;
    stim[52] = 12'hf5c;
    stim[53] = 12'h912;
    stim[54] = 12'h4a8;
    stim[55] = 12'h507;
    stim[56] = 12'hf5f;
    stim[57] = 12'ha2a;
    stim[58] = 12'hb77;
    stim[59] = 12'h067;
    stim[60] = 12'h699;
    stim[61] = 12'ha7e;
    stim[62] = 12'h224;
    stim[63] = 12'h3e3;
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
      expv[0] = 12'hb71;
      expv[1] = 12'h9a3;
      expv[2] = 12'h639;
      expv[3] = 12'h943;
      expv[4] = 12'h1e9;
      expv[5] = 12'hd48;
      expv[6] = 12'hd50;
      expv[7] = 12'he53;
      expv[8] = 12'h481;
      expv[9] = 12'ha1a;
      expv[10] = 12'hd96;
      expv[11] = 12'h020;
      expv[12] = 12'h741;
      expv[13] = 12'hdd3;
      expv[14] = 12'he23;
      expv[15] = 12'h021;
      expv[16] = 12'h3cd;
      expv[17] = 12'h583;
      expv[18] = 12'ha43;
      expv[19] = 12'hcf1;
      expv[20] = 12'h922;
      expv[21] = 12'hac8;
      expv[22] = 12'h897;
      expv[23] = 12'h773;
      expv[24] = 12'h015;
      expv[25] = 12'hc38;
      expv[26] = 12'ha80;
      expv[27] = 12'h5ad;
      expv[28] = 12'h3a3;
      expv[29] = 12'h931;
      expv[30] = 12'h036;
      expv[31] = 12'hdf3;
      expv[32] = 12'hb90;
      expv[33] = 12'h4c8;
      expv[34] = 12'he3f;
      expv[35] = 12'h50f;
      expv[36] = 12'h18c;
      expv[37] = 12'h6d4;
      expv[38] = 12'he25;
      expv[39] = 12'ha50;
      expv[40] = 12'h983;
      expv[41] = 12'h16c;
      expv[42] = 12'hd9a;
      expv[43] = 12'h2fd;
      expv[44] = 12'h351;
      expv[45] = 12'h664;
      expv[46] = 12'ha5f;
      expv[47] = 12'h939;
      expv[48] = 12'h713;
      expv[49] = 12'hba3;
      expv[50] = 12'ha63;
      expv[51] = 12'he69;
      expv[52] = 12'h8a4;
      expv[53] = 12'heee;
      expv[54] = 12'h4a8;
      expv[55] = 12'h507;
      expv[56] = 12'h8a1;
      expv[57] = 12'hdd6;
      expv[58] = 12'hc89;
      expv[59] = 12'h067;
      expv[60] = 12'h699;
      expv[61] = 12'hd82;
      expv[62] = 12'h224;
      expv[63] = 12'h3e3;
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
