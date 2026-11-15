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

  gf_mult_by_8c dut (
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
    stim[0] = 8'h7a;
    stim[1] = 8'h4b;
    stim[2] = 8'h7b;
    stim[3] = 8'hc1;
    stim[4] = 8'he5;
    stim[5] = 8'h94;
    stim[6] = 8'h8f;
    stim[7] = 8'h8d;
    stim[8] = 8'hf9;
    stim[9] = 8'h4b;
    stim[10] = 8'hd7;
    stim[11] = 8'h13;
    stim[12] = 8'h54;
    stim[13] = 8'h20;
    stim[14] = 8'h24;
    stim[15] = 8'hd9;
    stim[16] = 8'hd2;
    stim[17] = 8'h6e;
    stim[18] = 8'hc6;
    stim[19] = 8'hf6;
    stim[20] = 8'h0a;
    stim[21] = 8'h8b;
    stim[22] = 8'h69;
    stim[23] = 8'h91;
    stim[24] = 8'hbb;
    stim[25] = 8'h3e;
    stim[26] = 8'h13;
    stim[27] = 8'hdf;
    stim[28] = 8'h80;
    stim[29] = 8'hdc;
    stim[30] = 8'hff;
    stim[31] = 8'hae;
    stim[32] = 8'hc8;
    stim[33] = 8'he2;
    stim[34] = 8'h65;
    stim[35] = 8'h6c;
    stim[36] = 8'hde;
    stim[37] = 8'h6b;
    stim[38] = 8'h9e;
    stim[39] = 8'h1f;
    stim[40] = 8'h7d;
    stim[41] = 8'hbb;
    stim[42] = 8'h82;
    stim[43] = 8'h5e;
    stim[44] = 8'ha6;
    stim[45] = 8'ha3;
    stim[46] = 8'h8b;
    stim[47] = 8'h52;
    stim[48] = 8'h10;
    stim[49] = 8'h1a;
    stim[50] = 8'h26;
    stim[51] = 8'h01;
    stim[52] = 8'h1b;
    stim[53] = 8'hc0;
    stim[54] = 8'h49;
    stim[55] = 8'h73;
    stim[56] = 8'h27;
    stim[57] = 8'h54;
    stim[58] = 8'h98;
    stim[59] = 8'h94;
    stim[60] = 8'h21;
    stim[61] = 8'hec;
    stim[62] = 8'h4a;
    stim[63] = 8'h14;
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
      expv[0] = 8'hc9;
      expv[1] = 8'h3d;
      expv[2] = 8'h45;
      expv[3] = 8'h71;
      expv[4] = 8'h2b;
      expv[5] = 8'h7f;
      expv[6] = 8'hca;
      expv[7] = 8'hcf;
      expv[8] = 8'h1d;
      expv[9] = 8'h3d;
      expv[10] = 8'h56;
      expv[11] = 8'ha1;
      expv[12] = 8'h82;
      expv[13] = 8'h50;
      expv[14] = 8'h5a;
      expv[15] = 8'h4d;
      expv[16] = 8'hd0;
      expv[17] = 8'heb;
      expv[18] = 8'hf2;
      expv[19] = 8'h8a;
      expv[20] = 8'h11;
      expv[21] = 8'hc0;
      expv[22] = 8'h68;
      expv[23] = 8'hf9;
      expv[24] = 8'hb8;
      expv[25] = 8'h63;
      expv[26] = 8'ha1;
      expv[27] = 8'h42;
      expv[28] = 8'h5d;
      expv[29] = 8'hcb;
      expv[30] = 8'h12;
      expv[31] = 8'h16;
      expv[32] = 8'he9;
      expv[33] = 8'ha8;
      expv[34] = 8'h76;
      expv[35] = 8'hee;
      expv[36] = 8'hce;
      expv[37] = 8'h6d;
      expv[38] = 8'h6e;
      expv[39] = 8'hbf;
      expv[40] = 8'h4a;
      expv[41] = 8'hb8;
      expv[42] = 8'h58;
      expv[43] = 8'h93;
      expv[44] = 8'h02;
      expv[45] = 8'h84;
      expv[46] = 8'hc0;
      expv[47] = 8'h8d;
      expv[48] = 8'h28;
      expv[49] = 8'h39;
      expv[50] = 8'h5f;
      expv[51] = 8'h8c;
      expv[52] = 8'hb5;
      expv[53] = 8'hfd;
      expv[54] = 8'h38;
      expv[55] = 8'h51;
      expv[56] = 8'hd3;
      expv[57] = 8'h82;
      expv[58] = 8'h61;
      expv[59] = 8'h7f;
      expv[60] = 8'hdc;
      expv[61] = 8'hb3;
      expv[62] = 8'hb1;
      expv[63] = 8'h22;
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
