// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_041808 dut (
    .clk(clk),
    .rst(in_vec[10:10]),
    .ena(in_vec[9:9]),
    .din(in_vec[8:0]),
    .dout(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h544;
    stim[1] = 11'h5b7;
    stim[2] = 11'h1c0;
    stim[3] = 11'h37a;
    stim[4] = 11'h08e;
    stim[5] = 11'h27a;
    stim[6] = 11'h073;
    stim[7] = 11'h278;
    stim[8] = 11'h3f9;
    stim[9] = 11'h0e4;
    stim[10] = 11'h024;
    stim[11] = 11'h38d;
    stim[12] = 11'h0e5;
    stim[13] = 11'h0b0;
    stim[14] = 11'h03d;
    stim[15] = 11'h37b;
    stim[16] = 11'h2ec;
    stim[17] = 11'h018;
    stim[18] = 11'h318;
    stim[19] = 11'h3ec;
    stim[20] = 11'h2c0;
    stim[21] = 11'h1f6;
    stim[22] = 11'h016;
    stim[23] = 11'h3c4;
    stim[24] = 11'h3bc;
    stim[25] = 11'h3fe;
    stim[26] = 11'h7a6;
    stim[27] = 11'h0e6;
    stim[28] = 11'h00f;
    stim[29] = 11'h259;
    stim[30] = 11'h326;
    stim[31] = 11'h362;
    stim[32] = 11'h038;
    stim[33] = 11'h210;
    stim[34] = 11'h2a9;
    stim[35] = 11'h08a;
    stim[36] = 11'h191;
    stim[37] = 11'h197;
    stim[38] = 11'h2a5;
    stim[39] = 11'h217;
    stim[40] = 11'h682;
    stim[41] = 11'h0ad;
    stim[42] = 11'h0ed;
    stim[43] = 11'h28f;
    stim[44] = 11'h004;
    stim[45] = 11'h0a6;
    stim[46] = 11'h2a5;
    stim[47] = 11'h2e7;
    stim[48] = 11'h367;
    stim[49] = 11'h235;
    stim[50] = 11'h1dd;
    stim[51] = 11'h2c3;
    stim[52] = 11'h0c8;
    stim[53] = 11'h1b2;
    stim[54] = 11'h2aa;
    stim[55] = 11'h1d7;
    stim[56] = 11'h184;
    stim[57] = 11'h1e3;
    stim[58] = 11'h31a;
    stim[59] = 11'h27d;
    stim[60] = 11'h0a8;
    stim[61] = 11'h3a2;
    stim[62] = 11'h39f;
    stim[63] = 11'h23d;
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
      expv[0] = 32'h00000000;
      expv[1] = 32'h00000000;
      expv[2] = 32'h00000000;
      expv[3] = 32'h00000000;
      expv[4] = 32'h00000000;
      expv[5] = 32'h00000000;
      expv[6] = 32'h00000000;
      expv[7] = 32'h00000000;
      expv[8] = 32'h00000001;
      expv[9] = 32'h00ff4880;
      expv[10] = 32'h00ff4880;
      expv[11] = 32'h00ff4880;
      expv[12] = 32'h000000ff;
      expv[13] = 32'h000000ff;
      expv[14] = 32'h000000ff;
      expv[15] = 32'h000000ff;
      expv[16] = 32'h000000e5;
      expv[17] = 32'hf27c0000;
      expv[18] = 32'hf27c0000;
      expv[19] = 32'h0149bf40;
      expv[20] = 32'h008bf140;
      expv[21] = 32'h00004c3c;
      expv[22] = 32'h00004c3c;
      expv[23] = 32'h00004c3c;
      expv[24] = 32'h00039634;
      expv[25] = 32'h4c3c2000;
      expv[26] = 32'h00000000;
      expv[27] = 32'h00000000;
      expv[28] = 32'h00000000;
      expv[29] = 32'h00000000;
      expv[30] = 32'h00000000;
      expv[31] = 32'h00000000;
      expv[32] = 32'h00000001;
      expv[33] = 32'h00000001;
      expv[34] = 32'h0000003c;
      expv[35] = 32'h00065a13;
      expv[36] = 32'h00065a13;
      expv[37] = 32'h00065a13;
      expv[38] = 32'h00065a13;
      expv[39] = 32'h004b95c2;
      expv[40] = 32'h00000000;
      expv[41] = 32'h00000000;
      expv[42] = 32'h00000000;
      expv[43] = 32'h00000000;
      expv[44] = 32'h00000000;
      expv[45] = 32'h00000000;
      expv[46] = 32'h00000000;
      expv[47] = 32'h00000000;
      expv[48] = 32'h00000001;
      expv[49] = 32'h0000017a;
      expv[50] = 32'h000005ef;
      expv[51] = 32'h000005ef;
      expv[52] = 32'h00006c3c;
      expv[53] = 32'h00006c3c;
      expv[54] = 32'h00006c3c;
      expv[55] = 32'h006c3c74;
      expv[56] = 32'h006c3c74;
      expv[57] = 32'h006c3c74;
      expv[58] = 32'h006c3c74;
      expv[59] = 32'h0000000b;
      expv[60] = 32'h0000147a;
      expv[61] = 32'h0000147a;
      expv[62] = 32'h000007fa;
      expv[63] = 32'h0003fd22;
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
