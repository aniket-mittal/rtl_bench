// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 14;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_046449 dut (
    .clk(clk),
    .rstb(in_vec[13:13]),
    .mlb(in_vec[12:12]),
    .start(in_vec[11:11]),
    .tdat(in_vec[10:3]),
    .cdiv(in_vec[2:1]),
    .din(in_vec[0:0]),
    .ss(out_vec[11:11]),
    .sck(out_vec[10:10]),
    .dout(out_vec[9:9]),
    .done(out_vec[8:8]),
    .rdata(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 14'h33af;
    stim[1] = 14'h2820;
    stim[2] = 14'h1270;
    stim[3] = 14'h0430;
    stim[4] = 14'h0e96;
    stim[5] = 14'h1cfc;
    stim[6] = 14'h022e;
    stim[7] = 14'h0a6c;
    stim[8] = 14'h0932;
    stim[9] = 14'h07c1;
    stim[10] = 14'h1e17;
    stim[11] = 14'h0e36;
    stim[12] = 14'h0c6c;
    stim[13] = 14'h0db8;
    stim[14] = 14'h1ee4;
    stim[15] = 14'h0f61;
    stim[16] = 14'h10a0;
    stim[17] = 14'h180f;
    stim[18] = 14'h0ec8;
    stim[19] = 14'h1844;
    stim[20] = 14'h1d23;
    stim[21] = 14'h0260;
    stim[22] = 14'h1824;
    stim[23] = 14'h0394;
    stim[24] = 14'h065b;
    stim[25] = 14'h19ac;
    stim[26] = 14'h1ca7;
    stim[27] = 14'h074b;
    stim[28] = 14'h14d0;
    stim[29] = 14'h09e2;
    stim[30] = 14'h05a0;
    stim[31] = 14'h1daa;
    stim[32] = 14'h01fe;
    stim[33] = 14'h0c10;
    stim[34] = 14'h0eb2;
    stim[35] = 14'h0c7b;
    stim[36] = 14'h0896;
    stim[37] = 14'h0950;
    stim[38] = 14'h1a44;
    stim[39] = 14'h0575;
    stim[40] = 14'h0690;
    stim[41] = 14'h0f17;
    stim[42] = 14'h165c;
    stim[43] = 14'h0b4f;
    stim[44] = 14'h07ba;
    stim[45] = 14'h11d8;
    stim[46] = 14'h22ca;
    stim[47] = 14'h06e7;
    stim[48] = 14'h1575;
    stim[49] = 14'h1c41;
    stim[50] = 14'h1989;
    stim[51] = 14'h1f64;
    stim[52] = 14'h0302;
    stim[53] = 14'h14bb;
    stim[54] = 14'h0bfb;
    stim[55] = 14'h05ba;
    stim[56] = 14'h115f;
    stim[57] = 14'h1d7a;
    stim[58] = 14'h11b2;
    stim[59] = 14'h17ee;
    stim[60] = 14'h1a23;
    stim[61] = 14'h0f36;
    stim[62] = 14'h102a;
    stim[63] = 14'h0473;
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
      expv[0] = 12'h800;
      expv[1] = 12'h800;
      expv[2] = 12'h800;
      expv[3] = 12'h800;
      expv[4] = 12'h800;
      expv[5] = 12'h800;
      expv[6] = 12'h800;
      expv[7] = 12'h800;
      expv[8] = 12'h800;
      expv[9] = 12'h800;
      expv[10] = 12'h800;
      expv[11] = 12'h800;
      expv[12] = 12'h800;
      expv[13] = 12'h800;
      expv[14] = 12'h800;
      expv[15] = 12'h800;
      expv[16] = 12'h800;
      expv[17] = 12'h800;
      expv[18] = 12'h800;
      expv[19] = 12'h800;
      expv[20] = 12'h800;
      expv[21] = 12'h800;
      expv[22] = 12'h800;
      expv[23] = 12'h800;
      expv[24] = 12'h800;
      expv[25] = 12'h800;
      expv[26] = 12'h800;
      expv[27] = 12'h800;
      expv[28] = 12'h800;
      expv[29] = 12'h800;
      expv[30] = 12'h800;
      expv[31] = 12'h800;
      expv[32] = 12'h800;
      expv[33] = 12'h800;
      expv[34] = 12'h800;
      expv[35] = 12'h800;
      expv[36] = 12'h800;
      expv[37] = 12'h800;
      expv[38] = 12'h800;
      expv[39] = 12'h800;
      expv[40] = 12'h800;
      expv[41] = 12'h800;
      expv[42] = 12'h800;
      expv[43] = 12'h800;
      expv[44] = 12'h800;
      expv[45] = 12'h800;
      expv[46] = 12'h800;
      expv[47] = 12'h800;
      expv[48] = 12'h800;
      expv[49] = 12'h800;
      expv[50] = 12'h800;
      expv[51] = 12'h800;
      expv[52] = 12'h800;
      expv[53] = 12'h800;
      expv[54] = 12'h800;
      expv[55] = 12'h800;
      expv[56] = 12'h800;
      expv[57] = 12'h800;
      expv[58] = 12'h800;
      expv[59] = 12'h800;
      expv[60] = 12'h800;
      expv[61] = 12'h800;
      expv[62] = 12'h800;
      expv[63] = 12'h800;
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
