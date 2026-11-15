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

  mg_08901 dut (
    .clk(clk),
    .rx_address(in_vec[5:0]),
    .tx_k(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 6'h33;
    stim[1] = 6'h38;
    stim[2] = 6'h03;
    stim[3] = 6'h3b;
    stim[4] = 6'h07;
    stim[5] = 6'h26;
    stim[6] = 6'h06;
    stim[7] = 6'h0e;
    stim[8] = 6'h25;
    stim[9] = 6'h0a;
    stim[10] = 6'h3a;
    stim[11] = 6'h19;
    stim[12] = 6'h0f;
    stim[13] = 6'h02;
    stim[14] = 6'h04;
    stim[15] = 6'h35;
    stim[16] = 6'h0f;
    stim[17] = 6'h32;
    stim[18] = 6'h29;
    stim[19] = 6'h2c;
    stim[20] = 6'h02;
    stim[21] = 6'h0d;
    stim[22] = 6'h2c;
    stim[23] = 6'h0e;
    stim[24] = 6'h31;
    stim[25] = 6'h0f;
    stim[26] = 6'h2c;
    stim[27] = 6'h1f;
    stim[28] = 6'h00;
    stim[29] = 6'h31;
    stim[30] = 6'h1b;
    stim[31] = 6'h03;
    stim[32] = 6'h1d;
    stim[33] = 6'h39;
    stim[34] = 6'h14;
    stim[35] = 6'h11;
    stim[36] = 6'h2a;
    stim[37] = 6'h25;
    stim[38] = 6'h24;
    stim[39] = 6'h16;
    stim[40] = 6'h12;
    stim[41] = 6'h1f;
    stim[42] = 6'h07;
    stim[43] = 6'h13;
    stim[44] = 6'h31;
    stim[45] = 6'h03;
    stim[46] = 6'h08;
    stim[47] = 6'h08;
    stim[48] = 6'h36;
    stim[49] = 6'h04;
    stim[50] = 6'h36;
    stim[51] = 6'h2c;
    stim[52] = 6'h1c;
    stim[53] = 6'h0f;
    stim[54] = 6'h05;
    stim[55] = 6'h37;
    stim[56] = 6'h14;
    stim[57] = 6'h25;
    stim[58] = 6'h1f;
    stim[59] = 6'h0d;
    stim[60] = 6'h0f;
    stim[61] = 6'h26;
    stim[62] = 6'h29;
    stim[63] = 6'h0d;
    for (c = 0; c < N; c = c + 1) begin
      #1 in_vec = stim[c];
      #3 sample;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 32'h34b0bcb5;
      expv[1] = 32'h748f82ee;
      expv[2] = 32'he9b5dba5;
      expv[3] = 32'h8cc70208;
      expv[4] = 32'hab1c5ed5;
      expv[5] = 32'h81c2c92e;
      expv[6] = 32'h923f82a4;
      expv[7] = 32'h9bdc06a7;
      expv[8] = 32'h766a0abb;
      expv[9] = 32'h243185be;
      expv[10] = 32'h84c87814;
      expv[11] = 32'ha831c66d;
      expv[12] = 32'hc19bf174;
      expv[13] = 32'hb5c0fbcf;
      expv[14] = 32'h3956c25b;
      expv[15] = 32'h4ed8aa4a;
      expv[16] = 32'hc19bf174;
      expv[17] = 32'h2748774c;
      expv[18] = 32'ha81a664b;
      expv[19] = 32'hd192e819;
      expv[20] = 32'hb5c0fbcf;
      expv[21] = 32'h80deb1fe;
      expv[22] = 32'hd192e819;
      expv[23] = 32'h9bdc06a7;
      expv[24] = 32'h1e376c08;
      expv[25] = 32'hc19bf174;
      expv[26] = 32'hd192e819;
      expv[27] = 32'h14292967;
      expv[28] = 32'h428a2f98;
      expv[29] = 32'h1e376c08;
      expv[30] = 32'hbf597fc7;
      expv[31] = 32'he9b5dba5;
      expv[32] = 32'hd5a79147;
      expv[33] = 32'h78a5636f;
      expv[34] = 32'h2de92c6f;
      expv[35] = 32'hefbe4786;
      expv[36] = 32'hc24b8b70;
      expv[37] = 32'h766a0abb;
      expv[38] = 32'h650a7354;
      expv[39] = 32'h5cb0a9dc;
      expv[40] = 32'h0fc19dc6;
      expv[41] = 32'h14292967;
      expv[42] = 32'hab1c5ed5;
      expv[43] = 32'h240ca1cc;
      expv[44] = 32'h1e376c08;
      expv[45] = 32'he9b5dba5;
      expv[46] = 32'hd807aa98;
      expv[47] = 32'hd807aa98;
      expv[48] = 32'h5b9cca4f;
      expv[49] = 32'h3956c25b;
      expv[50] = 32'h5b9cca4f;
      expv[51] = 32'hd192e819;
      expv[52] = 32'hc6e00bf3;
      expv[53] = 32'hc19bf174;
      expv[54] = 32'h59f111f1;
      expv[55] = 32'h682e6ff3;
      expv[56] = 32'h2de92c6f;
      expv[57] = 32'h766a0abb;
      expv[58] = 32'h14292967;
      expv[59] = 32'h80deb1fe;
      expv[60] = 32'hc19bf174;
      expv[61] = 32'h81c2c92e;
      expv[62] = 32'ha81a664b;
      expv[63] = 32'h80deb1fe;
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
