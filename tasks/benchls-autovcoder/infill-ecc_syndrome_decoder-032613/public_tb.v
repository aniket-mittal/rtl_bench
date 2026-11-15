// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 8;
  localparam OW = 65;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_032613 dut (
    .s(in_vec[7:0]),
    .e(out_vec[64:1]),
    .fatal(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'hf5;
    stim[1] = 8'hfc;
    stim[2] = 8'h61;
    stim[3] = 8'h8f;
    stim[4] = 8'h74;
    stim[5] = 8'hbf;
    stim[6] = 8'h0c;
    stim[7] = 8'h3c;
    stim[8] = 8'h6f;
    stim[9] = 8'h49;
    stim[10] = 8'hfe;
    stim[11] = 8'h08;
    stim[12] = 8'h6f;
    stim[13] = 8'hc8;
    stim[14] = 8'hd2;
    stim[15] = 8'hca;
    stim[16] = 8'hf4;
    stim[17] = 8'hf5;
    stim[18] = 8'hd8;
    stim[19] = 8'h74;
    stim[20] = 8'h9f;
    stim[21] = 8'ha6;
    stim[22] = 8'h4c;
    stim[23] = 8'h10;
    stim[24] = 8'h8b;
    stim[25] = 8'h18;
    stim[26] = 8'hae;
    stim[27] = 8'h15;
    stim[28] = 8'hf9;
    stim[29] = 8'hff;
    stim[30] = 8'hb7;
    stim[31] = 8'hdc;
    stim[32] = 8'ha3;
    stim[33] = 8'h37;
    stim[34] = 8'h32;
    stim[35] = 8'h43;
    stim[36] = 8'h4a;
    stim[37] = 8'h52;
    stim[38] = 8'h9a;
    stim[39] = 8'h77;
    stim[40] = 8'ha6;
    stim[41] = 8'hbf;
    stim[42] = 8'h95;
    stim[43] = 8'h54;
    stim[44] = 8'h45;
    stim[45] = 8'h37;
    stim[46] = 8'h50;
    stim[47] = 8'ha7;
    stim[48] = 8'h8f;
    stim[49] = 8'he5;
    stim[50] = 8'h10;
    stim[51] = 8'h0e;
    stim[52] = 8'h2c;
    stim[53] = 8'hd6;
    stim[54] = 8'h3f;
    stim[55] = 8'hc6;
    stim[56] = 8'h5d;
    stim[57] = 8'hc1;
    stim[58] = 8'h73;
    stim[59] = 8'hd6;
    stim[60] = 8'h75;
    stim[61] = 8'hd8;
    stim[62] = 8'h56;
    stim[63] = 8'h61;
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
      expv[0] = 65'h00000000000000000;
      expv[1] = 65'h00000000000000000;
      expv[2] = 65'h00000000000000001;
      expv[3] = 65'h00000000000000800;
      expv[4] = 65'h00000000000000001;
      expv[5] = 65'h00200000000000000;
      expv[6] = 65'h00000000000000001;
      expv[7] = 65'h00000000000000001;
      expv[8] = 65'h00000000000000001;
      expv[9] = 65'h00000000000000001;
      expv[10] = 65'h00000000000000000;
      expv[11] = 65'h00000000000000001;
      expv[12] = 65'h00000000000000001;
      expv[13] = 65'h00000000000000000;
      expv[14] = 65'h00000000000000000;
      expv[15] = 65'h00000000000000000;
      expv[16] = 65'h00000000000000000;
      expv[17] = 65'h00000000000000000;
      expv[18] = 65'h00000000000000000;
      expv[19] = 65'h00000000000000001;
      expv[20] = 65'h00000000004000000;
      expv[21] = 65'h00000000100000000;
      expv[22] = 65'h00000000000000001;
      expv[23] = 65'h00000000000000001;
      expv[24] = 65'h00000000000000080;
      expv[25] = 65'h00000000000000001;
      expv[26] = 65'h00000010000000000;
      expv[27] = 65'h00000000000000001;
      expv[28] = 65'h00000000000000000;
      expv[29] = 65'h00000000000000000;
      expv[30] = 65'h00002000000000000;
      expv[31] = 65'h00000000000000000;
      expv[32] = 65'h00000000020000000;
      expv[33] = 65'h00000000000000001;
      expv[34] = 65'h00000000000000001;
      expv[35] = 65'h00000000000000001;
      expv[36] = 65'h00000000000000001;
      expv[37] = 65'h00000000000000001;
      expv[38] = 65'h00000000000200000;
      expv[39] = 65'h00000000000000001;
      expv[40] = 65'h00000000100000000;
      expv[41] = 65'h00200000000000000;
      expv[42] = 65'h00000000000010000;
      expv[43] = 65'h00000000000000001;
      expv[44] = 65'h00000000000000001;
      expv[45] = 65'h00000000000000001;
      expv[46] = 65'h00000000000000001;
      expv[47] = 65'h00000000200000000;
      expv[48] = 65'h00000000000000800;
      expv[49] = 65'h00000000000000000;
      expv[50] = 65'h00000000000000001;
      expv[51] = 65'h00000000000000001;
      expv[52] = 65'h00000000000000001;
      expv[53] = 65'h00000000000000000;
      expv[54] = 65'h00000000000000001;
      expv[55] = 65'h08000000000000000;
      expv[56] = 65'h00000000000000001;
      expv[57] = 65'h00400000000000000;
      expv[58] = 65'h00000000000000001;
      expv[59] = 65'h00000000000000000;
      expv[60] = 65'h00000000000000001;
      expv[61] = 65'h00000000000000000;
      expv[62] = 65'h00000000000000001;
      expv[63] = 65'h00000000000000001;
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
