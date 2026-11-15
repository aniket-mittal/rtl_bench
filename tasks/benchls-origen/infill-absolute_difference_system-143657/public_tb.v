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

  origen_143657 dut (
    .in(in_vec[7:0]),
    .out(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'h8d;
    stim[1] = 8'he5;
    stim[2] = 8'h08;
    stim[3] = 8'h4d;
    stim[4] = 8'hcd;
    stim[5] = 8'h29;
    stim[6] = 8'h4e;
    stim[7] = 8'h0e;
    stim[8] = 8'h85;
    stim[9] = 8'h87;
    stim[10] = 8'hf1;
    stim[11] = 8'hae;
    stim[12] = 8'h37;
    stim[13] = 8'h59;
    stim[14] = 8'h41;
    stim[15] = 8'h76;
    stim[16] = 8'ha8;
    stim[17] = 8'hc4;
    stim[18] = 8'h45;
    stim[19] = 8'hff;
    stim[20] = 8'h4d;
    stim[21] = 8'hfd;
    stim[22] = 8'h35;
    stim[23] = 8'ha4;
    stim[24] = 8'haf;
    stim[25] = 8'ha8;
    stim[26] = 8'hc2;
    stim[27] = 8'hc1;
    stim[28] = 8'hf2;
    stim[29] = 8'h79;
    stim[30] = 8'hc4;
    stim[31] = 8'h4a;
    stim[32] = 8'h5d;
    stim[33] = 8'had;
    stim[34] = 8'h4b;
    stim[35] = 8'h47;
    stim[36] = 8'haa;
    stim[37] = 8'h6e;
    stim[38] = 8'h8d;
    stim[39] = 8'hc4;
    stim[40] = 8'h0c;
    stim[41] = 8'hdb;
    stim[42] = 8'h4d;
    stim[43] = 8'hb0;
    stim[44] = 8'hc5;
    stim[45] = 8'h67;
    stim[46] = 8'h5c;
    stim[47] = 8'hd7;
    stim[48] = 8'hbe;
    stim[49] = 8'h1b;
    stim[50] = 8'hca;
    stim[51] = 8'had;
    stim[52] = 8'h50;
    stim[53] = 8'hfd;
    stim[54] = 8'haf;
    stim[55] = 8'h3c;
    stim[56] = 8'hd1;
    stim[57] = 8'heb;
    stim[58] = 8'h6e;
    stim[59] = 8'h59;
    stim[60] = 8'h20;
    stim[61] = 8'h88;
    stim[62] = 8'hf7;
    stim[63] = 8'hda;
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
      expv[0] = 8'hb1;
      expv[1] = 8'ha7;
      expv[2] = 8'h10;
      expv[3] = 8'hb2;
      expv[4] = 8'hb3;
      expv[5] = 8'h94;
      expv[6] = 8'h72;
      expv[7] = 8'h70;
      expv[8] = 8'ha1;
      expv[9] = 8'he1;
      expv[10] = 8'h8f;
      expv[11] = 8'h75;
      expv[12] = 8'hec;
      expv[13] = 8'h9a;
      expv[14] = 8'h82;
      expv[15] = 8'h6e;
      expv[16] = 8'h15;
      expv[17] = 8'h23;
      expv[18] = 8'ha2;
      expv[19] = 8'hff;
      expv[20] = 8'hb2;
      expv[21] = 8'hbf;
      expv[22] = 8'hac;
      expv[23] = 8'h25;
      expv[24] = 8'hf5;
      expv[25] = 8'h15;
      expv[26] = 8'h43;
      expv[27] = 8'h83;
      expv[28] = 8'h4f;
      expv[29] = 8'h9e;
      expv[30] = 8'h23;
      expv[31] = 8'h52;
      expv[32] = 8'hba;
      expv[33] = 8'hb5;
      expv[34] = 8'hd2;
      expv[35] = 8'he2;
      expv[36] = 8'h55;
      expv[37] = 8'h76;
      expv[38] = 8'hb1;
      expv[39] = 8'h23;
      expv[40] = 8'h30;
      expv[41] = 8'hdb;
      expv[42] = 8'hb2;
      expv[43] = 8'h0d;
      expv[44] = 8'ha3;
      expv[45] = 8'he6;
      expv[46] = 8'h3a;
      expv[47] = 8'heb;
      expv[48] = 8'h7d;
      expv[49] = 8'hd8;
      expv[50] = 8'h53;
      expv[51] = 8'hb5;
      expv[52] = 8'h0a;
      expv[53] = 8'hbf;
      expv[54] = 8'hf5;
      expv[55] = 8'h3c;
      expv[56] = 8'h8b;
      expv[57] = 8'hd7;
      expv[58] = 8'h76;
      expv[59] = 8'h9a;
      expv[60] = 8'h04;
      expv[61] = 8'h11;
      expv[62] = 8'hef;
      expv[63] = 8'h5b;
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
