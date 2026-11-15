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

  gf_mult_by_7c dut (
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
    stim[0] = 8'hdf;
    stim[1] = 8'h5b;
    stim[2] = 8'hc3;
    stim[3] = 8'h43;
    stim[4] = 8'h34;
    stim[5] = 8'h4c;
    stim[6] = 8'h2e;
    stim[7] = 8'h6c;
    stim[8] = 8'h61;
    stim[9] = 8'hf2;
    stim[10] = 8'hda;
    stim[11] = 8'hd6;
    stim[12] = 8'hc5;
    stim[13] = 8'h6f;
    stim[14] = 8'h1c;
    stim[15] = 8'h68;
    stim[16] = 8'h68;
    stim[17] = 8'hfa;
    stim[18] = 8'h19;
    stim[19] = 8'hc3;
    stim[20] = 8'h32;
    stim[21] = 8'h40;
    stim[22] = 8'h81;
    stim[23] = 8'hf5;
    stim[24] = 8'h9c;
    stim[25] = 8'hf5;
    stim[26] = 8'h92;
    stim[27] = 8'h69;
    stim[28] = 8'h1e;
    stim[29] = 8'h15;
    stim[30] = 8'h43;
    stim[31] = 8'h3b;
    stim[32] = 8'h87;
    stim[33] = 8'h57;
    stim[34] = 8'h5d;
    stim[35] = 8'h6d;
    stim[36] = 8'h10;
    stim[37] = 8'he6;
    stim[38] = 8'h1f;
    stim[39] = 8'hb2;
    stim[40] = 8'h7e;
    stim[41] = 8'hd5;
    stim[42] = 8'hae;
    stim[43] = 8'h72;
    stim[44] = 8'h83;
    stim[45] = 8'h8c;
    stim[46] = 8'h4c;
    stim[47] = 8'he2;
    stim[48] = 8'h48;
    stim[49] = 8'hb8;
    stim[50] = 8'h84;
    stim[51] = 8'hbb;
    stim[52] = 8'hd2;
    stim[53] = 8'h49;
    stim[54] = 8'h6d;
    stim[55] = 8'hb5;
    stim[56] = 8'h05;
    stim[57] = 8'hd3;
    stim[58] = 8'ha1;
    stim[59] = 8'hac;
    stim[60] = 8'h3c;
    stim[61] = 8'h94;
    stim[62] = 8'h72;
    stim[63] = 8'hbc;
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
      expv[0] = 8'ha7;
      expv[1] = 8'ha6;
      expv[2] = 8'h1e;
      expv[3] = 8'hf2;
      expv[4] = 8'h45;
      expv[5] = 8'h5c;
      expv[6] = 8'he9;
      expv[7] = 8'h67;
      expv[8] = 8'h31;
      expv[9] = 8'hca;
      expv[10] = 8'h36;
      expv[11] = 8'h1c;
      expv[12] = 8'h0b;
      expv[13] = 8'he3;
      expv[14] = 8'hb9;
      expv[15] = 8'h8a;
      expv[16] = 8'h8a;
      expv[17] = 8'h0d;
      expv[18] = 8'h28;
      expv[19] = 8'h1e;
      expv[20] = 8'h50;
      expv[21] = 8'h76;
      expv[22] = 8'h90;
      expv[23] = 8'ha3;
      expv[24] = 8'h55;
      expv[25] = 8'ha3;
      expv[26] = 8'h87;
      expv[27] = 8'hf6;
      expv[28] = 8'h41;
      expv[29] = 8'h02;
      expv[30] = 8'hf2;
      expv[31] = 8'heb;
      expv[32] = 8'h85;
      expv[33] = 8'h8c;
      expv[34] = 8'hb3;
      expv[35] = 8'h1b;
      expv[36] = 8'h93;
      expv[37] = 8'hb4;
      expv[38] = 8'h3d;
      expv[39] = 8'hbc;
      expv[40] = 8'h0c;
      expv[41] = 8'h98;
      expv[42] = 8'h05;
      expv[43] = 8'h26;
      expv[44] = 8'h68;
      expv[45] = 8'hc6;
      expv[46] = 8'h5c;
      expv[47] = 8'h59;
      expv[48] = 8'hb1;
      expv[49] = 8'h83;
      expv[50] = 8'h01;
      expv[51] = 8'h07;
      expv[52] = 8'hf1;
      expv[53] = 8'hcd;
      expv[54] = 8'h1b;
      expv[55] = 8'hd5;
      expv[56] = 8'h91;
      expv[57] = 8'h8d;
      expv[58] = 8'hab;
      expv[59] = 8'hfd;
      expv[60] = 8'h82;
      expv[61] = 8'h92;
      expv[62] = 8'h26;
      expv[63] = 8'h6e;
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
