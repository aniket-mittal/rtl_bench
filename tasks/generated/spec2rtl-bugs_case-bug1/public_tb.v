// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 8;
  localparam OW = 5;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  dut dut (
    .code(in_vec[7:0]),
    .out(out_vec[4:1]),
    .valid(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'h0e;
    stim[1] = 8'h0b;
    stim[2] = 8'h7c;
    stim[3] = 8'h43;
    stim[4] = 8'h28;
    stim[5] = 8'h5a;
    stim[6] = 8'hc7;
    stim[7] = 8'h96;
    stim[8] = 8'ha7;
    stim[9] = 8'h09;
    stim[10] = 8'hdf;
    stim[11] = 8'h62;
    stim[12] = 8'h53;
    stim[13] = 8'h29;
    stim[14] = 8'he5;
    stim[15] = 8'h12;
    stim[16] = 8'h5c;
    stim[17] = 8'h7d;
    stim[18] = 8'h16;
    stim[19] = 8'hbc;
    stim[20] = 8'hcd;
    stim[21] = 8'hf6;
    stim[22] = 8'h20;
    stim[23] = 8'h81;
    stim[24] = 8'h68;
    stim[25] = 8'he9;
    stim[26] = 8'h17;
    stim[27] = 8'hce;
    stim[28] = 8'h98;
    stim[29] = 8'h4c;
    stim[30] = 8'hc4;
    stim[31] = 8'h09;
    stim[32] = 8'h52;
    stim[33] = 8'h87;
    stim[34] = 8'h6b;
    stim[35] = 8'h8a;
    stim[36] = 8'h24;
    stim[37] = 8'ha7;
    stim[38] = 8'hbf;
    stim[39] = 8'h3f;
    stim[40] = 8'h6a;
    stim[41] = 8'h76;
    stim[42] = 8'haf;
    stim[43] = 8'h69;
    stim[44] = 8'hd3;
    stim[45] = 8'hea;
    stim[46] = 8'h54;
    stim[47] = 8'hf1;
    stim[48] = 8'h71;
    stim[49] = 8'h55;
    stim[50] = 8'h2f;
    stim[51] = 8'h28;
    stim[52] = 8'h29;
    stim[53] = 8'h57;
    stim[54] = 8'haf;
    stim[55] = 8'haf;
    stim[56] = 8'h25;
    stim[57] = 8'hf5;
    stim[58] = 8'ha4;
    stim[59] = 8'h4a;
    stim[60] = 8'h5a;
    stim[61] = 8'hdc;
    stim[62] = 8'h99;
    stim[63] = 8'h5c;
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
      expv[0] = 5'h00;
      expv[1] = 5'h00;
      expv[2] = 5'h00;
      expv[3] = 5'h00;
      expv[4] = 5'h00;
      expv[5] = 5'h00;
      expv[6] = 5'h00;
      expv[7] = 5'h00;
      expv[8] = 5'h00;
      expv[9] = 5'h00;
      expv[10] = 5'h00;
      expv[11] = 5'h00;
      expv[12] = 5'h00;
      expv[13] = 5'h00;
      expv[14] = 5'h00;
      expv[15] = 5'h00;
      expv[16] = 5'h00;
      expv[17] = 5'h00;
      expv[18] = 5'h03;
      expv[19] = 5'h00;
      expv[20] = 5'h00;
      expv[21] = 5'h00;
      expv[22] = 5'h00;
      expv[23] = 5'h00;
      expv[24] = 5'h00;
      expv[25] = 5'h00;
      expv[26] = 5'h00;
      expv[27] = 5'h00;
      expv[28] = 5'h00;
      expv[29] = 5'h00;
      expv[30] = 5'h00;
      expv[31] = 5'h00;
      expv[32] = 5'h00;
      expv[33] = 5'h00;
      expv[34] = 5'h00;
      expv[35] = 5'h00;
      expv[36] = 5'h00;
      expv[37] = 5'h00;
      expv[38] = 5'h00;
      expv[39] = 5'h00;
      expv[40] = 5'h00;
      expv[41] = 5'h00;
      expv[42] = 5'h00;
      expv[43] = 5'h00;
      expv[44] = 5'h00;
      expv[45] = 5'h00;
      expv[46] = 5'h00;
      expv[47] = 5'h00;
      expv[48] = 5'h00;
      expv[49] = 5'h00;
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
