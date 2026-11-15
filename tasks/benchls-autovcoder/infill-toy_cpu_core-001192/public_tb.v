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

  autovcoder_001192 dut (
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
    stim[0] = 33'h17cc25af4;
    stim[1] = 33'h15312f817;
    stim[2] = 33'h0cbc8bcd6;
    stim[3] = 33'h0d993999f;
    stim[4] = 33'h083aa1db9;
    stim[5] = 33'h0dc382800;
    stim[6] = 33'h095f79b20;
    stim[7] = 33'h070c36bca;
    stim[8] = 33'h0fbc69afc;
    stim[9] = 33'h0fe0881c4;
    stim[10] = 33'h09a63d158;
    stim[11] = 33'h0ffd0e348;
    stim[12] = 33'h0096d126d;
    stim[13] = 33'h011a253d3;
    stim[14] = 33'h045a766dc;
    stim[15] = 33'h006593e6d;
    stim[16] = 33'h0253cf03b;
    stim[17] = 33'h09c81b19c;
    stim[18] = 33'h082f69a11;
    stim[19] = 33'h01a6a307b;
    stim[20] = 33'h0c41cc15c;
    stim[21] = 33'h02fd9e43f;
    stim[22] = 33'h018ef63ea;
    stim[23] = 33'h0929335d3;
    stim[24] = 33'h0a77d019a;
    stim[25] = 33'h0c8ffdb8a;
    stim[26] = 33'h0381e3712;
    stim[27] = 33'h00b42127a;
    stim[28] = 33'h0ec7096f1;
    stim[29] = 33'h0694b124d;
    stim[30] = 33'h0f022f825;
    stim[31] = 33'h05c033404;
    stim[32] = 33'h0ef7fc78e;
    stim[33] = 33'h04fb6c0da;
    stim[34] = 33'h0a3f03581;
    stim[35] = 33'h0abc047ef;
    stim[36] = 33'h0f3a7696d;
    stim[37] = 33'h0631e215d;
    stim[38] = 33'h00738aa8f;
    stim[39] = 33'h0099c08f8;
    stim[40] = 33'h033ee6d7a;
    stim[41] = 33'h0d767edc1;
    stim[42] = 33'h04e132672;
    stim[43] = 33'h0cb2de0a4;
    stim[44] = 33'h07644127c;
    stim[45] = 33'h0cae6e9c0;
    stim[46] = 33'h0de96acf7;
    stim[47] = 33'h094f28ed7;
    stim[48] = 33'h045041411;
    stim[49] = 33'h0f64a76a7;
    stim[50] = 33'h002b4fa2f;
    stim[51] = 33'h0eee1f1a7;
    stim[52] = 33'h0c277142f;
    stim[53] = 33'h0edf09ff4;
    stim[54] = 33'h05a8c0234;
    stim[55] = 33'h0d74312c4;
    stim[56] = 33'h0d774b8c5;
    stim[57] = 33'h06c437412;
    stim[58] = 33'h02da635fc;
    stim[59] = 33'h0728ab981;
    stim[60] = 33'h0cc963add;
    stim[61] = 33'h06371eb1e;
    stim[62] = 33'h0a3ca42d4;
    stim[63] = 33'h0b831e9fa;
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
      expv[2] = 74'h00000000xxxxxxxxx17;
      expv[3] = 74'h00000000xxxxxxxxxd6;
      expv[4] = 74'h00000000xxxxxxxxxd6;
      expv[5] = 74'h00000000000000000d6;
      expv[6] = 74'h00000000000000000d6;
      expv[7] = 74'h00000000400000001d6;
      expv[8] = 74'h00000000000000000ca;
      expv[9] = 74'h00000000000000000ca;
      expv[10] = 74'h00000000000000000ca;
      expv[11] = 74'h00000000000000000ca;
      expv[12] = 74'h00000000800000001ca;
      expv[13] = 74'h000000000000000006d;
      expv[14] = 74'h000000000000000006d;
      expv[15] = 74'h000000000000000006d;
      expv[16] = 74'h000000000000000006d;
      expv[17] = 74'h00000000c000000016d;
      expv[18] = 74'h000000000000000009c;
      expv[19] = 74'h000000000000000009c;
      expv[20] = 74'h000000000000000009c;
      expv[21] = 74'h000000000000000009c;
      expv[22] = 74'h000000010000000019c;
      expv[23] = 74'h00000000000000000ea;
      expv[24] = 74'h00000000000000000ea;
      expv[25] = 74'h00000000000000000ea;
      expv[26] = 74'h00000000000000000ea;
      expv[27] = 74'h00000001400000001ea;
      expv[28] = 74'h000000000000000007a;
      expv[29] = 74'h000000000000000007a;
      expv[30] = 74'h000000000000000007a;
      expv[31] = 74'h000000000000000007a;
      expv[32] = 74'h000000018000000017a;
      expv[33] = 74'h000000000000000008e;
      expv[34] = 74'h000000000000000008e;
      expv[35] = 74'h000000000000000008e;
      expv[36] = 74'h000000000000000008e;
      expv[37] = 74'h00000001c000000018e;
      expv[38] = 74'h000000000000000005d;
      expv[39] = 74'h000000000000000005d;
      expv[40] = 74'h000000000000000005d;
      expv[41] = 74'h000000000000000005d;
      expv[42] = 74'h000000020000000015d;
      expv[43] = 74'h0000000000000000072;
      expv[44] = 74'h0000000000000000072;
      expv[45] = 74'h0000000000000000072;
      expv[46] = 74'h0000000000000000072;
      expv[47] = 74'h0000000240000000172;
      expv[48] = 74'h00000000000000000d7;
      expv[49] = 74'h00000000000000000d7;
      expv[50] = 74'h00000000000000000d7;
      expv[51] = 74'h00000000000000000d7;
      expv[52] = 74'h00000002800000001d7;
      expv[53] = 74'h000000000000000002f;
      expv[54] = 74'h000000000000000002f;
      expv[55] = 74'h000000000000000002f;
      expv[56] = 74'h000000000000000002f;
      expv[57] = 74'h00000002c000000012f;
      expv[58] = 74'h0000000000000000012;
      expv[59] = 74'h0000000000000000012;
      expv[60] = 74'h0000000000000000012;
      expv[61] = 74'h0000000000000000012;
      expv[62] = 74'h0000000300000000112;
      expv[63] = 74'h00000000000000000d4;
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
