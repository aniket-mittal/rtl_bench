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

  gf_mult_by_05 dut (
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
    stim[0] = 8'h6a;
    stim[1] = 8'hfa;
    stim[2] = 8'hf7;
    stim[3] = 8'h71;
    stim[4] = 8'h5e;
    stim[5] = 8'hf3;
    stim[6] = 8'hd9;
    stim[7] = 8'hf7;
    stim[8] = 8'h72;
    stim[9] = 8'hd8;
    stim[10] = 8'ha0;
    stim[11] = 8'h01;
    stim[12] = 8'hdf;
    stim[13] = 8'hac;
    stim[14] = 8'h7b;
    stim[15] = 8'he3;
    stim[16] = 8'h59;
    stim[17] = 8'hde;
    stim[18] = 8'h5b;
    stim[19] = 8'h3c;
    stim[20] = 8'h8b;
    stim[21] = 8'hc4;
    stim[22] = 8'hea;
    stim[23] = 8'h61;
    stim[24] = 8'h89;
    stim[25] = 8'h04;
    stim[26] = 8'he2;
    stim[27] = 8'h2b;
    stim[28] = 8'h27;
    stim[29] = 8'h9a;
    stim[30] = 8'hcb;
    stim[31] = 8'h93;
    stim[32] = 8'h07;
    stim[33] = 8'he6;
    stim[34] = 8'heb;
    stim[35] = 8'h7d;
    stim[36] = 8'hd6;
    stim[37] = 8'h22;
    stim[38] = 8'h5c;
    stim[39] = 8'hfe;
    stim[40] = 8'h3c;
    stim[41] = 8'h1e;
    stim[42] = 8'h0b;
    stim[43] = 8'h94;
    stim[44] = 8'h8f;
    stim[45] = 8'h28;
    stim[46] = 8'h57;
    stim[47] = 8'he2;
    stim[48] = 8'hdc;
    stim[49] = 8'h7c;
    stim[50] = 8'h23;
    stim[51] = 8'h47;
    stim[52] = 8'h0b;
    stim[53] = 8'hc2;
    stim[54] = 8'hb5;
    stim[55] = 8'hfa;
    stim[56] = 8'hc5;
    stim[57] = 8'hae;
    stim[58] = 8'h7f;
    stim[59] = 8'hf3;
    stim[60] = 8'h25;
    stim[61] = 8'hcc;
    stim[62] = 8'h6e;
    stim[63] = 8'h4f;
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
      expv[0] = 8'hdf;
      expv[1] = 8'h35;
      expv[2] = 8'h0c;
      expv[3] = 8'ha8;
      expv[4] = 8'h3b;
      expv[5] = 8'h18;
      expv[6] = 8'h9a;
      expv[7] = 8'h0c;
      expv[8] = 8'ha7;
      expv[9] = 8'h9f;
      expv[10] = 8'h1a;
      expv[11] = 8'h05;
      expv[12] = 8'h84;
      expv[13] = 8'h26;
      expv[14] = 8'h8a;
      expv[15] = 8'h48;
      expv[16] = 8'h20;
      expv[17] = 8'h81;
      expv[18] = 8'h2a;
      expv[19] = 8'hcc;
      expv[20] = 8'h9d;
      expv[21] = 8'hf3;
      expv[22] = 8'h65;
      expv[23] = 8'hf8;
      expv[24] = 8'h97;
      expv[25] = 8'h14;
      expv[26] = 8'h4d;
      expv[27] = 8'h87;
      expv[28] = 8'hbb;
      expv[29] = 8'hc8;
      expv[30] = 8'hc0;
      expv[31] = 8'he5;
      expv[32] = 8'h1b;
      expv[33] = 8'h59;
      expv[34] = 8'h60;
      expv[35] = 8'h94;
      expv[36] = 8'ha9;
      expv[37] = 8'haa;
      expv[38] = 8'h31;
      expv[39] = 8'h21;
      expv[40] = 8'hcc;
      expv[41] = 8'h66;
      expv[42] = 8'h27;
      expv[43] = 8'hfe;
      expv[44] = 8'h89;
      expv[45] = 8'h88;
      expv[46] = 8'h16;
      expv[47] = 8'h4d;
      expv[48] = 8'h8b;
      expv[49] = 8'h91;
      expv[50] = 8'haf;
      expv[51] = 8'h46;
      expv[52] = 8'h27;
      expv[53] = 8'hed;
      expv[54] = 8'h5b;
      expv[55] = 8'h35;
      expv[56] = 8'hf6;
      expv[57] = 8'h2c;
      expv[58] = 8'h9e;
      expv[59] = 8'h18;
      expv[60] = 8'hb1;
      expv[61] = 8'hdb;
      expv[62] = 8'hcb;
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
