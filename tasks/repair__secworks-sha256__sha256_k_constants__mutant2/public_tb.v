// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 6;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  dut dut (
    .round(in_vec[5:0]),
    .K(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 6'h13;
    stim[1] = 6'h33;
    stim[2] = 6'h3b;
    stim[3] = 6'h14;
    stim[4] = 6'h13;
    stim[5] = 6'h13;
    stim[6] = 6'h35;
    stim[7] = 6'h13;
    stim[8] = 6'h01;
    stim[9] = 6'h21;
    stim[10] = 6'h1a;
    stim[11] = 6'h17;
    stim[12] = 6'h02;
    stim[13] = 6'h2b;
    stim[14] = 6'h2b;
    stim[15] = 6'h07;
    stim[16] = 6'h07;
    stim[17] = 6'h13;
    stim[18] = 6'h00;
    stim[19] = 6'h35;
    stim[20] = 6'h1a;
    stim[21] = 6'h3b;
    stim[22] = 6'h03;
    stim[23] = 6'h2c;
    stim[24] = 6'h00;
    stim[25] = 6'h3e;
    stim[26] = 6'h12;
    stim[27] = 6'h2e;
    stim[28] = 6'h17;
    stim[29] = 6'h0d;
    stim[30] = 6'h08;
    stim[31] = 6'h26;
    stim[32] = 6'h33;
    stim[33] = 6'h3e;
    stim[34] = 6'h31;
    stim[35] = 6'h0b;
    stim[36] = 6'h0a;
    stim[37] = 6'h1f;
    stim[38] = 6'h09;
    stim[39] = 6'h22;
    stim[40] = 6'h3b;
    stim[41] = 6'h08;
    stim[42] = 6'h3a;
    stim[43] = 6'h2f;
    stim[44] = 6'h23;
    stim[45] = 6'h3a;
    stim[46] = 6'h39;
    stim[47] = 6'h25;
    stim[48] = 6'h39;
    stim[49] = 6'h2c;
    stim[50] = 6'h0e;
    stim[51] = 6'h24;
    stim[52] = 6'h16;
    stim[53] = 6'h1f;
    stim[54] = 6'h31;
    stim[55] = 6'h30;
    stim[56] = 6'h36;
    stim[57] = 6'h01;
    stim[58] = 6'h1e;
    stim[59] = 6'h3e;
    stim[60] = 6'h2d;
    stim[61] = 6'h3e;
    stim[62] = 6'h3a;
    stim[63] = 6'h15;
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
      expv[0] = 32'h240ca1cc;
      expv[1] = 32'h34b0bcb5;
      expv[2] = 32'h8cc70208;
      expv[3] = 32'h2de92c6f;
      expv[4] = 32'h240ca1cc;
      expv[5] = 32'h240ca1cc;
      expv[6] = 32'h4ed8aa4a;
      expv[7] = 32'h240ca1cc;
      expv[8] = 32'h71374491;
      expv[9] = 32'h2e1b2138;
      expv[10] = 32'hb00327c8;
      expv[11] = 32'h76f988da;
      expv[12] = 32'hb5c0fbcf;
      expv[13] = 32'hc76c51a3;
      expv[14] = 32'hc76c51a3;
      expv[15] = 32'hab1c5ed5;
      expv[16] = 32'hab1c5ed5;
      expv[17] = 32'h240ca1cc;
      expv[18] = 32'h428a2f98;
      expv[19] = 32'h4ed8aa4a;
      expv[20] = 32'hb00327c8;
      expv[21] = 32'h8cc70208;
      expv[22] = 32'he9b5dba5;
      expv[23] = 32'hd192e819;
      expv[24] = 32'h428a2f98;
      expv[25] = 32'hbef9a3f7;
      expv[26] = 32'h0fc19dc6;
      expv[27] = 32'hf40e3585;
      expv[28] = 32'h76f988da;
      expv[29] = 32'h80deb1fe;
      expv[30] = 32'hd807aa98;
      expv[31] = 32'h81c2c92e;
      expv[32] = 32'h34b0bcb5;
      expv[33] = 32'hbef9a3f7;
      expv[34] = 32'h1e376c08;
      expv[35] = 32'h550c7dc3;
      expv[36] = 32'h550c7dc3;
      expv[37] = 32'h14292967;
      expv[38] = 32'h12835b01;
      expv[39] = 32'h4d2c6dfc;
      expv[40] = 32'h8cc70208;
      expv[41] = 32'hd807aa98;
      expv[42] = 32'h84c87814;
      expv[43] = 32'h106aa070;
      expv[44] = 32'h53380d13;
      expv[45] = 32'h84c87814;
      expv[46] = 32'h78a5636f;
      expv[47] = 32'h766a0abb;
      expv[48] = 32'h78a5636f;
      expv[49] = 32'hd192e819;
      expv[50] = 32'h9bdc06a7;
      expv[51] = 32'h650a7354;
      expv[52] = 32'h5cb0a9dc;
      expv[53] = 32'h14292967;
      expv[54] = 32'h1e376c08;
      expv[55] = 32'h19a4c116;
      expv[56] = 32'h5b9cca4f;
      expv[57] = 32'h71374491;
      expv[58] = 32'h06ca6351;
      expv[59] = 32'hbef9a3f7;
      expv[60] = 32'hd6990624;
      expv[61] = 32'hbef9a3f7;
      expv[62] = 32'h84c87814;
      expv[63] = 32'h4a7484aa;
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
