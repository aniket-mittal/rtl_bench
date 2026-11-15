// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 20;
  localparam OW = 5;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_08177 dut (
    .clk(clk),
    .rst(in_vec[19:19]),
    .estado(in_vec[18:11]),
    .en(in_vec[10:9]),
    .Cambio(in_vec[8:1]),
    .got_data(in_vec[0:0]),
    .Cuenta(out_vec[4:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 20'hbe1f3;
    stim[1] = 20'hb1dc9;
    stim[2] = 20'h4d7a5;
    stim[3] = 20'h3900e;
    stim[4] = 20'h3f186;
    stim[5] = 20'h2e553;
    stim[6] = 20'h731ef;
    stim[7] = 20'h72043;
    stim[8] = 20'h2acee;
    stim[9] = 20'h66124;
    stim[10] = 20'h405c6;
    stim[11] = 20'h454ca;
    stim[12] = 20'h4c3fa;
    stim[13] = 20'h5e9f5;
    stim[14] = 20'hde704;
    stim[15] = 20'h79f71;
    stim[16] = 20'h049e3;
    stim[17] = 20'h1b443;
    stim[18] = 20'h67769;
    stim[19] = 20'h5a43a;
    stim[20] = 20'h2a25e;
    stim[21] = 20'h758bc;
    stim[22] = 20'h7a263;
    stim[23] = 20'h09086;
    stim[24] = 20'h473e9;
    stim[25] = 20'h76f95;
    stim[26] = 20'h7e53c;
    stim[27] = 20'h70e7c;
    stim[28] = 20'h1762b;
    stim[29] = 20'h39657;
    stim[30] = 20'h36429;
    stim[31] = 20'h1ede2;
    stim[32] = 20'h07e9a;
    stim[33] = 20'h71339;
    stim[34] = 20'h6b821;
    stim[35] = 20'h0c770;
    stim[36] = 20'h46963;
    stim[37] = 20'h2006d;
    stim[38] = 20'h61cf8;
    stim[39] = 20'h79396;
    stim[40] = 20'h7e54c;
    stim[41] = 20'h5022c;
    stim[42] = 20'h6ea24;
    stim[43] = 20'h2e24e;
    stim[44] = 20'h39b23;
    stim[45] = 20'h71727;
    stim[46] = 20'h6faaf;
    stim[47] = 20'h5e32c;
    stim[48] = 20'h7a280;
    stim[49] = 20'h71ca2;
    stim[50] = 20'h7a076;
    stim[51] = 20'h74a2c;
    stim[52] = 20'h5bcb2;
    stim[53] = 20'h48b43;
    stim[54] = 20'h2058b;
    stim[55] = 20'h1f7ae;
    stim[56] = 20'h63d65;
    stim[57] = 20'h31e7b;
    stim[58] = 20'h6954e;
    stim[59] = 20'h7852c;
    stim[60] = 20'h757af;
    stim[61] = 20'h35aba;
    stim[62] = 20'h97c08;
    stim[63] = 20'h06442;
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
      expv[0] = 5'hxx;
      expv[1] = 5'h01;
      expv[2] = 5'h01;
      expv[3] = 5'h01;
      expv[4] = 5'h01;
      expv[5] = 5'h01;
      expv[6] = 5'h01;
      expv[7] = 5'h01;
      expv[8] = 5'h01;
      expv[9] = 5'h01;
      expv[10] = 5'h01;
      expv[11] = 5'h01;
      expv[12] = 5'h01;
      expv[13] = 5'h01;
      expv[14] = 5'h01;
      expv[15] = 5'h01;
      expv[16] = 5'h01;
      expv[17] = 5'h01;
      expv[18] = 5'h01;
      expv[19] = 5'h01;
      expv[20] = 5'h01;
      expv[21] = 5'h01;
      expv[22] = 5'h01;
      expv[23] = 5'h01;
      expv[24] = 5'h01;
      expv[25] = 5'h01;
      expv[26] = 5'h01;
      expv[27] = 5'h01;
      expv[28] = 5'h01;
      expv[29] = 5'h01;
      expv[30] = 5'h01;
      expv[31] = 5'h01;
      expv[32] = 5'h01;
      expv[33] = 5'h01;
      expv[34] = 5'h01;
      expv[35] = 5'h01;
      expv[36] = 5'h01;
      expv[37] = 5'h01;
      expv[38] = 5'h01;
      expv[39] = 5'h01;
      expv[40] = 5'h01;
      expv[41] = 5'h01;
      expv[42] = 5'h01;
      expv[43] = 5'h01;
      expv[44] = 5'h01;
      expv[45] = 5'h01;
      expv[46] = 5'h01;
      expv[47] = 5'h01;
      expv[48] = 5'h01;
      expv[49] = 5'h01;
      expv[50] = 5'h01;
      expv[51] = 5'h01;
      expv[52] = 5'h01;
      expv[53] = 5'h01;
      expv[54] = 5'h01;
      expv[55] = 5'h01;
      expv[56] = 5'h01;
      expv[57] = 5'h01;
      expv[58] = 5'h01;
      expv[59] = 5'h01;
      expv[60] = 5'h01;
      expv[61] = 5'h01;
      expv[62] = 5'h01;
      expv[63] = 5'h01;
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
