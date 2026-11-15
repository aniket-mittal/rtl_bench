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

  gf_mult_by_51 dut (
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
    stim[0] = 8'hbd;
    stim[1] = 8'h17;
    stim[2] = 8'hf6;
    stim[3] = 8'h02;
    stim[4] = 8'h1f;
    stim[5] = 8'had;
    stim[6] = 8'hb3;
    stim[7] = 8'h08;
    stim[8] = 8'hfa;
    stim[9] = 8'hce;
    stim[10] = 8'hb0;
    stim[11] = 8'had;
    stim[12] = 8'h8e;
    stim[13] = 8'hf6;
    stim[14] = 8'h0e;
    stim[15] = 8'h6d;
    stim[16] = 8'hbc;
    stim[17] = 8'h6c;
    stim[18] = 8'h84;
    stim[19] = 8'h18;
    stim[20] = 8'h1b;
    stim[21] = 8'h6a;
    stim[22] = 8'hef;
    stim[23] = 8'h2f;
    stim[24] = 8'h17;
    stim[25] = 8'h1e;
    stim[26] = 8'h7e;
    stim[27] = 8'h25;
    stim[28] = 8'h10;
    stim[29] = 8'hc9;
    stim[30] = 8'h24;
    stim[31] = 8'h30;
    stim[32] = 8'h67;
    stim[33] = 8'hd4;
    stim[34] = 8'h72;
    stim[35] = 8'h31;
    stim[36] = 8'h90;
    stim[37] = 8'he4;
    stim[38] = 8'h34;
    stim[39] = 8'h0d;
    stim[40] = 8'h51;
    stim[41] = 8'h40;
    stim[42] = 8'h83;
    stim[43] = 8'h81;
    stim[44] = 8'h3f;
    stim[45] = 8'h38;
    stim[46] = 8'h32;
    stim[47] = 8'h9e;
    stim[48] = 8'h83;
    stim[49] = 8'h9b;
    stim[50] = 8'h2b;
    stim[51] = 8'h0d;
    stim[52] = 8'h11;
    stim[53] = 8'h3b;
    stim[54] = 8'h2d;
    stim[55] = 8'h2e;
    stim[56] = 8'h0f;
    stim[57] = 8'hb8;
    stim[58] = 8'h97;
    stim[59] = 8'h6d;
    stim[60] = 8'h98;
    stim[61] = 8'h42;
    stim[62] = 8'h3c;
    stim[63] = 8'hd5;
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
      expv[0] = 8'hde;
      expv[1] = 8'hd3;
      expv[2] = 8'h66;
      expv[3] = 8'ha2;
      expv[4] = 8'h61;
      expv[5] = 8'ha7;
      expv[6] = 8'h97;
      expv[7] = 8'hb2;
      expv[8] = 8'h8d;
      expv[9] = 8'h5f;
      expv[10] = 8'h64;
      expv[11] = 8'ha7;
      expv[12] = 8'ha6;
      expv[13] = 8'h66;
      expv[14] = 8'h49;
      expv[15] = 8'hb1;
      expv[16] = 8'h8f;
      expv[17] = 8'he0;
      expv[18] = 8'hb6;
      expv[19] = 8'hcb;
      expv[20] = 8'h38;
      expv[21] = 8'h1b;
      expv[22] = 8'hfc;
      expv[23] = 8'hea;
      expv[24] = 8'hd3;
      expv[25] = 8'h30;
      expv[26] = 8'h3b;
      expv[27] = 8'hfa;
      expv[28] = 8'h79;
      expv[29] = 8'hf5;
      expv[30] = 8'hab;
      expv[31] = 8'h8b;
      expv[32] = 8'ha1;
      expv[33] = 8'h36;
      expv[34] = 8'hd0;
      expv[35] = 8'hda;
      expv[36] = 8'h96;
      expv[37] = 8'hbd;
      expv[38] = 8'hd2;
      expv[39] = 8'hba;
      expv[40] = 8'hd1;
      expv[41] = 8'hf9;
      expv[42] = 8'h1c;
      expv[43] = 8'hbe;
      expv[44] = 8'h93;
      expv[45] = 8'h39;
      expv[46] = 8'h29;
      expv[47] = 8'hdf;
      expv[48] = 8'h1c;
      expv[49] = 8'hd7;
      expv[50] = 8'hb3;
      expv[51] = 8'hba;
      expv[52] = 8'h28;
      expv[53] = 8'hca;
      expv[54] = 8'h48;
      expv[55] = 8'hbb;
      expv[56] = 8'h18;
      expv[57] = 8'hd6;
      expv[58] = 8'h3c;
      expv[59] = 8'hb1;
      expv[60] = 8'h24;
      expv[61] = 8'h5b;
      expv[62] = 8'h60;
      expv[63] = 8'h67;
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
