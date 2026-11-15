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

  autovcoder_002561 dut (
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
    stim[0] = 33'h1c6ff1e28;
    stim[1] = 33'h1c607d6e3;
    stim[2] = 33'h085afdee9;
    stim[3] = 33'h0b2f708d0;
    stim[4] = 33'h0cad33d1d;
    stim[5] = 33'h0781fa077;
    stim[6] = 33'h0106a32f1;
    stim[7] = 33'h0501b5cce;
    stim[8] = 33'h09ef31a9f;
    stim[9] = 33'h138680d16;
    stim[10] = 33'h0ade50042;
    stim[11] = 33'h0e9903587;
    stim[12] = 33'h0b8948a86;
    stim[13] = 33'h0dc2ad6da;
    stim[14] = 33'h0aad11759;
    stim[15] = 33'h0529a7411;
    stim[16] = 33'h0c4231463;
    stim[17] = 33'h0138c15f7;
    stim[18] = 33'h08b12b3c6;
    stim[19] = 33'h0a7fc2d16;
    stim[20] = 33'h06a023698;
    stim[21] = 33'h0ddd8236e;
    stim[22] = 33'h05c87d251;
    stim[23] = 33'h049088fb2;
    stim[24] = 33'h05f262a04;
    stim[25] = 33'h0371e3b95;
    stim[26] = 33'h01fd9888d;
    stim[27] = 33'h0417ad7c2;
    stim[28] = 33'h0a00b60b1;
    stim[29] = 33'h0b511b10e;
    stim[30] = 33'h09163542d;
    stim[31] = 33'h03352f91d;
    stim[32] = 33'h0a2998759;
    stim[33] = 33'h0ff19edd2;
    stim[34] = 33'h06c360247;
    stim[35] = 33'h07abd8195;
    stim[36] = 33'h07822a13a;
    stim[37] = 33'h0caddbda0;
    stim[38] = 33'h0d3c696f8;
    stim[39] = 33'h0f8505d6f;
    stim[40] = 33'h13d8debf3;
    stim[41] = 33'h0331e3e4d;
    stim[42] = 33'h091bb93ce;
    stim[43] = 33'h07192b621;
    stim[44] = 33'h04a04464f;
    stim[45] = 33'h0ed825298;
    stim[46] = 33'h04cacd6ab;
    stim[47] = 33'h0714b6322;
    stim[48] = 33'h01e980309;
    stim[49] = 33'h01cc7ebcd;
    stim[50] = 33'h107dfe0f6;
    stim[51] = 33'h0ec447065;
    stim[52] = 33'h0d269b6b9;
    stim[53] = 33'h01e73a2d2;
    stim[54] = 33'h0c4c22658;
    stim[55] = 33'h0c701f590;
    stim[56] = 33'h097072b46;
    stim[57] = 33'h0418144a2;
    stim[58] = 33'h08c6e6ff1;
    stim[59] = 33'h0e292a70f;
    stim[60] = 33'h06bcca90e;
    stim[61] = 33'h03ed4dbd7;
    stim[62] = 33'h0b0314d09;
    stim[63] = 33'h09a0267a0;
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
      expv[2] = 74'h00000000xxxxxxxxxe3;
      expv[3] = 74'h00000000xxxxxxxxxe9;
      expv[4] = 74'h00000000xxxxxxxxxe9;
      expv[5] = 74'h00000000000000000e9;
      expv[6] = 74'h00000000000000000e9;
      expv[7] = 74'h00000000400000001e9;
      expv[8] = 74'h00000000000000000ce;
      expv[9] = 74'h00000000000000000ce;
      expv[10] = 74'h00000000000000001ce;
      expv[11] = 74'h0000000000000000042;
      expv[12] = 74'h0000000000000000042;
      expv[13] = 74'h0000000000000000042;
      expv[14] = 74'h0000000000000000042;
      expv[15] = 74'h0000000040000000142;
      expv[16] = 74'h0000000000000000011;
      expv[17] = 74'h0000000000000000011;
      expv[18] = 74'h0000000000000000011;
      expv[19] = 74'h0000000000000000011;
      expv[20] = 74'h0000000080000000111;
      expv[21] = 74'h0000000000000000098;
      expv[22] = 74'h0000000000000000098;
      expv[23] = 74'h0000000000000000098;
      expv[24] = 74'h0000000000000000098;
      expv[25] = 74'h00000000c0000000198;
      expv[26] = 74'h0000000000000000095;
      expv[27] = 74'h0000000000000000095;
      expv[28] = 74'h0000000000000000095;
      expv[29] = 74'h0000000000000000095;
      expv[30] = 74'h0000000100000000195;
      expv[31] = 74'h000000000000000002d;
      expv[32] = 74'h000000000000000002d;
      expv[33] = 74'h000000000000000002d;
      expv[34] = 74'h000000000000000002d;
      expv[35] = 74'h000000014000000012d;
      expv[36] = 74'h0000000000000000095;
      expv[37] = 74'h0000000000000000095;
      expv[38] = 74'h0000000000000000095;
      expv[39] = 74'h0000000000000000095;
      expv[40] = 74'h0000000180000000195;
      expv[41] = 74'h00000000000000001f3;
      expv[42] = 74'h000000000000000004d;
      expv[43] = 74'h000000000000000004d;
      expv[44] = 74'h000000000000000004d;
      expv[45] = 74'h000000000000000004d;
      expv[46] = 74'h000000004000000014d;
      expv[47] = 74'h00000000000000000ab;
      expv[48] = 74'h00000000000000000ab;
      expv[49] = 74'h00000000000000000ab;
      expv[50] = 74'h00000000000000000ab;
      expv[51] = 74'h00000000000000001ab;
      expv[52] = 74'h0000000000000000065;
      expv[53] = 74'h0000000000000000065;
      expv[54] = 74'h0000000000000000065;
      expv[55] = 74'h0000000000000000065;
      expv[56] = 74'h0000000040000000165;
      expv[57] = 74'h0000000000000000046;
      expv[58] = 74'h0000000000000000046;
      expv[59] = 74'h0000000000000000046;
      expv[60] = 74'h0000000000000000046;
      expv[61] = 74'h0000000080000000146;
      expv[62] = 74'h00000000000000000d7;
      expv[63] = 74'h00000000000000000d7;
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
