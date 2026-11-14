// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 16;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  dut dut (
    .in(in_vec[15:0]),
    .out_hi(out_vec[15:8]),
    .out_lo(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 16'h3091;
    stim[1] = 16'hb3dc;
    stim[2] = 16'h1fff;
    stim[3] = 16'hf606;
    stim[4] = 16'hb287;
    stim[5] = 16'h74df;
    stim[6] = 16'hd157;
    stim[7] = 16'h586a;
    stim[8] = 16'h89ad;
    stim[9] = 16'h46cc;
    stim[10] = 16'h7069;
    stim[11] = 16'h37e4;
    stim[12] = 16'h754e;
    stim[13] = 16'h5beb;
    stim[14] = 16'h20c6;
    stim[15] = 16'h8f01;
    stim[16] = 16'h4596;
    stim[17] = 16'ha172;
    stim[18] = 16'h9e34;
    stim[19] = 16'h8b69;
    stim[20] = 16'hfaf8;
    stim[21] = 16'h3863;
    stim[22] = 16'hf61e;
    stim[23] = 16'hb468;
    stim[24] = 16'hed1b;
    stim[25] = 16'h1f52;
    stim[26] = 16'hbc57;
    stim[27] = 16'h1360;
    stim[28] = 16'h3ba5;
    stim[29] = 16'h9a0f;
    stim[30] = 16'h01cd;
    stim[31] = 16'h1030;
    stim[32] = 16'h210e;
    stim[33] = 16'h503f;
    stim[34] = 16'h78e6;
    stim[35] = 16'h982f;
    stim[36] = 16'hc6ff;
    stim[37] = 16'hecaa;
    stim[38] = 16'h3d3d;
    stim[39] = 16'h9b53;
    stim[40] = 16'hd223;
    stim[41] = 16'hed86;
    stim[42] = 16'h8afe;
    stim[43] = 16'hf03d;
    stim[44] = 16'hf00c;
    stim[45] = 16'hbefe;
    stim[46] = 16'he1eb;
    stim[47] = 16'hd3d6;
    stim[48] = 16'h85d0;
    stim[49] = 16'hb3b3;
    stim[50] = 16'hc789;
    stim[51] = 16'heb08;
    stim[52] = 16'h107b;
    stim[53] = 16'hdb21;
    stim[54] = 16'hb312;
    stim[55] = 16'h37d3;
    stim[56] = 16'h1893;
    stim[57] = 16'h80b4;
    stim[58] = 16'h011e;
    stim[59] = 16'h1ff6;
    stim[60] = 16'heb3d;
    stim[61] = 16'heeb1;
    stim[62] = 16'h20e1;
    stim[63] = 16'h4deb;
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
      expv[0] = 16'hcf6e;
      expv[1] = 16'h4c23;
      expv[2] = 16'he000;
      expv[3] = 16'h09f9;
      expv[4] = 16'h4d78;
      expv[5] = 16'h8b20;
      expv[6] = 16'h2ea8;
      expv[7] = 16'ha795;
      expv[8] = 16'h7652;
      expv[9] = 16'hb933;
      expv[10] = 16'h8f96;
      expv[11] = 16'hc81b;
      expv[12] = 16'h8ab1;
      expv[13] = 16'ha414;
      expv[14] = 16'hdf39;
      expv[15] = 16'h70fe;
      expv[16] = 16'hba69;
      expv[17] = 16'h5e8d;
      expv[18] = 16'h61cb;
      expv[19] = 16'h7496;
      expv[20] = 16'h0507;
      expv[21] = 16'hc79c;
      expv[22] = 16'h09e1;
      expv[23] = 16'h4b97;
      expv[24] = 16'h12e4;
      expv[25] = 16'he0ad;
      expv[26] = 16'h43a8;
      expv[27] = 16'hec9f;
      expv[28] = 16'hc45a;
      expv[29] = 16'h65f0;
      expv[30] = 16'hfe32;
      expv[31] = 16'hefcf;
      expv[32] = 16'hdef1;
      expv[33] = 16'hafc0;
      expv[34] = 16'h8719;
      expv[35] = 16'h67d0;
      expv[36] = 16'h3900;
      expv[37] = 16'h1355;
      expv[38] = 16'hc2c2;
      expv[39] = 16'h64ac;
      expv[40] = 16'h2ddc;
      expv[41] = 16'h1279;
      expv[42] = 16'h7501;
      expv[43] = 16'h0fc2;
      expv[44] = 16'h0ff3;
      expv[45] = 16'h4101;
      expv[46] = 16'h1e14;
      expv[47] = 16'h2c29;
      expv[48] = 16'h7a2f;
      expv[49] = 16'h4c4c;
      expv[50] = 16'h3876;
      expv[51] = 16'h14f7;
      expv[52] = 16'hef84;
      expv[53] = 16'h24de;
      expv[54] = 16'h4ced;
      expv[55] = 16'hc82c;
      expv[56] = 16'he76c;
      expv[57] = 16'h7f4b;
      expv[58] = 16'hfee1;
      expv[59] = 16'he009;
      expv[60] = 16'h14c2;
      expv[61] = 16'h114e;
      expv[62] = 16'hdf1e;
      expv[63] = 16'hb214;
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
