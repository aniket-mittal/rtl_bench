// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 19;
  localparam OW = 19;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_119104 dut (
    .ap_clk(clk),
    .ap_rst(in_vec[18:18]),
    .ap_start(in_vec[17:17]),
    .ap_continue(in_vec[16:16]),
    .tmp_253(in_vec[15:0]),
    .ap_done(out_vec[18:18]),
    .ap_idle(out_vec[17:17]),
    .ap_ready(out_vec[16:16]),
    .ap_return(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 19'h42e11;
    stim[1] = 19'h462b9;
    stim[2] = 19'h0c77d;
    stim[3] = 19'h23aef;
    stim[4] = 19'h04227;
    stim[5] = 19'h1050a;
    stim[6] = 19'h2660c;
    stim[7] = 19'h1ff86;
    stim[8] = 19'h28504;
    stim[9] = 19'h3fcd5;
    stim[10] = 19'h1eac7;
    stim[11] = 19'h2ae84;
    stim[12] = 19'h0c381;
    stim[13] = 19'h487b2;
    stim[14] = 19'h1aaae;
    stim[15] = 19'h306a3;
    stim[16] = 19'h3923d;
    stim[17] = 19'h309b5;
    stim[18] = 19'h0b291;
    stim[19] = 19'h1efd1;
    stim[20] = 19'h3e790;
    stim[21] = 19'h3fa0d;
    stim[22] = 19'h3004b;
    stim[23] = 19'h24ea6;
    stim[24] = 19'h2ee26;
    stim[25] = 19'h0068c;
    stim[26] = 19'h00664;
    stim[27] = 19'h3c0dc;
    stim[28] = 19'h123df;
    stim[29] = 19'h35e8d;
    stim[30] = 19'h21a9a;
    stim[31] = 19'h11e99;
    stim[32] = 19'h13a6f;
    stim[33] = 19'h14af8;
    stim[34] = 19'h182c9;
    stim[35] = 19'h1dda6;
    stim[36] = 19'h1e6ed;
    stim[37] = 19'h01ebb;
    stim[38] = 19'h147af;
    stim[39] = 19'h0d4b9;
    stim[40] = 19'h0a4f4;
    stim[41] = 19'h2c10c;
    stim[42] = 19'h17bc0;
    stim[43] = 19'h2e227;
    stim[44] = 19'h29864;
    stim[45] = 19'h3d362;
    stim[46] = 19'h075da;
    stim[47] = 19'h3ae48;
    stim[48] = 19'h2a01f;
    stim[49] = 19'h0cae4;
    stim[50] = 19'h10c84;
    stim[51] = 19'h25163;
    stim[52] = 19'h3ff8e;
    stim[53] = 19'h03d47;
    stim[54] = 19'h231af;
    stim[55] = 19'h0c6f9;
    stim[56] = 19'h386c9;
    stim[57] = 19'h0a3cf;
    stim[58] = 19'h35aef;
    stim[59] = 19'h12c29;
    stim[60] = 19'h06a84;
    stim[61] = 19'h01e7c;
    stim[62] = 19'h61dba;
    stim[63] = 19'h3eed3;
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
      expv[0] = 19'h20000;
      expv[1] = 19'h20000;
      expv[2] = 19'h20000;
      expv[3] = 19'h53aef;
      expv[4] = 19'h63aef;
      expv[5] = 19'h63aef;
      expv[6] = 19'h5660c;
      expv[7] = 19'h6660c;
      expv[8] = 19'h58504;
      expv[9] = 19'h48504;
      expv[10] = 19'h28504;
      expv[11] = 19'h5ae84;
      expv[12] = 19'h6ae84;
      expv[13] = 19'h6ae84;
      expv[14] = 19'h20000;
      expv[15] = 19'h506a3;
      expv[16] = 19'h5923d;
      expv[17] = 19'h509b5;
      expv[18] = 19'h209b5;
      expv[19] = 19'h209b5;
      expv[20] = 19'h5e790;
      expv[21] = 19'h5fa0d;
      expv[22] = 19'h5004b;
      expv[23] = 19'h54ea6;
      expv[24] = 19'h44ea6;
      expv[25] = 19'h64ea6;
      expv[26] = 19'h64ea6;
      expv[27] = 19'h44ea6;
      expv[28] = 19'h24ea6;
      expv[29] = 19'h55e8d;
      expv[30] = 19'h51a9a;
      expv[31] = 19'h61a9a;
      expv[32] = 19'h21a9a;
      expv[33] = 19'h21a9a;
      expv[34] = 19'h21a9a;
      expv[35] = 19'h21a9a;
      expv[36] = 19'h21a9a;
      expv[37] = 19'h21a9a;
      expv[38] = 19'h21a9a;
      expv[39] = 19'h21a9a;
      expv[40] = 19'h21a9a;
      expv[41] = 19'h5c10c;
      expv[42] = 19'h6c10c;
      expv[43] = 19'h5e227;
      expv[44] = 19'h4e227;
      expv[45] = 19'h4e227;
      expv[46] = 19'h2e227;
      expv[47] = 19'h5ae48;
      expv[48] = 19'h5a01f;
      expv[49] = 19'h6a01f;
      expv[50] = 19'h6a01f;
      expv[51] = 19'h55163;
      expv[52] = 19'h45163;
      expv[53] = 19'h25163;
      expv[54] = 19'h531af;
      expv[55] = 19'h631af;
      expv[56] = 19'h431af;
      expv[57] = 19'h231af;
      expv[58] = 19'h55aef;
      expv[59] = 19'h25aef;
      expv[60] = 19'h25aef;
      expv[61] = 19'h25aef;
      expv[62] = 19'h51dba;
      expv[63] = 19'h5eed3;
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
