// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 20;
  localparam OW = 4;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  dut dut (
    .a(in_vec[19:16]),
    .b(in_vec[15:12]),
    .c(in_vec[11:8]),
    .d(in_vec[7:4]),
    .e(in_vec[3:0]),
    .q(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 20'h50457;
    stim[1] = 20'h71eb9;
    stim[2] = 20'h04a92;
    stim[3] = 20'h438a0;
    stim[4] = 20'h0f107;
    stim[5] = 20'h51470;
    stim[6] = 20'h830ea;
    stim[7] = 20'hc46b8;
    stim[8] = 20'hba362;
    stim[9] = 20'hceaea;
    stim[10] = 20'h2f79b;
    stim[11] = 20'h20532;
    stim[12] = 20'h98ff6;
    stim[13] = 20'h3eb54;
    stim[14] = 20'ha08e9;
    stim[15] = 20'hb2cff;
    stim[16] = 20'h83dcf;
    stim[17] = 20'h0f846;
    stim[18] = 20'hf2659;
    stim[19] = 20'h28595;
    stim[20] = 20'h3b02a;
    stim[21] = 20'hea112;
    stim[22] = 20'he7f99;
    stim[23] = 20'h2feac;
    stim[24] = 20'h8a325;
    stim[25] = 20'h36d96;
    stim[26] = 20'h770ff;
    stim[27] = 20'h1fae4;
    stim[28] = 20'hbb129;
    stim[29] = 20'hbf9d3;
    stim[30] = 20'h61e92;
    stim[31] = 20'h31e25;
    stim[32] = 20'h95583;
    stim[33] = 20'hf5601;
    stim[34] = 20'h6aa8a;
    stim[35] = 20'h6b2a3;
    stim[36] = 20'h537e4;
    stim[37] = 20'ha71a1;
    stim[38] = 20'he1b4f;
    stim[39] = 20'h88058;
    stim[40] = 20'h7fe3d;
    stim[41] = 20'h8f151;
    stim[42] = 20'hdf409;
    stim[43] = 20'he8444;
    stim[44] = 20'h072b1;
    stim[45] = 20'h3bda8;
    stim[46] = 20'hbf926;
    stim[47] = 20'h1c0f6;
    stim[48] = 20'h63c47;
    stim[49] = 20'he91bc;
    stim[50] = 20'h2b9d1;
    stim[51] = 20'hccb6e;
    stim[52] = 20'h565c2;
    stim[53] = 20'hfbdbf;
    stim[54] = 20'ha9f77;
    stim[55] = 20'hbc122;
    stim[56] = 20'h1a132;
    stim[57] = 20'h69df6;
    stim[58] = 20'h3cb90;
    stim[59] = 20'hdd3d6;
    stim[60] = 20'h6eca0;
    stim[61] = 20'h5e9d5;
    stim[62] = 20'hfb627;
    stim[63] = 20'h0e72c;
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
      expv[0] = 4'hf;
      expv[1] = 4'hf;
      expv[2] = 4'hf;
      expv[3] = 4'hf;
      expv[4] = 4'hf;
      expv[5] = 4'hf;
      expv[6] = 4'hf;
      expv[7] = 4'hf;
      expv[8] = 4'hf;
      expv[9] = 4'hf;
      expv[10] = 4'hf;
      expv[11] = 4'h3;
      expv[12] = 4'hf;
      expv[13] = 4'hf;
      expv[14] = 4'hf;
      expv[15] = 4'hf;
      expv[16] = 4'hf;
      expv[17] = 4'hf;
      expv[18] = 4'hf;
      expv[19] = 4'hf;
      expv[20] = 4'h3;
      expv[21] = 4'h2;
      expv[22] = 4'hf;
      expv[23] = 4'hf;
      expv[24] = 4'h8;
      expv[25] = 4'hf;
      expv[26] = 4'hf;
      expv[27] = 4'hf;
      expv[28] = 4'hb;
      expv[29] = 4'hf;
      expv[30] = 4'hf;
      expv[31] = 4'h3;
      expv[32] = 4'hf;
      expv[33] = 4'h5;
      expv[34] = 4'hf;
      expv[35] = 4'hf;
      expv[36] = 4'hf;
      expv[37] = 4'hf;
      expv[38] = 4'hf;
      expv[39] = 4'hf;
      expv[40] = 4'h3;
      expv[41] = 4'hf;
      expv[42] = 4'hf;
      expv[43] = 4'hf;
      expv[44] = 4'hf;
      expv[45] = 4'hf;
      expv[46] = 4'hb;
      expv[47] = 4'hf;
      expv[48] = 4'hf;
      expv[49] = 4'hf;
      expv[50] = 4'hf;
      expv[51] = 4'hf;
      expv[52] = 4'hf;
      expv[53] = 4'hf;
      expv[54] = 4'hf;
      expv[55] = 4'hb;
      expv[56] = 4'h3;
      expv[57] = 4'hf;
      expv[58] = 4'hf;
      expv[59] = 4'hf;
      expv[60] = 4'hf;
      expv[61] = 4'hf;
      expv[62] = 4'hf;
      expv[63] = 4'h0;
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
