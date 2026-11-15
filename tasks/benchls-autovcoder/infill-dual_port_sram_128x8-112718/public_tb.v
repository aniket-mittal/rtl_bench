// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 37;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_112718 dut (
    .CLKA(clk),
    .CENA(in_vec[36:36]),
    .WENA(in_vec[35:35]),
    .AA(in_vec[34:28]),
    .DA(in_vec[27:20]),
    .OENA(in_vec[19:19]),
    .CLKB(in_vec[18:18]),
    .CENB(in_vec[17:17]),
    .WENB(in_vec[16:16]),
    .AB(in_vec[15:9]),
    .DB(in_vec[8:1]),
    .OENB(in_vec[0:0]),
    .QA(out_vec[15:8]),
    .QB(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 37'h1b0d032543;
    stim[1] = 37'h1a879d69f2;
    stim[2] = 37'h1e18f004c4;
    stim[3] = 37'h14ce11d8f4;
    stim[4] = 37'h14066cf2e7;
    stim[5] = 37'h0dd8f7fc4f;
    stim[6] = 37'h1a20832f5e;
    stim[7] = 37'h10fe17e2a1;
    stim[8] = 37'h1b1aa24a90;
    stim[9] = 37'h1eede287c9;
    stim[10] = 37'h166f99df57;
    stim[11] = 37'h1db1866089;
    stim[12] = 37'h093d068198;
    stim[13] = 37'h0368841131;
    stim[14] = 37'h1c41dde829;
    stim[15] = 37'h004d6b3eca;
    stim[16] = 37'h1bbcd7ae7a;
    stim[17] = 37'h12bd29435c;
    stim[18] = 37'h11727c254a;
    stim[19] = 37'h119f35a276;
    stim[20] = 37'h020517239a;
    stim[21] = 37'h14e1ac9109;
    stim[22] = 37'h106b07a5b1;
    stim[23] = 37'h0c79bfd621;
    stim[24] = 37'h1b8dba8cce;
    stim[25] = 37'h0ffe48a03f;
    stim[26] = 37'h1a1141e354;
    stim[27] = 37'h07211b24cb;
    stim[28] = 37'h044026626b;
    stim[29] = 37'h11deea8ad7;
    stim[30] = 37'h190af00fda;
    stim[31] = 37'h04d254d065;
    stim[32] = 37'h05efe5b0b0;
    stim[33] = 37'h0c0f14ecbb;
    stim[34] = 37'h00ed0d6fee;
    stim[35] = 37'h1ebfc6225e;
    stim[36] = 37'h124812493c;
    stim[37] = 37'h05baf40a28;
    stim[38] = 37'h0fe6643562;
    stim[39] = 37'h0ab159cbb1;
    stim[40] = 37'h0e0da9d816;
    stim[41] = 37'h13fd8b5938;
    stim[42] = 37'h16f5e08659;
    stim[43] = 37'h10070798b7;
    stim[44] = 37'h0a388b3f17;
    stim[45] = 37'h0dbbfbf8f2;
    stim[46] = 37'h14d3213be7;
    stim[47] = 37'h06456df143;
    stim[48] = 37'h05c9b4834c;
    stim[49] = 37'h1cf096324a;
    stim[50] = 37'h096ba051f1;
    stim[51] = 37'h0b5fe585c5;
    stim[52] = 37'h1376355038;
    stim[53] = 37'h1eee23636e;
    stim[54] = 37'h1c8017128a;
    stim[55] = 37'h04c483ac28;
    stim[56] = 37'h045cccbb31;
    stim[57] = 37'h1316f247c8;
    stim[58] = 37'h1ff9a78540;
    stim[59] = 37'h018e61ec64;
    stim[60] = 37'h0f99939533;
    stim[61] = 37'h05404a0d9f;
    stim[62] = 37'h07bd6fdc01;
    stim[63] = 37'h1846348d2d;
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
      expv[0] = 16'hxxxx;
      expv[1] = 16'hxxxx;
      expv[2] = 16'hxxxx;
      expv[3] = 16'hxxxx;
      expv[4] = 16'hxxxx;
      expv[5] = 16'hxxxx;
      expv[6] = 16'hxxxx;
      expv[7] = 16'hxxxx;
      expv[8] = 16'hxxxx;
      expv[9] = 16'hxxxx;
      expv[10] = 16'hxxxx;
      expv[11] = 16'hxxxx;
      expv[12] = 16'hxxxx;
      expv[13] = 16'hxxxx;
      expv[14] = 16'hxxxx;
      expv[15] = 16'hxxxx;
      expv[16] = 16'hxxxx;
      expv[17] = 16'hxxxx;
      expv[18] = 16'hxxxx;
      expv[19] = 16'hxxxx;
      expv[20] = 16'hxxxx;
      expv[21] = 16'hxxxx;
      expv[22] = 16'hxxxx;
      expv[23] = 16'hxxxx;
      expv[24] = 16'hxxxx;
      expv[25] = 16'hxxxx;
      expv[26] = 16'hxxxx;
      expv[27] = 16'hxxxx;
      expv[28] = 16'hxxxx;
      expv[29] = 16'hxxxx;
      expv[30] = 16'hxxxx;
      expv[31] = 16'hxxxx;
      expv[32] = 16'hxxxx;
      expv[33] = 16'hxxxx;
      expv[34] = 16'hxxxx;
      expv[35] = 16'hxxxx;
      expv[36] = 16'hxxxx;
      expv[37] = 16'hxxxx;
      expv[38] = 16'hxxxx;
      expv[39] = 16'hxxxx;
      expv[40] = 16'hxxxx;
      expv[41] = 16'hxxxx;
      expv[42] = 16'hxxxx;
      expv[43] = 16'hxxxx;
      expv[44] = 16'hxxxx;
      expv[45] = 16'hxxxx;
      expv[46] = 16'hafxx;
      expv[47] = 16'hafxx;
      expv[48] = 16'hafxx;
      expv[49] = 16'hafxx;
      expv[50] = 16'hafxx;
      expv[51] = 16'hxxxx;
      expv[52] = 16'hxxxx;
      expv[53] = 16'hxxxx;
      expv[54] = 16'hxxxx;
      expv[55] = 16'hxxxx;
      expv[56] = 16'hxxxx;
      expv[57] = 16'hxxxx;
      expv[58] = 16'hxxxx;
      expv[59] = 16'hxxxx;
      expv[60] = 16'hxxxx;
      expv[61] = 16'h73xx;
      expv[62] = 16'h73xx;
      expv[63] = 16'h73xx;
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
