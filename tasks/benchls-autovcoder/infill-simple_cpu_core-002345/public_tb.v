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

  autovcoder_002345 dut (
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
    stim[0] = 33'h11522ea1e;
    stim[1] = 33'h1268d505f;
    stim[2] = 33'h0b86a615c;
    stim[3] = 33'h05d291011;
    stim[4] = 33'h0ac7fa1cd;
    stim[5] = 33'h0a00bdccd;
    stim[6] = 33'h06aeaf1a8;
    stim[7] = 33'h05214f950;
    stim[8] = 33'h0cb547b08;
    stim[9] = 33'h0464f5dbd;
    stim[10] = 33'h022e4c432;
    stim[11] = 33'h0e8142cd1;
    stim[12] = 33'h0992136c0;
    stim[13] = 33'h0e9eee4da;
    stim[14] = 33'h04cf1f6b3;
    stim[15] = 33'h05bed3b84;
    stim[16] = 33'h0d16b240d;
    stim[17] = 33'h0bd5e323b;
    stim[18] = 33'h15dd5eccc;
    stim[19] = 33'h05fd092bd;
    stim[20] = 33'h0f0feb4c2;
    stim[21] = 33'h071d2cfbf;
    stim[22] = 33'h056869d21;
    stim[23] = 33'h0ef3d27a5;
    stim[24] = 33'h0a0fbc5b6;
    stim[25] = 33'h05fdf71c0;
    stim[26] = 33'h0d7a40914;
    stim[27] = 33'h01a5c151d;
    stim[28] = 33'h0030acdd9;
    stim[29] = 33'h0578cdd61;
    stim[30] = 33'h0adf992b1;
    stim[31] = 33'h01de43f03;
    stim[32] = 33'h04f985664;
    stim[33] = 33'h0071ee90c;
    stim[34] = 33'h0a322c1fe;
    stim[35] = 33'h0f4aac66e;
    stim[36] = 33'h05f5ae212;
    stim[37] = 33'h0110ff768;
    stim[38] = 33'h01f789c77;
    stim[39] = 33'h0b28d1893;
    stim[40] = 33'h018bcca32;
    stim[41] = 33'h0f03df0c0;
    stim[42] = 33'h0add301a7;
    stim[43] = 33'h179eef609;
    stim[44] = 33'h095ee10b0;
    stim[45] = 33'h0325747a0;
    stim[46] = 33'h0a0ddf701;
    stim[47] = 33'h08923bd75;
    stim[48] = 33'h08242f836;
    stim[49] = 33'h070f67ef6;
    stim[50] = 33'h0b77710df;
    stim[51] = 33'h044bbe938;
    stim[52] = 33'h0507a2fe5;
    stim[53] = 33'h0ac6b4654;
    stim[54] = 33'h0708a7ce4;
    stim[55] = 33'h0241d57b3;
    stim[56] = 33'h013a3c3f6;
    stim[57] = 33'h02ff56ed3;
    stim[58] = 33'h04d23acc8;
    stim[59] = 33'h07a2a36ec;
    stim[60] = 33'h0bc393526;
    stim[61] = 33'h025dc97b6;
    stim[62] = 33'h063c3d1c3;
    stim[63] = 33'h06e6cb850;
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
      expv[2] = 74'h00000000xxxxxxxxx5f;
      expv[3] = 74'h00000000xxxxxxxxx5c;
      expv[4] = 74'h00000000xxxxxxxxx5c;
      expv[5] = 74'h000000000000000005c;
      expv[6] = 74'h000000000000000005c;
      expv[7] = 74'h000000004000000015c;
      expv[8] = 74'h0000000000000000050;
      expv[9] = 74'h0000000000000000050;
      expv[10] = 74'h0000000000000000050;
      expv[11] = 74'h0000000000000000050;
      expv[12] = 74'h0000000080000000150;
      expv[13] = 74'h00000000000000000c0;
      expv[14] = 74'h00000000000000000c0;
      expv[15] = 74'h00000000000000000c0;
      expv[16] = 74'h00000000000000000c0;
      expv[17] = 74'h00000000c00000001c0;
      expv[18] = 74'h000000000000000003b;
      expv[19] = 74'h000000000000000013b;
      expv[20] = 74'h00000000000000000bd;
      expv[21] = 74'h00000000000000000bd;
      expv[22] = 74'h00000000000000000bd;
      expv[23] = 74'h00000000000000000bd;
      expv[24] = 74'h00000000400000001bd;
      expv[25] = 74'h00000000000000000b6;
      expv[26] = 74'h00000000000000000b6;
      expv[27] = 74'h00000000000000000b6;
      expv[28] = 74'h00000000000000000b6;
      expv[29] = 74'h00000000800000001b6;
      expv[30] = 74'h0000000000000000061;
      expv[31] = 74'h0000000000000000061;
      expv[32] = 74'h0000000000000000061;
      expv[33] = 74'h0000000000000000061;
      expv[34] = 74'h00000000c0000000161;
      expv[35] = 74'h00000000000000000fe;
      expv[36] = 74'h00000000000000000fe;
      expv[37] = 74'h00000000000000000fe;
      expv[38] = 74'h00000000000000000fe;
      expv[39] = 74'h00000001000000001fe;
      expv[40] = 74'h0000000000000000093;
      expv[41] = 74'h0000000000000000093;
      expv[42] = 74'h0000000000000000093;
      expv[43] = 74'h0000000000000000093;
      expv[44] = 74'h0000000000000000193;
      expv[45] = 74'h00000000000000000b0;
      expv[46] = 74'h00000000000000000b0;
      expv[47] = 74'h00000000000000000b0;
      expv[48] = 74'h00000000000000000b0;
      expv[49] = 74'h00000000400000001b0;
      expv[50] = 74'h00000000000000000f6;
      expv[51] = 74'h00000000000000000f6;
      expv[52] = 74'h00000000000000000f6;
      expv[53] = 74'h00000000000000000f6;
      expv[54] = 74'h00000000800000001f6;
      expv[55] = 74'h00000000000000000e4;
      expv[56] = 74'h00000000000000000e4;
      expv[57] = 74'h00000000000000000e4;
      expv[58] = 74'h00000000000000000e4;
      expv[59] = 74'h00000000c00000001e4;
      expv[60] = 74'h00000000000000000ec;
      expv[61] = 74'h00000000000000000ec;
      expv[62] = 74'h00000000000000000ec;
      expv[63] = 74'h00000000000000000ec;
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
