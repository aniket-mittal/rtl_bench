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

  gf_mult_by_57 dut (
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
    stim[0] = 8'h9e;
    stim[1] = 8'h5c;
    stim[2] = 8'h35;
    stim[3] = 8'h10;
    stim[4] = 8'h72;
    stim[5] = 8'h6b;
    stim[6] = 8'hd4;
    stim[7] = 8'h79;
    stim[8] = 8'h5a;
    stim[9] = 8'h8b;
    stim[10] = 8'h57;
    stim[11] = 8'h50;
    stim[12] = 8'hc6;
    stim[13] = 8'had;
    stim[14] = 8'h32;
    stim[15] = 8'hc5;
    stim[16] = 8'hf4;
    stim[17] = 8'h4b;
    stim[18] = 8'hcc;
    stim[19] = 8'h37;
    stim[20] = 8'h26;
    stim[21] = 8'h64;
    stim[22] = 8'h65;
    stim[23] = 8'h00;
    stim[24] = 8'h99;
    stim[25] = 8'h0e;
    stim[26] = 8'hba;
    stim[27] = 8'h3d;
    stim[28] = 8'h0d;
    stim[29] = 8'hca;
    stim[30] = 8'hcd;
    stim[31] = 8'h5d;
    stim[32] = 8'hc0;
    stim[33] = 8'h28;
    stim[34] = 8'hf0;
    stim[35] = 8'he0;
    stim[36] = 8'h51;
    stim[37] = 8'h31;
    stim[38] = 8'h5b;
    stim[39] = 8'h11;
    stim[40] = 8'h4c;
    stim[41] = 8'h20;
    stim[42] = 8'h0b;
    stim[43] = 8'hca;
    stim[44] = 8'h4e;
    stim[45] = 8'h32;
    stim[46] = 8'hd3;
    stim[47] = 8'haf;
    stim[48] = 8'h39;
    stim[49] = 8'h6d;
    stim[50] = 8'hb3;
    stim[51] = 8'h4d;
    stim[52] = 8'hb9;
    stim[53] = 8'h63;
    stim[54] = 8'h73;
    stim[55] = 8'h50;
    stim[56] = 8'h17;
    stim[57] = 8'h49;
    stim[58] = 8'h4f;
    stim[59] = 8'h16;
    stim[60] = 8'h30;
    stim[61] = 8'hb7;
    stim[62] = 8'h5b;
    stim[63] = 8'h96;
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
      expv[0] = 8'hbc;
      expv[1] = 8'hbe;
      expv[2] = 8'h3d;
      expv[3] = 8'h19;
      expv[4] = 8'he1;
      expv[5] = 8'h2d;
      expv[6] = 8'hf4;
      expv[7] = 8'h9a;
      expv[8] = 8'h51;
      expv[9] = 8'hb3;
      expv[10] = 8'hc5;
      expv[11] = 8'h7d;
      expv[12] = 8'h43;
      expv[13] = 8'h6e;
      expv[14] = 8'h85;
      expv[15] = 8'hba;
      expv[16] = 8'hc6;
      expv[17] = 8'h1f;
      expv[18] = 8'h6f;
      expv[19] = 8'h93;
      expv[20] = 8'hdd;
      expv[21] = 8'h17;
      expv[22] = 8'h40;
      expv[23] = 8'h00;
      expv[24] = 8'h04;
      expv[25] = 8'h6d;
      expv[26] = 8'hcf;
      expv[27] = 8'hbf;
      expv[28] = 8'h94;
      expv[29] = 8'h80;
      expv[30] = 8'h38;
      expv[31] = 8'he9;
      expv[32] = 8'hac;
      expv[33] = 8'hb0;
      expv[34] = 8'h87;
      expv[35] = 8'h9e;
      expv[36] = 8'h2a;
      expv[37] = 8'h7c;
      expv[38] = 8'h06;
      expv[39] = 8'h4e;
      expv[40] = 8'ha7;
      expv[41] = 8'h32;
      expv[42] = 8'h7b;
      expv[43] = 8'h80;
      expv[44] = 8'h09;
      expv[45] = 8'h85;
      expv[46] = 8'h4c;
      expv[47] = 8'hc0;
      expv[48] = 8'hfe;
      expv[49] = 8'hc2;
      expv[50] = 8'h1a;
      expv[51] = 8'hf0;
      expv[52] = 8'h36;
      expv[53] = 8'haf;
      expv[54] = 8'hb6;
      expv[55] = 8'h7d;
      expv[56] = 8'ha1;
      expv[57] = 8'hb1;
      expv[58] = 8'h5e;
      expv[59] = 8'hf6;
      expv[60] = 8'h2b;
      expv[61] = 8'h5b;
      expv[62] = 8'h06;
      expv[63] = 8'h3e;
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
