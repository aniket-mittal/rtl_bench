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

  gf_mult_by_2e dut (
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
    stim[0] = 8'h89;
    stim[1] = 8'h89;
    stim[2] = 8'hcb;
    stim[3] = 8'h5b;
    stim[4] = 8'hee;
    stim[5] = 8'h6e;
    stim[6] = 8'hc8;
    stim[7] = 8'h62;
    stim[8] = 8'h68;
    stim[9] = 8'hed;
    stim[10] = 8'ha3;
    stim[11] = 8'hd7;
    stim[12] = 8'h1f;
    stim[13] = 8'h77;
    stim[14] = 8'he9;
    stim[15] = 8'h3a;
    stim[16] = 8'h96;
    stim[17] = 8'h65;
    stim[18] = 8'hbc;
    stim[19] = 8'h78;
    stim[20] = 8'h0c;
    stim[21] = 8'h59;
    stim[22] = 8'h57;
    stim[23] = 8'ha8;
    stim[24] = 8'h9f;
    stim[25] = 8'ha7;
    stim[26] = 8'h1b;
    stim[27] = 8'hf3;
    stim[28] = 8'h15;
    stim[29] = 8'hb4;
    stim[30] = 8'h9b;
    stim[31] = 8'h40;
    stim[32] = 8'hfc;
    stim[33] = 8'hb1;
    stim[34] = 8'he3;
    stim[35] = 8'hdf;
    stim[36] = 8'he6;
    stim[37] = 8'h42;
    stim[38] = 8'hf6;
    stim[39] = 8'h8f;
    stim[40] = 8'hb2;
    stim[41] = 8'h45;
    stim[42] = 8'h9c;
    stim[43] = 8'h13;
    stim[44] = 8'hfd;
    stim[45] = 8'h14;
    stim[46] = 8'he7;
    stim[47] = 8'h25;
    stim[48] = 8'h90;
    stim[49] = 8'h8a;
    stim[50] = 8'h72;
    stim[51] = 8'hf0;
    stim[52] = 8'h85;
    stim[53] = 8'h2a;
    stim[54] = 8'hf3;
    stim[55] = 8'h4e;
    stim[56] = 8'h43;
    stim[57] = 8'hd8;
    stim[58] = 8'h21;
    stim[59] = 8'h5e;
    stim[60] = 8'hc0;
    stim[61] = 8'h26;
    stim[62] = 8'h4a;
    stim[63] = 8'hc1;
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
      expv[0] = 8'hdd;
      expv[1] = 8'hdd;
      expv[2] = 8'hce;
      expv[3] = 8'h8a;
      expv[4] = 8'hf1;
      expv[5] = 8'h6f;
      expv[6] = 8'hbc;
      expv[7] = 8'hba;
      expv[8] = 8'h8b;
      expv[9] = 8'h83;
      expv[10] = 8'h45;
      expv[11] = 8'hc1;
      expv[12] = 8'h7d;
      expv[13] = 8'hf6;
      expv[14] = 8'h3b;
      expv[15] = 8'h42;
      expv[16] = 8'ha0;
      expv[17] = 8'h70;
      expv[18] = 8'h38;
      expv[19] = 8'h51;
      expv[20] = 8'hd5;
      expv[21] = 8'hd6;
      expv[22] = 8'h5f;
      expv[23] = 8'h5a;
      expv[24] = 8'he3;
      expv[25] = 8'hfd;
      expv[26] = 8'hc5;
      expv[27] = 8'hd0;
      expv[28] = 8'h4c;
      expv[29] = 8'h55;
      expv[30] = 8'h5b;
      expv[31] = 8'h4f;
      expv[32] = 8'h77;
      expv[33] = 8'hc3;
      expv[34] = 8'h0a;
      expv[35] = 8'hac;
      expv[36] = 8'h9c;
      expv[37] = 8'h13;
      expv[38] = 8'h46;
      expv[39] = 8'h39;
      expv[40] = 8'hb1;
      expv[41] = 8'hd9;
      expv[42] = 8'h91;
      expv[43] = 8'ha8;
      expv[44] = 8'h59;
      expv[45] = 8'h62;
      expv[46] = 8'hb2;
      expv[47] = 8'h3f;
      expv[48] = 8'h44;
      expv[49] = 8'haf;
      expv[50] = 8'h60;
      expv[51] = 8'ha2;
      expv[52] = 8'h08;
      expv[53] = 8'h98;
      expv[54] = 8'hd0;
      expv[55] = 8'hc6;
      expv[56] = 8'h3d;
      expv[57] = 8'h66;
      expv[58] = 8'h87;
      expv[59] = 8'h1c;
      expv[60] = 8'hd1;
      expv[61] = 8'h4d;
      expv[62] = 8'h7e;
      expv[63] = 8'hff;
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
