// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 37;
  localparam OW = 36;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_015574 dut (
    .clk(clk),
    .rst(in_vec[36:36]),
    .quad(in_vec[35:35]),
    .din(in_vec[34:3]),
    .din_valid(in_vec[2:2]),
    .dout_ready(in_vec[1:1]),
    .miso(in_vec[0:0]),
    .din_ready(out_vec[35:35]),
    .dout(out_vec[34:3]),
    .dout_valid(out_vec[2:2]),
    .sck(out_vec[1:1]),
    .mosi(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 37'h13661c0e77;
    stim[1] = 37'h15d2b80373;
    stim[2] = 37'h09ad5d412d;
    stim[3] = 37'h068418c708;
    stim[4] = 37'h04ebbab744;
    stim[5] = 37'h006221a7a6;
    stim[6] = 37'h01e9bc883e;
    stim[7] = 37'h08675657ea;
    stim[8] = 37'h0cfe6fff7f;
    stim[9] = 37'h034752b2df;
    stim[10] = 37'h07732a762d;
    stim[11] = 37'h075759d2b0;
    stim[12] = 37'h0d6e85e4fc;
    stim[13] = 37'h0367104ae8;
    stim[14] = 37'h036b6d4264;
    stim[15] = 37'h0c4676ceac;
    stim[16] = 37'h040e5d5ac0;
    stim[17] = 37'h045f9c43af;
    stim[18] = 37'h03bf3b5575;
    stim[19] = 37'h0630908864;
    stim[20] = 37'h0f305dc959;
    stim[21] = 37'h0c58cc4583;
    stim[22] = 37'h0b689198e8;
    stim[23] = 37'h0767a037fe;
    stim[24] = 37'h044ad3290f;
    stim[25] = 37'h0d309315fb;
    stim[26] = 37'h06527f24b8;
    stim[27] = 37'h0a94c218fd;
    stim[28] = 37'h03ec3e3830;
    stim[29] = 37'h017f8c69f3;
    stim[30] = 37'h0c0362fd0a;
    stim[31] = 37'h0e80864ed5;
    stim[32] = 37'h02810e3d22;
    stim[33] = 37'h05e2ff5528;
    stim[34] = 37'h17b931564c;
    stim[35] = 37'h06ea5ce4a4;
    stim[36] = 37'h0641230c17;
    stim[37] = 37'h017188755e;
    stim[38] = 37'h0d7cb90ae7;
    stim[39] = 37'h1416f88854;
    stim[40] = 37'h02db42cf1b;
    stim[41] = 37'h02332d9703;
    stim[42] = 37'h032db8ac80;
    stim[43] = 37'h03ddcd1eaf;
    stim[44] = 37'h0951615a37;
    stim[45] = 37'h0bc968a863;
    stim[46] = 37'h028b05f1be;
    stim[47] = 37'h0b74fd8bea;
    stim[48] = 37'h09daa96422;
    stim[49] = 37'h00d1e37c13;
    stim[50] = 37'h092301dc67;
    stim[51] = 37'h089dacb90a;
    stim[52] = 37'h0859537c0f;
    stim[53] = 37'h087b0c5001;
    stim[54] = 37'h0b9ff56736;
    stim[55] = 37'h0b5235b780;
    stim[56] = 37'h0f08bfd153;
    stim[57] = 37'h09bde4133e;
    stim[58] = 37'h0713ad3f56;
    stim[59] = 37'h061e520ea0;
    stim[60] = 37'h08b88b613b;
    stim[61] = 37'h089fe59f87;
    stim[62] = 37'h04121c2630;
    stim[63] = 37'h1179f90235;
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
      expv[0] = 36'h800000000;
      expv[1] = 36'h800000000;
      expv[2] = 36'h800000000;
      expv[3] = 36'h000000000;
      expv[4] = 36'h000000000;
      expv[5] = 36'h000000002;
      expv[6] = 36'h000000002;
      expv[7] = 36'h000000000;
      expv[8] = 36'h000000000;
      expv[9] = 36'h000000002;
      expv[10] = 36'h000000002;
      expv[11] = 36'h000000000;
      expv[12] = 36'h000000000;
      expv[13] = 36'h000000002;
      expv[14] = 36'h000000002;
      expv[15] = 36'h000000000;
      expv[16] = 36'h000000000;
      expv[17] = 36'h000000002;
      expv[18] = 36'h000000002;
      expv[19] = 36'h000000000;
      expv[20] = 36'h000000000;
      expv[21] = 36'h000000002;
      expv[22] = 36'h000000002;
      expv[23] = 36'h000000000;
      expv[24] = 36'h000000000;
      expv[25] = 36'h000000002;
      expv[26] = 36'h000000002;
      expv[27] = 36'h000000000;
      expv[28] = 36'h000000000;
      expv[29] = 36'h000000002;
      expv[30] = 36'h000000002;
      expv[31] = 36'h000000000;
      expv[32] = 36'h000000000;
      expv[33] = 36'h000000002;
      expv[34] = 36'h800000000;
      expv[35] = 36'h800000000;
      expv[36] = 36'h000000001;
      expv[37] = 36'h000000001;
      expv[38] = 36'h000000003;
      expv[39] = 36'h800000000;
      expv[40] = 36'h800000000;
      expv[41] = 36'h800000000;
      expv[42] = 36'h800000000;
      expv[43] = 36'h800000000;
      expv[44] = 36'h000000000;
      expv[45] = 36'h000000000;
      expv[46] = 36'h000000002;
      expv[47] = 36'h000000002;
      expv[48] = 36'h000000000;
      expv[49] = 36'h000000000;
      expv[50] = 36'h000000002;
      expv[51] = 36'h000000002;
      expv[52] = 36'h000000000;
      expv[53] = 36'h000000000;
      expv[54] = 36'h000000002;
      expv[55] = 36'h000000002;
      expv[56] = 36'h000000000;
      expv[57] = 36'h000000000;
      expv[58] = 36'h000000002;
      expv[59] = 36'h000000002;
      expv[60] = 36'h000000000;
      expv[61] = 36'h000000000;
      expv[62] = 36'h000000002;
      expv[63] = 36'h800000000;
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
