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

  gf_mult_by_a3 dut (
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
    stim[0] = 8'hf4;
    stim[1] = 8'h13;
    stim[2] = 8'he5;
    stim[3] = 8'h07;
    stim[4] = 8'h23;
    stim[5] = 8'h5d;
    stim[6] = 8'h2f;
    stim[7] = 8'h54;
    stim[8] = 8'h7c;
    stim[9] = 8'hba;
    stim[10] = 8'h19;
    stim[11] = 8'h8b;
    stim[12] = 8'h0a;
    stim[13] = 8'h4d;
    stim[14] = 8'h20;
    stim[15] = 8'hc1;
    stim[16] = 8'ha2;
    stim[17] = 8'h30;
    stim[18] = 8'h98;
    stim[19] = 8'h2c;
    stim[20] = 8'hd7;
    stim[21] = 8'h48;
    stim[22] = 8'hb7;
    stim[23] = 8'h83;
    stim[24] = 8'h61;
    stim[25] = 8'h87;
    stim[26] = 8'ha6;
    stim[27] = 8'he6;
    stim[28] = 8'h94;
    stim[29] = 8'h11;
    stim[30] = 8'h10;
    stim[31] = 8'h43;
    stim[32] = 8'h04;
    stim[33] = 8'hd7;
    stim[34] = 8'h1c;
    stim[35] = 8'h92;
    stim[36] = 8'h11;
    stim[37] = 8'h86;
    stim[38] = 8'h0d;
    stim[39] = 8'h00;
    stim[40] = 8'h29;
    stim[41] = 8'hf5;
    stim[42] = 8'h82;
    stim[43] = 8'h7c;
    stim[44] = 8'h39;
    stim[45] = 8'h30;
    stim[46] = 8'h80;
    stim[47] = 8'he1;
    stim[48] = 8'hb7;
    stim[49] = 8'hb0;
    stim[50] = 8'h59;
    stim[51] = 8'h2e;
    stim[52] = 8'hdc;
    stim[53] = 8'h1b;
    stim[54] = 8'heb;
    stim[55] = 8'hc6;
    stim[56] = 8'h57;
    stim[57] = 8'h4b;
    stim[58] = 8'h17;
    stim[59] = 8'hc9;
    stim[60] = 8'h27;
    stim[61] = 8'h70;
    stim[62] = 8'hd1;
    stim[63] = 8'h55;
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
      expv[0] = 8'h61;
      expv[1] = 8'h1a;
      expv[2] = 8'h20;
      expv[3] = 8'h4e;
      expv[4] = 8'h21;
      expv[5] = 8'h29;
      expv[6] = 8'he6;
      expv[7] = 8'hfb;
      expv[8] = 8'h53;
      expv[9] = 8'h52;
      expv[10] = 8'h30;
      expv[11] = 8'hca;
      expv[12] = 8'h2a;
      expv[13] = 8'hcb;
      expv[14] = 8'hd9;
      expv[15] = 8'h4f;
      expv[16] = 8'hc1;
      expv[17] = 8'h3b;
      expv[18] = 8'hd0;
      expv[19] = 8'h1e;
      expv[20] = 8'h40;
      expv[21] = 8'hde;
      expv[22] = 8'h36;
      expv[23] = 8'hbb;
      expv[24] = 8'hd5;
      expv[25] = 8'h0d;
      expv[26] = 8'h77;
      expv[27] = 8'hd8;
      expv[28] = 8'h17;
      expv[29] = 8'h41;
      expv[30] = 8'he2;
      expv[31] = 8'h57;
      expv[32] = 8'hb6;
      expv[33] = 8'h40;
      expv[34] = 8'h25;
      expv[35] = 8'hfa;
      expv[36] = 8'h41;
      expv[37] = 8'hae;
      expv[38] = 8'h64;
      expv[39] = 8'h00;
      expv[40] = 8'h0b;
      expv[41] = 8'hc2;
      expv[42] = 8'h18;
      expv[43] = 8'h53;
      expv[44] = 8'he9;
      expv[45] = 8'h3b;
      expv[46] = 8'h43;
      expv[47] = 8'h96;
      expv[48] = 8'h36;
      expv[49] = 8'h78;
      expv[50] = 8'h9f;
      expv[51] = 8'h45;
      expv[52] = 8'hc9;
      expv[53] = 8'h6b;
      expv[54] = 8'hbc;
      expv[55] = 8'h01;
      expv[56] = 8'h03;
      expv[57] = 8'h26;
      expv[58] = 8'hac;
      expv[59] = 8'h3e;
      expv[60] = 8'h97;
      expv[61] = 8'h94;
      expv[62] = 8'had;
      expv[63] = 8'h58;
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
