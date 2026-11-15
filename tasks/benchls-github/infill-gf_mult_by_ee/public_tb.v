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

  gf_mult_by_ee dut (
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
    stim[0] = 8'h59;
    stim[1] = 8'he2;
    stim[2] = 8'h52;
    stim[3] = 8'h2c;
    stim[4] = 8'h91;
    stim[5] = 8'h30;
    stim[6] = 8'h3b;
    stim[7] = 8'h55;
    stim[8] = 8'h61;
    stim[9] = 8'h56;
    stim[10] = 8'hfb;
    stim[11] = 8'h53;
    stim[12] = 8'h15;
    stim[13] = 8'h26;
    stim[14] = 8'h61;
    stim[15] = 8'ha8;
    stim[16] = 8'h82;
    stim[17] = 8'h8a;
    stim[18] = 8'h71;
    stim[19] = 8'ha5;
    stim[20] = 8'h29;
    stim[21] = 8'h43;
    stim[22] = 8'h53;
    stim[23] = 8'h0d;
    stim[24] = 8'h0b;
    stim[25] = 8'hf1;
    stim[26] = 8'hce;
    stim[27] = 8'hec;
    stim[28] = 8'h4c;
    stim[29] = 8'ha7;
    stim[30] = 8'h39;
    stim[31] = 8'h77;
    stim[32] = 8'h4f;
    stim[33] = 8'hb2;
    stim[34] = 8'h66;
    stim[35] = 8'h40;
    stim[36] = 8'h6b;
    stim[37] = 8'hab;
    stim[38] = 8'h4b;
    stim[39] = 8'hdd;
    stim[40] = 8'hbc;
    stim[41] = 8'hf8;
    stim[42] = 8'hbb;
    stim[43] = 8'h6b;
    stim[44] = 8'h90;
    stim[45] = 8'hf4;
    stim[46] = 8'h66;
    stim[47] = 8'h73;
    stim[48] = 8'hca;
    stim[49] = 8'hb0;
    stim[50] = 8'h11;
    stim[51] = 8'hdf;
    stim[52] = 8'hbd;
    stim[53] = 8'h43;
    stim[54] = 8'he2;
    stim[55] = 8'h09;
    stim[56] = 8'hf6;
    stim[57] = 8'h02;
    stim[58] = 8'he9;
    stim[59] = 8'hf6;
    stim[60] = 8'h9b;
    stim[61] = 8'h4c;
    stim[62] = 8'ha7;
    stim[63] = 8'h62;
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
      expv[0] = 8'h8e;
      expv[1] = 8'h42;
      expv[2] = 8'h82;
      expv[3] = 8'h30;
      expv[4] = 8'ha2;
      expv[5] = 8'hca;
      expv[6] = 8'hc6;
      expv[7] = 8'h32;
      expv[8] = 8'h67;
      expv[9] = 8'h1d;
      expv[10] = 8'hc9;
      expv[11] = 8'h6c;
      expv[12] = 8'h37;
      expv[13] = 8'hd2;
      expv[14] = 8'h67;
      expv[15] = 8'ha5;
      expv[16] = 8'hcb;
      expv[17] = 8'he8;
      expv[18] = 8'h21;
      expv[19] = 8'hf7;
      expv[20] = 8'h41;
      expv[21] = 8'h2a;
      expv[22] = 8'h6c;
      expv[23] = 8'h52;
      expv[24] = 8'h0c;
      expv[25] = 8'h2b;
      expv[26] = 8'h72;
      expv[27] = 8'h3f;
      expv[28] = 8'hb9;
      expv[29] = 8'h36;
      expv[30] = 8'h07;
      expv[31] = 8'h7f;
      expv[32] = 8'h96;
      expv[33] = 8'h01;
      expv[34] = 8'hd7;
      expv[35] = 8'h05;
      expv[36] = 8'h85;
      expv[37] = 8'h8a;
      expv[38] = 8'h09;
      expv[39] = 8'h1b;
      expv[40] = 8'h7c;
      expv[41] = 8'he6;
      expv[42] = 8'hcc;
      expv[43] = 8'h85;
      expv[44] = 8'h4c;
      expv[45] = 8'h5a;
      expv[46] = 8'hd7;
      expv[47] = 8'he0;
      expv[48] = 8'hed;
      expv[49] = 8'hc0;
      expv[50] = 8'ha8;
      expv[51] = 8'hda;
      expv[52] = 8'h92;
      expv[53] = 8'h2a;
      expv[54] = 8'h42;
      expv[55] = 8'hcd;
      expv[56] = 8'h9b;
      expv[57] = 8'hc1;
      expv[58] = 8'h4e;
      expv[59] = 8'h9b;
      expv[60] = 8'h40;
      expv[61] = 8'hb9;
      expv[62] = 8'h36;
      expv[63] = 8'h48;
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
