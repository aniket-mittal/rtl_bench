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

  autovcoder_002566 dut (
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
    stim[0] = 33'h18ab62fc5;
    stim[1] = 33'h1124827fb;
    stim[2] = 33'h0ec8e857f;
    stim[3] = 33'h0473eb5fd;
    stim[4] = 33'h0ad31780f;
    stim[5] = 33'h01e56edbb;
    stim[6] = 33'h028585d34;
    stim[7] = 33'h081948ab9;
    stim[8] = 33'h0763fd45c;
    stim[9] = 33'h0197af8b7;
    stim[10] = 33'h0f4b7614a;
    stim[11] = 33'h06265dd2c;
    stim[12] = 33'h0fc3f127f;
    stim[13] = 33'h074d1c1c3;
    stim[14] = 33'h1da47420e;
    stim[15] = 33'h0d6060eb5;
    stim[16] = 33'h01577ab77;
    stim[17] = 33'h045900b33;
    stim[18] = 33'h0546ab139;
    stim[19] = 33'h0565bef5f;
    stim[20] = 33'h0a499ea06;
    stim[21] = 33'h0550faf90;
    stim[22] = 33'h01668a116;
    stim[23] = 33'h0a8693b61;
    stim[24] = 33'h076ac08b5;
    stim[25] = 33'h03f450788;
    stim[26] = 33'h09009d806;
    stim[27] = 33'h059febf1a;
    stim[28] = 33'h1630299f9;
    stim[29] = 33'h0de33d1dd;
    stim[30] = 33'h0b9ebd581;
    stim[31] = 33'h04736bced;
    stim[32] = 33'h01d5fd90f;
    stim[33] = 33'h0ca71d307;
    stim[34] = 33'h0893e0628;
    stim[35] = 33'h0485cf303;
    stim[36] = 33'h04a708acb;
    stim[37] = 33'h07b92daa6;
    stim[38] = 33'h0e20fc4df;
    stim[39] = 33'h0343ad913;
    stim[40] = 33'h019de399b;
    stim[41] = 33'h00fa8f116;
    stim[42] = 33'h089336013;
    stim[43] = 33'h08a491188;
    stim[44] = 33'h04598c7b2;
    stim[45] = 33'h0293be75a;
    stim[46] = 33'h0e295a1e3;
    stim[47] = 33'h027ff8624;
    stim[48] = 33'h0ab0e72f2;
    stim[49] = 33'h06cc1e6ea;
    stim[50] = 33'h0ddb0ed99;
    stim[51] = 33'h07648f520;
    stim[52] = 33'h0a8e7e072;
    stim[53] = 33'h0ca514d7c;
    stim[54] = 33'h012b9e927;
    stim[55] = 33'h08e3fd3c0;
    stim[56] = 33'h075aee5c0;
    stim[57] = 33'h0d8c75c49;
    stim[58] = 33'h01fa4ad93;
    stim[59] = 33'h01cad2bd9;
    stim[60] = 33'h0fb44adc0;
    stim[61] = 33'h0ff2ba22b;
    stim[62] = 33'h01decf297;
    stim[63] = 33'h063d08c0e;
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
      expv[1] = 74'h3fffffffxxxxxxxxxxx;
      expv[2] = 74'h3fffffffxxxxxxxxxfb;
      expv[3] = 74'h00000000xxxxxxxxx7f;
      expv[4] = 74'h00000000xxxxxxxxx7f;
      expv[5] = 74'h000000000000000007f;
      expv[6] = 74'h000000000000000007f;
      expv[7] = 74'h3fffffffc000000017f;
      expv[8] = 74'h00000000000000000b9;
      expv[9] = 74'h00000000000000000b9;
      expv[10] = 74'h00000000000000000b9;
      expv[11] = 74'h00000000000000000b9;
      expv[12] = 74'h3fffffffc00000001b9;
      expv[13] = 74'h000000000000000007f;
      expv[14] = 74'h000000000000000007f;
      expv[15] = 74'h3fffffffc000000017f;
      expv[16] = 74'h00000000000000000b5;
      expv[17] = 74'h00000000000000000b5;
      expv[18] = 74'h00000000000000000b5;
      expv[19] = 74'h00000000000000000b5;
      expv[20] = 74'h3fffffffc00000001b5;
      expv[21] = 74'h0000000000000000006;
      expv[22] = 74'h0000000000000000006;
      expv[23] = 74'h0000000000000000006;
      expv[24] = 74'h0000000000000000006;
      expv[25] = 74'h3fffffffc0000000106;
      expv[26] = 74'h0000000000000000088;
      expv[27] = 74'h0000000000000000088;
      expv[28] = 74'h0000000000000000088;
      expv[29] = 74'h3fffffffc0000000188;
      expv[30] = 74'h00000000000000000dd;
      expv[31] = 74'h00000000000000000dd;
      expv[32] = 74'h00000000000000000dd;
      expv[33] = 74'h00000000000000000dd;
      expv[34] = 74'h3fffffffc00000001dd;
      expv[35] = 74'h0000000000000000028;
      expv[36] = 74'h0000000000000000028;
      expv[37] = 74'h0000000000000000028;
      expv[38] = 74'h0000000000000000028;
      expv[39] = 74'h3fffffffc0000000128;
      expv[40] = 74'h0000000000000000013;
      expv[41] = 74'h0000000000000000013;
      expv[42] = 74'h0000000000000000013;
      expv[43] = 74'h0000000000000000013;
      expv[44] = 74'h3fffffffc0000000113;
      expv[45] = 74'h00000000000000000b2;
      expv[46] = 74'h00000000000000000b2;
      expv[47] = 74'h00000000000000000b2;
      expv[48] = 74'h00000000000000000b2;
      expv[49] = 74'h3fffffffc00000001b2;
      expv[50] = 74'h00000000000000000ea;
      expv[51] = 74'h00000000000000000ea;
      expv[52] = 74'h00000000000000000ea;
      expv[53] = 74'h00000000000000000ea;
      expv[54] = 74'h3fffffffc00000001ea;
      expv[55] = 74'h0000000000000000027;
      expv[56] = 74'h0000000000000000027;
      expv[57] = 74'h0000000000000000027;
      expv[58] = 74'h0000000000000000027;
      expv[59] = 74'h3fffffffc0000000127;
      expv[60] = 74'h00000000000000000d9;
      expv[61] = 74'h00000000000000000d9;
      expv[62] = 74'h00000000000000000d9;
      expv[63] = 74'h00000000000000000d9;
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
