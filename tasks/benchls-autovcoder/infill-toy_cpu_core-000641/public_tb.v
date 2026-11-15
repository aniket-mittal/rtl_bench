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

  autovcoder_000641 dut (
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
    stim[0] = 33'h11e304cf3;
    stim[1] = 33'h1f9c9f3ae;
    stim[2] = 33'h0b419b7f7;
    stim[3] = 33'h0c074f4c3;
    stim[4] = 33'h05693e68e;
    stim[5] = 33'h041d2b453;
    stim[6] = 33'h0e9f13583;
    stim[7] = 33'h02a815aca;
    stim[8] = 33'h18ab0974f;
    stim[9] = 33'h0ae3dddfb;
    stim[10] = 33'h08ff3c1f2;
    stim[11] = 33'h0eded075d;
    stim[12] = 33'h0dccce94e;
    stim[13] = 33'h0e7399cf5;
    stim[14] = 33'h074cc27cd;
    stim[15] = 33'h09a175fca;
    stim[16] = 33'h023040595;
    stim[17] = 33'h0aefe697c;
    stim[18] = 33'h1a2f9ff7d;
    stim[19] = 33'h0c6fef156;
    stim[20] = 33'h04c6ccd4b;
    stim[21] = 33'h07705fc3c;
    stim[22] = 33'h0cfd3f3f9;
    stim[23] = 33'h056c24027;
    stim[24] = 33'h050d2b3c5;
    stim[25] = 33'h0cb1804aa;
    stim[26] = 33'h0e28d9936;
    stim[27] = 33'h0dfad2d51;
    stim[28] = 33'h039ac7447;
    stim[29] = 33'h0b8a3d8a8;
    stim[30] = 33'h0da57eb55;
    stim[31] = 33'h00f3aa402;
    stim[32] = 33'h0cfcaa8dd;
    stim[33] = 33'h0ad61d5d0;
    stim[34] = 33'h0eb914d75;
    stim[35] = 33'h03239ef2b;
    stim[36] = 33'h06febea34;
    stim[37] = 33'h0a8d8739c;
    stim[38] = 33'h0b7d01b96;
    stim[39] = 33'h08597d748;
    stim[40] = 33'h034a7bea2;
    stim[41] = 33'h05401f283;
    stim[42] = 33'h06d86b5da;
    stim[43] = 33'h0d8174487;
    stim[44] = 33'h052eed127;
    stim[45] = 33'h048c5eacf;
    stim[46] = 33'h005a9d0d2;
    stim[47] = 33'h08cab3f46;
    stim[48] = 33'h01d9345db;
    stim[49] = 33'h0082696d9;
    stim[50] = 33'h0bcbb34af;
    stim[51] = 33'h0a7fb36e3;
    stim[52] = 33'h0c1d05460;
    stim[53] = 33'h0ce02c862;
    stim[54] = 33'h0f0b91a78;
    stim[55] = 33'h0df3b47b7;
    stim[56] = 33'h018a49b1c;
    stim[57] = 33'h0f1d6aa02;
    stim[58] = 33'h0cc09b76a;
    stim[59] = 33'h0ade83af8;
    stim[60] = 33'h01d7e38c4;
    stim[61] = 33'h08c7a476b;
    stim[62] = 33'h00fbb40d2;
    stim[63] = 33'h07edf9208;
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
      expv[2] = 74'h00000000xxxxxxxxxae;
      expv[3] = 74'h00000000xxxxxxxxxf7;
      expv[4] = 74'h00000000xxxxxxxxxf7;
      expv[5] = 74'h00000000000000000f7;
      expv[6] = 74'h00000000000000000f7;
      expv[7] = 74'h00000000400000001f7;
      expv[8] = 74'h00000000000000000ca;
      expv[9] = 74'h00000000000000001ca;
      expv[10] = 74'h00000000000000000fb;
      expv[11] = 74'h00000000000000000fb;
      expv[12] = 74'h00000000000000000fb;
      expv[13] = 74'h00000000000000000fb;
      expv[14] = 74'h00000000400000001fb;
      expv[15] = 74'h00000000000000000cd;
      expv[16] = 74'h00000000000000000cd;
      expv[17] = 74'h00000000000000000cd;
      expv[18] = 74'h00000000000000000cd;
      expv[19] = 74'h00000000000000001cd;
      expv[20] = 74'h0000000000000000056;
      expv[21] = 74'h0000000000000000056;
      expv[22] = 74'h0000000000000000056;
      expv[23] = 74'h0000000000000000056;
      expv[24] = 74'h0000000040000000156;
      expv[25] = 74'h00000000000000000c5;
      expv[26] = 74'h00000000000000000c5;
      expv[27] = 74'h00000000000000000c5;
      expv[28] = 74'h00000000000000000c5;
      expv[29] = 74'h00000000800000001c5;
      expv[30] = 74'h00000000000000000a8;
      expv[31] = 74'h00000000000000000a8;
      expv[32] = 74'h00000000000000000a8;
      expv[33] = 74'h00000000000000000a8;
      expv[34] = 74'h00000000c00000001a8;
      expv[35] = 74'h0000000000000000075;
      expv[36] = 74'h0000000000000000075;
      expv[37] = 74'h0000000000000000075;
      expv[38] = 74'h0000000000000000075;
      expv[39] = 74'h0000001480000000175;
      expv[40] = 74'h0000000000000000048;
      expv[41] = 74'h0000000000000000048;
      expv[42] = 74'h0000000000000000048;
      expv[43] = 74'h0000000000000000048;
      expv[44] = 74'h00000014c0000000148;
      expv[45] = 74'h0000000000000000027;
      expv[46] = 74'h0000000000000000027;
      expv[47] = 74'h0000000000000000027;
      expv[48] = 74'h0000000000000000027;
      expv[49] = 74'h0000001500000000127;
      expv[50] = 74'h00000000000000000d9;
      expv[51] = 74'h00000000000000000d9;
      expv[52] = 74'h00000000000000000d9;
      expv[53] = 74'h00000000000000000d9;
      expv[54] = 74'h00000015400000001d9;
      expv[55] = 74'h0000000000000000078;
      expv[56] = 74'h0000000000000000078;
      expv[57] = 74'h0000000000000000078;
      expv[58] = 74'h0000000000000000078;
      expv[59] = 74'h0000001580000000178;
      expv[60] = 74'h00000000000000000f8;
      expv[61] = 74'h00000000000000000f8;
      expv[62] = 74'h00000000000000000f8;
      expv[63] = 74'h00000000000000000f8;
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
