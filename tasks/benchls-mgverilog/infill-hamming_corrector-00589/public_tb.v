// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 7;
  localparam OW = 4;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_00589 dut (
    .H(in_vec[6:0]),
    .D(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 7'h23;
    stim[1] = 7'h65;
    stim[2] = 7'h61;
    stim[3] = 7'h0b;
    stim[4] = 7'h70;
    stim[5] = 7'h0e;
    stim[6] = 7'h39;
    stim[7] = 7'h65;
    stim[8] = 7'h4a;
    stim[9] = 7'h3d;
    stim[10] = 7'h73;
    stim[11] = 7'h28;
    stim[12] = 7'h79;
    stim[13] = 7'h36;
    stim[14] = 7'h31;
    stim[15] = 7'h72;
    stim[16] = 7'h1d;
    stim[17] = 7'h58;
    stim[18] = 7'h17;
    stim[19] = 7'h65;
    stim[20] = 7'h0f;
    stim[21] = 7'h35;
    stim[22] = 7'h73;
    stim[23] = 7'h33;
    stim[24] = 7'h62;
    stim[25] = 7'h0d;
    stim[26] = 7'h41;
    stim[27] = 7'h7b;
    stim[28] = 7'h17;
    stim[29] = 7'h57;
    stim[30] = 7'h42;
    stim[31] = 7'h36;
    stim[32] = 7'h5c;
    stim[33] = 7'h22;
    stim[34] = 7'h43;
    stim[35] = 7'h74;
    stim[36] = 7'h1b;
    stim[37] = 7'h4b;
    stim[38] = 7'h2d;
    stim[39] = 7'h00;
    stim[40] = 7'h21;
    stim[41] = 7'h55;
    stim[42] = 7'h1e;
    stim[43] = 7'h7e;
    stim[44] = 7'h7f;
    stim[45] = 7'h3d;
    stim[46] = 7'h50;
    stim[47] = 7'h53;
    stim[48] = 7'h3c;
    stim[49] = 7'h6c;
    stim[50] = 7'h5e;
    stim[51] = 7'h2f;
    stim[52] = 7'h44;
    stim[53] = 7'h76;
    stim[54] = 7'h58;
    stim[55] = 7'h1e;
    stim[56] = 7'h01;
    stim[57] = 7'h2c;
    stim[58] = 7'h44;
    stim[59] = 7'h70;
    stim[60] = 7'h46;
    stim[61] = 7'h73;
    stim[62] = 7'h0f;
    stim[63] = 7'h77;
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
      expv[0] = 4'h6;
      expv[1] = 4'hc;
      expv[2] = 4'hc;
      expv[3] = 4'h1;
      expv[4] = 4'he;
      expv[5] = 4'h3;
      expv[6] = 4'h7;
      expv[7] = 4'hc;
      expv[8] = 4'hd;
      expv[9] = 4'h5;
      expv[10] = 4'h6;
      expv[11] = 4'h7;
      expv[12] = 4'hb;
      expv[13] = 4'h4;
      expv[14] = 4'h6;
      expv[15] = 4'ha;
      expv[16] = 4'h2;
      expv[17] = 4'hb;
      expv[18] = 4'h2;
      expv[19] = 4'hc;
      expv[20] = 4'h1;
      expv[21] = 4'h2;
      expv[22] = 4'h6;
      expv[23] = 4'h6;
      expv[24] = 4'hd;
      expv[25] = 4'h5;
      expv[26] = 4'hc;
      expv[27] = 4'hf;
      expv[28] = 4'h2;
      expv[29] = 4'h8;
      expv[30] = 4'ha;
      expv[31] = 4'h4;
      expv[32] = 4'h9;
      expv[33] = 4'h4;
      expv[34] = 4'h8;
      expv[35] = 4'he;
      expv[36] = 4'h1;
      expv[37] = 4'h1;
      expv[38] = 4'h5;
      expv[39] = 4'h0;
      expv[40] = 4'hc;
      expv[41] = 4'h2;
      expv[42] = 4'h3;
      expv[43] = 4'hf;
      expv[44] = 4'hf;
      expv[45] = 4'h5;
      expv[46] = 4'ha;
      expv[47] = 4'ha;
      expv[48] = 4'h7;
      expv[49] = 4'h9;
      expv[50] = 4'h3;
      expv[51] = 4'h5;
      expv[52] = 4'h9;
      expv[53] = 4'he;
      expv[54] = 4'hb;
      expv[55] = 4'h3;
      expv[56] = 4'h0;
      expv[57] = 4'h5;
      expv[58] = 4'h9;
      expv[59] = 4'he;
      expv[60] = 4'h8;
      expv[61] = 4'h6;
      expv[62] = 4'h1;
      expv[63] = 4'hf;
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
