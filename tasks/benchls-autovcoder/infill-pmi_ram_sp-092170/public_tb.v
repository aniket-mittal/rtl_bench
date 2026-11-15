// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 16;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_092170 dut (
    .Clock(clk),
    .Address(in_vec[15:11]),
    .Data(in_vec[10:3]),
    .WE(in_vec[2:2]),
    .ClockEn(in_vec[1:1]),
    .Reset(in_vec[0:0]),
    .Q(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 16'haca5;
    stim[1] = 16'h3a29;
    stim[2] = 16'hca64;
    stim[3] = 16'h570c;
    stim[4] = 16'h4aca;
    stim[5] = 16'hd39c;
    stim[6] = 16'hd742;
    stim[7] = 16'h3fae;
    stim[8] = 16'hfa5a;
    stim[9] = 16'haca2;
    stim[10] = 16'h009e;
    stim[11] = 16'h0b34;
    stim[12] = 16'h18d4;
    stim[13] = 16'ha81a;
    stim[14] = 16'hcfb6;
    stim[15] = 16'h7dfe;
    stim[16] = 16'h61b6;
    stim[17] = 16'hf43e;
    stim[18] = 16'hdbac;
    stim[19] = 16'h4af2;
    stim[20] = 16'h3cae;
    stim[21] = 16'h3910;
    stim[22] = 16'h8164;
    stim[23] = 16'he701;
    stim[24] = 16'h14f0;
    stim[25] = 16'h0e25;
    stim[26] = 16'h6e9c;
    stim[27] = 16'hecea;
    stim[28] = 16'hda70;
    stim[29] = 16'h530e;
    stim[30] = 16'h2f30;
    stim[31] = 16'h7f4a;
    stim[32] = 16'hee12;
    stim[33] = 16'hf350;
    stim[34] = 16'h9f52;
    stim[35] = 16'ha17c;
    stim[36] = 16'h12e8;
    stim[37] = 16'h81ac;
    stim[38] = 16'ha206;
    stim[39] = 16'ha6ac;
    stim[40] = 16'h28e6;
    stim[41] = 16'haccc;
    stim[42] = 16'hf0d6;
    stim[43] = 16'h7588;
    stim[44] = 16'hd63a;
    stim[45] = 16'h8ca8;
    stim[46] = 16'h824a;
    stim[47] = 16'h5b20;
    stim[48] = 16'h7d96;
    stim[49] = 16'hca58;
    stim[50] = 16'h96e4;
    stim[51] = 16'h3a48;
    stim[52] = 16'h5e90;
    stim[53] = 16'h366e;
    stim[54] = 16'h2bce;
    stim[55] = 16'h24a3;
    stim[56] = 16'h2372;
    stim[57] = 16'h8206;
    stim[58] = 16'h9a10;
    stim[59] = 16'h14de;
    stim[60] = 16'h6dd2;
    stim[61] = 16'h99e0;
    stim[62] = 16'hbf46;
    stim[63] = 16'h6b82;
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
      expv[0] = 8'h00;
      expv[1] = 8'h00;
      expv[2] = 8'h00;
      expv[3] = 8'h00;
      expv[4] = 8'h00;
      expv[5] = 8'hxx;
      expv[6] = 8'hxx;
      expv[7] = 8'hxx;
      expv[8] = 8'hxx;
      expv[9] = 8'hxx;
      expv[10] = 8'hxx;
      expv[11] = 8'hxx;
      expv[12] = 8'hxx;
      expv[13] = 8'hxx;
      expv[14] = 8'hxx;
      expv[15] = 8'hxx;
      expv[16] = 8'hxx;
      expv[17] = 8'hxx;
      expv[18] = 8'hxx;
      expv[19] = 8'hxx;
      expv[20] = 8'hxx;
      expv[21] = 8'hf5;
      expv[22] = 8'hf5;
      expv[23] = 8'h00;
      expv[24] = 8'h00;
      expv[25] = 8'h00;
      expv[26] = 8'h00;
      expv[27] = 8'h00;
      expv[28] = 8'hxx;
      expv[29] = 8'hxx;
      expv[30] = 8'hxx;
      expv[31] = 8'hxx;
      expv[32] = 8'hbf;
      expv[33] = 8'hxx;
      expv[34] = 8'hxx;
      expv[35] = 8'hxx;
      expv[36] = 8'hxx;
      expv[37] = 8'hxx;
      expv[38] = 8'hxx;
      expv[39] = 8'hxx;
      expv[40] = 8'hxx;
      expv[41] = 8'hxx;
      expv[42] = 8'hxx;
      expv[43] = 8'h87;
      expv[44] = 8'h87;
      expv[45] = 8'hxx;
      expv[46] = 8'hxx;
      expv[47] = 8'hxx;
      expv[48] = 8'hxx;
      expv[49] = 8'hbf;
      expv[50] = 8'hbf;
      expv[51] = 8'hbf;
      expv[52] = 8'hbf;
      expv[53] = 8'hbf;
      expv[54] = 8'hxx;
      expv[55] = 8'h00;
      expv[56] = 8'h00;
      expv[57] = 8'hxx;
      expv[58] = 8'hxx;
      expv[59] = 8'hxx;
      expv[60] = 8'hxx;
      expv[61] = 8'hxx;
      expv[62] = 8'hxx;
      expv[63] = 8'hxx;
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
