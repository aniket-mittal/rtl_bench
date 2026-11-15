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

  autovcoder_086920 dut (
    .CLK(clk),
    .MR(in_vec[7:7]),
    .NoLoad(in_vec[6:6]),
    .EN(in_vec[5:5]),
    .Dn(in_vec[4:4]),
    .D(in_vec[3:0]),
    .Q(out_vec[4:1]),
    .CO(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'hb9;
    stim[1] = 8'hf1;
    stim[2] = 8'h69;
    stim[3] = 8'h34;
    stim[4] = 8'h0c;
    stim[5] = 8'h76;
    stim[6] = 8'h35;
    stim[7] = 8'h52;
    stim[8] = 8'h00;
    stim[9] = 8'h04;
    stim[10] = 8'h39;
    stim[11] = 8'h74;
    stim[12] = 8'h2d;
    stim[13] = 8'h10;
    stim[14] = 8'h04;
    stim[15] = 8'h1b;
    stim[16] = 8'h36;
    stim[17] = 8'h26;
    stim[18] = 8'h4d;
    stim[19] = 8'h3f;
    stim[20] = 8'h30;
    stim[21] = 8'h7e;
    stim[22] = 8'h7d;
    stim[23] = 8'h7c;
    stim[24] = 8'h71;
    stim[25] = 8'h6d;
    stim[26] = 8'h15;
    stim[27] = 8'h28;
    stim[28] = 8'h53;
    stim[29] = 8'h16;
    stim[30] = 8'h51;
    stim[31] = 8'h6f;
    stim[32] = 8'h2d;
    stim[33] = 8'h51;
    stim[34] = 8'h5c;
    stim[35] = 8'h3e;
    stim[36] = 8'h2d;
    stim[37] = 8'h1a;
    stim[38] = 8'h56;
    stim[39] = 8'h46;
    stim[40] = 8'h37;
    stim[41] = 8'h2b;
    stim[42] = 8'h7a;
    stim[43] = 8'h7f;
    stim[44] = 8'h34;
    stim[45] = 8'h1f;
    stim[46] = 8'hfc;
    stim[47] = 8'hf0;
    stim[48] = 8'h0c;
    stim[49] = 8'h7e;
    stim[50] = 8'h38;
    stim[51] = 8'h3d;
    stim[52] = 8'h35;
    stim[53] = 8'h54;
    stim[54] = 8'h4a;
    stim[55] = 8'h54;
    stim[56] = 8'h46;
    stim[57] = 8'h6c;
    stim[58] = 8'h6e;
    stim[59] = 8'h3e;
    stim[60] = 8'h78;
    stim[61] = 8'h66;
    stim[62] = 8'h11;
    stim[63] = 8'h4f;
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
      expv[0] = 5'h00;
      expv[1] = 5'h00;
      expv[2] = 5'h00;
      expv[3] = 5'h02;
      expv[4] = 5'h08;
      expv[5] = 5'h18;
      expv[6] = 5'h16;
      expv[7] = 5'h0a;
      expv[8] = 5'h0a;
      expv[9] = 5'h00;
      expv[10] = 5'h08;
      expv[11] = 5'h12;
      expv[12] = 5'h10;
      expv[13] = 5'h1a;
      expv[14] = 5'h00;
      expv[15] = 5'h08;
      expv[16] = 5'h16;
      expv[17] = 5'h0c;
      expv[18] = 5'h0c;
      expv[19] = 5'h0c;
      expv[20] = 5'h1e;
      expv[21] = 5'h00;
      expv[22] = 5'h1e;
      expv[23] = 5'h1c;
      expv[24] = 5'h1a;
      expv[25] = 5'h18;
      expv[26] = 5'h1a;
      expv[27] = 5'h0a;
      expv[28] = 5'h10;
      expv[29] = 5'h10;
      expv[30] = 5'h0c;
      expv[31] = 5'h0c;
      expv[32] = 5'h0e;
      expv[33] = 5'h1a;
      expv[34] = 5'h1a;
      expv[35] = 5'h1a;
      expv[36] = 5'h1c;
      expv[37] = 5'h1a;
      expv[38] = 5'h14;
      expv[39] = 5'h14;
      expv[40] = 5'h14;
      expv[41] = 5'h0e;
      expv[42] = 5'h16;
      expv[43] = 5'h14;
      expv[44] = 5'h12;
      expv[45] = 5'h08;
      expv[46] = 5'h00;
      expv[47] = 5'h00;
      expv[48] = 5'h00;
      expv[49] = 5'h18;
      expv[50] = 5'h16;
      expv[51] = 5'h10;
      expv[52] = 5'h1a;
      expv[53] = 5'h0a;
      expv[54] = 5'h0a;
      expv[55] = 5'h0a;
      expv[56] = 5'h0a;
      expv[57] = 5'h0a;
      expv[58] = 5'h0c;
      expv[59] = 5'h0e;
      expv[60] = 5'h1c;
      expv[61] = 5'h1a;
      expv[62] = 5'h1c;
      expv[63] = 5'h02;
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
