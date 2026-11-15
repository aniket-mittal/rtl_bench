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

  SDP_C_mgc_in_wire_v1 dut (
    .z(in_vec[7:0]),
    .d(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'h25;
    stim[1] = 8'hdd;
    stim[2] = 8'ha6;
    stim[3] = 8'h00;
    stim[4] = 8'h93;
    stim[5] = 8'hc8;
    stim[6] = 8'ha2;
    stim[7] = 8'he0;
    stim[8] = 8'h98;
    stim[9] = 8'h26;
    stim[10] = 8'h73;
    stim[11] = 8'h7c;
    stim[12] = 8'h4f;
    stim[13] = 8'h31;
    stim[14] = 8'hdb;
    stim[15] = 8'h1e;
    stim[16] = 8'h7c;
    stim[17] = 8'h1f;
    stim[18] = 8'h2d;
    stim[19] = 8'h17;
    stim[20] = 8'h2e;
    stim[21] = 8'h8c;
    stim[22] = 8'hb0;
    stim[23] = 8'he7;
    stim[24] = 8'h98;
    stim[25] = 8'hbc;
    stim[26] = 8'h4e;
    stim[27] = 8'he2;
    stim[28] = 8'h9d;
    stim[29] = 8'hf9;
    stim[30] = 8'h23;
    stim[31] = 8'hca;
    stim[32] = 8'h84;
    stim[33] = 8'he6;
    stim[34] = 8'haf;
    stim[35] = 8'h37;
    stim[36] = 8'h81;
    stim[37] = 8'h5b;
    stim[38] = 8'h06;
    stim[39] = 8'h1b;
    stim[40] = 8'hd4;
    stim[41] = 8'h7f;
    stim[42] = 8'h84;
    stim[43] = 8'ha3;
    stim[44] = 8'he3;
    stim[45] = 8'h74;
    stim[46] = 8'h98;
    stim[47] = 8'h25;
    stim[48] = 8'ha2;
    stim[49] = 8'h98;
    stim[50] = 8'h94;
    stim[51] = 8'hc7;
    stim[52] = 8'h3c;
    stim[53] = 8'hb2;
    stim[54] = 8'hd8;
    stim[55] = 8'h05;
    stim[56] = 8'hdb;
    stim[57] = 8'hc1;
    stim[58] = 8'hd4;
    stim[59] = 8'hc7;
    stim[60] = 8'h50;
    stim[61] = 8'h4c;
    stim[62] = 8'h69;
    stim[63] = 8'h86;
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
      expv[0] = 8'h25;
      expv[1] = 8'hdd;
      expv[2] = 8'ha6;
      expv[3] = 8'h00;
      expv[4] = 8'h93;
      expv[5] = 8'hc8;
      expv[6] = 8'ha2;
      expv[7] = 8'he0;
      expv[8] = 8'h98;
      expv[9] = 8'h26;
      expv[10] = 8'h73;
      expv[11] = 8'h7c;
      expv[12] = 8'h4f;
      expv[13] = 8'h31;
      expv[14] = 8'hdb;
      expv[15] = 8'h1e;
      expv[16] = 8'h7c;
      expv[17] = 8'h1f;
      expv[18] = 8'h2d;
      expv[19] = 8'h17;
      expv[20] = 8'h2e;
      expv[21] = 8'h8c;
      expv[22] = 8'hb0;
      expv[23] = 8'he7;
      expv[24] = 8'h98;
      expv[25] = 8'hbc;
      expv[26] = 8'h4e;
      expv[27] = 8'he2;
      expv[28] = 8'h9d;
      expv[29] = 8'hf9;
      expv[30] = 8'h23;
      expv[31] = 8'hca;
      expv[32] = 8'h84;
      expv[33] = 8'he6;
      expv[34] = 8'haf;
      expv[35] = 8'h37;
      expv[36] = 8'h81;
      expv[37] = 8'h5b;
      expv[38] = 8'h06;
      expv[39] = 8'h1b;
      expv[40] = 8'hd4;
      expv[41] = 8'h7f;
      expv[42] = 8'h84;
      expv[43] = 8'ha3;
      expv[44] = 8'he3;
      expv[45] = 8'h74;
      expv[46] = 8'h98;
      expv[47] = 8'h25;
      expv[48] = 8'ha2;
      expv[49] = 8'h98;
      expv[50] = 8'h94;
      expv[51] = 8'hc7;
      expv[52] = 8'h3c;
      expv[53] = 8'hb2;
      expv[54] = 8'hd8;
      expv[55] = 8'h05;
      expv[56] = 8'hdb;
      expv[57] = 8'hc1;
      expv[58] = 8'hd4;
      expv[59] = 8'hc7;
      expv[60] = 8'h50;
      expv[61] = 8'h4c;
      expv[62] = 8'h69;
      expv[63] = 8'h86;
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
