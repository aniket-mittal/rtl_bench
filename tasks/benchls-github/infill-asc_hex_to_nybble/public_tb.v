// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 8;
  localparam OW = 4;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  asc_hex_to_nybble dut (
    .in(in_vec[7:0]),
    .out(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'h78;
    stim[1] = 8'hcf;
    stim[2] = 8'ha6;
    stim[3] = 8'h4a;
    stim[4] = 8'h62;
    stim[5] = 8'h8a;
    stim[6] = 8'hb8;
    stim[7] = 8'h0d;
    stim[8] = 8'h15;
    stim[9] = 8'h3a;
    stim[10] = 8'h5a;
    stim[11] = 8'hf4;
    stim[12] = 8'h04;
    stim[13] = 8'hdc;
    stim[14] = 8'hea;
    stim[15] = 8'h0d;
    stim[16] = 8'hc8;
    stim[17] = 8'hcb;
    stim[18] = 8'h0b;
    stim[19] = 8'hbc;
    stim[20] = 8'h93;
    stim[21] = 8'h97;
    stim[22] = 8'hf4;
    stim[23] = 8'h6d;
    stim[24] = 8'h37;
    stim[25] = 8'h67;
    stim[26] = 8'h99;
    stim[27] = 8'h34;
    stim[28] = 8'had;
    stim[29] = 8'hfe;
    stim[30] = 8'h12;
    stim[31] = 8'h48;
    stim[32] = 8'h68;
    stim[33] = 8'h73;
    stim[34] = 8'h15;
    stim[35] = 8'h76;
    stim[36] = 8'ha1;
    stim[37] = 8'h6a;
    stim[38] = 8'h35;
    stim[39] = 8'h64;
    stim[40] = 8'ha7;
    stim[41] = 8'hd0;
    stim[42] = 8'h0f;
    stim[43] = 8'haa;
    stim[44] = 8'h95;
    stim[45] = 8'h64;
    stim[46] = 8'h04;
    stim[47] = 8'hd9;
    stim[48] = 8'h34;
    stim[49] = 8'h12;
    stim[50] = 8'h8a;
    stim[51] = 8'hfd;
    stim[52] = 8'heb;
    stim[53] = 8'h8a;
    stim[54] = 8'hb8;
    stim[55] = 8'h42;
    stim[56] = 8'h51;
    stim[57] = 8'h6b;
    stim[58] = 8'h17;
    stim[59] = 8'hfb;
    stim[60] = 8'h50;
    stim[61] = 8'h6d;
    stim[62] = 8'h77;
    stim[63] = 8'h49;
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
      expv[0] = 4'h9;
      expv[1] = 4'hc;
      expv[2] = 4'h6;
      expv[3] = 4'hb;
      expv[4] = 4'hb;
      expv[5] = 4'ha;
      expv[6] = 4'h8;
      expv[7] = 4'hd;
      expv[8] = 4'h5;
      expv[9] = 4'ha;
      expv[10] = 4'hb;
      expv[11] = 4'hd;
      expv[12] = 4'h4;
      expv[13] = 4'hd;
      expv[14] = 4'hb;
      expv[15] = 4'hd;
      expv[16] = 4'h9;
      expv[17] = 4'hc;
      expv[18] = 4'hb;
      expv[19] = 4'hc;
      expv[20] = 4'h3;
      expv[21] = 4'h7;
      expv[22] = 4'hd;
      expv[23] = 4'he;
      expv[24] = 4'h7;
      expv[25] = 4'hc;
      expv[26] = 4'h9;
      expv[27] = 4'h4;
      expv[28] = 4'hd;
      expv[29] = 4'hf;
      expv[30] = 4'h2;
      expv[31] = 4'h9;
      expv[32] = 4'h9;
      expv[33] = 4'hc;
      expv[34] = 4'h5;
      expv[35] = 4'hf;
      expv[36] = 4'h1;
      expv[37] = 4'hb;
      expv[38] = 4'h5;
      expv[39] = 4'hd;
      expv[40] = 4'h7;
      expv[41] = 4'h9;
      expv[42] = 4'hf;
      expv[43] = 4'ha;
      expv[44] = 4'h5;
      expv[45] = 4'hd;
      expv[46] = 4'h4;
      expv[47] = 4'ha;
      expv[48] = 4'h4;
      expv[49] = 4'h2;
      expv[50] = 4'ha;
      expv[51] = 4'he;
      expv[52] = 4'hc;
      expv[53] = 4'ha;
      expv[54] = 4'h8;
      expv[55] = 4'hb;
      expv[56] = 4'ha;
      expv[57] = 4'hc;
      expv[58] = 4'h7;
      expv[59] = 4'hc;
      expv[60] = 4'h9;
      expv[61] = 4'he;
      expv[62] = 4'hc;
      expv[63] = 4'ha;
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
