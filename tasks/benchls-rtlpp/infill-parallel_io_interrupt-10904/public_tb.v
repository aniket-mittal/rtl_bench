// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 41;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_10904 dut (
    .clk(clk),
    .address(in_vec[40:39]),
    .chipselect(in_vec[38:38]),
    .in_port(in_vec[37:34]),
    .reset_n(in_vec[33:33]),
    .write_n(in_vec[32:32]),
    .writedata(in_vec[31:0]),
    .irq(out_vec[32:32]),
    .readdata(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 41'h120d6c9ec7e;
    stim[1] = 41'h0d5fe9766e6;
    stim[2] = 41'h1e236c05941;
    stim[3] = 41'h14bef8ae585;
    stim[4] = 41'h16e6bc10a97;
    stim[5] = 41'h03b2db908b2;
    stim[6] = 41'h1f2a5099a89;
    stim[7] = 41'h1f65864afa5;
    stim[8] = 41'h08afaaff0d7;
    stim[9] = 41'h00f54b7a6c8;
    stim[10] = 41'h03bbfc8a760;
    stim[11] = 41'h10235f64eb9;
    stim[12] = 41'h0d2ae5f78b4;
    stim[13] = 41'h17f7ea4005b;
    stim[14] = 41'h17e8765cbaa;
    stim[15] = 41'h0ef39638e57;
    stim[16] = 41'h116868aa103;
    stim[17] = 41'h1de77b9034d;
    stim[18] = 41'h1bb25dcff28;
    stim[19] = 41'h11fabed5f4e;
    stim[20] = 41'h17a939268a0;
    stim[21] = 41'h127170ba63b;
    stim[22] = 41'h1ceccf928af;
    stim[23] = 41'h043da9b1e4b;
    stim[24] = 41'h1daf61a77d5;
    stim[25] = 41'h173eebb799b;
    stim[26] = 41'h03d77a13114;
    stim[27] = 41'h1134dc8b382;
    stim[28] = 41'h1bb81c61955;
    stim[29] = 41'h0d30173ef45;
    stim[30] = 41'h0f628f816a8;
    stim[31] = 41'h10f669e15c7;
    stim[32] = 41'h1c7a0cd1277;
    stim[33] = 41'h0b2a788832f;
    stim[34] = 41'h196af63a33f;
    stim[35] = 41'h02f8dabfd0a;
    stim[36] = 41'h13e9b9e7f2c;
    stim[37] = 41'h0d6bae8e213;
    stim[38] = 41'h0a60776abfe;
    stim[39] = 41'h04dc0928e70;
    stim[40] = 41'h19b6204518a;
    stim[41] = 41'h16e68d11fbe;
    stim[42] = 41'h09346a0026f;
    stim[43] = 41'h057688c636e;
    stim[44] = 41'h02a9c74af3a;
    stim[45] = 41'h0766ccedd2f;
    stim[46] = 41'h1077b1e414c;
    stim[47] = 41'h106f803b365;
    stim[48] = 41'h04a2c65c1bb;
    stim[49] = 41'h0eba90c51ff;
    stim[50] = 41'h072f6f36980;
    stim[51] = 41'h0ae976bda6e;
    stim[52] = 41'h09bcd399d4f;
    stim[53] = 41'h0d31740ff12;
    stim[54] = 41'h0d28f2b3f87;
    stim[55] = 41'h1baf9500011;
    stim[56] = 41'h03e135999f8;
    stim[57] = 41'h07ac525326a;
    stim[58] = 41'h1369f756e89;
    stim[59] = 41'h1c339a9483b;
    stim[60] = 41'h13722834699;
    stim[61] = 41'h013a402b5b9;
    stim[62] = 41'h0051b529173;
    stim[63] = 41'h19f7bbb6d56;
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
      expv[0] = 33'h000000000;
      expv[1] = 33'h000000000;
      expv[2] = 33'h000000000;
      expv[3] = 33'h000000000;
      expv[4] = 33'h000000000;
      expv[5] = 33'h100000000;
      expv[6] = 33'h10000000e;
      expv[7] = 33'h10000000b;
      expv[8] = 33'h100000006;
      expv[9] = 33'h100000000;
      expv[10] = 33'h100000003;
      expv[11] = 33'h10000000e;
      expv[12] = 33'h100000007;
      expv[13] = 33'h100000000;
      expv[14] = 33'h100000007;
      expv[15] = 33'h100000007;
      expv[16] = 33'h100000000;
      expv[17] = 33'h10000000a;
      expv[18] = 33'h10000000f;
      expv[19] = 33'h100000002;
      expv[20] = 33'h10000000a;
      expv[21] = 33'h00000000a;
      expv[22] = 33'h000000000;
      expv[23] = 33'h00000000b;
      expv[24] = 33'h000000000;
      expv[25] = 33'h00000000a;
      expv[26] = 33'h000000000;
      expv[27] = 33'h000000000;
      expv[28] = 33'h000000000;
      expv[29] = 33'h000000000;
      expv[30] = 33'h000000000;
      expv[31] = 33'h000000000;
      expv[32] = 33'h000000000;
      expv[33] = 33'h00000000f;
      expv[34] = 33'h000000000;
      expv[35] = 33'h00000000f;
      expv[36] = 33'h00000000b;
      expv[37] = 33'h000000000;
      expv[38] = 33'h000000000;
      expv[39] = 33'h000000000;
      expv[40] = 33'h000000000;
      expv[41] = 33'h000000000;
      expv[42] = 33'h100000000;
      expv[43] = 33'h100000000;
      expv[44] = 33'h100000005;
      expv[45] = 33'h10000000a;
      expv[46] = 33'h10000000d;
      expv[47] = 33'h10000000e;
      expv[48] = 33'h10000000e;
      expv[49] = 33'h100000002;
      expv[50] = 33'h100000000;
      expv[51] = 33'h10000000c;
      expv[52] = 33'h100000000;
      expv[53] = 33'h100000000;
      expv[54] = 33'h100000000;
      expv[55] = 33'h100000000;
      expv[56] = 33'h10000000f;
      expv[57] = 33'h10000000f;
      expv[58] = 33'h10000000e;
      expv[59] = 33'h10000000e;
      expv[60] = 33'h10000000f;
      expv[61] = 33'h10000000e;
      expv[62] = 33'h000000000;
      expv[63] = 33'h000000000;
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
