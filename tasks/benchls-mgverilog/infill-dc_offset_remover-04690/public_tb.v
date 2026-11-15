// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 15;
  localparam OW = 24;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_04690 dut (
    .clock(clk),
    .reset(in_vec[14:14]),
    .strobe(in_vec[13:13]),
    .iqSel(in_vec[12:12]),
    .sig_in(in_vec[11:0]),
    .dcoffset(out_vec[23:12]),
    .sigout(out_vec[11:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 15'h4592;
    stim[1] = 15'h565a;
    stim[2] = 15'h0951;
    stim[3] = 15'h367d;
    stim[4] = 15'h05f3;
    stim[5] = 15'h2549;
    stim[6] = 15'h39d6;
    stim[7] = 15'h273f;
    stim[8] = 15'h2ced;
    stim[9] = 15'h21c1;
    stim[10] = 15'h7fc7;
    stim[11] = 15'h18f7;
    stim[12] = 15'h0d8a;
    stim[13] = 15'h17f0;
    stim[14] = 15'h1910;
    stim[15] = 15'h28ca;
    stim[16] = 15'h2bd1;
    stim[17] = 15'h2d02;
    stim[18] = 15'h32bc;
    stim[19] = 15'h4ba2;
    stim[20] = 15'h0850;
    stim[21] = 15'h22f8;
    stim[22] = 15'h38ab;
    stim[23] = 15'h21a3;
    stim[24] = 15'h1ec7;
    stim[25] = 15'h3049;
    stim[26] = 15'h2196;
    stim[27] = 15'h0cb0;
    stim[28] = 15'h0481;
    stim[29] = 15'h3836;
    stim[30] = 15'h1011;
    stim[31] = 15'h1d15;
    stim[32] = 15'h0046;
    stim[33] = 15'h35ad;
    stim[34] = 15'h180c;
    stim[35] = 15'h01b2;
    stim[36] = 15'h3ffa;
    stim[37] = 15'h13a4;
    stim[38] = 15'h29f9;
    stim[39] = 15'h2f31;
    stim[40] = 15'h2771;
    stim[41] = 15'h1ecb;
    stim[42] = 15'h0775;
    stim[43] = 15'h25d9;
    stim[44] = 15'h3e56;
    stim[45] = 15'h1b24;
    stim[46] = 15'h2c84;
    stim[47] = 15'h1ad6;
    stim[48] = 15'h0033;
    stim[49] = 15'h2f24;
    stim[50] = 15'h52f7;
    stim[51] = 15'h1630;
    stim[52] = 15'h15dc;
    stim[53] = 15'h17a9;
    stim[54] = 15'h0147;
    stim[55] = 15'h31ac;
    stim[56] = 15'h0f66;
    stim[57] = 15'h334d;
    stim[58] = 15'h20d0;
    stim[59] = 15'h0c8c;
    stim[60] = 15'h2e0b;
    stim[61] = 15'h3fa9;
    stim[62] = 15'h18a0;
    stim[63] = 15'h3aa5;
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
      expv[0] = 24'hxxxxxx;
      expv[1] = 24'h00065a;
      expv[2] = 24'h000951;
      expv[3] = 24'h00067d;
      expv[4] = 24'h0005f3;
      expv[5] = 24'h000549;
      expv[6] = 24'h0009d6;
      expv[7] = 24'h00073f;
      expv[8] = 24'h000ced;
      expv[9] = 24'h0001c1;
      expv[10] = 24'h000fc7;
      expv[11] = 24'h0008f7;
      expv[12] = 24'h000d8a;
      expv[13] = 24'h0007f0;
      expv[14] = 24'h000910;
      expv[15] = 24'h0008ca;
      expv[16] = 24'hfffbd2;
      expv[17] = 24'hfffd03;
      expv[18] = 24'h0002bc;
      expv[19] = 24'hfffba3;
      expv[20] = 24'h000850;
      expv[21] = 24'h0002f8;
      expv[22] = 24'h0008ab;
      expv[23] = 24'h0001a3;
      expv[24] = 24'hfffec8;
      expv[25] = 24'hfff04a;
      expv[26] = 24'h000196;
      expv[27] = 24'h000cb0;
      expv[28] = 24'h000481;
      expv[29] = 24'hfff837;
      expv[30] = 24'hfff012;
      expv[31] = 24'hfffd16;
      expv[32] = 24'h000046;
      expv[33] = 24'hfff5ae;
      expv[34] = 24'hfff80d;
      expv[35] = 24'h0001b2;
      expv[36] = 24'hfffffb;
      expv[37] = 24'hfff3a5;
      expv[38] = 24'h0009f9;
      expv[39] = 24'h000f31;
      expv[40] = 24'hfff772;
      expv[41] = 24'hfffecc;
      expv[42] = 24'h000775;
      expv[43] = 24'h0005d9;
      expv[44] = 24'hfffe57;
      expv[45] = 24'hfffb25;
      expv[46] = 24'h000c84;
      expv[47] = 24'hfffad7;
      expv[48] = 24'h000033;
      expv[49] = 24'h000f24;
      expv[50] = 24'hfff2f8;
      expv[51] = 24'h000630;
      expv[52] = 24'h0005dc;
      expv[53] = 24'h0007a9;
      expv[54] = 24'h000147;
      expv[55] = 24'h0001ac;
      expv[56] = 24'h000f66;
      expv[57] = 24'h00034d;
      expv[58] = 24'h0000d0;
      expv[59] = 24'h000c8c;
      expv[60] = 24'h000e0b;
      expv[61] = 24'h000fa9;
      expv[62] = 24'h0008a0;
      expv[63] = 24'h000aa5;
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
