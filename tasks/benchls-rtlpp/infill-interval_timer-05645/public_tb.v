// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 22;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_05645 dut (
    .clk(clk),
    .address(in_vec[21:19]),
    .chipselect(in_vec[18:18]),
    .reset_n(in_vec[17:17]),
    .write_n(in_vec[16:16]),
    .writedata(in_vec[15:0]),
    .irq(out_vec[16:16]),
    .readdata(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 22'h34a481;
    stim[1] = 22'h0dfc02;
    stim[2] = 22'h13aff3;
    stim[3] = 22'h1295c0;
    stim[4] = 22'h23d83e;
    stim[5] = 22'h36e518;
    stim[6] = 22'h3f34e5;
    stim[7] = 22'h036d5d;
    stim[8] = 22'h1e61a4;
    stim[9] = 22'h2e245d;
    stim[10] = 22'h2ea8b7;
    stim[11] = 22'h1a996d;
    stim[12] = 22'h326d60;
    stim[13] = 22'h36c001;
    stim[14] = 22'h3bdba0;
    stim[15] = 22'h1317e1;
    stim[16] = 22'h1bd63f;
    stim[17] = 22'h2e7eb1;
    stim[18] = 22'h3ee2de;
    stim[19] = 22'h2a652a;
    stim[20] = 22'h3f9561;
    stim[21] = 22'h2a03b1;
    stim[22] = 22'h221aac;
    stim[23] = 22'h1bf5f1;
    stim[24] = 22'h13fb0d;
    stim[25] = 22'h07dcd5;
    stim[26] = 22'h3aaeae;
    stim[27] = 22'h262a17;
    stim[28] = 22'h2a0dba;
    stim[29] = 22'h025ccf;
    stim[30] = 22'h0a4c07;
    stim[31] = 22'h231ec0;
    stim[32] = 22'h1b1a79;
    stim[33] = 22'h22dcab;
    stim[34] = 22'h2ef5fd;
    stim[35] = 22'h1b310d;
    stim[36] = 22'h2b9dc9;
    stim[37] = 22'h1bf427;
    stim[38] = 22'h1e6f70;
    stim[39] = 22'h3f1844;
    stim[40] = 22'h3f646e;
    stim[41] = 22'h2f5e80;
    stim[42] = 22'h1eb579;
    stim[43] = 22'h32fdda;
    stim[44] = 22'h2b3905;
    stim[45] = 22'h0fc4bb;
    stim[46] = 22'h1734a8;
    stim[47] = 22'h2b09da;
    stim[48] = 22'h0f80dd;
    stim[49] = 22'h074f41;
    stim[50] = 22'h2b8f07;
    stim[51] = 22'h0bdc69;
    stim[52] = 22'h0af5d5;
    stim[53] = 22'h37d91c;
    stim[54] = 22'h1aa426;
    stim[55] = 22'h2f2549;
    stim[56] = 22'h1a9b74;
    stim[57] = 22'h3adfae;
    stim[58] = 22'h2ea11b;
    stim[59] = 22'h0a92a8;
    stim[60] = 22'h3f241c;
    stim[61] = 22'h331e11;
    stim[62] = 22'h2f67c6;
    stim[63] = 22'h2fa06c;
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
      expv[0] = 17'h00000;
      expv[1] = 17'h00000;
      expv[2] = 17'h00000;
      expv[3] = 17'h0c34f;
      expv[4] = 17'h0c34f;
      expv[5] = 17'h00000;
      expv[6] = 17'h00000;
      expv[7] = 17'h00000;
      expv[8] = 17'h00000;
      expv[9] = 17'h00000;
      expv[10] = 17'h00000;
      expv[11] = 17'h00000;
      expv[12] = 17'h061a4;
      expv[13] = 17'h00000;
      expv[14] = 17'h00000;
      expv[15] = 17'h00000;
      expv[16] = 17'h0c34f;
      expv[17] = 17'h061a4;
      expv[18] = 17'h061a4;
      expv[19] = 17'h00000;
      expv[20] = 17'h061a4;
      expv[21] = 17'h00000;
      expv[22] = 17'h061a4;
      expv[23] = 17'h0c34f;
      expv[24] = 17'h061a4;
      expv[25] = 17'h0c34f;
      expv[26] = 17'h00000;
      expv[27] = 17'h00000;
      expv[28] = 17'h0c34f;
      expv[29] = 17'h061a4;
      expv[30] = 17'h00000;
      expv[31] = 17'h00000;
      expv[32] = 17'h0c34f;
      expv[33] = 17'h061a4;
      expv[34] = 17'h0c34f;
      expv[35] = 17'h061a4;
      expv[36] = 17'h061a4;
      expv[37] = 17'h061a4;
      expv[38] = 17'h061a4;
      expv[39] = 17'h061a4;
      expv[40] = 17'h00000;
      expv[41] = 17'h00000;
      expv[42] = 17'h061a4;
      expv[43] = 17'h06f70;
      expv[44] = 17'h00000;
      expv[45] = 17'h061a4;
      expv[46] = 17'h00000;
      expv[47] = 17'h0c34f;
      expv[48] = 17'h061a4;
      expv[49] = 17'h00000;
      expv[50] = 17'h00000;
      expv[51] = 17'h061a4;
      expv[52] = 17'h00000;
      expv[53] = 17'h00000;
      expv[54] = 17'h00000;
      expv[55] = 17'h0b579;
      expv[56] = 17'h061a4;
      expv[57] = 17'h0b579;
      expv[58] = 17'h00000;
      expv[59] = 17'h061a4;
      expv[60] = 17'h00000;
      expv[61] = 17'h00000;
      expv[62] = 17'h00000;
      expv[63] = 17'h0b579;
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
