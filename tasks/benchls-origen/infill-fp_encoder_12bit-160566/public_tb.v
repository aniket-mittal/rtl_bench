// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_160566 dut (
    .D(in_vec[11:0]),
    .S(out_vec[7:7]),
    .E(out_vec[6:4]),
    .F(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'h1f2;
    stim[1] = 12'h461;
    stim[2] = 12'ha27;
    stim[3] = 12'hb42;
    stim[4] = 12'h933;
    stim[5] = 12'hcf6;
    stim[6] = 12'h492;
    stim[7] = 12'h038;
    stim[8] = 12'hbca;
    stim[9] = 12'h5a8;
    stim[10] = 12'h316;
    stim[11] = 12'h3fe;
    stim[12] = 12'h01f;
    stim[13] = 12'hf25;
    stim[14] = 12'hbaf;
    stim[15] = 12'h26a;
    stim[16] = 12'h4df;
    stim[17] = 12'h202;
    stim[18] = 12'h59a;
    stim[19] = 12'h9a8;
    stim[20] = 12'heaa;
    stim[21] = 12'h391;
    stim[22] = 12'h4e9;
    stim[23] = 12'h567;
    stim[24] = 12'h98f;
    stim[25] = 12'hcc5;
    stim[26] = 12'ha83;
    stim[27] = 12'h671;
    stim[28] = 12'ha0d;
    stim[29] = 12'h54b;
    stim[30] = 12'h65e;
    stim[31] = 12'he26;
    stim[32] = 12'h7af;
    stim[33] = 12'hdcc;
    stim[34] = 12'ha25;
    stim[35] = 12'h6d4;
    stim[36] = 12'h172;
    stim[37] = 12'h53a;
    stim[38] = 12'hec6;
    stim[39] = 12'hb3a;
    stim[40] = 12'heb2;
    stim[41] = 12'h334;
    stim[42] = 12'h680;
    stim[43] = 12'h17f;
    stim[44] = 12'hfa4;
    stim[45] = 12'h6b5;
    stim[46] = 12'h636;
    stim[47] = 12'h9b8;
    stim[48] = 12'h6bb;
    stim[49] = 12'hace;
    stim[50] = 12'h069;
    stim[51] = 12'h9f0;
    stim[52] = 12'h31f;
    stim[53] = 12'hf92;
    stim[54] = 12'h038;
    stim[55] = 12'he77;
    stim[56] = 12'h5ce;
    stim[57] = 12'hc55;
    stim[58] = 12'h9d7;
    stim[59] = 12'he3e;
    stim[60] = 12'h672;
    stim[61] = 12'h27c;
    stim[62] = 12'h344;
    stim[63] = 12'hb5e;
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
      expv[0] = 8'h01;
      expv[1] = 8'h00;
      expv[2] = 8'h80;
      expv[3] = 8'h81;
      expv[4] = 8'h80;
      expv[5] = 8'h81;
      expv[6] = 8'h01;
      expv[7] = 8'h00;
      expv[8] = 8'h81;
      expv[9] = 8'h00;
      expv[10] = 8'h01;
      expv[11] = 8'h01;
      expv[12] = 8'h01;
      expv[13] = 8'h81;
      expv[14] = 8'h80;
      expv[15] = 8'h01;
      expv[16] = 8'h01;
      expv[17] = 8'h50;
      expv[18] = 8'h01;
      expv[19] = 8'h80;
      expv[20] = 8'h81;
      expv[21] = 8'h00;
      expv[22] = 8'h00;
      expv[23] = 8'h01;
      expv[24] = 8'h80;
      expv[25] = 8'h81;
      expv[26] = 8'h80;
      expv[27] = 8'h00;
      expv[28] = 8'h81;
      expv[29] = 8'h01;
      expv[30] = 8'h01;
      expv[31] = 8'h81;
      expv[32] = 8'h01;
      expv[33] = 8'h80;
      expv[34] = 8'h81;
      expv[35] = 8'h00;
      expv[36] = 8'h01;
      expv[37] = 8'h01;
      expv[38] = 8'h81;
      expv[39] = 8'h81;
      expv[40] = 8'h81;
      expv[41] = 8'h00;
      expv[42] = 8'h00;
      expv[43] = 8'h01;
      expv[44] = 8'h80;
      expv[45] = 8'h00;
      expv[46] = 8'h01;
      expv[47] = 8'h80;
      expv[48] = 8'h01;
      expv[49] = 8'h81;
      expv[50] = 8'h00;
      expv[51] = 8'h80;
      expv[52] = 8'h01;
      expv[53] = 8'h81;
      expv[54] = 8'h00;
      expv[55] = 8'h80;
      expv[56] = 8'h01;
      expv[57] = 8'h81;
      expv[58] = 8'h80;
      expv[59] = 8'h81;
      expv[60] = 8'h01;
      expv[61] = 8'h00;
      expv[62] = 8'h00;
      expv[63] = 8'h81;
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
