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

  autovcoder_002166 dut (
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
    stim[0] = 33'h1fa238657;
    stim[1] = 33'h19da53b53;
    stim[2] = 33'h05055219b;
    stim[3] = 33'h02544fb8a;
    stim[4] = 33'h042667e78;
    stim[5] = 33'h0b9109a25;
    stim[6] = 33'h08c263019;
    stim[7] = 33'h0eff3a04a;
    stim[8] = 33'h0d2fb3cfb;
    stim[9] = 33'h08232f9e6;
    stim[10] = 33'h0f62879d0;
    stim[11] = 33'h00f4955c7;
    stim[12] = 33'h070b2da4c;
    stim[13] = 33'h0e3963951;
    stim[14] = 33'h09d2e09c9;
    stim[15] = 33'h02cc17fdd;
    stim[16] = 33'h0e8eb44a9;
    stim[17] = 33'h08c8aee59;
    stim[18] = 33'h00c3783b8;
    stim[19] = 33'h0cb77abde;
    stim[20] = 33'h0a257103d;
    stim[21] = 33'h078aa27ee;
    stim[22] = 33'h06b193e1f;
    stim[23] = 33'h0cfa62b4c;
    stim[24] = 33'h0a5572443;
    stim[25] = 33'h082165be1;
    stim[26] = 33'h04800c651;
    stim[27] = 33'h0d5979c94;
    stim[28] = 33'h0ade9ccbf;
    stim[29] = 33'h02ab8e86f;
    stim[30] = 33'h0ebb9738e;
    stim[31] = 33'h0d2a7a2d9;
    stim[32] = 33'h0a75edfa4;
    stim[33] = 33'h007922aa9;
    stim[34] = 33'h07c047761;
    stim[35] = 33'h064466358;
    stim[36] = 33'h06af56768;
    stim[37] = 33'h0c8d628dd;
    stim[38] = 33'h0d5b3f5ae;
    stim[39] = 33'h008eadaca;
    stim[40] = 33'h02865db6b;
    stim[41] = 33'h0065e9120;
    stim[42] = 33'h0b03fff0b;
    stim[43] = 33'h00f9f8586;
    stim[44] = 33'h01040a009;
    stim[45] = 33'h0556034cf;
    stim[46] = 33'h049580406;
    stim[47] = 33'h0015e9c0f;
    stim[48] = 33'h0ea90436c;
    stim[49] = 33'h091f2164e;
    stim[50] = 33'h04c9a6cc3;
    stim[51] = 33'h0a34789a3;
    stim[52] = 33'h0b49a4395;
    stim[53] = 33'h0ec53d608;
    stim[54] = 33'h067499bf3;
    stim[55] = 33'h0612e7d94;
    stim[56] = 33'h06f1ad0a8;
    stim[57] = 33'h138b677b5;
    stim[58] = 33'h0840999a7;
    stim[59] = 33'h0822c22b5;
    stim[60] = 33'h01c940d88;
    stim[61] = 33'h0783a0e35;
    stim[62] = 33'h03b826965;
    stim[63] = 33'h0c85097d3;
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
      expv[2] = 74'h00000000xxxxxxxxx53;
      expv[3] = 74'h00000000xxxxxxxxx9b;
      expv[4] = 74'h00000000xxxxxxxxx9b;
      expv[5] = 74'h000000000000000009b;
      expv[6] = 74'h000000000000000009b;
      expv[7] = 74'h000000004000000019b;
      expv[8] = 74'h000000000000000004a;
      expv[9] = 74'h000000000000000004a;
      expv[10] = 74'h000000000000000004a;
      expv[11] = 74'h000000000000000004a;
      expv[12] = 74'h000000008000000014a;
      expv[13] = 74'h000000000000000004c;
      expv[14] = 74'h000000000000000004c;
      expv[15] = 74'h000000000000000004c;
      expv[16] = 74'h000000000000000004c;
      expv[17] = 74'h00000000c000000014c;
      expv[18] = 74'h0000000000000000059;
      expv[19] = 74'h0000000000000000059;
      expv[20] = 74'h0000000000000000059;
      expv[21] = 74'h0000000000000000059;
      expv[22] = 74'h0000000100000000159;
      expv[23] = 74'h000000000000000001f;
      expv[24] = 74'h000000000000000001f;
      expv[25] = 74'h000000000000000001f;
      expv[26] = 74'h000000000000000001f;
      expv[27] = 74'h000000014000000011f;
      expv[28] = 74'h0000000000000000094;
      expv[29] = 74'h0000000000000000094;
      expv[30] = 74'h0000000000000000094;
      expv[31] = 74'h0000000000000000094;
      expv[32] = 74'h0000000180000000194;
      expv[33] = 74'h00000000000000000a4;
      expv[34] = 74'h00000000000000000a4;
      expv[35] = 74'h00000000000000000a4;
      expv[36] = 74'h00000000000000000a4;
      expv[37] = 74'h00000001c00000001a4;
      expv[38] = 74'h00000000000000000dd;
      expv[39] = 74'h00000000000000000dd;
      expv[40] = 74'h00000000000000000dd;
      expv[41] = 74'h00000000000000000dd;
      expv[42] = 74'h00000002000000001dd;
      expv[43] = 74'h000000000000000000b;
      expv[44] = 74'h000000000000000000b;
      expv[45] = 74'h000000000000000000b;
      expv[46] = 74'h000000000000000000b;
      expv[47] = 74'h000000024000000010b;
      expv[48] = 74'h000000000000000000f;
      expv[49] = 74'h000000000000000000f;
      expv[50] = 74'h000000000000000000f;
      expv[51] = 74'h000000000000000000f;
      expv[52] = 74'h000000028000000010f;
      expv[53] = 74'h0000000000000000095;
      expv[54] = 74'h0000000000000000095;
      expv[55] = 74'h0000000000000000095;
      expv[56] = 74'h0000000000000000095;
      expv[57] = 74'h00000002c0000000195;
      expv[58] = 74'h00000000000000001b5;
      expv[59] = 74'h00000000000000000a7;
      expv[60] = 74'h00000000000000000a7;
      expv[61] = 74'h00000000000000000a7;
      expv[62] = 74'h00000000000000000a7;
      expv[63] = 74'h00000000400000001a7;
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
