// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 33;
  localparam OW = 74;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_002554 dut (
    .clk(clk),
    .rst(in_vec[32:32]),
    .bus_in(in_vec[31:0]),
    .bus_A(out_vec[73:42]),
    .bus_out(out_vec[41:10]),
    .bus_WE(out_vec[9:9]),
    .bus_RE(out_vec[8:8]),
    .current_opcode(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 33'h13c622817;
    stim[1] = 33'h16b432239;
    stim[2] = 33'h0327c96e9;
    stim[3] = 33'h06f28dcaa;
    stim[4] = 33'h021d33be5;
    stim[5] = 33'h0e0ae5849;
    stim[6] = 33'h0aefe20e1;
    stim[7] = 33'h03dc53e5b;
    stim[8] = 33'h003b905a3;
    stim[9] = 33'h0a0052dcc;
    stim[10] = 33'h0715633d9;
    stim[11] = 33'h067155279;
    stim[12] = 33'h053f5b48b;
    stim[13] = 33'h04b4c7a19;
    stim[14] = 33'h0dfbad0a1;
    stim[15] = 33'h1a8d3c635;
    stim[16] = 33'h0e08f764c;
    stim[17] = 33'h044647b4b;
    stim[18] = 33'h043950124;
    stim[19] = 33'h06599a716;
    stim[20] = 33'h0cfb7af25;
    stim[21] = 33'h03fa5818c;
    stim[22] = 33'h01839efdf;
    stim[23] = 33'h0284a6493;
    stim[24] = 33'h094a12846;
    stim[25] = 33'h03c11b01c;
    stim[26] = 33'h0ff7d6d28;
    stim[27] = 33'h0d6181cb8;
    stim[28] = 33'h07a90ff10;
    stim[29] = 33'h0316bb91f;
    stim[30] = 33'h0834b9204;
    stim[31] = 33'h009602d24;
    stim[32] = 33'h0d7d94b29;
    stim[33] = 33'h08649ae4e;
    stim[34] = 33'h0e7d936e8;
    stim[35] = 33'h01027582f;
    stim[36] = 33'h088994b0e;
    stim[37] = 33'h0841174fa;
    stim[38] = 33'h08b130b32;
    stim[39] = 33'h093c55b44;
    stim[40] = 33'h08ed16f63;
    stim[41] = 33'h0faf6a55d;
    stim[42] = 33'h0119b2df3;
    stim[43] = 33'h0c8c78537;
    stim[44] = 33'h0fb0fc4b4;
    stim[45] = 33'h0c8f56692;
    stim[46] = 33'h0e20091e2;
    stim[47] = 33'h055ec2bc2;
    stim[48] = 33'h091f3bc2a;
    stim[49] = 33'h016ebe0a9;
    stim[50] = 33'h006b10c53;
    stim[51] = 33'h08e3d7cfe;
    stim[52] = 33'h09877b57c;
    stim[53] = 33'h0f1420cb5;
    stim[54] = 33'h001eb4c7d;
    stim[55] = 33'h066ec2bf7;
    stim[56] = 33'h0e31a77dc;
    stim[57] = 33'h0dcb0236f;
    stim[58] = 33'h0909aa1e8;
    stim[59] = 33'h0848c9173;
    stim[60] = 33'h0713d0790;
    stim[61] = 33'h084e69e01;
    stim[62] = 33'h019ba103f;
    stim[63] = 33'h05e388648;
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
      expv[0] = 74'hxxxxxxxxxxxxxxxxxxx;
      expv[1] = 74'h00000000xxxxxxxxxxx;
      expv[2] = 74'h00000000xxxxxxxxx39;
      expv[3] = 74'h00000000xxxxxxxxxe9;
      expv[4] = 74'h00000000xxxxxxxxxe9;
      expv[5] = 74'h00000000000000000e9;
      expv[6] = 74'h00000000000000000e9;
      expv[7] = 74'h00000000400000001e9;
      expv[8] = 74'h000000000000000005b;
      expv[9] = 74'h000000000000000005b;
      expv[10] = 74'h000000000000000005b;
      expv[11] = 74'h000000000000000005b;
      expv[12] = 74'h000000008000000015b;
      expv[13] = 74'h000000000000000008b;
      expv[14] = 74'h000000000000000008b;
      expv[15] = 74'h000000000000000008b;
      expv[16] = 74'h000000000000000018b;
      expv[17] = 74'h000000000000000004c;
      expv[18] = 74'h000000000000000004c;
      expv[19] = 74'h000000000000000004c;
      expv[20] = 74'h000000000000000004c;
      expv[21] = 74'h000000004000000014c;
      expv[22] = 74'h000000000000000008c;
      expv[23] = 74'h000000000000000008c;
      expv[24] = 74'h000000000000000008c;
      expv[25] = 74'h000000000000000008c;
      expv[26] = 74'h000000008000000018c;
      expv[27] = 74'h0000000000000000028;
      expv[28] = 74'h0000000000000000028;
      expv[29] = 74'h0000000000000000028;
      expv[30] = 74'h0000000000000000028;
      expv[31] = 74'h00000000c0000000128;
      expv[32] = 74'h0000000000000000024;
      expv[33] = 74'h0000000000000000024;
      expv[34] = 74'h0000000000000000024;
      expv[35] = 74'h0000000000000000024;
      expv[36] = 74'h0000000100000000124;
      expv[37] = 74'h000000000000000000e;
      expv[38] = 74'h000000000000000000e;
      expv[39] = 74'h000000000000000000e;
      expv[40] = 74'h000000000000000000e;
      expv[41] = 74'h000000014000000010e;
      expv[42] = 74'h000000000000000005d;
      expv[43] = 74'h000000000000000005d;
      expv[44] = 74'h000000000000000005d;
      expv[45] = 74'h000000000000000005d;
      expv[46] = 74'h000000018000000015d;
      expv[47] = 74'h00000000000000000e2;
      expv[48] = 74'h00000000000000000e2;
      expv[49] = 74'h00000000000000000e2;
      expv[50] = 74'h00000000000000000e2;
      expv[51] = 74'h00000001c00000001e2;
      expv[52] = 74'h00000000000000000fe;
      expv[53] = 74'h00000000000000000fe;
      expv[54] = 74'h00000000000000000fe;
      expv[55] = 74'h00000000000000000fe;
      expv[56] = 74'h00000002000000001fe;
      expv[57] = 74'h00000000000000000dc;
      expv[58] = 74'h00000000000000000dc;
      expv[59] = 74'h00000000000000000dc;
      expv[60] = 74'h00000000000000000dc;
      expv[61] = 74'h00000002400000001dc;
      expv[62] = 74'h0000000000000000001;
      expv[63] = 74'h0000000000000000001;
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
