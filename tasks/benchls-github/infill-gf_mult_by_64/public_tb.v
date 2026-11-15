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

  gf_mult_by_64 dut (
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
    stim[0] = 8'h6f;
    stim[1] = 8'hca;
    stim[2] = 8'h70;
    stim[3] = 8'hdf;
    stim[4] = 8'hdd;
    stim[5] = 8'heb;
    stim[6] = 8'h1d;
    stim[7] = 8'h11;
    stim[8] = 8'h91;
    stim[9] = 8'hba;
    stim[10] = 8'h76;
    stim[11] = 8'h15;
    stim[12] = 8'hc2;
    stim[13] = 8'he6;
    stim[14] = 8'hed;
    stim[15] = 8'h7d;
    stim[16] = 8'hc3;
    stim[17] = 8'h99;
    stim[18] = 8'hb8;
    stim[19] = 8'h2f;
    stim[20] = 8'hd3;
    stim[21] = 8'h77;
    stim[22] = 8'h1f;
    stim[23] = 8'heb;
    stim[24] = 8'h76;
    stim[25] = 8'h3f;
    stim[26] = 8'h25;
    stim[27] = 8'hde;
    stim[28] = 8'h09;
    stim[29] = 8'h6c;
    stim[30] = 8'h80;
    stim[31] = 8'h3b;
    stim[32] = 8'h9f;
    stim[33] = 8'h4e;
    stim[34] = 8'hcc;
    stim[35] = 8'h2c;
    stim[36] = 8'h66;
    stim[37] = 8'h9c;
    stim[38] = 8'h08;
    stim[39] = 8'h15;
    stim[40] = 8'h2e;
    stim[41] = 8'hf8;
    stim[42] = 8'h27;
    stim[43] = 8'h5b;
    stim[44] = 8'h72;
    stim[45] = 8'he1;
    stim[46] = 8'hef;
    stim[47] = 8'h0a;
    stim[48] = 8'h93;
    stim[49] = 8'ha4;
    stim[50] = 8'h7f;
    stim[51] = 8'h8c;
    stim[52] = 8'hdb;
    stim[53] = 8'h36;
    stim[54] = 8'hfa;
    stim[55] = 8'h9f;
    stim[56] = 8'h2c;
    stim[57] = 8'h6c;
    stim[58] = 8'h4d;
    stim[59] = 8'hde;
    stim[60] = 8'hc1;
    stim[61] = 8'hd9;
    stim[62] = 8'hd4;
    stim[63] = 8'h28;
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
      expv[0] = 8'h02;
      expv[1] = 8'h87;
      expv[2] = 8'h2a;
      expv[3] = 8'h60;
      expv[4] = 8'ha8;
      expv[5] = 8'hff;
      expv[6] = 8'he0;
      expv[7] = 8'h6a;
      expv[8] = 8'h1a;
      expv[9] = 8'had;
      expv[10] = 8'h6f;
      expv[11] = 8'he7;
      expv[12] = 8'h80;
      expv[13] = 8'h11;
      expv[14] = 8'hba;
      expv[15] = 8'hc4;
      expv[16] = 8'he4;
      expv[17] = 8'h1d;
      expv[18] = 8'h65;
      expv[19] = 8'h3a;
      expv[20] = 8'hea;
      expv[21] = 8'h0b;
      expv[22] = 8'h28;
      expv[23] = 8'hff;
      expv[24] = 8'h6f;
      expv[25] = 8'h34;
      expv[26] = 8'hf5;
      expv[27] = 8'h04;
      expv[28] = 8'h63;
      expv[29] = 8'hae;
      expv[30] = 8'h70;
      expv[31] = 8'hb9;
      expv[32] = 8'h58;
      expv[33] = 8'h7a;
      expv[34] = 8'hc2;
      expv[35] = 8'h96;
      expv[36] = 8'h61;
      expv[37] = 8'hf4;
      expv[38] = 8'h07;
      expv[39] = 8'he7;
      expv[40] = 8'h5e;
      expv[41] = 8'h5d;
      expv[42] = 8'h3d;
      expv[43] = 8'h9d;
      expv[44] = 8'he2;
      expv[45] = 8'h30;
      expv[46] = 8'h72;
      expv[47] = 8'hcf;
      expv[48] = 8'hd2;
      expv[49] = 8'he1;
      expv[50] = 8'h0c;
      expv[51] = 8'hfa;
      expv[52] = 8'hed;
      expv[53] = 8'h57;
      expv[54] = 8'h95;
      expv[55] = 8'h58;
      expv[56] = 8'h96;
      expv[57] = 8'hae;
      expv[58] = 8'hd6;
      expv[59] = 8'h04;
      expv[60] = 8'h2c;
      expv[61] = 8'h25;
      expv[62] = 8'hcb;
      expv[63] = 8'h1b;
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
