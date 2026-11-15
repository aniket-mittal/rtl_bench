// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 5;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_01316 dut (
    .op(in_vec[11:6]),
    .func(in_vec[5:0]),
    .aluc(out_vec[4:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'h351;
    stim[1] = 12'hf6a;
    stim[2] = 12'h170;
    stim[3] = 12'hdb2;
    stim[4] = 12'he48;
    stim[5] = 12'h778;
    stim[6] = 12'h4d8;
    stim[7] = 12'h5e6;
    stim[8] = 12'h492;
    stim[9] = 12'hb6a;
    stim[10] = 12'h35b;
    stim[11] = 12'h940;
    stim[12] = 12'h6e7;
    stim[13] = 12'h9c7;
    stim[14] = 12'hc70;
    stim[15] = 12'h59a;
    stim[16] = 12'hcd2;
    stim[17] = 12'h857;
    stim[18] = 12'h0a8;
    stim[19] = 12'h342;
    stim[20] = 12'h4e2;
    stim[21] = 12'he90;
    stim[22] = 12'h68b;
    stim[23] = 12'hb76;
    stim[24] = 12'hfb3;
    stim[25] = 12'hed1;
    stim[26] = 12'h49d;
    stim[27] = 12'h713;
    stim[28] = 12'h277;
    stim[29] = 12'hda7;
    stim[30] = 12'h326;
    stim[31] = 12'h36f;
    stim[32] = 12'hb0b;
    stim[33] = 12'h83a;
    stim[34] = 12'hec7;
    stim[35] = 12'h641;
    stim[36] = 12'h978;
    stim[37] = 12'he10;
    stim[38] = 12'h340;
    stim[39] = 12'h29b;
    stim[40] = 12'h4c4;
    stim[41] = 12'h0f5;
    stim[42] = 12'h501;
    stim[43] = 12'h348;
    stim[44] = 12'h5ec;
    stim[45] = 12'h8c1;
    stim[46] = 12'h356;
    stim[47] = 12'h894;
    stim[48] = 12'h38a;
    stim[49] = 12'h36d;
    stim[50] = 12'h415;
    stim[51] = 12'h1a4;
    stim[52] = 12'h394;
    stim[53] = 12'hb77;
    stim[54] = 12'hbe6;
    stim[55] = 12'h39d;
    stim[56] = 12'h78d;
    stim[57] = 12'hab8;
    stim[58] = 12'h813;
    stim[59] = 12'hd60;
    stim[60] = 12'h623;
    stim[61] = 12'hd31;
    stim[62] = 12'he1d;
    stim[63] = 12'h04c;
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
      expv[0] = 5'h05;
      expv[1] = 5'h00;
      expv[2] = 5'h00;
      expv[3] = 5'h00;
      expv[4] = 5'h00;
      expv[5] = 5'h00;
      expv[6] = 5'h00;
      expv[7] = 5'h00;
      expv[8] = 5'h00;
      expv[9] = 5'h00;
      expv[10] = 5'h05;
      expv[11] = 5'h00;
      expv[12] = 5'h00;
      expv[13] = 5'h00;
      expv[14] = 5'h00;
      expv[15] = 5'h00;
      expv[16] = 5'h00;
      expv[17] = 5'h00;
      expv[18] = 5'h00;
      expv[19] = 5'h05;
      expv[20] = 5'h00;
      expv[21] = 5'h00;
      expv[22] = 5'h00;
      expv[23] = 5'h00;
      expv[24] = 5'h00;
      expv[25] = 5'h00;
      expv[26] = 5'h00;
      expv[27] = 5'h00;
      expv[28] = 5'h01;
      expv[29] = 5'h00;
      expv[30] = 5'h04;
      expv[31] = 5'h05;
      expv[32] = 5'h00;
      expv[33] = 5'h00;
      expv[34] = 5'h00;
      expv[35] = 5'h00;
      expv[36] = 5'h00;
      expv[37] = 5'h00;
      expv[38] = 5'h05;
      expv[39] = 5'h08;
      expv[40] = 5'h00;
      expv[41] = 5'h00;
      expv[42] = 5'h00;
      expv[43] = 5'h05;
      expv[44] = 5'h00;
      expv[45] = 5'h00;
      expv[46] = 5'h05;
      expv[47] = 5'h00;
      expv[48] = 5'h00;
      expv[49] = 5'h05;
      expv[50] = 5'h00;
      expv[51] = 5'h00;
      expv[52] = 5'h00;
      expv[53] = 5'h00;
      expv[54] = 5'h00;
      expv[55] = 5'h00;
      expv[56] = 5'h00;
      expv[57] = 5'h00;
      expv[58] = 5'h00;
      expv[59] = 5'h00;
      expv[60] = 5'h00;
      expv[61] = 5'h00;
      expv[62] = 5'h00;
      expv[63] = 5'h00;
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
