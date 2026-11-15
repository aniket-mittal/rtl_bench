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

  gf_mult_by_1c dut (
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
    stim[0] = 8'hb0;
    stim[1] = 8'haa;
    stim[2] = 8'h60;
    stim[3] = 8'h85;
    stim[4] = 8'hd9;
    stim[5] = 8'h37;
    stim[6] = 8'h2e;
    stim[7] = 8'h25;
    stim[8] = 8'hbc;
    stim[9] = 8'h91;
    stim[10] = 8'ha3;
    stim[11] = 8'hf0;
    stim[12] = 8'h66;
    stim[13] = 8'h2b;
    stim[14] = 8'h8d;
    stim[15] = 8'h7c;
    stim[16] = 8'hdb;
    stim[17] = 8'h5b;
    stim[18] = 8'h07;
    stim[19] = 8'hb4;
    stim[20] = 8'h63;
    stim[21] = 8'hb8;
    stim[22] = 8'hab;
    stim[23] = 8'h69;
    stim[24] = 8'h01;
    stim[25] = 8'hf2;
    stim[26] = 8'h19;
    stim[27] = 8'h37;
    stim[28] = 8'h72;
    stim[29] = 8'h19;
    stim[30] = 8'h02;
    stim[31] = 8'hce;
    stim[32] = 8'h2c;
    stim[33] = 8'ha2;
    stim[34] = 8'h4e;
    stim[35] = 8'h91;
    stim[36] = 8'hae;
    stim[37] = 8'h9d;
    stim[38] = 8'hbd;
    stim[39] = 8'h6d;
    stim[40] = 8'hc3;
    stim[41] = 8'hac;
    stim[42] = 8'h01;
    stim[43] = 8'ha7;
    stim[44] = 8'h14;
    stim[45] = 8'haf;
    stim[46] = 8'h56;
    stim[47] = 8'h8c;
    stim[48] = 8'hc6;
    stim[49] = 8'h66;
    stim[50] = 8'hf3;
    stim[51] = 8'he5;
    stim[52] = 8'he3;
    stim[53] = 8'h47;
    stim[54] = 8'hea;
    stim[55] = 8'h26;
    stim[56] = 8'h52;
    stim[57] = 8'h20;
    stim[58] = 8'hb7;
    stim[59] = 8'h4c;
    stim[60] = 8'hff;
    stim[61] = 8'h1b;
    stim[62] = 8'h6e;
    stim[63] = 8'hf6;
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
      expv[0] = 8'hdc;
      expv[1] = 8'hd9;
      expv[2] = 8'hf4;
      expv[3] = 8'hca;
      expv[4] = 8'hd4;
      expv[5] = 8'h2e;
      expv[6] = 8'h0f;
      expv[7] = 8'hcb;
      expv[8] = 8'h4c;
      expv[9] = 8'h67;
      expv[10] = 8'h25;
      expv[11] = 8'h8f;
      expv[12] = 8'hbc;
      expv[13] = 8'h63;
      expv[14] = 8'h2a;
      expv[15] = 8'hb9;
      expv[16] = 8'hec;
      expv[17] = 8'h4a;
      expv[18] = 8'h54;
      expv[19] = 8'hac;
      expv[20] = 8'hd0;
      expv[21] = 8'h3c;
      expv[22] = 8'hc5;
      expv[23] = 8'h08;
      expv[24] = 8'h1c;
      expv[25] = 8'hb7;
      expv[26] = 8'h21;
      expv[27] = 8'h2e;
      expv[28] = 8'h11;
      expv[29] = 8'h21;
      expv[30] = 8'h38;
      expv[31] = 8'h5d;
      expv[32] = 8'h37;
      expv[33] = 8'h39;
      expv[34] = 8'hfb;
      expv[35] = 8'h67;
      expv[36] = 8'ha9;
      expv[37] = 8'hf7;
      expv[38] = 8'h50;
      expv[39] = 8'h78;
      expv[40] = 8'hd1;
      expv[41] = 8'h91;
      expv[42] = 8'h1c;
      expv[43] = 8'h55;
      expv[44] = 8'had;
      expv[45] = 8'hb5;
      expv[46] = 8'hc6;
      expv[47] = 8'h36;
      expv[48] = 8'hbd;
      expv[49] = 8'hbc;
      expv[50] = 8'hab;
      expv[51] = 8'h3e;
      expv[52] = 8'h76;
      expv[53] = 8'h07;
      expv[54] = 8'h8a;
      expv[55] = 8'hef;
      expv[56] = 8'hb6;
      expv[57] = 8'ha7;
      expv[58] = 8'h88;
      expv[59] = 8'hc3;
      expv[60] = 8'h3b;
      expv[61] = 8'h19;
      expv[62] = 8'h5c;
      expv[63] = 8'hc7;
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
